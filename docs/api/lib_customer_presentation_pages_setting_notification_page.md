# API Reference: notification_page

Source file: `lib/customer/presentation/pages/setting/notification_page.dart`

## Classes

### class `NotificationPage`

## Whitelisted API Endpoints

### `NotificationPage({super.key}); @override ConsumerState<NotificationPage> createState() => _NotificationPageState(); } class _NotificationPageState extends ConsumerState<NotificationPage> { late SettingNotifier event; @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Loading() : Column( children: [ ListView.builder( padding: EdgeInsets.zero, shrinkWrap: true, itemCount: state.notifications?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Column(children: [ CustomToggle( controller: ValueNotifier<bool>( state.notifications?[index].active ?? false, ), title: AppHelpers.getTranslation( state.notifications?[index].type ?? "", ), isChecked: state.notifications?[index].active ?? false, onChange: ()`
*No documentation provided (generation failed).*
