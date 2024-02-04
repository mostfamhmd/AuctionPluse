class BuyingFormat {
  String buyingFormat;
  bool isSelected;

  BuyingFormat({required this.buyingFormat, this.isSelected = false});
}

List<BuyingFormat> buyingFormat = [
  BuyingFormat(buyingFormat: "All Listings"),
  BuyingFormat(buyingFormat: "Accepts Offers"),
  BuyingFormat(buyingFormat: "Auction"),
  BuyingFormat(buyingFormat: "Buy It Now"),
  BuyingFormat(buyingFormat: "Classified Ads"),
];
