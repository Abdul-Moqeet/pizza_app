
class price_selection {
 
  final bool isSelectedS;
  final bool isSelectedL;
  final bool isSelectedM;
    final List selectedIngredients;
  

  
  price_selection(
      {
      required this.isSelectedS,
      required this.isSelectedM,
      required this.isSelectedL,
      this.selectedIngredients = const []});

  String price_display() {
    double baseprice;
    if (isSelectedS) {
      
     baseprice = 13.9;
    } else if (isSelectedM) {
      baseprice = 15.9;
    } else {
        baseprice = 17.9;
    }

    double ingredientscost = selectedIngredients.length * 1;
    double total_price = baseprice + ingredientscost;
    String price = '\$$total_price';
  
    return price;
  }
  
}
