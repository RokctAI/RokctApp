# API Reference: profile_page

Source file: `lib/customer/presentation/pages/profile/profile_page.dart`

## Classes

### class `ProfilePage`

## Whitelisted API Endpoints

### `ProfilePage({super.key, this.isBackButton = true}); @override ConsumerState<ProfilePage> createState() => _ProfilePageState(); } class _ProfilePageState extends ConsumerState<ProfilePage> { late RefreshController _refreshController; late Timer _timer; bool get _isAuthenticated => LocalStorage.getToken().isNotEmpty; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `CustomScaffold(body: (colors) => profileState.isLoading ? const Loading() : Column( children: [ ProfileHeader( userData: profileState.userData, onLogout: ()`
*No documentation provided (generation failed).*

### `ProfileItemsList(isBackButton: widget.isBackButton, theme: controller, userData: profileState.userData, notificationCount: notificationState .countOfNotifications ?.notification, onLanguageChange: ()`
*No documentation provided (generation failed).*
