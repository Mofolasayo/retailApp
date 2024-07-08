# retail_app

In this Flutter application, I have implemented a feature that allows users to retrieve retail products from the Timbu API and present them in a scrollable list. Each product entry holds various information such as the name, description, price, and images, providing users with a comprehensive view of the available items. This application serves as a practical example of utilizing APIs, parsing JSON data, and exhibiting the results using Flutter widgets.

## Getting Started

Installation
Clone the repository:

```git clone https://github.com/your-username/retail-product-app.git```

```cd retail-product-app```

Install dependencies:
```flutter pub get```

Run the app:
```flutter run```

## Api Integration
This project uses the Timbu API to fetch product data. 
```import 'package:http/http.dart' as http;

class RetailService {
  static const BASE_URL = 'https://api.timbu.cloud/products';
  final String apiKey;
  final String appiD;
  final String organizationId;

  RetailService({
    required this.apiKey,
    required this.appiD,
    required this.organizationId,
  });

  Future<Retail> getRetail() async {
    final response = await http.get(Uri.parse(
        '$BASE_URL?organization_id=$organizationId&APP_ID=$appiD&API_KEY=$apiKey'));
    if (response.statusCode == 200) {
      return Retail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
```

