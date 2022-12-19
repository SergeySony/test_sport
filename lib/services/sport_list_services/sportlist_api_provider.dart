import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_project_bets/models/sport_info.dart';

class SportListProvider {
  Future<List<SportInfo>> getGames() async {
    final response = await http.get(Uri.parse('https://www.thesportsdb.com/api/v2/json/40130162/livescore.php?s=Ice_Hockey'));
    if (response.statusCode == 200) {
      final dynamic userJson = json.decode(response.body);
      final List<dynamic> userJsonList = userJson['events'];
      return userJsonList.map((json) => SportInfo.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching games');
    }
  }
}
