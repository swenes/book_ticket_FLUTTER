import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utilitys/app_styles.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: Styles.headLineStyle3,
            ),
            const Gap(5),
            Text('Book Tickets', style: Styles.headLineStyle1),
          ],
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/img_1.png'),
            ),
          ),
        )
      ],
    );
  }
}
