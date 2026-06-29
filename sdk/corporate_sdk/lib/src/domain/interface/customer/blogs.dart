import 'package:rokctapp/customer/models/models.dart';
import 'package:core_sdk/core_sdk.dart';

abstract class BlogsRepositoryFacade {
  Future<ApiResult<BlogsPaginateResponse>> getBlogs(int page, String type);

  Future<ApiResult<BlogDetailsResponse>> getBlogDetails(String uuid);
}
