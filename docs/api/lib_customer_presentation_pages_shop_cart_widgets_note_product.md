# API Reference: note_product

Source file: `lib/customer/presentation/pages/shop/cart/widgets/note_product.dart`

## Classes

### class `NoteProduct`

## Whitelisted API Endpoints

### `NoteProduct({ super.key, required this.onTap, this.comment, this.isSave = true, }); @override State<NoteProduct> createState() => _NoteProductState(); } class _NoteProductState extends State<NoteProduct> { late TextEditingController controller; @override void initState()`
*No documentation provided (generation failed).*

### `didUpdateWidget(NoteProduct oldWidget)`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(mainAxisSize: MainAxisSize.min, children: [ TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.productNote), paddingHorizontalSize: 0, ), 24.verticalSpace, OutlinedBorderTextField( readOnly: !widget.isSave, textController: controller, label: AppHelpers.getTranslation(TrKeys.comment).toUpperCase(), ), 32.verticalSpace, if (widget.isSave) CustomButton( title: AppHelpers.getTranslation(TrKeys.save), onPressed: ()`
*No documentation provided (generation failed).*
