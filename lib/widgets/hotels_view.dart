import 'package:book_tickets/utilitys/app_layout.dart';
import 'package:book_tickets/utilitys/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelView extends StatelessWidget {
  const HotelView({Key? key, required this.path, required this.title, required this.place, required this.price})
      : super(key: key);
  final String path;
  final String title;
  final String place;
  final int price;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        margin: const EdgeInsets.only(right: 17, top: 5, bottom: 17),
        decoration: BoxDecoration(color: Styles.primaryColor, borderRadius: BorderRadius.circular(12)),
        width: size.width * 0.6,
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Styles.primaryColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(path),
                ),
              ),
            ),
            const Gap(20),
            Text(
              title,
              style: Styles.headLineStyle2.copyWith(color: Colors.white38),
            ),
            const Gap(5),
            Text(
              place,
              style: Styles.headLineStyle3.copyWith(color: Colors.white),
            ),
            const Gap(15),
            Text("$price€/night", style: Styles.headLineStyle1.copyWith(color: Colors.white38)),
          ],
        ));
  }
}
