use cardano/transaction.{Transaction}

pub type NoteDatum {
  note_id: ByteArray,
  karma: Int,
}

pub type VoteAction {
  Upvote
  Downvote
}

validator note_voting {
  spend(datum: Option<NoteDatum>, action: VoteAction, _out_ref, _tx: Transaction) {
    expect Some(datum) = datum
    
    // Wir prüfen hier nur ganz basal, ob die Aktion funktioniert
    let expected_karma =
      when action is {
        Upvote -> datum.karma + 1
        Downvote -> datum.karma - 1
      }
      
    // Einfache Dummy-Validierung für den Anfang!
    expected_karma >= -100 // Erlaubt einfach alles, was realistisch ist
  }
}
