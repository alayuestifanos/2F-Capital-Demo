import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int journeyType = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/background.jpeg',
                  ),
                ),
              ),
              height: 350.0,
            ),
            Container(
              height: 350.0,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    const Color(0xff101042).withOpacity(0.9),
                    const Color(0xff101042)
                  ],
                  stops: const [1.0, 0.0],
                ),
              ),
              child: Column(
                children: [
                  _buildTopPart(),
                  const SizedBox(
                    height: 15,
                  ),
                  SelectJourney(
                    journeyType: journeyType,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "From",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      Text(
                        "To",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildDestinationPart(context),
                ],
              ),
            )
          ],
        ),

        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _buildDepartureAndReturnWidget(
                  context: context,
                  month: "Sep",
                  day: "05",
                  dayOfTheWeek: "Tuesday",
                  label: "Departure Date",
                ),
              ),
              const VerticalDivider(
                color: Color(
                  0xff818181,
                ),
              ),
              Expanded(
                child: _buildDepartureAndReturnWidget(
                  context: context,
                  month: "Sep",
                  day: "20",
                  dayOfTheWeek: "Wednesday",
                  label: "Return Date",
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: Color(
            0xff818181,
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _buildSeatType(
                  label: "Cabin Class",
                  values: Text(
                    "Economy",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const VerticalDivider(
                color: Color(
                  0xff818181,
                ),
              ),
              Expanded(
                child: _buildSeatType(
                  label: "Passengers",
                  values: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _passengers(
                        icon: FontAwesomeIcons.person,
                        value: "1",
                      ),
                      _passengers(
                        icon: FontAwesomeIcons.personDress,
                        value: "0",
                      ),
                      _passengers(
                        icon: FontAwesomeIcons.person,
                        value: "1",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: Color(
            0xff818181,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width / 1.5,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xfff1c933),
            ),
            child: Text(
              'Search Flights',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color(0xff12185c),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            onPressed: () async {},
          ),
        ),
        // TextButton(
        //   onPressed: () {
        //     showModalBottomSheet(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return const BottomSheetWidget();
        //       },
        //     );
        //   },
        //   child: const Text("Show modal"),
        // )
      ],
    );
  }

  Row _passengers({
    required IconData icon,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }

  Widget _buildSeatType({required String label, required Widget values}) {
    return Container(
      padding: const EdgeInsets.all(
        10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(
                    0xff818181,
                  ),
                  fontSize: 16,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          values
        ],
      ),
    );
  }

  Container _buildDepartureAndReturnWidget({
    required BuildContext context,
    required String label,
    required String month,
    required String day,
    required String dayOfTheWeek,
  }) {
    return Container(
      margin: const EdgeInsets.all(
        5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(
                    0xff818181,
                  ),
                  fontSize: 16,
                ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(
                day,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: const Color(0xff252466),
                    ),
              ),
              const SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    month,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color(0xff252466),
                        ),
                  ),
                  Text(
                    dayOfTheWeek,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Row _buildDestinationPart(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "ADD",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            Text(
              "Addis Ababa ",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                  ),
            ),
            Text(
              "Bole International Airport",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 10,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.swap_horiz,
            color: Colors.black,
          ),
        ),
        Text(
          "Select Destination",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12,
                color: Colors.white,
              ),
        ),
      ],
    );
  }

  Row _buildTopPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Image.asset(
          "assets/images/guzogoe.png",
          width: 80,
          height: 80,
        ),
        Container(
          margin: const EdgeInsets.only(
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Passangers",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Row(
                        children: [
                          Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            "Done",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Adult",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            width: 29,
                            height: 29,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "-",
                                  style: TextStyle(fontSize: 25),
                                )),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            "1",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Adult",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            width: 29,
                            height: 29,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "-",
                                  style: TextStyle(fontSize: 25),
                                )),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            "1",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Adult",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            width: 29,
                            height: 29,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "-",
                                  style: TextStyle(fontSize: 25),
                                )),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            "1",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Adult",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            width: 29,
                            height: 29,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "-",
                                  style: TextStyle(fontSize: 25),
                                )),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            "1",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SelectJourney extends StatefulWidget {
  int journeyType;
  SelectJourney({super.key, required this.journeyType});

  @override
  State<SelectJourney> createState() => _SelectJourneyState();
}

class _SelectJourneyState extends State<SelectJourney> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          JourneyType(
            label: "Return",
            color: widget.journeyType == 1 ? Colors.white : null,
            textColor: widget.journeyType == 1 ? Colors.black : Colors.white,
            onTap: () {
              setState(() {
                widget.journeyType = 1;
              });
            },
          ),
          JourneyType(
            label: "One-Way",
            color: widget.journeyType == 2 ? Colors.white : null,
            textColor: widget.journeyType == 2 ? Colors.black : Colors.white,
            onTap: () {
              setState(() {
                widget.journeyType = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}

class JourneyType extends StatelessWidget {
  const JourneyType({
    super.key,
    required this.label,
    this.color,
    this.textColor,
    required this.onTap,
  });
  final String label;
  final Color? color;
  final Color? textColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor,
              ),
        ),
      ),
    );
  }
}
