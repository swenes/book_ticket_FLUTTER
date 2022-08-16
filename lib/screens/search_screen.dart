import 'package:book_tickets/utilitys/app_layout.dart';
import 'package:book_tickets/utilitys/app_styles.dart';
import 'package:book_tickets/widgets/categories_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(
          padding: EdgeInsets.all(AppLayout.getHeight(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              'What are\nyou looking for?',
              style: Styles.headLineStyle1.copyWith(fontSize: AppLayout.getHeight(35)),
            ),
            Gap(AppLayout.getHeight(20)),
            chooseBar(size, 'Airline Tickets', 'Hotels'),
            Gap(AppLayout.getHeight(30)),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: AppLayout.getHeight(10)),
                  height: AppLayout.getHeight(45),
                  width: size.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(AppLayout.getHeight(10)), color: Colors.white),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.flight_takeoff_outlined,
                        color: Colors.grey,
                      ),
                      Gap(AppLayout.getHeight(10)),
                      Text(
                        'Departure',
                        style: Styles.headLineStyle3.copyWith(color: Colors.black54),
                      )
                    ],
                  ),
                ),
                Gap(AppLayout.getHeight(30)),
                Container(
                  padding: EdgeInsets.only(left: AppLayout.getHeight(10)),
                  height: AppLayout.getHeight(45),
                  width: size.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(AppLayout.getHeight(10)), color: Colors.white),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.flight_land_outlined,
                        color: Colors.grey,
                      ),
                      Gap(AppLayout.getHeight(10)),
                      Text(
                        'Arrival',
                        style: Styles.headLineStyle3.copyWith(color: Colors.black54),
                      )
                    ],
                  ),
                ),
                Gap(AppLayout.getHeight(20)),
                Container(
                  height: AppLayout.getHeight(55),
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(10)), color: Colors.blueAccent.shade700),
                  child: Center(
                    child: Text(
                      'Find Tickets',
                      style: Styles.headLineStyle3.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(30)),
                const CategorieBarView(title: 'Upcoming Flights')
              ],
            ),
            Gap(AppLayout.getHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 370,
                  width: size.width * 0.43,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          height: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/sit.jpg'),
                            ),
                          ),
                        ),
                        Gap(AppLayout.getHeight(20)),
                        Text(
                          "%20 discount on the early booking of this flight. Don't miss",
                          style: Styles.headLineStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(30)),
                Column(
                  children: [
                    Container(
                      height: 200,
                      width: size.width * 0.40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppLayout.getHeight(15)), color: Colors.cyan.shade600),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              'Discount for survey',
                              style: Styles.headLineStyle1.copyWith(color: Colors.white),
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Text('Take the survey about our services and get a discount',
                                style: Styles.headLineStyle3.copyWith(fontSize: 20, color: Colors.white70))
                          ],
                        ),
                      ),
                    ),
                    Gap(AppLayout.getHeight(20)),
                    Container(
                      height: 200,
                      width: size.width * 0.40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppLayout.getHeight(15)), color: Colors.red),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            Text(
                              'Take Love',
                              style: Styles.headLineStyle1.copyWith(color: Colors.white),
                            ),
                            Gap(AppLayout.getHeight(10)),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '😍',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  TextSpan(
                                    text: '🥰',
                                    style: TextStyle(fontSize: 42),
                                  ),
                                  TextSpan(
                                    text: '😍',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static Row chooseBar(size, String firstTitle, String secondTitle) {
    return Row(
      children: [
        Container(
          width: size.width * .45,
          padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(50)),
                  bottomLeft: Radius.circular(AppLayout.getHeight(50))),
              color: Colors.white),
          child: Text(
            firstTitle,
            style: Styles.textStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: size.width * .45,
          padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppLayout.getHeight(50)),
                  bottomRight: Radius.circular(AppLayout.getHeight(50))),
              color: const Color.fromARGB(44, 125, 123, 123)),
          child: Text(
            secondTitle,
            style: Styles.textStyle.copyWith(color: Colors.black45),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
