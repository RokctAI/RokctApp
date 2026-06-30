import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:betassist_sdk/betassist_sdk.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class UserProfile {
  final String user;
  final String? localFavoriteTeam;
  final String? intlFavoriteTeam;
  final double monthlyBudget;
  final double remainingBudget;
  final bool budgetLocked;
  final List<String> followedTeams;

  UserProfile({
    required this.user,
    this.localFavoriteTeam,
    this.intlFavoriteTeam,
    this.monthlyBudget = 0.0,
    this.remainingBudget = 0.0,
    this.budgetLocked = false,
    this.followedTeams = const [],
  });

  UserProfile copyWith({
    String? localFavoriteTeam,
    String? intlFavoriteTeam,
    double? monthlyBudget,
    double? remainingBudget,
    bool? budgetLocked,
    List<String>? followedTeams,
  }) {
    return UserProfile(
      user: user,
      localFavoriteTeam: localFavoriteTeam ?? this.localFavoriteTeam,
      intlFavoriteTeam: intlFavoriteTeam ?? this.intlFavoriteTeam,
      monthlyBudget: monthlyBudget ?? this.monthlyBudget,
      remainingBudget: remainingBudget ?? this.remainingBudget,
      budgetLocked: budgetLocked ?? this.budgetLocked,
      followedTeams: followedTeams ?? this.followedTeams,
    );
  }
}

// =========================================================================
// 2. STATE MANAGEMENT (RIVERPOD)
// =========================================================================

class UserProfileNotifier extends StateNotifier<UserProfile> {
  UserProfileNotifier() : super(UserProfile(user: "User123"));

  void setLocalFavorite(String team) {
    if (state.localFavoriteTeam != null) return; // Enforce lock
    state = state.copyWith(localFavoriteTeam: team);
  }

  void setIntlFavorite(String team) {
    if (state.intlFavoriteTeam != null) return; // Enforce lock
    state = state.copyWith(intlFavoriteTeam: team);
  }

  void setBudget(double budget) {
    state = state.copyWith(
      monthlyBudget: budget,
      remainingBudget: budget,
      budgetLocked: budget <= 0,
    );
  }

  void toggleFollowTeam(String team) {
    final list = List<String>.from(state.followedTeams);
    if (list.contains(team)) {
      list.remove(team);
    } else {
      list.add(team);
    }
    state = state.copyWith(followedTeams: list);
  }

  bool placeBet(double amount) {
    if (amount > state.remainingBudget || state.budgetLocked) return false;
    final newRemaining = state.remainingBudget - amount;
    state = state.copyWith(
      remainingBudget: newRemaining,
      budgetLocked: newRemaining <= 0,
    );
    return true;
  }
}

final userProfileProvider = StateNotifierProvider<UserProfileNotifier, UserProfile>((ref) {
  return UserProfileNotifier();
});

// Mock matches feed
final matchesProvider = Provider<List<SoccerMatch>>((ref) {
  return [
    SoccerMatch(
      id: "m1",
      teamA: "Orlando Pirates",
      teamB: "Kaizer Chiefs",
      teamALogo: "🏴‍☠️",
      teamBLogo: "✌️",
      kickoffTime: DateTime.now().add(const Duration(hours: 48)),
      league: "PSL",
      status: "Scheduled",
      score: "0-0",
      confidenceScore: 78.0,
      predictedWinner: "Orlando Pirates",
      whyWin: "Orlando Pirates has a 4-match winning streak at home, while Kaizer Chiefs faces suspensions for their two key central defenders.",
      whyLose: "Kaizer Chiefs excels at quick counter-attacks. If Pirates overcommit their fullbacks early, they risk conceding on transition.",
    ),
    SoccerMatch(
      id: "m2",
      teamA: "Mamelodi Sundowns",
      teamB: "SuperSport United",
      teamALogo: "🌟",
      teamBLogo: "🛡️",
      kickoffTime: DateTime.now().add(const Duration(hours: 24)),
      league: "PSL",
      status: "Scheduled",
      score: "0-0",
      confidenceScore: 85.0,
      predictedWinner: "Mamelodi Sundowns",
      whyWin: "Sundowns have dominated possession statistics (averaging 68% in their last 5 matches) and play with home advantage.",
      whyLose: "SuperSport United are physical on set pieces. A lack of concentration on corners is Sundowns' primary vulnerability.",
    ),
    SoccerMatch(
      id: "m3",
      teamA: "Manchester City",
      teamB: "Arsenal",
      teamALogo: "🩵",
      teamBLogo: "🔴",
      kickoffTime: DateTime.now().add(const Duration(hours: 12)),
      league: "EPL",
      status: "Scheduled",
      score: "0-0",
      confidenceScore: 62.0,
      predictedWinner: "Manchester City",
      whyWin: "City has won the last three home clashes against Arsenal, showcasing superior attacking transition metrics.",
      whyLose: "Arsenal boasts the best defensive expected goals (xGA) record away from home in the league this season.",
    ),
  ];
});

// =========================================================================
// 3. THEME & PALETTE (Financial Dark Terminal Theme)
// =========================================================================

class AppColors {
  static const Color background = Color(0xFF0A0E12); // Deep Obsidian Black
  static const Color surface = Color(0xFF141A22);    // Terminal surface gray
  static const Color accent = Color(0xFF00E676);     // Neon Green (Financial gains)
  static const Color alert = Color(0xFFFF3D00);      // Warning Red (Risk blocks)
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF90A4AE);
}

final themeData = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.accent,
  colorScheme: ColorScheme.dark(
    surface: AppColors.background,
    primary: AppColors.accent,
    secondary: AppColors.accent,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
  ),
);

// =========================================================================
// 4. ROUTER CONFIGURATION
// =========================================================================

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
});

// =========================================================================
// 5. APPLICATION ENTRYPOINT
// =========================================================================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Route all Flutter framework errors to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Route native / async Dart errors to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routerConfig: router,
    );
  }
}

// =========================================================================
// 6. SCREEN: ONBOARDING FLOW
// =========================================================================

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int _step = 1;
  String? _selectedLocal;
  String? _selectedIntl;
  final TextEditingController _budgetController = TextEditingController();

  final List<String> localTeams = ["Orlando Pirates", "Kaizer Chiefs", "Mamelodi Sundowns", "SuperSport United", "Cape Town City"];
  final List<String> intlTeams = ["Manchester City", "Real Madrid", "Arsenal", "Barcelona", "Liverpool", "Bayern Munich"];

  void _nextStep() {
    if (_step == 1 && _selectedLocal != null) {
      ref.read(userProfileProvider.notifier).setLocalFavorite(_selectedLocal!);
      setState(() => _step = 2);
    } else if (_step == 2 && _selectedIntl != null) {
      ref.read(userProfileProvider.notifier).setIntlFavorite(_selectedIntl!);
      setState(() => _step = 3);
    } else if (_step == 3) {
      final double budget = double.tryParse(_budgetController.text) ?? 0.0;
      if (budget > 0) {
        ref.read(userProfileProvider.notifier).setBudget(budget);
        ref.read(userProfileProvider.notifier).toggleFollowTeam(_selectedLocal!);
        ref.read(userProfileProvider.notifier).toggleFollowTeam(_selectedIntl!);
        // Track onboarding completion
        FirebaseAnalytics.instance.logEvent(
          name: 'onboarding_completed',
          parameters: {
            'local_team': _selectedLocal ?? '',
            'intl_team': _selectedIntl ?? '',
            'monthly_budget': budget,
          },
        );
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header progress indication
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("BETASSIST", style: TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                  Text("STEP $_step OF 3", style: const TextStyle(color: AppColors.textSecondary)),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: _step / 3.0,
                backgroundColor: AppColors.surface,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
              ),
              const SizedBox(height: 48),
              
              if (_step == 1) ...[
                const Text("Choose Local Favorite Team", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text("This selection is permanent. You will never be allowed to place bets on matches involving this team to eliminate bias.", style: TextStyle(color: AppColors.textSecondary)),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.builder(
                    itemCount: localTeams.length,
                    itemBuilder: (context, index) {
                      final team = localTeams[index];
                      final isSelected = _selectedLocal == team;
                      return ListTile(
                        title: Text(team),
                        trailing: isSelected ? const Icon(Icons.check_circle, color: AppColors.accent) : null,
                        tileColor: isSelected ? AppColors.surface : Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        onTap: () => setState(() => _selectedLocal = team),
                      );
                    },
                  ),
                ),
              ] else if (_step == 2) ...[
                const Text("Choose International Favorite Team", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text("This choice is permanent. Bias blocks prevent all emotional betting involving your favorites.", style: TextStyle(color: AppColors.textSecondary)),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.builder(
                    itemCount: intlTeams.length,
                    itemBuilder: (context, index) {
                      final team = intlTeams[index];
                      final isSelected = _selectedIntl == team;
                      return ListTile(
                        title: Text(team),
                        trailing: isSelected ? const Icon(Icons.check_circle, color: AppColors.accent) : null,
                        tileColor: isSelected ? AppColors.surface : Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        onTap: () => setState(() => _selectedIntl = team),
                      );
                    },
                  ),
                ),
              ] else if (_step == 3) ...[
                const Text("Define Monthly Budget", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text("Enter your monthly ZAR budget. BetAssist will strictly enforce the 2% maximum stake rule per match to preserve capital.", style: TextStyle(color: AppColors.textSecondary)),
                const SizedBox(height: 32),
                TextField(
                  controller: _budgetController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Monthly Budget (ZAR)",
                    prefixText: "R ",
                    labelStyle: TextStyle(color: AppColors.accent),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.surface)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.accent)),
                  ),
                ),
                const SizedBox(height: 24),
                if (_budgetController.text.isNotEmpty) ...[
                  Card(
                    color: AppColors.surface,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Enforced 2% Max Bet limit:"),
                          Text(
                            "R ${(double.tryParse(_budgetController.text) ?? 0.0) * 0.02}",
                            style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                const Spacer(),
              ],

              ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("CONTINUE", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =========================================================================
// 7. SCREEN: 2D PORTFOLIO DASHBOARD
// =========================================================================

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _hasGyro = true;
  StreamSubscription? _gyroCheckSub;

  @override
  void initState() {
    super.initState();
    _checkGyroscopeAvailability();
  }

  void _checkGyroscopeAvailability() {
    try {
      _gyroCheckSub = gyroscopeEventStream().listen(
        (event) {
          if (mounted) {
            setState(() => _hasGyro = true);
          }
          _gyroCheckSub?.cancel();
        },
        onError: (err) {
          if (mounted) {
            setState(() => _hasGyro = false);
          }
        },
      );
      
      Future.delayed(const Duration(milliseconds: 350), () {
        if (_gyroCheckSub != null) {
          _gyroCheckSub!.cancel();
          if (mounted && _hasGyro == true) {
            setState(() => _hasGyro = false);
          }
        }
      });
    } catch (e) {
      setState(() => _hasGyro = false);
    }
  }

  @override
  void dispose() {
    _gyroCheckSub?.cancel();
    super.dispose();
  }

  void _showFlatAnalysisSheet(BuildContext context, SoccerMatch match, bool isFav, bool isFollowing) {
    final profile = ref.read(userProfileProvider);
    final maxBet = profile.monthlyBudget * 0.02;

    // Track analysis sheet viewed
    FirebaseAnalytics.instance.logEvent(
      name: 'match_analysis_viewed',
      parameters: {'match_id': match.id, 'mode': 'flat_sheet'},
    );

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(bottom: 24),
          height: 420,
          child: ARCardBack(
            match: match,
            isFav: isFav,
            isFollowing: isFollowing,
            recommendedStake: maxBet,
            onPlaceBet: () {
              final success = ref.read(userProfileProvider.notifier).placeBet(maxBet);
              if (success) {
                // Track bet placed event
                FirebaseAnalytics.instance.logEvent(
                  name: 'bet_placed',
                  parameters: {
                    'match_id': match.id,
                    'amount': maxBet,
                    'mode': 'flat_sheet',
                  },
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Calculated risk bet of R ${maxBet.toStringAsFixed(2)} placed successfully via deep-link!"),
                    backgroundColor: AppColors.accent,
                  ),
                );
                Navigator.pop(context); // Close bottom sheet
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Failed to place bet. Budget exhausted or locked."),
                    backgroundColor: AppColors.alert,
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(userProfileProvider);
    final allMatches = ref.watch(matchesProvider);

    // Filters: matches with followed teams or league leaders (Sundowns or Man City for mock purposes)
    final feedMatches = allMatches.where((m) {
      final isFollowed = profile.followedTeams.contains(m.teamA) || profile.followedTeams.contains(m.teamB);
      final isLeader = m.teamA == "Mamelodi Sundowns" || m.teamA == "Manchester City";
      return isFollowed || isLeader;
    }).toList();

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: AppColors.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: const Icon(Icons.home, color: AppColors.accent), onPressed: () {}),
              FloatingActionButton(
                backgroundColor: AppColors.accent,
                onPressed: () {
                  if (_hasGyro) {
                    final currentMatch = feedMatches.isNotEmpty ? feedMatches.first : allMatches.first;
                    final isFav = currentMatch.teamA == profile.localFavoriteTeam ||
                                  currentMatch.teamB == profile.localFavoriteTeam ||
                                  currentMatch.teamA == profile.intlFavoriteTeam ||
                                  currentMatch.teamB == profile.intlFavoriteTeam;
                    final isFollowing = profile.followedTeams.contains(currentMatch.teamA) || 
                                        profile.followedTeams.contains(currentMatch.teamB);
                    final maxBet = profile.monthlyBudget * 0.02;

                    // Track AR scanner launched
                    FirebaseAnalytics.instance.logEvent(
                      name: 'ar_scanner_launched',
                      parameters: {'match_id': currentMatch.id, 'source': 'fab'},
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ARScanScreen(
                          match: currentMatch,
                          isFav: isFav,
                          isFollowing: isFollowing,
                          recommendedStake: maxBet,
                          onPlaceBet: () {
                            final success = ref.read(userProfileProvider.notifier).placeBet(maxBet);
                            if (success) {
                              FirebaseAnalytics.instance.logEvent(
                                name: 'bet_placed',
                                parameters: {
                                  'match_id': currentMatch.id,
                                  'amount': maxBet,
                                  'mode': 'ar_scanner',
                                },
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Calculated risk bet of R ${maxBet.toStringAsFixed(2)} placed successfully via deep-link!"),
                                  backgroundColor: AppColors.accent,
                                ),
                              );
                              Navigator.pop(context); // Close scanner
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Failed to place bet. Budget exhausted or locked."),
                                  backgroundColor: AppColors.alert,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("AR Scan requires a Gyroscope. Tap any match to view analysis instead."),
                        backgroundColor: AppColors.surface,
                      ),
                    );
                  }
                },
                child: const Icon(Icons.camera_alt, color: Colors.black),
              ),
              IconButton(icon: const Icon(Icons.person, color: Colors.white), onPressed: () {}),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Financial State Summary
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("AVAILABLE BANKROLL", style: TextStyle(fontSize: 11, color: AppColors.textSecondary, letterSpacing: 1.0)),
                      Text("R ${profile.remainingBudget.toStringAsFixed(2)}", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.accent)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("MONTHLY LIMIT", style: TextStyle(fontSize: 11, color: AppColors.textSecondary, letterSpacing: 1.0)),
                      Text("R ${profile.monthlyBudget.toStringAsFixed(2)}", style: const TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: profile.remainingBudget / (profile.monthlyBudget > 0 ? profile.monthlyBudget : 1.0),
                backgroundColor: AppColors.surface,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
              ),
              const SizedBox(height: 32),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("LIVE TELEMETRY FEED", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1.2)),
                  Text("${feedMatches.length} Matches Loaded", style: const TextStyle(fontSize: 11, color: AppColors.accent)),
                ],
              ),
              const SizedBox(height: 16),
              
              Expanded(
                child: ListView.builder(
                  itemCount: feedMatches.length,
                  itemBuilder: (context, index) {
                    final match = feedMatches[index];
                    final isFavA = match.teamA == profile.localFavoriteTeam || match.teamA == profile.intlFavoriteTeam;
                    final isFavB = match.teamB == profile.localFavoriteTeam || match.teamB == profile.intlFavoriteTeam;

                    return Card(
                      color: AppColors.surface,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(match.league, style: const TextStyle(fontSize: 11, color: AppColors.accent, fontWeight: FontWeight.bold)),
                                Text(match.status, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(match.teamALogo, style: const TextStyle(fontSize: 32)),
                                    const SizedBox(height: 4),
                                    Text(match.teamA, style: TextStyle(fontSize: 13, color: isFavA ? AppColors.accent : Colors.white)),
                                    if (isFavA) const Text("FAVORITE (LOCKED)", style: TextStyle(fontSize: 8, color: AppColors.alert, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const Text("VS", style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
                                Column(
                                  children: [
                                    Text(match.teamBLogo, style: const TextStyle(fontSize: 32)),
                                    const SizedBox(height: 4),
                                    Text(match.teamB, style: TextStyle(fontSize: 13, color: isFavB ? AppColors.accent : Colors.white)),
                                    if (isFavB) const Text("FAVORITE (LOCKED)", style: TextStyle(fontSize: 8, color: AppColors.alert, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Confidence: ${match.confidenceScore}%", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                TextButton(
                                  onPressed: () {
                                    final isFav = isFavA || isFavB;
                                    final isFollowing = profile.followedTeams.contains(match.teamA) || profile.followedTeams.contains(match.teamB);
                                    final maxBet = profile.monthlyBudget * 0.02;

                                    if (_hasGyro) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ARScanScreen(
                                            match: match,
                                            isFav: isFav,
                                            isFollowing: isFollowing,
                                            recommendedStake: maxBet,
                                            onPlaceBet: () {
                                              final success = ref.read(userProfileProvider.notifier).placeBet(maxBet);
                                              if (success) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text("Calculated risk bet of R ${maxBet.toStringAsFixed(2)} placed successfully via deep-link!"),
                                                    backgroundColor: AppColors.accent,
                                                  ),
                                                );
                                                Navigator.pop(context); // Close scanner
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                    content: Text("Failed to place bet. Budget exhausted or locked."),
                                                    backgroundColor: AppColors.alert,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      );
                                    } else {
                                      _showFlatAnalysisSheet(
                                        context, 
                                        match, 
                                        isFav, 
                                        isFollowing
                                      );
                                    }
                                  },
                                  child: Text(_hasGyro ? "LAUNCH SCANNER" : "VIEW ANALYSIS", style: const TextStyle(color: AppColors.accent)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


