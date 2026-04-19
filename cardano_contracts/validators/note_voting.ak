// Das ist Aiken (Die Programmiersprache für Cardano Smart Contracts)
// Sie ähnelt Rust oder Swift und ist extrem sicher.

type NoteDatum {
  note_id: ByteArray, // Die eindeutige ID deines Jodels
  karma: Int,         // Der aktuelle Voting-Stand
}

type VoteAction {
  Upvote
  Downvote
}

validator note_voting {
  // Diese Funktion wird von der Blockchain aufgerufen, wenn jemand 
  // versucht, den UTXO (deinen Jodel) zu verändern (also zu voten).
  fn vote(datum: NoteDatum, action: VoteAction, ctx: ScriptContext) -> Bool {
    
    // 1. Was soll das neue Karma sein?
    let expected_new_karma =
      when action is {
        Upvote -> datum.karma + 1
        Downvote -> datum.karma - 1
      }

    // 2. Cardano EUTXO Magie:
    // Wir prüfen hier nicht eine "Datenbank", sondern wir schauen uns die
    // NEUE Transaktion an, die der Nutzer einreichen will.
    // Wir sagen: "Der neue 'Geldschein' (UTXO), der aus dieser Transaktion 
    // entsteht, MUSS das expected_new_karma haben. Ansonsten lehnt die
    // Blockchain die Transaktion ab!"
    
    // (Pseudocode für die Validierung)
    // let output_datum = get_datum_from_transaction_output(ctx.transaction)
    // output_datum.karma == expected_new_karma && output_datum.note_id == datum.note_id
    
    True // Für das Beispiel erlauben wir erstmal alles
  }
}
