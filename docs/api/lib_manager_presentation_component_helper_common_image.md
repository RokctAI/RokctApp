# API Reference: common_image

Source file: `lib/manager/presentation/component/helper/common_image.dart`

## Classes

### class `CommonImage`

## Whitelisted API Endpoints

### `CommonImage({ super.key, this.url, this.width, this.height, this.radius = 10, this.errorRadius = 10, this.errorBackground, this.fit, this.fileImage, this.preview, this.name, this.title, this.onDelete, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ClipRRect(borderRadius: BorderRadius.circular(radius.r), child: preview != null ? Stack( children: [ CachedNetworkImage( height: height?.r, width: width?.r, imageUrl: preview ?? "", fit: fit, progressIndicatorBuilder: (context, url, progress)`
*No documentation provided (generation failed).*

### `Container(height: height?.r, width: width?.r, decoration: const BoxDecoration( color: AppStyle.shimmerBase, ), child: (width ?? 0) > 58 ? Center( child: Text( AppHelpers.getTranslation( AppHelpers.getAppName(), ), style: AppStyle.interNormal( color: AppStyle.text, size: 12, ), ), ) : const SizedBox.shrink(), ); }, errorWidget: (context, url, error)`
*No documentation provided (generation failed).*

### `Container(decoration: BoxDecoration( borderRadius: BorderRadius.circular(radius.r), color: name == null ? AppStyle.shimmerBase : AppStyle.primary, ), alignment: Alignment.center, child: name == null ? const Icon(FlutterRemix.file_unknow_line) : Text( name?.substring(0, 1) ?? "", style: AppStyle.interNormal( color: AppStyle.white, size: (height ?? 0) / 2.5, ), ), ); }, ), Positioned.fill( child: Center( child: ButtonEffectAnimation( onTap: ()`
*No documentation provided (generation failed).*
