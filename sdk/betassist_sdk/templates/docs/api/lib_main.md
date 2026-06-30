# API Reference: main

Source file: `lib/main.dart`

## Classes

### class `UserProfile`

### class `OnboardingScreen`

## Whitelisted API Endpoints

### `Duration(hours: 48)), league: "PSL", status: "Scheduled", score: "0-0", confidenceScore: 78.0, predictedWinner: "Orlando Pirates", whyWin: "Orlando Pirates has a 4-match winning streak at home, while Kaizer Chiefs faces suspensions for their two key central defenders.", whyLose: "Kaizer Chiefs excels at quick counter-attacks. If Pirates overcommit their fullbacks early, they risk conceding on transition.", ), SoccerMatch( id: "m2", teamA: "Mamelodi Sundowns", teamB: "SuperSport United", teamALogo: "🌟", teamBLogo: "🛡️", kickoffTime: DateTime.now().add(const Duration(hours: 24)), league: "PSL", status: "Scheduled", score: "0-0", confidenceScore: 85.0, predictedWinner: "Mamelodi Sundowns", whyWin: "Sundowns have dominated possession statistics (averaging 68% in their last 5 matches) and play with home advantage.", whyLose: "SuperSport United are physical on set pieces. A lack of concentration on corners is Sundowns' primary vulnerability.", ), SoccerMatch( id: "m3", teamA: "Manchester City", teamB: "Arsenal", teamALogo: "🩵", teamBLogo: "🔴", kickoffTime: DateTime.now().add(const Duration(hours: 12)), league: "EPL", status: "Scheduled", score: "0-0", confidenceScore: 62.0, predictedWinner: "Manchester City", whyWin: "City has won the last three home clashes against Arsenal, showcasing superior attacking transition metrics.", whyLose: "Arsenal boasts the best defensive expected goals (xGA) record away from home in the league this season.", ), ]; }); class AppColors { static const Color background = Color(0xFF0A0E12); static const Color surface = Color(0xFF141A22); static const Color accent = Color(0xFF00E676); static const Color alert = Color(0xFFFF3D00); static const Color textPrimary = Colors.white; static const Color textSecondary = Color(0xFF90A4AE); } final themeData = ThemeData( scaffoldBackgroundColor: AppColors.background, primaryColor: AppColors.accent, colorScheme: ColorScheme.dark( surface: AppColors.background, primary: AppColors.accent, secondary: AppColors.accent, ), textTheme: const TextTheme( headlineMedium: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold), bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14), ), ); final routerProvider = Provider<GoRouter>((ref)`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 350), ()`
*No documentation provided (generation failed).*
