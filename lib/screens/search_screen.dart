import 'package:book_tickets/utilitys/app_styles.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 25.0),
          child: Text(
            'What are\nyou looking for?',
            style: Styles.headLineStyle4.copyWith(fontSize: 45, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
