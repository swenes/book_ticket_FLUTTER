// ignore_for_file: camel_case_types

import 'package:book_tickets/widgets/ticket_view.dart';
import 'package:book_tickets/utilitys/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/app_bar_view.dart';
import '../widgets/categories_bar_view.dart';
import '../widgets/hotels_view.dart';
import '../widgets/search_bar_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(50),
                const AppBarView(),
                const Gap(25),
                const SearchBarView(),
                const Gap(40),
                const CategorieBarView(title: 'Upcoming Flights'),
                const Gap(10),
                SingleChildScrollView(
                  dragStartBehavior: DragStartBehavior.start,
                  scrollDirection: Axis.horizontal,
                  child: Expanded(
                    child: Row(
                      children: const [
                        TicketView(
                          departureShortName: 'TR',
                          departureLongName: 'Türkiye  ',
                          destinationShortName: 'DE',
                          destinationLongName: 'Almanya',
                          flightTimeHours: 16,
                          flightTimeMinutes: 40,
                          departureDate: '1 MAY',
                          departureTime: '6:00 PM',
                          flightNumber: 24,
                        ),
                        TicketView(
                          departureShortName: 'NYC',
                          departureLongName: 'New-York',
                          destinationShortName: 'LND',
                          destinationLongName: '  London',
                          flightTimeHours: 8,
                          flightTimeMinutes: 30,
                          departureDate: '5 MAY',
                          departureTime: '08:00 AM',
                          flightNumber: 24,
                        ),
                        TicketView(
                          departureShortName: 'FR',
                          departureLongName: 'Fransa      ',
                          destinationShortName: 'BG',
                          destinationLongName: 'Bulgaristan',
                          flightTimeHours: 14,
                          flightTimeMinutes: 45,
                          departureDate: ' 7 MAY',
                          departureTime: '14:00 AM',
                          flightNumber: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                const CategorieBarView(title: 'Hotels'),
                const Gap(10),
                SingleChildScrollView(
                  dragStartBehavior: DragStartBehavior.start,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      HotelView(
                        title: 'Tallest Building',
                        path: 'assets/images/three.png',
                        place: 'Dubai',
                        price: 68,
                      ),
                      HotelView(
                        title: 'Global Will',
                        path: 'assets/images/two.png',
                        place: 'New York',
                        price: 45,
                      ),
                      HotelView(
                        title: 'Open Space',
                        path: 'assets/images/one.png',
                        place: 'London',
                        price: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
