# API Reference: img_service

Source file: `lib/driver/infrastructure/services/img_service.dart`

## Classes

### class `ImgService`

## Whitelisted API Endpoints

### `getVideoGallery(ValueChanged<String> onChange) async { XFile? file; try { file = await ImagePicker().pickVideo(source: ImageSource.gallery); } catch (ex)`
*No documentation provided (generation failed).*

### `getPhotoGallery(ValueChanged<String> onChange) async { XFile? file; try { file = await ImagePicker().pickImage(source: ImageSource.gallery); } catch (ex)`
*No documentation provided (generation failed).*

### `getPhotoCamera(ValueChanged<String> onChange) async { XFile? file; try { file = await ImagePicker().pickImage(source: ImageSource.camera); } catch (ex)`
*No documentation provided (generation failed).*

### `getGallery() async { final ImagePicker picker = ImagePicker(); final XFile? image = await picker.pickImage(source: ImageSource.gallery); if (image != null)`
*No documentation provided (generation failed).*

### `getCamera() async { final ImagePicker picker = ImagePicker(); final XFile? image = await picker.pickImage(source: ImageSource.camera); if (image != null)`
*No documentation provided (generation failed).*
