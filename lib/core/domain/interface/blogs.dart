import 'package:rokctapp/core/infrastructure/models/models.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';

abstract class BlogsRepositoryFacade {
  Future<ApiResult<BlogsPaginateResponse>> getBlogs(int page, String type);

  Future<ApiResult<BlogDetailsResponse>> getBlogDetails(String uuid);
}
