import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String? landSize;
  final int? bedrooms;
  final String? deliveryTime;
  final String? price;
  final String imagePath;

  const ProjectCard({
    super.key,
    required this.title,
    this.landSize,
    this.bedrooms,
    this.deliveryTime,
    this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: 180),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    if (landSize != null && bedrooms != null)
                      Text('Land size: $landSize  •  Number of Bedroom: $bedrooms'),
                    if (deliveryTime != null && price != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery time',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Text(
                            '$price  $deliveryTime',
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}