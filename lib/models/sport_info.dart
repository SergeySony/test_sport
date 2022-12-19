class SportInfo {
  final String league;
  final String homeTeamName;
  final String awayTeamName;
  final String homeTeamScore;
  final String awayTeamScore;
  final String gameStatus;
  final String dateEvent;

  SportInfo({
    required this.league,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.gameStatus,
    required this.dateEvent,
  });

  factory SportInfo.fromJson(Map<String, dynamic> json) {
    return SportInfo(
      league: json['strLeague'] ?? '',
      homeTeamName: json['strHomeTeam'] ?? '',
      awayTeamName: json['strAwayTeam'] ?? '',
      homeTeamScore: json['intHomeScore'] ?? '',
      awayTeamScore: json['intAwayScore'] ?? '',
      gameStatus: json['strStatus'] ?? '',
      dateEvent: json['dateEvent'] ?? '',
    );
  }
}