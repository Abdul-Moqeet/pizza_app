import 'package:flutter/material.dart';
import 'package:pizza_app/models/ingredients_list.dart';

class IngreidientsWidget extends StatefulWidget {

  // const IngreidientsWidget({super.key});

  @override
  State<IngreidientsWidget> createState() => _IngreidientsWidgetState();
}

class _IngreidientsWidgetState extends State<IngreidientsWidget> {
  
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: ingredients.length,
      itemBuilder: (context, index) {

        
       
        return Column(children: [
          
          Draggable(
            
            onDragCompleted: () {
              
            },
            // data: ingredients[index].Image,
            
            data: ingredients_unit[index].Image,
            feedback: Image.asset(ingredients[index].Image, height: 70,
            width: 70,),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 221, 217, 174),
                  borderRadius: BorderRadius.circular(50)),
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              padding: const EdgeInsets.all(8),
              height: 60,
              width: 60,
              child: Image.asset(ingredients[index].Image),
            ),
          ),
          Text(ingredients[index].name, style: TextStyle(fontSize: 15),)
        ]);
      },
    );
  }
}
