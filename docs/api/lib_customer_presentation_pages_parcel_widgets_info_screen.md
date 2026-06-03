# API Reference: info_screen

Source file: `lib/customer/presentation/pages/parcel/widgets/info_screen.dart`

## Classes

### class `InfoPage`

## Whitelisted API Endpoints

### `InfoPage({super.key, required this.index}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(body: Stack( children: [ Container( decoration: BoxDecoration( image: DecorationImage( image: AssetImage(AppConstants.infoImage[index]), fit: BoxFit.cover, ), ), child: Padding( padding: EdgeInsets.symmetric(horizontal: 16.r), child: Column( mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation(AppConstants.infoTitle[index]), style: AppStyle.interNoSemi( size: 40, color: AppStyle.white, ), ), 40.verticalSpace, CustomButton( title: index == 3 ? AppHelpers.getTranslation(TrKeys.back) : AppHelpers.getTranslation(TrKeys.next), onPressed: ()`
*No documentation provided (generation failed).*
