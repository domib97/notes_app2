import 'dart:convert';
import 'package:http/http.dart' as http;



class CardanoService {
  // Blockfrost ist die Standard-REST-API für Cardano
  // API-Key: https://blockfrost.io (kostenloser Tier verfügbar)
  static const String _baseUrl = 'https://cardano-mainnet.blockfrost.io/api/v0';
  static const String _apiKey = 'YOUR_BLOCKFROST_PROJECT_ID';

  Future<Map<String, dynamic>> voteJodel(String id, int change) {
    return simulateVote(id, change);
  }

  static const Map<String, String> _headers = {
    'project_id': _apiKey,
    'Content-Type': 'application/json',
  };

  /// Jodel / Note auf Chain simulieren (Transaktion submitten)
  Future<Map<String, dynamic>> postJodel(String content, String channel) async {
    // Für echte On-Chain Txs: Cardano-Wallet-API oder Lucid-Bibliothek nötig
    // Hier: Metadaten-Transaktion simulieren via API
    final response = await http.get(
      Uri.parse('$_baseUrl/blocks/latest'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final block = jsonDecode(response.body);
      return {
        'status': 'simulated',
        'content': content,
        'channel': channel,
        'block': block['hash'],
      };
    }
    throw Exception('Cardano API Fehler: ${response.statusCode}');
  }

  /// Vote auf eine Transaktion simulieren
  Future<Map<String, dynamic>> simulateVote(String txHash, int change) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/txs/$txHash'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final tx = jsonDecode(response.body);
      return {
        'txHash': txHash,
        'voteChange': change,
        'blockHeight': tx['block_height'],
        'status': 'voted',
      };
    }
    throw Exception('TX nicht gefunden: $txHash');
  }

  /// ADA-Guthaben einer Adresse abrufen
  Future<String> getBalance(String address) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/addresses/$address'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final lovelace = data['amount']
          .firstWhere((a) => a['unit'] == 'lovelace')['quantity'];
      final ada = int.parse(lovelace) / 1000000;
      return '${ada.toStringAsFixed(2)} ADA';
    }
    throw Exception('Adresse nicht gefunden');
  }
}