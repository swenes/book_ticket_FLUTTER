import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchBarView extends StatelessWidget {
  const SearchBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xfff4f6fd),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [Icon(Icons.search), Gap(10), Text('Search')],
      ),
    );
  }
}
