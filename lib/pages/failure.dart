import 'package:flutter/material.dart';

class Failure extends StatelessWidget {
  const Failure(
      {super.key, required this.failureType, required this.recommendation});

  final String failureType;
  final String recommendation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE23E57),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "MACHINE",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        "FAILURE",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Failure Type",
                      style: TextStyle(
                        fontFamily: 'BricolageGrotesque',
                        fontSize: 20,
                        color: Color(0xFF00ADB5),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      failureType,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        color: Color(0xFF222831),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recommended Maintenance",
                      style: TextStyle(
                        fontFamily: 'BricolageGrotesque',
                        fontSize: 20,
                        color: Color(0xFF00ADB5),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      recommendation,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        color: Color(0xFF222831),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
