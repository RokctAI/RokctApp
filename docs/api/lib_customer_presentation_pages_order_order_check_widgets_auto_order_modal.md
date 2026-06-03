# API Reference: auto_order_modal

Source file: `lib/customer/presentation/pages/order/order_check/widgets/auto_order_modal.dart`

## Classes

### class `AutoOrderModal`

## Whitelisted API Endpoints

### `AutoOrderModal({ super.key, required this.repeatData, required this.orderId, required this.time, }); @override ConsumerState<AutoOrderModal> createState() => _AutoOrderModalState(); } class _AutoOrderModalState extends ConsumerState<AutoOrderModal> { Timer? timer; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 100), init); } super.initState(); } Future<void> init() async { if (widget.repeatData != null)`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Container(margin: MediaQuery.of(context).viewInsets, decoration: BoxDecoration( color: AppStyle.bgGrey.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r), ), ), width: double.infinity, child: SingleChildScrollView( child: Column( children: [ Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all(Radius.circular(40.r)), ), ), ), 14.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.autoOrder), paddingHorizontalSize: 0, rightTitle: (widget.repeatData?.updatedAt?.isNotEmpty ?? false) ? "${AppHelpers.getTranslation(TrKeys.started)} ${Jiffy.parseFromDateTime(DateTime.parse(widget.repeatData?.updatedAt ?? '')).from(Jiffy.now())}" : "", ), Padding( padding: const EdgeInsets.symmetric(vertical: 10), child: Wrap( runSpacing: 15, spacing: 20, children: [ Row( mainAxisSize: MainAxisSize.min, children: [ Text( AppHelpers.getTranslation(TrKeys.from), style: const TextStyle(fontSize: 18), ), const SizedBox(width: 10), GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `TextStyle(fontSize: 18), ), const SizedBox(width: 3), const Icon( CupertinoIcons.chevron_up_chevron_down, size: 20, ), ], ), ), ], ), Row( mainAxisSize: MainAxisSize.min, children: [ Text( AppHelpers.getTranslation(TrKeys.to), style: const TextStyle(fontSize: 18), ), 10.horizontalSpace, GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `TextStyle(fontSize: 18), ), const SizedBox(width: 3), const Icon( CupertinoIcons.chevron_up_chevron_down, size: 20, ), ], ), ), ], ), ], ), ), if (state.isError) Text( "*${AppHelpers.getTranslation(TrKeys.notValidDate)}", style: const TextStyle(color: Colors.red), ), Padding( padding: const EdgeInsets.symmetric(vertical: 15), child: Text( "*${AppHelpers.getTranslation(TrKeys.autoOrderInfo)}", style: const TextStyle(color: Colors.grey, fontSize: 15), ), ), Padding( padding: EdgeInsets.only( bottom: MediaQuery.paddingOf(context).bottom + 4.h, ), child: Column( children: [ if (!(timer?.isActive ?? false) && event.isTimeChanged(widget.repeatData)) Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: ref .watch(orderProvider) .isButtonLoading, title: AppHelpers.getTranslation(TrKeys.save), onPressed: ()`
*No documentation provided (generation failed).*

### `SizedBox(height: 10), if (widget.repeatData != null) Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: ref .watch(orderProvider) .isButtonLoading, textColor: Colors.white, background: Colors.red, title: AppHelpers.getTranslation( TrKeys.removeAutoOrder, ), onPressed: ()`
*No documentation provided (generation failed).*
