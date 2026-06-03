# API Reference: gallery_upload_response

Source file: `lib/core/infrastructure/models/response/gallery_upload_response.dart`

## Classes

### class `GalleryUploadResponse`

### class `ImageData`

## Whitelisted API Endpoints

### `copyWith({ String? timestamp, bool? status, String? message, ImageData? imageData, }) => GalleryUploadResponse( timestamp: timestamp ?? _timestamp, status: status ?? _status, message: message ?? _message, imageData: imageData ?? _imageData, ); String? get timestamp => _timestamp; bool? get status => _status; String? get message => _message; ImageData? get imageData => _imageData; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({String? title, String? type}) => ImageData(title: title ?? _title, type: type ?? _type); String? get title => _title; String? get type => _type; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
