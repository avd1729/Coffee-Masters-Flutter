import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Offer(
          title: 'Buy 1 Get 1 Free',
          description: 'On all cappuccinos this weekend only!',
        ),
        Offer(
          title: 'Happy Hour ☕',
          description: 'Espresso shots at half price, 4–6 PM daily.',
        ),
        Offer(
          title: 'New Launch: Iced Latte',
          description: 'Cool down with our latest iced treat!',
        ),
        Offer(
          title: 'Loyalty Perk',
          description: 'Collect 5 stars, get a free Americano.',
        ),
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
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'serif', // Try 'monospace' or remove if platform default is good
                          color: Colors.brown[700],
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'serif', // Try 'monospace' or remove if platform default is good
                          color: Colors.brown[700],
                          letterSpacing: 1.2,
                        ),
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