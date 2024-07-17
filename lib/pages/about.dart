import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final Color themeBlue = Color(0xFF00ADB5);
    final Color themeBlack = Color(0xFF222831);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeBlue,
        title: const Text(
          "About",
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Predictive Maintenance',
                      style: TextStyle(
                          fontFamily: 'BricolageGrotesque',
                          color: themeBlack,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'There is a saying, “Prevention is better than cure”. Predicting machine failure before it happens avoids downtime and reduce maintenance costs. Prediction happens based on historical and real-time sensor feeds, vibration, voltage, pressure, temperature, historical failure incidents.',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                        fontFamily: 'Quicksand'),
                  )
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Our Approach to Resolving This',
                      style: TextStyle(
                          fontFamily: 'BricolageGrotesque',
                          color: themeBlack,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Employing advanced machine learning models, we harness the power of historical data to proactively predict potential machine failures. By learning from a wealth of historical data points, our machine learning algorithms can recognize emerging patterns and deviations, allowing us to forecast impending machine failures with a heightened level of accuracy.',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                        fontFamily: 'Quicksand'),
                  )
                ],
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Failures that can occur.',
                      style: TextStyle(
                          fontFamily: 'BricolageGrotesque',
                          color: themeBlack,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tool Wear Failure (TWF)\nHeat Dissipation Failure (HDF)\nPower Failure (PWF)\nOverstrain Failure (OSF)\nRandom Failure (RNF)',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                        fontFamily: 'Quicksand'),
                  )
                ],
              ),
              SizedBox(height: 50),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sustainable Architecture  ",
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w700,
                        color: themeBlue,
                        fontSize: 20,
                      ),
                    ),
                    const Icon(Icons.solar_power),
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
