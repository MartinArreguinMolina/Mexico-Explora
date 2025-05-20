import 'dart:ui';

import 'package:flutter/material.dart';
class DestinationIconCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String imageUrl;

  const DestinationIconCard({
    required this.icon,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Imagen de fondo
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
            // Capa de difuminado
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                color: Colors.black.withOpacity(0.3), // sombra oscura sutil
              ),
            ),
            // Contenido frontal
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 40, color: Colors.white),
                  const SizedBox(height: 10),
                  Text(
                    '$title 📌',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


