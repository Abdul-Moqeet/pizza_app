import 'package:flutter/material.dart';
import 'package:pizza_app/components/widgets/Pizza_display.dart';

import 'Ingreidients_widget.dart';

class PizzaOrder extends StatefulWidget {
  const PizzaOrder({super.key});

  @override
  State<PizzaOrder> createState() => _PizzaOrderState();
}

class _PizzaOrderState extends State<PizzaOrder> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text(
          'Order Pizza',
          style: TextStyle(fontSize: 24, color: Colors.brown),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 50,),
          const Stack(
            children: [
              SizedBox(
                
                height:470,
                child: pizza_display(
                ),
              ),
            ],
          ),
          //**Ingredients**/
          SizedBox(
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: IngreidientsWidget()),
          //**Button**/
          const SizedBox(height: 20),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Colors.orange.withOpacity(0.7),
                Colors.orange.withOpacity(1)
              ], begin: Alignment.topCenter, end: Alignment.bottomRight),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Add To Cart',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
