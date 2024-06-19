class ItemLocation {
  String itemLocation;
  bool isSelected;
  ItemLocation({required this.itemLocation, this.isSelected = false});
}

List<ItemLocation> itemLocation = [
  ItemLocation(itemLocation: "US Only"),
  ItemLocation(itemLocation: "North America"),
  ItemLocation(itemLocation: "Europe"),
  ItemLocation(itemLocation: "Asia"),
];
