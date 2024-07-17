import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:machshield/pages/failure.dart';
import 'package:machshield/pages/loading.dart';
// import 'package:machshield/widgets/slider.dart';
import 'package:http/http.dart' as http;

import 'info.dart';

class Process extends StatefulWidget {
  @override
  State<Process> createState() => _ProcessState();
}

class _ProcessState extends State<Process> {
  final Color themeBlue = Color(0xFF00ADB5);

  final Color themeBlack = Color(0xFF222831);

  int selectedOption = 1;

  double sliderValue1 = 300.0;
  double sliderValue2 = 310.0;
  double sliderValue3 = 2020.0;
  double sliderValue4 = 40.0;
  double sliderValue5 = 150.0;

  String rCare = "";

  Future<void> getPrediction() async {
    final inputData = {
      'slider1': sliderValue1,
      'slider2': sliderValue2,
      'slider3': sliderValue3,
      'slider4': sliderValue4,
      'slider5': sliderValue5,
    };

    try {
      final response = await http.post(
        Uri.parse('https://macshield-api.onrender.com/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(inputData),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List prediction = data['prediction'];
        int result = prediction[0];
        if (result == 0) {
          Navigator.pushNamed(context, '/success');
          print(inputData);
        } else if (result == 1) {
          rCare =
              "Replace the current tool with a tool with a usage of less than 200min";
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Failure(
                failureType: failureTypes[result - 1],
                recommendation: rCare,
              ),
            ),
          );
        } else if (result == 2) {
          rCare = rCare =
              "Increase $sliderValue2 by ${(sliderValue2 - sliderValue1).abs()}K. Also increase the rotational speed by ${(1380 - sliderValue3).abs()} rpm";
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Failure(
                failureType: failureTypes[result - 1],
                recommendation: rCare,
              ),
            ),
          );
        } else if (result == 3) {
          double power = sliderValue3 * sliderValue4;
          if (power > 9000) {
            rCare = "Decrease the power by ${power - 9000}W";
          } else if (power < 3500) {
            rCare = "Increase the power by ${3000 - power}W";
          } else {
            rCare = "Could Not Find Recommended Care.";
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Failure(
                failureType: failureTypes[result - 1],
                recommendation: rCare,
              ),
            ),
          );
        } else if (result == 4) {
          double osfValue = sliderValue4 * sliderValue5;
          if (osfValue > 11000) {
            rCare = "Decrease the tool wear or torque or both of the machine.";
          } else {
            rCare = "Could Not Find Recommended Care.";
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Failure(
                failureType: failureTypes[result - 1],
                recommendation: rCare,
              ),
            ),
          );
        } else if (result == 5) {
          rCare = rCare =
              "Each process has a chance of 0,1 % to fail regardless of its process parameters. Please try again.";
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Failure(
                failureType: failureTypes[result - 1],
                recommendation: rCare,
              ),
            ),
          );
        }
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(error: 'Page not found'),
          ),
        );
        throw Exception('Error not found');
      }
    } catch (e) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ErrorPage(error: e.toString()),
        ),
      );
    }
  }

  List<String> failureTypes = [
    'Tool Wear Failure (TWF)',
    'Heat Dissipation Failure (HDF)',
    'Power Failure (PWF)',
    'Overstrain Failure (OSF)',
    'Random Failures (RNF)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeBlue,
        title: Text(
          "Simulation",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an Environment: ',
                style: TextStyle(
                  fontFamily: 'BricolageGrotesque',
                  fontWeight: FontWeight.w700,
                  color: themeBlack,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Product Quality",
                        style: TextStyle(
                            fontFamily: 'BricolageGrotesque', fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                        Text(
                          'Low',
                          style:
                              TextStyle(fontFamily: 'Quicksand', fontSize: 18),
                        ),
                        Radio(
                          value: 2,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                        Text(
                          'Medium',
                          style:
                              TextStyle(fontFamily: 'Quicksand', fontSize: 18),
                        ),
                        Radio(
                          value: 3,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                        Text(
                          'High',
                          style:
                              TextStyle(fontFamily: 'Quicksand', fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //  Slider 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Air Temperature [K]',
                      style: TextStyle(
                          fontFamily: 'BricolageGrotesque', fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Info(
                            title: 'Air Temperature [K]',
                            description:
                                "Ambient temperature is the air temperature of any object or environment where equipment is stored. The adjective ambient means \"relating to the immediate surroundings.\" This value is also referred to as the ordinary temperature or the baseline temperature. It is important for system design and thermal analysis. In a computing context, maintaining an appropriate ambient temperature is crucial to the proper functioning and longevity of computer equipment. In general, a safe ambient temperature range is between 60 degrees and 75 degrees Fahrenheit or 15 degrees and 24 degrees Celsius. The cooler end of that range is better. Higher ambient temperature readings or lower temperatures make it difficult for a computer's or data center's cooling system to maintain a safe operating temperature.",
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.info,
                      color: Color(0xFF222831),
                    ),
                  )
                ],
              ),
              Slider(
                onChanged: (newValue) {
                  setState(() {
                    sliderValue1 = newValue;
                  });
                },
                value: sliderValue1,
                min: 295,
                max: 305,
                divisions: 100,
              ),
              Center(child: Text('Value: $sliderValue1')),
              const SizedBox(height: 20),
              // Second Slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Process Temperature [K]',
                      style: TextStyle(
                          fontFamily: 'BricolageGrotesque', fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Info(
                            title: 'Process Temperature [K]',
                            description:
                                "Industrial process heat is the thermal energy used directly in the preparation or treatment of materials used to produce manufactured goods. In developing countries, the industrial sector is responsible for 30 to 65 percent of total national energy consumption. Commercially available solar systems have the potential to provide a large fraction of the energy consumed by industry. Industrial process heat needs can be categorized as follows: preheat for boiler feedwater, hot water for various processes, hot air for drying, steam production, and direct heating. It is possible to design solar energy systems capable of providing heat energy for each of these needs. However, near-term solar process heat technologies will probably be utilized to meet the major heating needs, classified by output: hot water (feedwater preheat or process water), hot air, and low pressure steam.",
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.info,
                      color: Color(0xFF222831),
                    ),
                  )
                ],
              ),
              Slider(
                onChanged: (newValue) {
                  setState(() {
                    sliderValue2 = newValue;
                  });
                },
                value: sliderValue2,
                min: 305,
                max: 315,
                divisions: 100,
              ),
              Center(child: Text('Value: $sliderValue2')),
              const SizedBox(height: 20),
              //  Slider 3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Rotational Speed [rms]',
                      style: TextStyle(
                          fontFamily: 'BricolageGrotesque', fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Info(
                            title: 'Rotational Speed [rms]',
                            description:
                                "Rotational speed (also called speed, or speed of rotation) can be quantified as the number of revolutions a rotating system makes within a defined period of time. Thee unit used for rotational speed is rev/s. pump speed is generally given in rpm.  The turning speed is considered an important factor depending on the type of work that we are going to carry out. Certain power tools, such as drills, rotary hammers, screwdrivers, etc., offer two mechanical speeds, highly applicable for different types of work. In fact, these machines benefit from a special gear that provides two settings for the spin speed: one slow and one fast.",
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.info,
                      color: Color(0xFF222831),
                    ),
                  )
                ],
              ),
              Slider(
                onChanged: (newValue) {
                  setState(() {
                    sliderValue3 = newValue;
                  });
                },
                value: sliderValue3,
                min: 1160,
                max: 2880,
                divisions: 1720,
              ),
              Center(child: Text('Value: $sliderValue3')),
              const SizedBox(height: 20),
              //  Slider 4
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Torque [Nm]',
                      style: TextStyle(
                          fontFamily: 'BricolageGrotesque', fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Info(
                            title: 'Torque [Nm]',
                            description:
                                "In the realm of mechanical engineering, torque is a fundamental concept that dictates the performance, efficiency, and longevity of machines. It forms the basis of any rotating machine, significantly impacting the driving experience.  Torque, often referred to as the 'turning force,' is a measure of the force that can cause an object to rotate about an axis. In theoretical mechanics, the relationship between torque and power is used to predict the behavior of machines under different operating conditions. This predictive analysis helps engineers foresee potential operational issues, allowing them to design more efficient and reliable machines. For example, by understanding how changes in torque affect power output, engineers can predict how a motor will perform under increased load. This knowledge can be used to design motors that can handle peak loads without overheating or failing.",
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.info,
                      color: Color(0xFF222831),
                    ),
                  )
                ],
              ),
              Slider(
                onChanged: (newValue) {
                  setState(() {
                    sliderValue4 = newValue;
                  });
                },
                value: sliderValue4,
                min: 3.5,
                max: 76.5,
                divisions: 730,
              ),
              Center(child: Text('Value: $sliderValue4')),
              const SizedBox(height: 20),
              //  Slider 5
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Tool Wear [Min]',
                      style: TextStyle(
                          fontFamily: 'BricolageGrotesque', fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Info(
                            title: 'Tool Wear [Min]',
                            description:
                                "In industrial machining processes, the wear of a tool has a significant influence on the quality of the produced part. Therefore, predicting wear upfront can result in significant improvements of machining processes. It can be measured directly or indirectly. Direct wear measurements via visual inspection techniques and indirect measurements of wear indicators from machine signals can be distinguished. Direct tool wear measurements require process stops for measuring due to the continuous interaction between workpiece and tool as well as the continuous flow of coolant fluids during production. Those measurements are difficult to include in a manufacturing process. But they offer information on the actual tool wear, measured by geometric changes of the tool. Indirect measurements only estimate the wear, based on wear indicators extracted from machine data but at the same time offer an easy way for real-time in-process monitoring. The quality variants H/M/L add 5/3/2 minutes of tool wear to the used tool in the process.",
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.info,
                      color: Color(0xFF222831),
                    ),
                  )
                ],
              ),
              Slider(
                onChanged: (newValue) {
                  setState(() {
                    sliderValue5 = newValue;
                  });
                },
                value: sliderValue5,
                min: 0,
                max: 300,
                divisions: 300,
              ),
              Center(child: Text('Value: $sliderValue5')),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: themeBlue),
                  onPressed: getPrediction,
                  child: Text(
                    'Check',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
