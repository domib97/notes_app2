import 'package:webview_flutter/webview_flutter.dart';

class CardanoService {
  late final WebViewController _controller;

  CardanoService() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavascriptMode.unrestricted)
      ..addJavaScriptChannel(
        'FlutterBridge',
        onMessageReceived: (JavaScriptMessage message) {
          // Das ist deine Konsole für Debugging in Flutter!
          print('CARDANO-JS: ${message.message}');
        },
      )
      ..loadHtmlString(_buildBridgeHtml());
  }

  Future<void> postJodel(String content, String channel) async {
    // Ruft die JS-Funktion auf, die wir unten definiert haben
    await _controller.runJavaScript("postJodelToContract('$content', '$channel')");
  }

  Future<void> voteJodel(String txHash, int change) async {
    await _controller.runJavaScript("simulateVote('$txHash', $change)");
  }

  String _buildBridgeHtml() {
    return '''
<!DOCTYPE html>
<html>
<head>
    <script type="module">
        import { Lucid, Blockfrost, Data, fromText, Constr } from "https://unpkg.com/lucid-cardano@0.10.7/web/mod.js";
        
        // --- KONFIGURATION (Dein funktionierender Code!) ---
        const blockfrostKey = "preprod8ysh4eKjL2DKIDaWwhPlLnBhrIPMGudr";
        const provider = new Blockfrost("https://cardano-preprod.blockfrost.io/api/v0", blockfrostKey);
        const compiledContractCbor = "49480100002221200101"; // Dein V2 AlwaysSucceeds
        
        const NoteDatumSchema = Data.Object({
            note_id: Data.Bytes(),
            karma: Data.Integer(),
        });

        let lucidInstance = null;

        // Initialisierung
        async function initLucid() {
            if (lucidInstance) return lucidInstance;
            
            if (!window.cardano || !window.cardano.eternl) {
                FlutterBridge.postMessage("Fehler: Eternl Wallet nicht gefunden!");
                return null;
            }
            
            const api = await window.cardano.eternl.enable();
            lucidInstance = await Lucid.new(provider, "Preprod");
            lucidInstance.selectWallet(api);
            return lucidInstance;
        }

        window.postJodelToContract = async (content, channel) => {
            try {
                const lucid = await initLucid();
                if (!lucid) return;

                FlutterBridge.postMessage("Baue Transaktion für Jodel...");

                const contractAddress = lucid.utils.validatorToAddress({ type: "PlutusV2", script: compiledContractCbor });
                const datum = Data.to({ note_id: fromText("jodel-flutter"), karma: 0n }, NoteDatumSchema);

                const tx = await lucid.newTx()
                    .payToContract(contractAddress, { inline: datum }, { lovelace: 2000000n })
                    .complete();

                const signedTx = await tx.sign().complete();
                const txHash = await signedTx.submit();

                FlutterBridge.postMessage("ERFOLG! Jodel TxHash: " + txHash);
            } catch (e) {
                FlutterBridge.postMessage("JS-FEHLER: " + e.toString());
            }
        };

        window.simulateVote = async (txHash, change) => {
            try {
                const lucid = await initLucid();
                if (!lucid) return;
                
                FlutterBridge.postMessage("Starte Vote-Prozess...");
                // Hier würde jetzt die reale Vote-Logik folgen (UTXO suchen etc.)
                // Für den ersten Flutter-Test lassen wir es bei dem Log-Eintrag
            } catch (e) {
                FlutterBridge.postMessage("JS-VOTE-FEHLER: " + e.toString());
            }
        };
    </script>
</head>
<body>
    <div id="status">Cardano Bridge Active</div>
</body>
</html>
    ''';
  }
}
