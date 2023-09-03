import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            final name = product['name'];
            final description = product['details']['description'];
            final price = product['details']['price'];
            final id = product['details']['id'];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Text(price.toString()),
              ),
              title: Text(name.toString()),
              subtitle: Text(description.toString()),
            );
          }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: new Icon(
          Icons.replay_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        onPressed: fetchProducts,
      ),
    );
  }

  void fetchProducts() async {
    print('Fetch Products call');
    const url = 'https://615f5fb4f7254d0017068109.mockapi.io/api/v1/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    products = json;
    print('Fetch Products completed');
  }
}
