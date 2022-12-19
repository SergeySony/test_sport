import 'package:test_project_bets/models/sport_info.dart';
import 'package:test_project_bets/services/sport_list_services/sportlist_api_provider.dart';

class SportListRepository {
  SportListProvider _sportListProvider = SportListProvider();

  Future<List<SportInfo>> getAllSports() => _sportListProvider.getGames();
}