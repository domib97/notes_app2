# Nutze ein schlankes Python-Image
FROM python:3.11-slim

# Setze Arbeitsverzeichnis
WORKDIR /app

# Installiere System-Abhängigkeiten für psycopg2 (Postgres-Treiber)
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Kopiere die Abhängigkeiten und installiere sie
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopiere den restlichen Code
COPY . .

# Exponiere den Port, auf dem FastAPI läuft
EXPOSE 8000

# Starte den Server
# Wir nutzen 0.0.0.0, damit der Server von außerhalb des Containers erreichbar ist
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
