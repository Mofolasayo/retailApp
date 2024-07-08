import 'package:flutter/material.dart';

const imageUrl = 'https://api.timbu.cloud/images/';
const apiKey = '2340030005154108b0b037ecb54c31b720240705123255632211';
const appId = 'L3H8EEJZDG7X3MF';
const organizationId = '72f5394fba944b46ba189d89ad0ded36';

class Constants extends StatelessWidget {
  const Constants({super.key});
  static double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static Color darkGrey = const Color.fromRGBO(30, 30, 30, 1);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
