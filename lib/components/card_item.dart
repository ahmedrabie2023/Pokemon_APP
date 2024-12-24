import 'package:flutter/material.dart';
class CardItem extends StatelessWidget {
  final String image;
  final String text;
  const CardItem({super.key, required this.image, required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: Image.network(image)),
             Text(text,style: const TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold
             ),),
          ],
        ),

      ),
    );
  }
}
