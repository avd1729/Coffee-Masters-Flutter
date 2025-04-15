import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Offer(
          title: 'Diwali offer', 
          description: 'This app slaps!!',),
           Offer(
          title: 'Diwali offer', 
          description: 'This app slaps!!',),
           Offer(
          title: 'Diwali offer', 
          description: 'This app slaps!!',),
           Offer(
          title: 'Diwali offer', 
          description: 'This app slaps!!',),
           Offer(
          title: 'Diwali offer', 
          description: 'This app slaps!!',),
           Offer(
          title: 'Diwali offer', 
          description: 'This app slaps!!',),
      ],
    );
  }
}

class Offer extends StatelessWidget {

  final String title;
  final String description;
  
  const Offer({
    super.key, 
    required this.title, 
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12), 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center, 
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}