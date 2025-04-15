import 'package:coffee_masters/pages/menu.dart';
import 'package:coffee_masters/pages/offers.dart';
import 'package:coffee_masters/pages/order.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedIndex = 1;

  @override
  Widget build(BuildContext context) {

    Widget currentWidgetPage = const Text("");

    switch (selectedIndex){
      case 0:
        currentWidgetPage = const MenuPage();
        break;
       case 1:
        currentWidgetPage = const OffersPage();
        break;
       case 2:
        currentWidgetPage = const OrderPage();
        break;
      
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
        centerTitle: true,
        title: Center(
          child: Image.asset(
            "images/logo.png",
            height: 40, 
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: selectedIndex,
        onTap: (value) => {
          setState(() {
            selectedIndex = value;
          })
        },
        
        items: const [
        BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
        BottomNavigationBarItem(label: "Offers", icon: Icon(Icons.local_offer)),
        BottomNavigationBarItem(label: "Order", icon: Icon(Icons.shopping_basket)),
      ]),

      body: currentWidgetPage,
    );
  }
}
