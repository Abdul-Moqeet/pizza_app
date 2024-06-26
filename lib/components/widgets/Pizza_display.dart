import 'package:flutter/material.dart';
import 'package:pizza_app/Logic/price_selection.dart';
import 'package:pizza_app/constants/fixed_positions.dart';
import 'package:pizza_app/models/Pizza_lists.dart';

import 'Size_button.dart';

class pizza_display extends StatefulWidget {
  const pizza_display({super.key});
  @override
  _pizza_displayState createState() => _pizza_displayState();
}

class _pizza_displayState extends State<pizza_display>
    with TickerProviderStateMixin {
  List<Widget> _images = [];
  List selectedIngredients = [];
  late bool isSelectedS;
  late bool isSelectedM;
  late bool isSelectedL;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;
  late AnimationController _controller5;
  late AnimationController _controller6;
  late AnimationController _controller7;
  late AnimationController _controller8;
  late AnimationController _controller9;
  late AnimationController _controller10;
  

  void _addImage( data, AnimationController controller) {
    setState(() {
    
       List<Offset> positions = fixedPositions(data);

     for (int i = 0; i < 10; i++) {
         int index = _images.length  % positions.length;
        Animation<Offset> animation = Tween<Offset>(
        begin: Offset(40, 0),
        end: Offset(positions[index].dx, positions[index].dy, ),
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ));
      
       Animation<double> sizeAnimation = Tween<double>(
        begin: 1000.0,
        end: 20.0,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ));
   
      _images.add(
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Positioned(
            left: animation.value.dx,
            top: animation.value.dy,
            // left: positions[index].dx,
            // top: positions[index].dy,
            child: Image.asset(
              data,
              width: sizeAnimation.value,
              height: sizeAnimation.value,
            ),
          );
          },
          
        ),
      );
    }
    });
    controller.forward(); // Start animation for the current topping
  }

  @override
  void initState() {
    super.initState();
    isSelectedS = false;
    isSelectedM = true;
    isSelectedL = false;

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller4 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller5 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller6 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller7 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller8 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller9 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller10 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _controller8.dispose();
    _controller9.dispose();
    _controller10.dispose();
    super.dispose();
  }

  // List<Offset> fixedPositions = [
  //   const Offset(50.0, 50.0),
  //   const Offset(100.0, 100.0),
  //   const Offset(150.0, 50.0),
  //   const Offset(180.0, 150.0),
  //   const Offset(180.0, 100.0),
  //   const Offset(10.0, 150.0),
  //   const Offset(100.0, 180.0),
  //   const Offset(60.0, 110.0),
  //   const Offset(100.0, 40.0),
  //   const Offset(20.0, 120.0),
  // ];

  void selectSize(String size) {
    setState(() {
      isSelectedS = size == 'S';
      isSelectedM = size == 'M';
      isSelectedL = size == 'L';
      _images.clear(); // Clear images when size changes
      _resetControllers(); // Reset controllers when size changes
    });
  }

  void _resetControllers() {
    _controller1.reset();
    _controller2.reset();
    _controller3.reset();
    _controller4.reset();
    _controller5.reset();
    _controller6.reset();
    _controller7.reset();
    _controller8.reset();
    _controller9.reset();
    _controller10.reset();
  }

  @override
  Widget build(BuildContext context) {
    price_selection priceSelection = price_selection(
      isSelectedS: isSelectedS,
      isSelectedM: isSelectedM,
      isSelectedL: isSelectedL,
      selectedIngredients: selectedIngredients
    );

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.bounceOut,
          width: MediaQuery.of(context).size.width,
          height: isSelectedS ? 240 : isSelectedM ? 270 : 300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/accessories/dish.png',
                  height: 300,
                ),
              ),
              PageView.builder(
                itemCount: pizza_list.length,
                itemBuilder: (context, index) {
                  return Positioned(
                  child: DragTarget(
                    onAccept: (data) {
                      
                      setState(() {
                         selectedIngredients.add(data);
                      print(selectedIngredients.length);
                      });
                     
                      if (data ==
                          'assets/pizza_ingredients/unit/green_chillies_thumb.png') {
                        _addImage(data, _controller1);
                      } else if (data ==
                          'assets/pizza_ingredients/unit/green_peppers_thumb.png') {
                        _addImage(data, _controller2);
                      } else if (data ==
                          'assets/pizza_ingredients/unit/halloumi_thumb_unit.png') {
                        _addImage(data, _controller3);
                      } else if (data ==
                          'assets/pizza_ingredients/unit/mozarella_Cheese_thumb_unit.png') {
                        _addImage(data, _controller4);
                      } else if (data ==
                          'assets/pizza_ingredients/unit/mushrooms_thumb.png') {
                        _addImage(data, _controller5);
                      } else if (data ==
                          'assets/pizza_ingredients/unit/olives_thumb.png') {
                        _addImage(data, _controller6);
                      } else if (data ==
                          'assets/pizza_ingredients/unit/onions_thumb_unit.png') {
                        _addImage(data, _controller7);
                      } else if (data ==
                          'assets/pizza_ingredients/unit/pineapples_thumb_unit.png') {
                        _addImage(data, _controller8);
                      } else if (data ==
                          'assets/pizza_ingredients/unit/sweetcorn_thumb_unit.png') {
                        _addImage(data, _controller9);
                      } else if (data ==
                          'assets/pizza_ingredients/unit/tomatos_thumb_unit.png') {
                        _addImage(data, _controller10);
                      }
                      // Add more conditions for additional toppings

                    },
                    builder: (context, candidateData, rejectedData) {
                      return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: SizedBox(
         
         
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: AnimatedContainer(
                    height: isSelectedS ? 210 : isSelectedM ? 240 : 280,
                    curve: Curves.bounceOut,
                    duration: Duration(milliseconds: 1000),
                    child: Image.asset(
                      pizza_list[index].image,
                       
                      // Ensure the asset path is correct and accessible
                    ),
                  ),
                ),
              ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Stack(
                                    children: [..._images],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
                },
                
              ),
            ],
          ),
        ),
        Text(
          priceSelection.price_display(),
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 70,
          width: 220,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizeButton(
                  size_pizza: 'S',
                  isSelected: isSelectedS,
                  onSelect: () {
                    selectSize('S');
                    setState(() {
                      selectedIngredients = [];
                    });
                  },
                ),
                SizeButton(
                  size_pizza: 'M',
                  isSelected: isSelectedM,
                  onSelect: () {
                    selectSize('M');
                     setState(() {
                      selectedIngredients = [];
                    });
                  },
                ),
                SizeButton(
                  size_pizza: 'L',
                  isSelected: isSelectedL,
                  onSelect: () {
                    selectSize('L');
                     setState(() {
                      selectedIngredients = [];
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
