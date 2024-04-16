import 'package:flutter/material.dart';

class CreatePizzaScreen extends StatelessWidget {
  const CreatePizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Text('Create Screen'),
      ),
    );
  }
}
