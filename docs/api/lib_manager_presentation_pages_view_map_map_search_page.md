# API Reference: map_search_page

Source file: `lib/manager/presentation/pages/view_map/map_search_page.dart`

## Classes

### class `ManagerMapSearchPage`

## Whitelisted API Endpoints

### `ManagerMapSearchPage({super.key}); @override State<ManagerMapSearchPage> createState() => _MapSearchPageState(); } class _MapSearchPageState extends State<ManagerMapSearchPage> { List<AutocompletePrediction> searchResult = []; @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(body: SafeArea( child: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( children: [ 16.verticalSpace, SearchTextField( isBorder: true, onChanged: (title) async { final res = await googlePlace.autocomplete.get(title); searchResult = res?.predictions ?? []; setState(()`
*No documentation provided (generation failed).*

### `InkWell(onTap: ()`
*No documentation provided (generation failed).*
