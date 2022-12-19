import 'package:test_project_bets/services/preload_services/preload_provider.dart';

class PreloadRepository {
  PreloadProvider _preloadProvider = PreloadProvider();

  Future<String?> getRedirectUrl() => _preloadProvider.getRedirect();
}