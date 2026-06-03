# API Reference: map_search_page

Source file: `lib/customer/presentation/pages/view_map/map_search_page.dart`

## Classes

### class `MapSearchPage`

## Whitelisted API Endpoints

### `MapSearchPage({super.key}); @override State<MapSearchPage> createState() => _MapSearchPageState(); } class _MapSearchPageState extends State<MapSearchPage> { List<AutocompletePrediction> searchResult = []; @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: colors.backgroundColor, body: SafeArea( child: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( children: [ 16.verticalSpace, SearchTextField( autofocus: true, isBorder: true, hintText: AppHelpers.getTranslation(TrKeys.search), onChanged: (title) async { final res = await googlePlace.autocomplete.get(title); searchResult = res?.predictions ?? []; setState(()`
*No documentation provided (generation failed).*

### `InkWell(onTap: () async { final placeId = searchResult[index].placeId; final details = await googlePlace.details.get( placeId!, ); final location = details?.result?.geometry?.location; if (context.mounted)`
*No documentation provided (generation failed).*
