import 'package:flutter/material.dart';
import 'package:paye_ton_kawa/screen/product.dart';
import 'package:paye_ton_kawa/screen/security.dart';
import 'package:paye_ton_kawa/screen/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paye ton kawa',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Icon(
                  Icons.lock,
                  color: Colors.green,
                  size: 200.0,
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Vérifier la connexion

                    print(_usernameController.text);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => NavigationPage(),
                      ),
                    );
                  },
                  child: Text("S'inscrire"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Vérifier la connexion
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => ScanPage(),
                      ),
                    );
                  },
                  child: Text('Se Connecter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    SearchPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paye ton kawa'),
        backgroundColor: Colors.green,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_rounded),
            backgroundColor: Colors.green,
            label: 'Produits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            backgroundColor: Colors.green,
            label: 'Paramètres',
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductScreen(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SettingPage(),
    );
  }
}

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
