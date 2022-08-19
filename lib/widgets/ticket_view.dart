import 'package:book_tickets/utilitys/app_layout.dart';
import 'package:book_tickets/utilitys/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  TicketView({
    Key? key,
    required this.ticket,
    this.isColor,
  }) : super(key: key);

  String? departureShortName;
  String? departureLongName;
  String? destinationShortName;
  String? destinationLongName;
  int? flightTimeHours;
  int? flightTimeMinutes;
  String? departureDate;
  String? departureTime;
  int? flightNumber;
  @override
  Widget build(BuildContext context) {
    departureShortName = ticket['from']['code'];
    departureLongName = ticket['from']['name'];
    destinationShortName = ticket['to']['code'];
    destinationLongName = ticket['to']['name'];
    flightTimeHours = ticket['flight_time_hours'];
    flightTimeMinutes = ticket['flight_time_minutes'];
    departureDate = ticket['date'];
    departureTime = ticket['departure_time'];
    flightNumber = ticket['number'];

    final size = AppLayout.getSize(context);

    return SizedBox(
      width: size.width * 0.92,
      height: AppLayout.getHeight(200),
      child: Container(
        margin: EdgeInsets.all(AppLayout.getHeight(10)),
        child: Column(
          children: [
            //blue part of ticket
            SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    color: isColor == null ? Styles.blueColor : Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppLayout.getHeight(21)),
                        topRight: Radius.circular(AppLayout.getHeight(21)))),
                padding: EdgeInsets.all(AppLayout.getHeight(16)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          departureShortName ?? '',
                          style: Styles.headLineStyle3.copyWith(color: isColor == null ? Colors.white : Colors.black),
                        ),
                        Expanded(child: Container()),
                        Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(3)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                            border: Border.all(
                                width: AppLayout.getWidth(2.5),
                                color: isColor == null ? Colors.white : Colors.blueAccent),
                          ),
                        ),
                        Expanded(
                          child: Stack(children: [
                            SizedBox(
                              height: AppLayout.getHeight(24),
                              child: LayoutBuilder(
                                builder: (BuildContext context, BoxConstraints constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                      (constraints.constrainWidth() / 6).floor(),
                                      (index) => SizedBox(
                                        width: AppLayout.getWidth(3),
                                        height: AppLayout.getHeight(1),
                                        child: DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: isColor == null ? Colors.white : Colors.grey),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                  angle: 1.5,
                                  child: Icon(
                                    Icons.airplanemode_active_sharp,
                                    color: isColor == null ? Colors.white : Colors.blueAccent,
                                  )),
                            )
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(3)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                            border: Border.all(
                                width: AppLayout.getWidth(2.5),
                                color: isColor == null ? Colors.white : Colors.blueAccent),
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          destinationShortName ?? '',
                          style: Styles.headLineStyle3.copyWith(color: isColor == null ? Colors.white : Colors.black),
                        )
                      ],
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        Text(
                          departureLongName ?? '',
                          style: Styles.headLineStyle4.copyWith(color: isColor == null ? Colors.white : Colors.black54),
                        ),
                        Expanded(child: Container()),
                        Center(
                          child: Text('${flightTimeHours}H ${flightTimeMinutes}M',
                              style:
                                  Styles.headLineStyle4.copyWith(color: isColor == null ? Colors.white : Colors.black)),
                        ),
                        Expanded(child: Container()),
                        Text(destinationLongName ?? '',
                            style:
                                Styles.headLineStyle4.copyWith(color: isColor == null ? Colors.white : Colors.black54)),
                      ],
                    )
                  ],
                ),
              ),
            ),

            Container(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      height: isColor == true ? AppLayout.getHeight(25) : AppLayout.getHeight(20),
                      width: AppLayout.getWidth(10),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Styles.bgColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(AppLayout.getHeight(10)),
                                  bottomRight: Radius.circular(AppLayout.getHeight(10)))),
                          child: isColor == true
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 5, bottom: 20),
                                  child: Transform.rotate(
                                      angle: 1.5,
                                      child: const Icon(
                                        Icons.adjust,
                                        color: Colors.black,
                                      )),
                                )
                              : Container()),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(AppLayout.getHeight(12)),
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            return Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                (constraints.constrainWidth() / 15).floor(),
                                (index) => SizedBox(
                                  width: AppLayout.getWidth(5),
                                  height: AppLayout.getHeight(1),
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                    color: isColor == null ? Colors.white : Colors.black54,
                                  )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: isColor == true ? AppLayout.getHeight(25) : AppLayout.getHeight(20),
                      width: AppLayout.getHeight(10),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Styles.bgColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(AppLayout.getHeight(10)),
                                  bottomLeft: Radius.circular(AppLayout.getHeight(10)))),
                          child: isColor == true
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 25, bottom: 25),
                                  child: Transform.rotate(
                                      angle: 1.5,
                                      child: const Icon(
                                        Icons.adjust,
                                        color: Colors.black,
                                      )),
                                )
                              : Container()),
                    ),
                  ],
                )),

            //orange part of ticket
            Container(
              decoration: BoxDecoration(
                  color: isColor == null ? Styles.orangeColor : Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: isColor == null
                          ? Radius.circular(AppLayout.getHeight(21))
                          : Radius.circular(AppLayout.getHeight(0)),
                      bottomRight: isColor == null
                          ? Radius.circular(AppLayout.getHeight(21))
                          : Radius.circular(AppLayout.getHeight(0)))),
              padding: EdgeInsets.only(
                  left: AppLayout.getHeight(16),
                  right: AppLayout.getHeight(16),
                  bottom: isColor == null ? AppLayout.getHeight(16) : AppLayout.getHeight(29),
                  top: AppLayout.getHeight(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(departureDate ?? '',
                          style: Styles.headLineStyle3.copyWith(color: isColor == null ? Colors.white : Colors.black)),
                      const Gap(3),
                      Text('Date',
                          style:
                              Styles.headLineStyle4.copyWith(color: isColor == null ? Colors.white : Colors.black54)),
                    ],
                  ),
                  Column(children: [
                    Text(departureTime ?? '',
                        style: Styles.headLineStyle3.copyWith(color: isColor == null ? Colors.white : Colors.black)),
                    const Gap(3),
                    Text('Departure Time',
                        style: Styles.headLineStyle4.copyWith(color: isColor == null ? Colors.white : Colors.black54)),
                  ]),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text(flightNumber.toString(),
                        style: Styles.headLineStyle3.copyWith(color: isColor == null ? Colors.white : Colors.black)),
                    const Gap(3),
                    Text('Number',
                        style: Styles.headLineStyle4.copyWith(color: isColor == null ? Colors.white : Colors.black54)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
