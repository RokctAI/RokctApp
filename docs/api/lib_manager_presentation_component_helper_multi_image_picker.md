# API Reference: multi_image_picker

Source file: `lib/manager/presentation/component/helper/multi_image_picker.dart`

## Classes

### class `MultiImagePicker`

## Whitelisted API Endpoints

### `Function(String) onDelete; final Function(String) onImageChange; const MultiImagePicker({ super.key, this.listOfImages, required this.onDelete, this.imageUrls, required this.onImageChange, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(children: [ (itemCount > 0) == false ? ButtonEffectAnimation( onTap: () async { Delayed(milliseconds: 300).run(() async { XFile? file; try { file = await ImagePicker().pickImage( source: ImageSource.gallery, ); } catch (ex)`
*No documentation provided (generation failed).*

### `onDelete((imageUrls?.isNotEmpty ?? false) ? imageUrls?.first?.path ?? "" : listOfImages?.first ?? "", ), child: BlurWrap( blur: 6, radius: BorderRadius.circular(20.r), child: Container( height: 40.r, width: 40.r, decoration: BoxDecoration( shape: BoxShape.circle, color: AppStyle.white.withOpacity(0.2), ), child: Icon( FlutterRemix.delete_bin_fill, color: AppStyle.white, size: 18.r, ), ), ), ), ), ], ), if (itemCount > 0) GridView.builder( padding: REdgeInsets.only(top: 12), itemCount: itemCount, gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( crossAxisSpacing: 8.r, mainAxisSpacing: 8.r, maxCrossAxisExtent: 100.r, childAspectRatio: 0.9, ), physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, itemBuilder: (BuildContext context, int index)`
*No documentation provided (generation failed).*

### `Icon(FlutterRemix.delete_bin_line, color: AppStyle.black, ), ), ), ), ), ], ); }, ), ], ); } ButtonEffectAnimation _mediaPicker(BuildContext context)`
*No documentation provided (generation failed).*

### `ButtonEffectAnimation(onTap: () async { Delayed(milliseconds: 300).run(() async { XFile? file; try { file = await ImagePicker().pickImage(source: ImageSource.gallery); } catch (ex)`
*No documentation provided (generation failed).*
