import 'package:flutter/material.dart';
import 'package:machshield/pages/info.dart';

class DragSlider extends StatefulWidget {
  final String slidertitle;
  final double initValue;
  final double minValue;
  final double maxValue;
  final String description;

  const DragSlider(
      {super.key,
      required this.slidertitle,
      required this.initValue,
      required this.minValue,
      required this.maxValue,
      required this.description});

  @override
  State<DragSlider> createState() => _DragSliderState();
}

class _DragSliderState extends State<DragSlider> {
  late double sliderValue;
  late String sliderTitle;
  late double minValue;
  late double maxValue;
  late String description;

  @override
  void initState() {
    super.initState();
    sliderValue = widget.initValue;
    sliderTitle = widget.slidertitle;
    minValue = widget.minValue;
    maxValue = widget.maxValue;
    description = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  sliderTitle,
                  style:
                      TextStyle(fontFamily: 'BricolageGrotesque', fontSize: 20),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Info(title: sliderTitle, description: description),
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
            value: sliderValue,
            onChanged: (newValue) {
              setState(() {
                sliderValue = newValue;
              });
              sliderValue = newValue;
              print(sliderValue);
            },
            min: minValue,
            max: maxValue,
          ),
          Text('Value: $sliderValue'),
        ],
      ),
    );
  }
}
