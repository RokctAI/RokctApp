import 'package:rokctapp/customer/models/models.dart';
import 'package:rokctapp/customer/models/response/multi_gallery_upload_response.dart';
import 'package:rokctapp/core/infrastructure/services/services.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';

abstract class GalleryRepositoryFacade {
  Future<ApiResult<GalleryUploadResponse>> uploadImage(
    String file,
    UploadType uploadType,
  );

  Future<ApiResult<MultiGalleryUploadResponse>> uploadMultiImage(
    List<String?> filePaths,
    UploadType uploadType,
  );
}
