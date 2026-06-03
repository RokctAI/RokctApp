# API Reference: working_time_modal

Source file: `lib/manager/presentation/pages/restaurant/widgets/working_time_modal.dart`

## Classes

### class `WorkingTimeModal`

## Whitelisted API Endpoints

### `WorkingTimeModal({super.key}); @override ConsumerState<WorkingTimeModal> createState() => _WorkingTimeModalState(); } class _WorkingTimeModalState extends ConsumerState<WorkingTimeModal> { late List<ShopWorkingDays> _workingDays; late List<ShopWorkingDays> _savingWorkingDays; bool _shouldUpdate = false; List temp = []; @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `ModalDrag(), TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.workingHours), ), Text( AppHelpers.getTranslation(TrKeys.enterOpeningHours), style: AppStyle.interNormal( size: 14, color: AppStyle.blackColor, ), ), 24.verticalSpace, SizedBox( height: 40.r, width: MediaQuery.sizeOf(context).width - 32.w, child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ ..._workingDays.map( (ShopWorkingDays day) => GestureDetector( onTap: ()`
*No documentation provided (generation failed).*
