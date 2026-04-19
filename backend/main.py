import os
from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from datetime import datetime
from uuid import UUID, uuid4
from typing import List, Optional
from sqlalchemy import create_engine, Column, String, Integer, BigInteger, DateTime, Text # BigInteger hinzugefügt
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
from sqlalchemy.dialects.postgresql import UUID as PG_UUID

# --- Database Setup ---
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "")
DB_HOST = os.getenv("DB_HOST", "127.0.0.1")
DB_PORT = os.getenv("DB_PORT", "5432")
DB_NAME = os.getenv("DB_NAME", "postgres")

SQLALCHEMY_DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

print(f"--- DATABASE STARTING: Connecting to {DB_HOST}:{DB_PORT} ---")

engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

class NoteDB(Base):
    __tablename__ = "notes"
    id = Column(PG_UUID(as_uuid=True), primary_key=True, default=uuid4)
    content = Column(Text, nullable=False)
    channel = Column(String, nullable=False)
    timestamp = Column(DateTime, default=datetime.now)
    color = Column(BigInteger, nullable=False) # GEÄNDERT: BigInteger statt Integer
    karma = Column(Integer, default=0)

    Base.metadata.create_all(bind=engine)

class NoteIn(BaseModel):
    id: Optional[UUID] = None
    content: str
    channel: str
    color: int
    karma: int = 0

class NoteOut(BaseModel):
    id: UUID
    content: str
    channel: str
    timestamp: datetime
    color: int
    karma: int
    class Config:
        from_attributes = True

class VoteData(BaseModel):
    change: int

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

app = FastAPI(title="Jodel 2.0 Debug Backend")

@app.get("/")
def read_root():
    return {"status": "online", "database": DB_HOST}

@app.get("/notes", response_model=List[NoteOut])
def get_notes(db: Session = Depends(get_db)):
    return db.query(NoteDB).order_by(NoteDB.timestamp.desc()).all()

@app.post("/notes", response_model=NoteOut, status_code=201)
def add_note(note: NoteIn, db: Session = Depends(get_db)):
    # DIAGNOSE: Logge die eingehende ID
    print(f"CREATE: Received Note from App with ID: {note.id}")

    new_note = NoteDB(
        id=note.id or uuid4(),
        content=note.content,
        channel=note.channel,
        color=note.color,
        karma=note.karma
    )
    if not note.id:
        print(f"WARNING: No ID received from App, generated new ID: {new_note.id}")

    db.add(new_note)
    db.commit()
    db.refresh(new_note)
    return new_note

@app.post("/notes/{note_id}/vote", response_model=NoteOut)
def vote_note(note_id: UUID, vote_data: VoteData, db: Session = Depends(get_db)):
    print(f"VOTE: Searching for Note with ID: {note_id}")
    note = db.query(NoteDB).filter(NoteDB.id == note_id).first()

    if not note:
        print(f"ERROR: Vote failed. ID {note_id} not found in database!")
        # Zeige alle vorhandenen IDs zum Vergleich
        existing_ids = [str(n.id) for n in db.query(NoteDB).limit(5).all()]
        print(f"Top 5 IDs in DB: {existing_ids}")
        raise HTTPException(status_code=404, detail="Note not found")

    note.karma += vote_data.change
    db.commit()
    db.refresh(note)
    return note
