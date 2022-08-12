import 'package:book_tickets/utilitys/app_layout.dart';
import 'package:book_tickets/utilitys/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  TicketView({
    Key? key,
    required this.ticket,
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
                    color: Styles.blueColor,
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
                          style: Styles.headLineStyle3.copyWith(color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        const ThickContainer(),
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
                                        child: const DecoratedBox(
                                          decoration: BoxDecoration(color: Colors.white),
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
                                  child: const Icon(
                                    Icons.airplanemode_active_sharp,
                                    color: Colors.white,
                                  )),
                            )
                          ]),
                        ),
                        const ThickContainer(),
                        Expanded(child: Container()),
                        Text(
                          destinationShortName ?? '',
                          style: Styles.headLineStyle3.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        Text(
                          departureLongName ?? '',
                          style: Styles.headLineStyle4.copyWith(color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        Center(
                          child: Text('${flightTimeHours}H ${flightTimeMinutes}M',
                              style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                        ),
                        Expanded(child: Container()),
                        Text(destinationLongName ?? '', style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ),
            ),

            const _MiddleBorder(),

            //orange part of ticket
            Container(
              decoration: BoxDecoration(
                  color: Styles.orangeColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                      bottomRight: Radius.circular(AppLayout.getHeight(21)))),
              padding: EdgeInsets.only(
                  left: AppLayout.getHeight(16),
                  right: AppLayout.getHeight(16),
                  bottom: AppLayout.getHeight(16),
                  top: AppLayout.getHeight(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(departureDate ?? '', style: Styles.headLineStyle3.copyWith(color: Colors.white)),
                      const Gap(3),
                      Text('Date', style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                    ],
                  ),
                  Column(children: [
                    Text(departureTime ?? '', style: Styles.headLineStyle3.copyWith(color: Colors.white)),
                    const Gap(3),
                    Text('Departure Time', style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                  ]),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text(flightNumber.toString(), style: Styles.headLineStyle3.copyWith(color: Colors.white)),
                    const Gap(3),
                    Text('Number', style: Styles.headLineStyle4.copyWith(color: Colors.white)),
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

class _MiddleBorder extends StatelessWidget {
  const _MiddleBorder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Styles.orangeColor,
        child: Row(
          children: [
            SizedBox(
              height: AppLayout.getHeight(20),
              width: AppLayout.getWidth(10),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppLayout.getHeight(10)),
                          bottomRight: Radius.circular(AppLayout.getHeight(10))))),
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
                          child: const DecoratedBox(
                              decoration: BoxDecoration(
                            color: Colors.white,
                          )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: AppLayout.getHeight(20),
              width: AppLayout.getHeight(10),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppLayout.getHeight(10)),
                          bottomLeft: Radius.circular(AppLayout.getHeight(10))))),
            ),
          ],
        ));
  }
}

class ThickContainer extends StatelessWidget {
  const ThickContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppLayout.getHeight(3)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
        border: Border.all(width: AppLayout.getWidth(2.5), color: Colors.white),
      ),
    );
  }
}
