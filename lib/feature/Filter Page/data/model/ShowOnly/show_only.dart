class ShowOnly {
   String showOnly;
   bool isSelected;
  ShowOnly({required this.showOnly, this.isSelected = false});
}

List<ShowOnly> showOnly = [
  ShowOnly(showOnly: "Free Returns"),
  ShowOnly(showOnly: "Returns Accepted"),
  ShowOnly(showOnly: "Authorized Seller"),
  ShowOnly(showOnly: "Completed Items"),
  ShowOnly(showOnly: "Sold Items"),
  ShowOnly(showOnly: "Deals & Savings"),
  ShowOnly(showOnly: "Sale Items"),
  ShowOnly(showOnly: "Listed as Lots"),
  ShowOnly(showOnly: "Search in Description"),
  ShowOnly(showOnly: "Benefits charity"),
  ShowOnly(showOnly: "Authenticity Verified"),
];