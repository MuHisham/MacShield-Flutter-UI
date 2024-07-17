import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Color bgColor = Color(0xFFEEEEEE);
  final Color themeBlue = Color(0xFF00ADB5);
  final Color themeBlack = Color(0xFF222831);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 25,
                    color: themeBlue,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    const TextSpan(text: 'Mac'),
                    TextSpan(
                        text: 'Shield', style: TextStyle(color: themeBlack))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/circuitry.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 20),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'BricolageGrotesque',
                            fontWeight: FontWeight.w700,
                            color: themeBlack,
                          ),
                          children: [
                            TextSpan(text: 'Revolutionizing '),
                            TextSpan(
                              text: ' Reliability \n',
                              style: TextStyle(color: themeBlue),
                            ),
                            TextSpan(text: "Your Machine's "),
                            TextSpan(
                              text: 'Best Friend',
                              style: TextStyle(color: themeBlue),
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/process');
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: themeBlack),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Get Started ',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Card(
                        color: Color(0xFF95E1D3),
                        elevation: 4, // Optional, adds a shadow
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          width: 150, // Fixed width
                          height: 150, // Fixed height
                          child: const Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Reduce Maintenace cost by 20%",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Card(
                        color: Color(0xFFFCE38A),
                        elevation: 4, // Optional, adds a shadow
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          width: 150, // Fixed width
                          height: 150, // Fixed height
                          child: const Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Reduce unplanned downtime by 30%",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Card(
                        color: Color(0xFFF38181),
                        elevation: 4, // Optional, adds a shadow
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          width: 150, // Fixed width
                          height: 150, // Fixed height
                          child: const Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Achieve upto 50% in energy savings",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Learn More ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: themeBlack,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: themeBlue,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
