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
            final name = product['name']['first'];
            final email = product['email'];
            final imageUrl = product['picture']['thumbnail'];
            return ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(imageUrl)),
              title: Text(name.toString()),
              subtitle: Text(email),
              trailing: SizedBox(
                width: 50,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
                  ],
                ),
              ),
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
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      products = json['results'];
    });
    print('Fetch Products completed');
  }
}
