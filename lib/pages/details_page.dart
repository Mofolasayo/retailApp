import 'package:flutter/material.dart';
import 'package:retail_app/constants/constants.dart';
import 'package:retail_app/models/item_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.item, required this.price});
  final Item item;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: Constants.deviceHeight(context) * 0.5,
              width: Constants.deviceWidth(context) * 0.95,
              child: item.photos.isNotEmpty
                  ? Image.network(
                      imageUrl + item.photos[0].url, // Displays the first photo
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  : const Text('No Images'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.name ?? "No title yet",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\$$price",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.description ?? 'No description yet',
              style: const TextStyle(height: 1.7),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                "❗Hurry, only ${item.availableQuantity.toInt()} left in stock",
                style: const TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
