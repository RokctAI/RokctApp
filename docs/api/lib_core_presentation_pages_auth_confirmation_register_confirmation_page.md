# API Reference: register_confirmation_page

Source file: `lib/core/presentation/pages/auth/confirmation/register_confirmation_page.dart`

## Classes

### class `RegisterConfirmationPage`

## Whitelisted API Endpoints

### `RegisterConfirmationPage({ super.key, required this.userModel, this.isResetPassword = false, required this.verificationId, this.editPhone = false, }); @override ConsumerState<RegisterConfirmationPage> createState() => _RegisterConfirmationPageState(); } class _RegisterConfirmationPageState extends ConsumerState<RegisterConfirmationPage> { @override void initState()`
*No documentation provided (generation failed).*

### `deactivate()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `SetPasswordPage(), isDarkMode: isDarkMode, ); } }); return Directionality( textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: AbsorbPointer( absorbing: state.isLoading || state.isResending, child: KeyboardDismisser( child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Container(margin: MediaQuery.of(context).viewInsets, decoration: BoxDecoration( color: colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: Padding( padding: const EdgeInsets.all(16.0), child: SingleChildScrollView( child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.min, children: [ Column( children: [ AppBarBottomSheet( title: AppHelpers.getTranslation(TrKeys.enterOtp), ), Text( AppHelpers.getTranslation(TrKeys.sendOtp), style: AppStyle.interRegular( size: 14, color: colors.textBlack, ), ), Text( widget.userModel.email ?? "", style: AppStyle.interRegular( size: 14, color: colors.textBlack, ), ), 40.verticalSpace, SizedBox( height: 64, child: PinFieldAutoFill( codeLength: 6, currentCode: state.confirmCode, onCodeChanged: notifier.setCode, cursor: Cursor( width: 1, height: 24, color: colors.textBlack, enabled: true, ), decoration: BoxLooseDecoration( gapSpace: 10.r, textStyle: AppStyle.interNormal( size: 15, color: colors.textBlack, ), bgColorBuilder: FixedColorBuilder( isDarkMode ? colors.textBlack : AppStyle.transparent, ), strokeColorBuilder: FixedColorBuilder( state.isCodeError ? AppStyle.red : isDarkMode ? AppStyle.borderDark : AppStyle.outlineButtonBorder, ), ), ), ), ], ), Padding( padding: EdgeInsets.only( bottom: MediaQuery.paddingOf(context).bottom, top: 120.h, ), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ CustomButton( isLoading: state.isResending, title: state.isTimeExpired ? AppHelpers.getTranslation( TrKeys.resendOtp, ) : state.timerText, onPressed: ()`
*No documentation provided (generation failed).*
