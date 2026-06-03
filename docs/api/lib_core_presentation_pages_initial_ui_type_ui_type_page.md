# API Reference: ui_type_page

Source file: `lib/core/presentation/pages/initial/ui_type/ui_type_page.dart`

## Classes

### class `UiTypePage`

## Whitelisted API Endpoints

### `UiTypePage({super.key, this.isBack = false}); @override ConsumerState<UiTypePage> createState() => _UiTypePageState(); } class _UiTypePageState extends ConsumerState<UiTypePage> with SingleTickerProviderStateMixin { int index = 0; late AnimationController _animationController; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 300), ); super.initState(); } @override void dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: colors.backgroundColor, appBar: AppBar( backgroundColor: colors.icon, elevation: 0, centerTitle: true, leading: widget.isBack ? BackButton(color: colors.textBlack) : null, title: Text( AppHelpers.getTranslation(TrKeys.uiType), style: AppStyle.interNoSemi( size: 18, color: colors.textBlack, letterSpacing: -0.3, ), ), ), body: Column( children: [ 16.verticalSpace, Padding( padding: REdgeInsets.symmetric(horizontal: 24), child: Text( AppHelpers.getTranslation(TrKeys.chooseYourPreferredStyle), style: AppStyle.interNormal( size: 14, color: AppStyle.textGrey, ), ), ), 8.verticalSpace, Expanded( child: GridView.builder( itemCount: 4, padding: REdgeInsets.symmetric(horizontal: 20, vertical: 16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, mainAxisExtent: 260.h, crossAxisSpacing: 16, mainAxisSpacing: 16, ), itemBuilder: (context, i)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 300), curve: Curves.easeOutCubic, decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular( AppConstants.radius.r, ), border: Border.all( color: isSelected ? colors.primary : AppStyle.border, width: isSelected ? 3.r : 1.r, ), boxShadow: [ BoxShadow( color: isSelected ? colors.primary.withValues(alpha: 0.2) : AppStyle.shadow, blurRadius: isSelected ? 20 : 12, offset: Offset(0, isSelected ? 8 : 4), spreadRadius: isSelected ? 2 : 0, ), ], ), padding: REdgeInsets.all(8), child: ClipRRect( borderRadius: BorderRadius.circular( (AppConstants.radius * 0.8).r, ), child: Stack( children: [ Positioned.fill( child: Image.asset( "assets/images/ui$i.png", fit: BoxFit.cover, alignment: Alignment.topCenter, ), ), Positioned.fill( child: Container( decoration: BoxDecoration( gradient: LinearGradient( begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [ AppStyle.transparent, AppStyle.black.withValues( alpha: 0.15, ), ], ), ), ), ), if (isSelected) Positioned.fill( child: AnimatedOpacity( opacity: isSelected ? 1.0 : 0.0, duration: const Duration( milliseconds: 200, ), child: Container( decoration: BoxDecoration( gradient: LinearGradient( begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [ colors.primary.withValues( alpha: 0.15, ), colors.primary.withValues( alpha: 0.05, ), ], ), ), child: Center( child: ScaleTransition( scale: CurvedAnimation( parent: _animationController, curve: Curves.elasticOut, ), child: Container( padding: REdgeInsets.all(10), decoration: BoxDecoration( color: colors.primary, shape: BoxShape.circle, boxShadow: [ BoxShadow( color: colors.primary .withValues(alpha: 0.4), blurRadius: 12, spreadRadius: 2, ), ], ), child: Icon( Icons.check_rounded, color: colors.buttonFontColor, size: 26.r, ), ), ), ), ), ), ), ], ), ), ), ), ); }, ), ), Container( decoration: BoxDecoration( color: colors.icon, boxShadow: [ BoxShadow( color: AppStyle.shadowBottom, blurRadius: 12, offset: const Offset(0, -4), ), ], ), padding: REdgeInsets.fromLTRB(20, 20, 20, 32), child: Column( children: [ CustomButton( title: AppHelpers.getTranslation(TrKeys.save), radius: 12, onPressed: () async { await LocalStorage.setUiType(index); if (context.mounted)`
*No documentation provided (generation failed).*
