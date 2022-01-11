class ProductsList{
  List<ProductModel> products =[];

  ProductsList(products);

  ProductsList.fromListJson(dynamic json){
    for (var item in json as List){
      products.add(ProductModel.fromJson(item));
    }
  }
}
class ProductModel {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? dateOnSaleFrom;
  String? dateOnSaleFromGmt;
  String? dateOnSaleTo;
  String? dateOnSaleToGmt;
  String? priceHtml;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<String>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  int? stockQuantity;
  String? stockStatus;
  String? backorders;
  bool? backordersAllowed;
  bool? backOrdered;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<int>? relatedIds;
  List<int>? upSellIds;
  List<int>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Categories>? categories;
  List<Tag>? tags;
  List<Images>? images;
  List<Attributes>? attributes;
  List<String>? defaultAttributes;
  List<int>? variations;
  List<String>? groupedProducts;
  int? menuOrder;
  List<MetaData>? metaData;
  Links? lLinks;
  int? cartItems;
  bool? isLiked;
  ProductModel(
      this.id,
        this.name,
        this.slug,
        this.permalink,
        this.dateCreated,
        this.dateCreatedGmt,
        this.dateModified,
        this.dateModifiedGmt,
        this.type,
        this.status,
        this.featured,
        this.catalogVisibility,
        this.description,
        this.shortDescription,
        this.sku,
        this.price,
        this.regularPrice,
        this.salePrice,
        this.dateOnSaleFrom,
        this.dateOnSaleFromGmt,
        this.dateOnSaleTo,
        this.dateOnSaleToGmt,
        this.priceHtml,
        this.onSale,
        this.purchasable,
        this.totalSales,
        this.virtual,
        this.downloadable,
        this.downloads,
        this.downloadLimit,
        this.downloadExpiry,
        this.externalUrl,
        this.buttonText,
        this.taxStatus,
        this.taxClass,
        this.manageStock,
        this.stockQuantity,
        this.stockStatus,
        this.backorders,
        this.backordersAllowed,
        this.backOrdered,
        this.soldIndividually,
        this.weight,
        this.dimensions,
        this.shippingRequired,
        this.shippingTaxable,
        this.shippingClass,
        this.shippingClassId,
        this.reviewsAllowed,
        this.averageRating,
        this.ratingCount,
        this.relatedIds,
        this.upSellIds,
        this.crossSellIds,
        this.parentId,
        this.purchaseNote,
        this.categories,
        this.tags,
        this.images,
        this.attributes,
        this.defaultAttributes,
        this.variations,
        this.groupedProducts,
        this.menuOrder,
        this.metaData,
        this.lLinks);

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    permalink = json['permalink'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    type = json['type'];
    status = json['status'];
    featured = json['featured'];
    catalogVisibility = json['catalog_visibility'];
    cartItems = json['cartItems'];
    isLiked = json['isLiked'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    dateOnSaleFrom = json['date_on_sale_from'];
    dateOnSaleFromGmt = json['date_on_sale_from_gmt'];
    dateOnSaleTo = json['date_on_sale_to'];
    dateOnSaleToGmt = json['date_on_sale_to_gmt'];
    priceHtml = json['price_html'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    totalSales = json['total_sales'] is String ? int.parse(json['total_sales']) : json['total_sales'];
    virtual = json['virtual'];
    downloadable = json['downloadable'];
    if (json['downloads'] != null) {
      downloads = [];
      json['downloads'].forEach((v) {
        downloads!.add(v);
      });
    }
    downloads= [];
    downloadLimit = json['download_limit'];
    downloadExpiry = json['download_expiry'];
    externalUrl = json['external_url'];
    buttonText = json['button_text'];
    taxStatus = json['tax_status'];
    taxClass = json['tax_class'];
    manageStock = json['manage_stock'];
    stockQuantity = json['stock_quantity'];
    stockStatus = json['stock_status'];
    backorders = json['backorders'];
    backordersAllowed = json['backorders_allowed'];
    backOrdered = json['backordered'];
    soldIndividually = json['sold_individually'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    shippingRequired = json['shipping_required'];
    shippingTaxable = json['shipping_taxable'];
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    reviewsAllowed = json['reviews_allowed'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    relatedIds = json['related_ids'].cast<int>();
    if (json['upsell_ids'] != null) {
      upSellIds = [];
      json['upsell_ids'].forEach((v) {
        upSellIds!.add(v);
      });
    }else upSellIds = [];
    if (json['cross_sell_ids'] != null) {
      crossSellIds = [];
      json['cross_sell_ids'].forEach((v) {
        crossSellIds!.add(v);
      });
    }else crossSellIds = [];
    parentId = json['parent_id'];
    purchaseNote = json['purchase_note'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }else categories = [];
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags!.add(Tag.fromJson(v));
      });
    }else   tags = [];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }else  images = [];
    if (json['attributes'] != null) {
      attributes = [];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }else attributes = [];
    if (json['default_attributes'] != null) {
      defaultAttributes = [];
      json['default_attributes'].forEach((v) {
        defaultAttributes!.add(v);
      });
    }else defaultAttributes = [];
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations!.add(v);
      });
    }else variations = [];
    if (json['grouped_products'] != null) {
      groupedProducts = [];
      json['grouped_products'].forEach((v) {
        groupedProducts!.add(v);
      });
    }
    menuOrder = json['menu_order'];
    if (json['meta_data'] != null) {
      metaData =[];
      json['meta_data'].forEach((v) {
        metaData!.add(MetaData.fromJson(v));
      });
    }else metaData =[];
    lLinks = json['_links'] != null ?  Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['cartItems'] = this.cartItems;
    data['isLiked'] = this.isLiked;
    data['permalink'] = this.permalink;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['type'] = this.type;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['catalog_visibility'] = this.catalogVisibility;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['sku'] = this.sku;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['date_on_sale_from'] = this.dateOnSaleFrom;
    data['date_on_sale_from_gmt'] = this.dateOnSaleFromGmt;
    data['date_on_sale_to'] = this.dateOnSaleTo;
    data['date_on_sale_to_gmt'] = this.dateOnSaleToGmt;
    data['price_html'] = this.priceHtml;
    data['on_sale'] = this.onSale;
    data['purchasable'] = this.purchasable;
    data['total_sales'] = this.totalSales;
    data['virtual'] = this.virtual;
    data['downloadable'] = this.downloadable;
    if (this.downloads != null) {
      data['downloads'] = this.downloads!.map((v) => v).toList();
    }
    data['download_limit'] = this.downloadLimit;
    data['download_expiry'] = this.downloadExpiry;
    data['external_url'] = this.externalUrl;
    data['button_text'] = this.buttonText;
    data['tax_status'] = this.taxStatus;
    data['tax_class'] = this.taxClass;
    data['manage_stock'] = this.manageStock;
    data['stock_quantity'] = this.stockQuantity;
    data['stock_status'] = this.stockStatus;
    data['backorders'] = this.backorders;
    data['backorders_allowed'] = this.backordersAllowed;
    data['backordered'] = this.backOrdered;
    data['sold_individually'] = this.soldIndividually;
    data['weight'] = this.weight;
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions!.toJson();
    }
    data['shipping_required'] = this.shippingRequired;
    data['shipping_taxable'] = this.shippingTaxable;
    data['shipping_class'] = this.shippingClass;
    data['shipping_class_id'] = this.shippingClassId;
    data['reviews_allowed'] = this.reviewsAllowed;
    data['average_rating'] = this.averageRating;
    data['rating_count'] = this.ratingCount;
    data['related_ids'] = this.relatedIds;
    if (this.upSellIds != null) {
      data['upsell_ids'] = this.upSellIds!.map((v) => v).toList();
    }
    if (this.crossSellIds != null) {
      data['cross_sell_ids'] =
          this.crossSellIds!.map((v) => v).toList();
    }
    data['parent_id'] = this.parentId;
    data['purchase_note'] = this.purchaseNote;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    if (this.defaultAttributes != null) {
      data['default_attributes'] =
          this.defaultAttributes!.map((v) => v).toList();
    }
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v).toList();
    }
    if (this.groupedProducts != null) {
      data['grouped_products'] =
          this.groupedProducts!.map((v) => v).toList();
    }
    data['menu_order'] = this.menuOrder;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData!.map((v) => v).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class MetaData {

  int? id ;
  String? key;
  String? value;

  MetaData.fromJson(Map<String , dynamic> json){
    key = json["key"];
    value = json["value"].toString();
    id = json["id"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    data['id'] = this.id;
    return data;
  }
}

class Tag {
  int? id ;
  String? name;
  String? slug;

  Tag.fromJson(Map<String , dynamic> json){
    slug = json["slug"];
    name = json["name"];
    id = json["id"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions(this.length, this.width, this.height);

  Dimensions.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;

  Categories({this.id, this.name, this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Images {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  Images(
      {this.id,
        this.dateCreated,
        this.dateCreatedGmt,
        this.dateModified,
        this.dateModifiedGmt,
        this.src,
        this.name,
        this.alt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['src'] = this.src;
    data['name'] = this.name;
    data['alt'] = this.alt;
    return data;
  }
}

class Attributes {
  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  Attributes(
      {this.id,
        this.name,
        this.position,
        this.visible,
        this.variation,
        this.options});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    visible = json['visible'];
    variation = json['variation'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    data['visible'] = this.visible;
    data['variation'] = this.variation;
    data['options'] = this.options;
    return data;
  }
}

class Links {
  List<Collection>? self;
  List<Collection>? collection;

  Links({this.self, this.collection});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self =[];
      json['self'].forEach((v) {
        self!.add(new Collection.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection =[];
      json['collection'].forEach((v) {
        collection!.add(new Collection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Collection {
  String? href;
  Collection({this.href});

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
