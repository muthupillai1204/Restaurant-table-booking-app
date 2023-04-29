// ignore_for_file: null_closures

import 'dart:convert';

class CatalogModel {
  // static final catModel = CatalogModel._singleton();

  // CatalogModel._singleton();
  // factory CatalogModel() => catModel;

  static List<Item> items = [];

  //get item by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
  //get item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

//creating constructors
  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  //we will try to make constructor of item jismein hum batayenge ki yeh data hain humare pass json se haara hain and json ke hisab se obj chathe hain

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price'] ?? '',
      color: map['color'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}

// class SearchMutation extends VxMutation<MyStore> {
//   final String query;

//   SearchMutation(this.query);
//   @override
//   perform() {
//     if (query.length > 1) {
//       store?.items = CatalogModel.items
//           .where((el) => el.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     } else {
//       store?.items = CatalogModel.items;
//     }
//   }
// }
