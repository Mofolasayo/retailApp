import 'package:flutter/material.dart';
import 'package:retail_app/constants/constants.dart';
import 'package:retail_app/models/retail_model.dart';
import 'package:retail_app/services/retail_services.dart';
import 'package:retail_app/utils/image_tiles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Retail> futureRetail;

  @override
  void initState() {
    super.initState();
    futureRetail = RetailServices(
      apiKey: apiKey,
      appId: appId,
      organizationId: organizationId,
    ).getRetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Decor Dash',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: FutureBuilder<Retail>(
            future: futureRetail,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final items =
                    snapshot.data!.items; // Accessing items from Retail object
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];

                      final price = item.currentPrice.isNotEmpty &&
                              item.currentPrice[0].usd.isNotEmpty
                          ? item.currentPrice[0].usd[0].toString()
                          : 'No prices yet!';
                      return ImageTiles(item: item, price: price);
                    },
                  ),
                );
              } else {
                return const Text('No data found, try again later!');
              }
            },
          ),
        ));
  }
}
