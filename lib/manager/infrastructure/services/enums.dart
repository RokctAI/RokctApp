import 'package:processing_sdk/processing_sdk.dart';
// Trace ID propagation context
enum SnackBarType { success, info, error }

enum ExtrasType { color, text, image }

enum UploadType {
  extras,
  brands,
  categories,
  shopsLogo,
  shopsBack,
  products,
  reviews,
  users,
}

enum ProductStatus { published, pending, unpublished }

extension ProductStatusProcessingMapping on ProductStatus {
  ProcessingState toProcessingState() {
    switch (this) {
      case ProductStatus.pending:
        return ProcessingState.submitted;
      case ProductStatus.published:
        return ProcessingState.active;
      case ProductStatus.unpublished:
        return ProcessingState.cancelled;
    }
  }

  static ProductStatus fromProcessingState(ProcessingState state) {
    switch (state) {
      case ProcessingState.draft:
      case ProcessingState.submitted:
      case ProcessingState.accepted:
      case ProcessingState.processing:
      case ProcessingState.ready:
      case ProcessingState.dispatched:
        return ProductStatus.pending;
      case ProcessingState.active:
      case ProcessingState.completed:
        return ProductStatus.published;
      case ProcessingState.failed:
      case ProcessingState.cancelled:
        return ProductStatus.unpublished;
    }
  }
}

enum WeekDays { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

enum AiTranslationModel {
  product('Product'),
  category('Category'),
  service('Service'),
  membership('MemberShip'),
  giftCart('GiftCart'),
  formOption('FormOption'),
  shop('Shop'),
  faq('Faq');

  const AiTranslationModel(this.type);

  final String type;
}

enum SignUpType { phone, email, both }
