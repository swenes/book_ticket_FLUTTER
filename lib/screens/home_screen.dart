// ignore_for_file: camel_case_types

import 'package:book_tickets/services/hotel_list.dart';
import 'package:book_tickets/services/ticket_list.dart';
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
                      children: ticketList.map((singleTicket) => TicketView(ticket: singleTicket)).toList(),
                    ),
                  ),
                ),
                const CategorieBarView(title: 'Hotels'),
                const Gap(10),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 12),
                  dragStartBehavior: DragStartBehavior.start,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: hotelList.map((e) => HotelView(hotel: e)).toList(),
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
