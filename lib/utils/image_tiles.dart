import 'package:flutter/material.dart';
import 'package:retail_app/constants/constants.dart';
import 'package:retail_app/models/item_model.dart';
import 'package:retail_app/pages/details_page.dart';

class ImageTiles extends StatelessWidget {
  const ImageTiles({
    super.key,
    required this.item,
    required this.price,
  });

  final Item item;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, right: 8.0, left: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                    item: item,
                    price: price,
                  )));
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: item.photos.isNotEmpty
                  ? Image.network(
                      imageUrl + item.photos[0].url,
                      width: 70,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  : const Center(child: Text('No Image Available')),
              title: Text(item.name ?? ''),
              subtitle: Text("\$$price"),
              trailing: const Icon(Icons.arrow_forward),
            ),
          ),
        ),
      ),
    );
  }
}
