# API Reference: background_image_picker

Source file: `lib/manager/presentation/pages/become_seller/widgets/background_image_picker.dart`

## Classes

### class `BackgroundImagePicker`

## Whitelisted API Endpoints

### `BackgroundImagePicker({ super.key, required this.bgImage, required this.event, }); Future<void> _pickImage() async { XFile? file; try { file = await ImagePicker().pickImage(source: ImageSource.gallery); } catch (ex)`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `AnimatedContainer(duration: const Duration(milliseconds: 300), height: 180.h, width: double.infinity, decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(16.r), boxShadow: [ BoxShadow( color: AppStyle.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4), ), ], ), child: bgImage.isNotEmpty ? _buildImagePreview() : _buildImagePlaceholder(), ); } Widget _buildImagePreview()`
*No documentation provided (generation failed).*

### `Stack(children: [ SizedBox( height: 180.h, width: double.infinity, child: ClipRRect( borderRadius: BorderRadius.circular(16.r), child: Image.file(File(bgImage), fit: BoxFit.cover), ), ), Positioned( top: 12.h, right: 16.w, child: Row( children: [ _buildActionButton( icon: FlutterRemix.image_add_fill, onTap: _pickImage, ), 10.horizontalSpace, _buildActionButton( icon: FlutterRemix.delete_bin_fill, onTap: () => event.setBgImage(""), ), ], ), ), ], ); } Widget _buildActionButton({ required IconData icon, required VoidCallback onTap, })`
*No documentation provided (generation failed).*

### `InkWell(onTap: onTap, child: BlurWrap( radius: BorderRadius.circular(20.r), child: Container( height: 40.r, width: 40.r, decoration: BoxDecoration( shape: BoxShape.circle, color: AppStyle.white.withOpacity(0.15), ), child: Icon(icon, color: AppStyle.white), ), ), ); } Widget _buildImagePlaceholder()`
*No documentation provided (generation failed).*
