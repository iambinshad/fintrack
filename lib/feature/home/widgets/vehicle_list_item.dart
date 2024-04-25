import 'package:flutter/material.dart';

class CarListItem extends StatelessWidget {
  final index;
  final image;
  final name;
  final descri;
  final price;
  const CarListItem(
      {this.index, super.key, this.image, this.name, this.descri, this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: Image(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover),

          // decoration: BoxDecoration(color: Colors.grey,image: DecorationImage(image:)),
        ),
        Container(
          child: Column(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(descri),
              Text(
                price,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
