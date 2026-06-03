# API Reference: free_lunch_screen

Source file: `lib/driver/presentation/pages/free_lunch/free_lunch_screen.dart`

## Classes

### class `FreeLunchScreen`

## Whitelisted API Endpoints

### `FreeLunchScreen({super.key}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.all(16.r), child: Column( children: [ Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), border: Border.all(color: AppStyle.shimmerBase), ), padding: EdgeInsets.all(10.r), child: Row( children: [ SizedBox( height: 56.h, child: Stack( children: [ Container( width: 48.r, height: 48.r, decoration: const BoxDecoration( shape: BoxShape.circle, color: AppStyle.orange, ), child: Center( child: Text( "4.5", style: AppStyle.interSemi( size: 16.sp, color: AppStyle.white, letterSpacing: -1, ), ), ), ), Positioned( bottom: 0, left: 10.w, child: Container( decoration: BoxDecoration( color: AppStyle.black, borderRadius: BorderRadius.circular(10.r), border: Border.all(color: AppStyle.white), ), padding: EdgeInsets.symmetric( vertical: 3.h, horizontal: 7.w, ), child: Icon( FlutterRemix.star_fill, color: AppStyle.white, size: 12.r, ), ), ), ], ), ), 12.horizontalSpace, Expanded( child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ RichText( text: TextSpan( text: AppHelpers.getTranslation(TrKeys.freeLunches), style: AppStyle.interSemi( size: 14.sp, letterSpacing: -0.3, ), children: [ TextSpan( text: AppHelpers.getTranslation( TrKeys.matchingYourRank, ), style: AppStyle.interRegular( size: 14.sp, letterSpacing: -0.3, ), ), ], ), ), RichText( text: TextSpan( text: AppHelpers.getTranslation(TrKeys.onlyOne), style: AppStyle.interSemi( size: 14.sp, letterSpacing: -0.3, ), children: [ TextSpan( text: AppHelpers.getTranslation(TrKeys.lunchCan), style: AppStyle.interRegular( size: 14.sp, letterSpacing: -0.3, ), ), ], ), ), ], ), ), ], ), ), SizedBox( height: MediaQuery.sizeOf(context).height / 2, child: ListView.builder( padding: EdgeInsets.only(top: 32.h), itemCount: 8, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: ()`
*No documentation provided (generation failed).*
