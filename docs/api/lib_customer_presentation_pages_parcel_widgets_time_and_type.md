# API Reference: time_and_type

Source file: `lib/customer/presentation/pages/parcel/widgets/time_and_type.dart`

## Classes

### class `TypeAndTime`

## Whitelisted API Endpoints

### `TypeAndTime({ super.key, required this.state, required this.event, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(children: [ if (state.expand) Container( margin: EdgeInsets.only(top: 16.r), color: AppStyle.transparent, padding: EdgeInsets.all(16.r), child: InkWell( child: Container( decoration: BoxDecoration( color: colors.icon, borderRadius: BorderRadius.circular(10.r), ), padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 16.r), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation(TrKeys.remainAnonymous), style: AppStyle.interSemi(size: 16), ), Text( AppHelpers.getTranslation(TrKeys.dontNotifyRecipient), style: AppStyle.interRegular(size: 14), ), ], ), Expanded( child: CustomToggle( controller: ValueNotifier<bool>(false), title: "", isChecked: state.anonymous, onChange: () => event.changeAnonymous(), ), ), ], ), ), ), ), Container( margin: EdgeInsets.only(top: 16.r, bottom: 24.r), color: colors.icon, padding: EdgeInsets.all(16.r), child: InkWell( onTap: () async { final time = await showTimePicker( context: context, initialTime: TimeOfDay.now(), initialEntryMode: TimePickerEntryMode.dialOnly, ); if (time != null)`
*No documentation provided (generation failed).*

### `Spacer(), Icon( FlutterRemix.arrow_right_s_line, color: colors.textBlack, ), ], ), ), ), ), ), Container( margin: EdgeInsets.only(top: 10.r, bottom: 24.r), color: colors.backgroundColor, padding: EdgeInsets.all(16.r), child: GridView.builder( padding: EdgeInsets.zero, itemCount: state.types.length, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( childAspectRatio: 1, crossAxisCount: 2, ), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `InkWell(onTap: ()`
*No documentation provided (generation failed).*
