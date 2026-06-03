# API Reference: custom_expanded

Source file: `lib/customer/presentation/pages/parcel/widgets/custom_expanded.dart`

## Classes

### class `ExpandedSection`

## Whitelisted API Endpoints

### `ExpandedSection({super.key, this.expand = false, required this.child}); @override ExpandedSectionState createState() => ExpandedSectionState(); } class ExpandedSectionState extends State<ExpandedSection> with SingleTickerProviderStateMixin { late AnimationController expandController; late Animation<double> animation; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 600), ); animation = CurvedAnimation( parent: expandController, curve: Curves.fastOutSlowIn, ); } void _runExpandCheck()`
*No documentation provided (generation failed).*

### `didUpdateWidget(ExpandedSection oldWidget)`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*
