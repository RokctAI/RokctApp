# API Reference: order_status

Source file: `lib/customer/presentation/pages/order/order_screen/widgets/order_status.dart`

## Classes

### class `OrderStatusScreen`

## Whitelisted API Endpoints

### `OrderStatusScreen({ super.key, required this.status, this.parcel = false, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Container(margin: EdgeInsets.only(top: 16.h), decoration: BoxDecoration( color: colors.backgroundColor, borderRadius: BorderRadius.circular(10.r), ), padding: EdgeInsets.all(14.r), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Text( AppHelpers.getTranslation( AppHelpers.getOrderStatusText(status), ), style: AppStyle.interNormal(size: 13, color: colors.textBlack), ), _buildStatusRow(colors), ], ), ); }, ); } Widget _buildStatusRow(CustomColorSet colors)`
*No documentation provided (generation failed).*

### `Row(children: [ _buildStatusItem( icon: parcel ? FlutterRemix.survey_fill : Icons.done_all, bgColor: color, iconColor: colors.buttonFontColor, colors: colors, ), _buildConnector(color), _buildStatusItem( icon: parcel ? Icons.done_all : Icons.restaurant_rounded, bgColor: color, iconColor: colors.primary, colors: colors, ), _buildConnector(color), _buildStatusItem( icon: parcel ? Icon(FlutterRemix.truck_fill, color: colors.primary) : SvgPicture.asset( Assets.svgDelivery2, width: 20.r, colorFilter: ColorFilter.mode( colors.buttonFontColor, BlendMode.srcIn, ), ), bgColor: color, colors: colors, ), _buildConnector(color), _buildStatusItem( icon: Icons.flag, bgColor: color, iconColor: colors.buttonFontColor, colors: colors, ), ], ); } Widget _buildInProgressStatusRow()`
*No documentation provided (generation failed).*

### `Row(children: [ _buildStatusItem( icon: parcel ? FlutterRemix.survey_fill : Icons.done_all, iconColor: colors.textBlack, isActive: !isOpen, isProgress: isOpen, colors: colors, ), _buildConnector(!isOpen ? colors.primary : colors.icon), _buildStatusItem( icon: parcel ? Icons.done_all : Icons.restaurant_rounded, iconColor: colors.textBlack, isActive: isReadyOrOnWay, isProgress: isAccepted, colors: colors, ), _buildConnector(isReadyOrOnWay ? colors.primary : colors.icon), _buildStatusItem( icon: parcel ? Icon(FlutterRemix.truck_fill, color: colors.textBlack) : SvgPicture.asset( isOnWay ? Assets.svgDelivery2 : Assets.svgDelivery, width: 20.w, colorFilter: ColorFilter.mode( colors.textBlack, BlendMode.srcIn, ), ), isActive: isOnWay, isProgress: isReadyOrDelivered, colors: colors, ), _buildConnector(colors.icon), _buildStatusItem( icon: Icon(Icons.flag, size: 16.r, color: colors.textBlack), isActive: false, isProgress: false, colors: colors, ), ], ); } Widget _buildStatusItem({ required Dyn icon, Color? bgColor, Color? iconColor, bool? isActive, bool? isProgress, required CustomColorSet colors, })`
*No documentation provided (generation failed).*

### `OrderStatusItem(icon: iconWidget, bgColor: bgColor, isActive: isActive ?? true, isProgress: isProgress ?? false, colors: colors, ); } Widget _buildConnector(Color color)`
*No documentation provided (generation failed).*
