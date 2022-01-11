class OrderModel {
  int? id;
  int? parentId;
  String? status;
  String? currency;
  String? version;
  bool? pricesIncludeTax;
  String? dateCreated;
  String? dateModified;
  String? discountTotal;
  String? discountTax;
  String? shippingTotal;
  String? shippingTax;
  String? cartTax;
  String? total;
  String? totalTax;
  int? customerId;
  String? orderKey;
  Billing? billing;
  Shipping? shipping;
  String? paymentMethod;
  String? paymentMethodTitle;
  String? transactionId;
  String? customerIpAddress;
  String? customerUserAgent;
  String? createdVia;
  String? customerNote;
  String? dateCompleted;
  String? datePaid;
  String? cartHash;
  String? number;
  List<LineItems>? lineItems;
  List<TaxLines>? taxLines;
  List<ShippingLines>? shippingLines;
  String? dateCreatedGmt;
  String? dateModifiedGmt;
  String? dateCompletedGmt;
  String? datePaidGmt;
  String? currencySymbol;

  

  OrderModel.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    status = json['status'];
    currency = json['currency'];
    version = json['version'];
    pricesIncludeTax = json['prices_include_tax'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    discountTotal = json['discount_total'];
    discountTax = json['discount_tax'];
    shippingTotal = json['shipping_total'];
    shippingTax = json['shipping_tax'];
    cartTax = json['cart_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
    customerId = json['customer_id'];
    orderKey = json['order_key'];
    billing =
    json['billing'] != null ? new Billing.fromJson(json['billing']) : null;
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    paymentMethod = json['payment_method'];
    paymentMethodTitle = json['payment_method_title'];
    transactionId = json['transaction_id'];
    customerIpAddress = json['customer_ip_address'];
    customerUserAgent = json['customer_user_agent'];
    createdVia = json['created_via'];
    customerNote = json['customer_note'];
    dateCompleted = json['date_completed'];
    datePaid = json['date_paid'];
    cartHash = json['cart_hash'];
    number = json['number'];

    if (json['line_items'] != null) {
      lineItems = [];
      json['line_items'].forEach((v) {
        lineItems!.add(new LineItems.fromJson(v));
      });
    }
    if (json['tax_lines'] != null) {
      taxLines = [];
      json['tax_lines'].forEach((v) {
        taxLines!.add(new TaxLines.fromJson(v));
      });
    }
    if (json['shipping_lines'] != null) {
      shippingLines = [];
      json['shipping_lines'].forEach((v) {
        shippingLines!.add(new ShippingLines.fromJson(v));
      });
    }
    dateCreatedGmt = json['date_created_gmt'];
    dateModifiedGmt = json['date_modified_gmt'];
    dateCompletedGmt = json['date_completed_gmt'];
    datePaidGmt = json['date_paid_gmt'];
    currencySymbol = json['currency_symbol'];
  }

 /* Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['status'] = this.status;
    data['currency'] = this.currency;
    data['version'] = this.version;
    data['prices_include_tax'] = this.pricesIncludeTax;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['discount_total'] = this.discountTotal;
    data['discount_tax'] = this.discountTax;
    data['shipping_total'] = this.shippingTotal;
    data['shipping_tax'] = this.shippingTax;
    data['cart_tax'] = this.cartTax;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    data['customer_id'] = this.customerId;
    data['order_key'] = this.orderKey;
    if (this.billing != null) {
      data['billing'] = this.billing!.toJson();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    data['payment_method'] = this.paymentMethod;
    data['payment_method_title'] = this.paymentMethodTitle;
    data['transaction_id'] = this.transactionId;
    data['customer_ip_address'] = this.customerIpAddress;
    data['customer_user_agent'] = this.customerUserAgent;
    data['created_via'] = this.createdVia;
    data['customer_note'] = this.customerNote;
    data['date_completed'] = this.dateCompleted;
    data['date_paid'] = this.datePaid;
    data['cart_hash'] = this.cartHash;
    data['number'] = this.number;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems.map((v) => v.toJson()).toList();
    }
    if (this.taxLines != null) {
      data['tax_lines'] = this.taxLines.map((v) => v.toJson()).toList();
    }
    if (this.shippingLines != null) {
      data['shipping_lines'] =
          this.shippingLines.map((v) => v.toJson()).toList();
    }
    if (this.feeLines != null) {
      data['fee_lines'] = this.feeLines.map((v) => v.toJson()).toList();
    }
    if (this.couponLines != null) {
      data['coupon_lines'] = this.couponLines.map((v) => v.toJson()).toList();
    }
    if (this.refunds != null) {
      data['refunds'] = this.refunds.map((v) => v.toJson()).toList();
    }
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['date_completed_gmt'] = this.dateCompletedGmt;
    data['date_paid_gmt'] = this.datePaidGmt;
    data['currency_symbol'] = this.currencySymbol;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }*/
}

class Billing {
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? email;
  String? phone;

  Billing(
      {this.firstName,
        this.lastName,
        this.company,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.postcode,
        this.country,
        this.email,
        this.phone});

  Billing.fromJson(Map<String?, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class Shipping {
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? phone;

  Shipping(
      {this.firstName,
        this.lastName,
        this.company,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.postcode,
        this.country,
        this.phone});

  Shipping.fromJson(Map<String?, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    phone = json['phone'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    data['phone'] = this.phone;
    return data;
  }
}

class MetaData {
  int? id;
  String? key;
  String? value;

  MetaData({this.id, this.key, this.value});

  MetaData.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class LineItems {
  int? id;
  String? name;
  int? productId;
  int? variationId;
  int? quantity;
  String? taxClass;
  String? subtotal;
  String? subtotalTax;
  String? total;
  String? totalTax;
  List<Taxes>? taxes;
  List<MetaData>? metaData;
  dynamic sku;
  int? price;
  dynamic parentName;

  LineItems(
      {this.id,
        this.name,
        this.productId,
        this.variationId,
        this.quantity,
        this.taxClass,
        this.subtotal,
        this.subtotalTax,
        this.total,
        this.totalTax,
        this.taxes,
        this.metaData,
        this.sku,
        this.price,
        this.parentName});

  LineItems.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    variationId = json['variation_id'];
    quantity = json['quantity'];
    taxClass = json['tax_class'];
    subtotal = json['subtotal'];
    subtotalTax = json['subtotal_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
    if (json['taxes'] != null) {
      taxes = [];
      json['taxes'].forEach((v) {
        taxes!.add(new Taxes.fromJson(v));
      });
    }
    if (json['meta_data'] != null) {
      metaData = [];
      json['meta_data'].forEach((v) {
        metaData!.add(v);
      });
    }
    sku = json['sku'];
    price = json['price'];
    parentName = json['parent_name'];
  }

}

class Taxes {
  int? id;
  String? total;
  String? subtotal;

  Taxes({this.id, this.total, this.subtotal});

  Taxes.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    total = json['total'];
    subtotal = json['subtotal'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['subtotal'] = this.subtotal;
    return data;
  }
}

class TaxLines {
  int? id;
  String? rateCode;
  int? rateId;
  String? label;
  bool? compound;
  String? taxTotal;
  String? shippingTaxTotal;
  int? ratePercent;
  List<MetaData>? metaData;

  TaxLines(
      {this.id,
        this.rateCode,
        this.rateId,
        this.label,
        this.compound,
        this.taxTotal,
        this.shippingTaxTotal,
        this.ratePercent,
        this.metaData});

  TaxLines.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    rateCode = json['rate_code'];
    rateId = json['rate_id'];
    label = json['label'];
    compound = json['compound'];
    taxTotal = json['tax_total'];
    shippingTaxTotal = json['shipping_tax_total'];
    ratePercent = json['rate_percent'];
    if (json['meta_data'] != null) {
      metaData = [];
      json['meta_data'].forEach((v) {
        metaData!.add(v);
      });
    }
  }

}

class ShippingLines {
  int? id;
  String? methodTitle;
  String? methodId;
  String? instanceId;
  String? total;
  String? totalTax;
  List<Taxes>? taxes;
  List<MetaData>? metaData;

  ShippingLines(
      {this.id,
        this.methodTitle,
        this.methodId,
        this.instanceId,
        this.total,
        this.totalTax,
        this.taxes,
        this.metaData});

  ShippingLines.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    methodTitle = json['method_title'];
    methodId = json['method_id'];
    instanceId = json['instance_id'];
    total = json['total'];
    totalTax = json['total_tax'];
    if (json['taxes'] != null) {
      taxes =[];
      json['taxes'].forEach((v) {
        taxes!.add(new Taxes.fromJson(v));
      });
    }
    if (json['meta_data'] != null) {
      metaData = [];
      json['meta_data'].forEach((v) {
        metaData!.add(v);
      });
    }
  }


}

class Links {
  List<Self>? self;
  List<dynamic>? collection;
  List<dynamic>? customer;

  Links({this.self, this.collection, this.customer});

  Links.fromJson(Map<String?, dynamic> json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self!.add(new Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection =[];
      json['collection'].forEach((v) {
        collection!.add(v);
      });
    }
    if (json['customer'] != null) {
      customer = [];
      json['customer'].forEach((v) {
        customer!.add(v);
      });
    }
  }


}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String?, dynamic> json) {
    href = json['href'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
