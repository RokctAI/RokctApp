# API Reference: gallery_repository

Source file: `lib/customer/repository/gallery_repository.dart`

## Classes

### class `GalleryRepository`

## Whitelisted API Endpoints

### `uploadImage(String file, UploadType uploadType, ) async { String type = ''; switch (uploadType)`
*No documentation provided (generation failed).*

### `Duration(seconds: 30); client.options.receiveTimeout = const Duration(seconds: 30); final response = await client.post( '/api/v1/dashboard/galleries', data: data, ); return ApiResult.success( data: GalleryUploadResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `uploadMultiImage(List<String?> filePaths, UploadType uploadType, ) async { String type = ''; switch (uploadType)`
*No documentation provided (generation failed).*

### `Duration(seconds: 30); client.options.receiveTimeout = const Duration(seconds: 30); final response = await client.post( '/api/v1/dashboard/galleries/store-many', data: data, ); return ApiResult.success( data: MultiGalleryUploadResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
