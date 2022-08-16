import 'package:book_tickets/utilitys/app_layout.dart';
import 'package:book_tickets/utilitys/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class HotelView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  HotelView({Key? key, required this.hotel}) : super(key: key);
  String? path;
  String? title;
  String? place;
  int? price;

  @override
  Widget build(BuildContext context) {
    path = "assets/images/${hotel['image']}";
    title = hotel['destination'];
    place = hotel['place'];
    price = hotel['price'];
    final size = AppLayout.getSize(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        margin: const EdgeInsets.only(right: 17, top: 5, bottom: 17),
        decoration: BoxDecoration(
          color: Styles.primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.red,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        width: size.width * 0.5,
        height: AppLayout.getHeight(350),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: AppLayout.getHeight(180),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
                color: Styles.primaryColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(path ?? ''),
                ),
              ),
            ),
            const Gap(20),
            Text(
              title ?? '',
              style: Styles.headLineStyle2.copyWith(color: Colors.white38),
            ),
            const Gap(5),
            Text(
              place ?? '',
              style: Styles.headLineStyle3.copyWith(color: Colors.white),
            ),
            const Gap(15),
            Text("\$${price ?? 'hata'}/night", style: Styles.headLineStyle1.copyWith(color: Colors.white38)),
          ],
        ));
  }
}
