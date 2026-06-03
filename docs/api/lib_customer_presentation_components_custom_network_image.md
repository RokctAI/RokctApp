# API Reference: custom_network_image

Source file: `lib/customer/presentation/components/custom_network_image.dart`

## Classes

### class `CustomNetworkImage`

## Whitelisted API Endpoints

### `CustomNetworkImage({ super.key, required this.url, this.height, this.width, required this.radius, this.fit = BoxFit.cover, this.bgColor = AppStyle.mainBack, this.profile = false, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ClipRRect(borderRadius: BorderRadius.circular(radius), child: AppHelpers.checkIsSvg(url) ? SvgPicture.network( url ?? "", width: width, height: height, fit: BoxFit.cover, placeholderBuilder: (_) => Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(radius), color: AppStyle.shimmerBase, ), ), ) : CachedNetworkImage( height: height, width: width, imageUrl: url ?? "", fit: fit, progressIndicatorBuilder: (context, url, progress)`
*No documentation provided (generation failed).*

### `Container(height: height, width: width, decoration: BoxDecoration(color: AppStyle.shimmerBase), ); }, errorWidget: (context, url, error)`
*No documentation provided (generation failed).*
