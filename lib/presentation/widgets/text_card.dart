import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String title;
  final String description;

  const TextCard({
    super.key,
    required this.description,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
              Text('Hola Bienvenido a Mexico Explora', style: TextStyle(fontSize: 23, color: Colors.amber),),
              Text(
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.justify,
                description
              ),
          ],
        ),
      ),
    );
  }
}
