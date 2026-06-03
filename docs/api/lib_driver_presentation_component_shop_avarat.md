# API Reference: shop_avarat

Source file: `lib/driver/presentation/component/shop_avarat.dart`

## Classes

### class `ShopAvatar`

## Whitelisted API Endpoints

### `ShopAvatar({ super.key, required this.size, required this.padding, this.bgColor = AppStyle.blackColorOpacity, this.radius = 10, this.imageUrl, this.path, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ClipRRect(borderRadius: BorderRadius.circular(radius.r), child: BackdropFilter( filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), child: Container( width: size.r, height: size.r, color: bgColor, padding: EdgeInsets.all(padding.r), child: ClipRRect( borderRadius: BorderRadius.circular(size.r / 2), child: imageUrl != null ? CachedNetworkImage( imageUrl: '$imageUrl', fit: BoxFit.cover, progressIndicatorBuilder: (context, url, progress)`
*No documentation provided (generation failed).*
