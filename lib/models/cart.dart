///this page is for removing or adding items in cart
// ignore_for_file: unnecessary_null_comparison

import 'package:restaurant_table_reservation/core/store.dart';
import 'package:restaurant_table_reservation/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //foodapp list
  late CatalogModel _catalog;

//COllection of IDs - store IDs of each item
//final list of integer from item id
  final List<int> _itemIds = [];

//get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // // for adding items
  void add(Item item) {
    _itemIds.add(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id); //write all ur logic of store
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id); //write all ur logic of store
  }
}
