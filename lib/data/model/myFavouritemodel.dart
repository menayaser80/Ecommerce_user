class MyFavoriteModel {
  dynamic favoriteId;
  dynamic favoriteUsersid;
  dynamic favoriteItemsid;
  dynamic itemsId;
  dynamic itemsName;
  dynamic itemsNameAr;
  dynamic itemsDesc;
  dynamic itemsDescAr;
  dynamic itemsImage;
  dynamic itemsCount;
  dynamic itemsActive;
  dynamic itemsPrice;
  dynamic itemsDiscount;
  dynamic itemsDate;
  dynamic itemsCat;
  dynamic usersId;

  MyFavoriteModel(
      {this.favoriteId,
        this.favoriteUsersid,
        this.favoriteItemsid,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCat,
        this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favourite_id'].toString();
    favoriteUsersid = json['favourite_userid'];
    favoriteItemsid = json['favourite_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favourite_id'] = this.favoriteId;
    data['favourite_userid'] = this.favoriteUsersid;
    data['favourite_itemsid'] = this.favoriteItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['users_id'] = this.usersId;
    return data;
  }
}