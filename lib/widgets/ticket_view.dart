import 'package:book_tickets/utilitys/app_layout.dart';
import 'package:book_tickets/utilitys/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  const TicketView(
      {Key? key,
      required this.departureShortName,
      required this.departureLongName,
      required this.destinationShortName,
      required this.destinationLongName,
      required this.flightTimeHours,
      required this.flightTimeMinutes,
      required this.departureDate,
      required this.departureTime,
      required this.flightNumber})
      : super(key: key);

  final String departureShortName;
  final String departureLongName;
  final String destinationShortName;
  final String destinationLongName;
  final int flightTimeHours;
  final int flightTimeMinutes;
  final String departureDate;
  final String departureTime;
  final int flightNumber;
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SizedBox(
      width: size.width * 0.92,
      height: 200,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            //blue part of ticket
            SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    color: Styles.blueColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21))),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          departureShortName,
                          style: Styles.headLineStyle3.copyWith(color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        const ThickContainer(),
                        Expanded(
                          child: Stack(children: [
                            SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                builder: (BuildContext context, BoxConstraints constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                      (constraints.constrainWidth() / 6).floor(),
                                      (index) => const SizedBox(
                                        width: 3.0,
                                        height: 1.0,
                                        child: DecoratedBox(
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
                          destinationShortName,
                          style: Styles.headLineStyle3.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        Text(
                          departureLongName,
                          style: Styles.headLineStyle4.copyWith(color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        Center(
                          child: Text('${flightTimeHours}H ${flightTimeMinutes}M',
                              style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                        ),
                        Expanded(child: Container()),
                        Text(destinationLongName, style: Styles.headLineStyle4.copyWith(color: Colors.white)),
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
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(21), bottomRight: Radius.circular(21))),
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(departureDate, style: Styles.headLineStyle3.copyWith(color: Colors.white)),
                      const Gap(3),
                      Text('Date', style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                    ],
                  ),
                  Column(children: [
                    Text(departureTime, style: Styles.headLineStyle3.copyWith(color: Colors.white)),
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
              height: 20,
              width: 10,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius:
                          const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)))),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        (constraints.constrainWidth() / 15).floor(),
                        (index) => const SizedBox(
                          width: 5,
                          height: 1,
                          child: DecoratedBox(
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
              height: 20,
              width: 10,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)))),
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
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2.5, color: Colors.white),
      ),
    );
  }
}
