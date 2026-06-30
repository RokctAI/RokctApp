

enum ShopStatus { notRequested, newShop, edited, approved, rejected }

extension ShopStatusProcessingMapping on ShopStatus {
  ProcessingState toProcessingState() {
    switch (this) {
      case ShopStatus.notRequested:
        return ProcessingState.draft;
      case ShopStatus.newShop:
        return ProcessingState.submitted;
      case ShopStatus.edited:
        return ProcessingState.processing;
      case ShopStatus.approved:
        return ProcessingState.active;
      case ShopStatus.rejected:
        return ProcessingState.failed;
    }
  }

  static ShopStatus fromProcessingState(ProcessingState state) {
    switch (state) {
      case ProcessingState.draft:
        return ShopStatus.notRequested;
      case ProcessingState.submitted:
        return ShopStatus.newShop;
      case ProcessingState.accepted:
      case ProcessingState.processing:
      case ProcessingState.ready:
      case ProcessingState.dispatched:
        return ShopStatus.edited;
      case ProcessingState.active:
      case ProcessingState.completed:
        return ShopStatus.approved;
      case ProcessingState.failed:
      case ProcessingState.cancelled:
        return ShopStatus.rejected;
    }
  }
}

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

enum PriceFilter { byLow, byHigh }

enum ListAlignment { singleBig, vertically, horizontally }

enum ExtrasType { color, text, image }

enum DeliveryTypeEnum { delivery, pickup }

enum ShippingDeliveryVisibilityType {
  cantOrder,
  onlyDelivery,
  onlyPickup,
  both,
}

enum CouponType { fix, percent }

enum MessageOwner { you, partner }

enum BannerType { banner, look }

enum LookProductStockStatus { outOfStock, alreadyAdded, notAdded }

enum SignUpType { phone, email, both }

enum AppFlavor { customer, driver, manager }
