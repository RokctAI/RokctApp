class SoccerMatch {
  final String id;
  final String teamA;
  final String teamB;
  final String teamALogo;
  final String teamBLogo;
  final DateTime kickoffTime;
  final String league;
  final String status;
  final String score;
  final double confidenceScore;
  final String predictedWinner;
  final String whyWin;
  final String whyLose;

  SoccerMatch({
    required this.id,
    required this.teamA,
    required this.teamB,
    required this.teamALogo,
    required this.teamBLogo,
    required this.kickoffTime,
    required this.league,
    required this.status,
    required this.score,
    required this.confidenceScore,
    required this.predictedWinner,
    required this.whyWin,
    required this.whyLose,
  });
}
