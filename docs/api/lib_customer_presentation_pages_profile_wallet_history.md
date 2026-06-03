# API Reference: wallet_history

Source file: `lib/customer/presentation/pages/profile/wallet_history.dart`

## Classes

### class `WalletHistoryPage`

## Whitelisted API Endpoints

### `WalletHistoryPage({super.key}); @override ConsumerState<WalletHistoryPage> createState() => _WalletHistoryState(); } class _WalletHistoryState extends ConsumerState<WalletHistoryPage> { late RefreshController controller; final bool isLtr = LocalStorage.getLangLtr(); @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( body: (colors) => Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.transactions), style: AppStyle.interNoSemi(size: 18, color: colors.textBlack), ), ), _buildContent(state, event, colors), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, floatingActionButton: (colors) => Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: const PopButton(), ), ), ); } Widget _buildContent( ProfileState state, ProfileNotifier event, CustomColorSet colors,)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.only(top: 56.h), child: const Loading(), ); } if (state.walletHistory?.isEmpty ?? true)`
*No documentation provided (generation failed).*

### `Expanded(child: Center( child: Column( mainAxisAlignment: MainAxisAlignment.center, children: [ Icon( Icons.account_balance_wallet_outlined, size: 64.r, color: AppStyle.textGrey, ), 16.verticalSpace, Text( AppHelpers.getTranslation(TrKeys.nothingFound), style: AppStyle.interRegular( size: 16, color: AppStyle.textGrey, ), ), ], ), ), ); } return Expanded( child: SmartRefresher( enablePullDown: true, enablePullUp: true, physics: const BouncingScrollPhysics(), controller: controller, onLoading: () => event.getWalletPage(context, controller), onRefresh: () => event.getWallet(context, refreshController: controller), child: ListView.builder( padding: EdgeInsets.all(16.r), itemCount: state.walletHistory?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Container(margin: EdgeInsets.only(bottom: 12.h), decoration: BoxDecoration( borderRadius: BorderRadius.circular(12.r), color: colors.icon, boxShadow: [ BoxShadow( color: AppStyle.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 2), ), ], ), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ _buildHeader(createdAt), _buildDivider(), _buildDetails(createdAt), ], ), ); } Widget _buildHeader(DateTime? createdAt)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.all(16.r), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ if (createdAt != null) Text( TimeService.dateFormatMDYHm(createdAt), style: AppStyle.interRegular(size: 12, color: AppStyle.textGrey), ), if (createdAt != null) 6.verticalSpace, Text( history.note ?? "", style: AppStyle.interSemi(size: 16, color: colors.textBlack), maxLines: 2, overflow: TextOverflow.ellipsis, ), ], ), ); } Widget _buildDivider()`
*No documentation provided (generation failed).*

### `Divider(height: 1, thickness: 1, color: AppStyle.textGrey.withValues(alpha: 0.2), indent: 16.r, endIndent: 16.r, ); } Widget _buildDetails(DateTime? createdAt)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.all(16.r), child: Column( children: [ _buildDetailRow( label: AppHelpers.getTranslation(TrKeys.paymentDate), value: createdAt != null ? TimeService.dateFormatDMY(createdAt) : "-", ), 12.verticalSpace, if (history.author?.firstname != null) _buildDetailRow( label: AppHelpers.getTranslation(TrKeys.sender), value: history.author?.firstname ?? "", ), if (history.author?.firstname != null) 12.verticalSpace, _buildDetailRow( label: AppHelpers.getTranslation(TrKeys.deposit), value: AppHelpers.numberFormat(history.price), valueStyle: AppStyle.interSemi( size: 16, color: (history.price ?? 0) >= 0 ? colors.primary : AppStyle.red, ), ), ], ), ); } Widget _buildDetailRow({ required String label, required String value, TextStyle? valueStyle, })`
*No documentation provided (generation failed).*
