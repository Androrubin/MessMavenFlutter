import 'package:flutter/material.dart';
import 'dart:math';

class ProfileFragment extends StatefulWidget {
  final double messCredits;
  ProfileFragment({super.key, required this.messCredits});

  @override
  _ProfileFragmentState createState() => _ProfileFragmentState();

  // Replace with actual value
}

class _ProfileFragmentState extends State<ProfileFragment>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final List<bool> activityData = [
    true, false, false, true, false, true, true, true, false, true, false,
    false, false
    // Add more data for other days
  ];
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Animation duration
    );
    _animation = Tween<double>(begin: 0, end: widget.messCredits)
        .animate(_animationController);
    _animationController.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 300, // Adjust height to fit the balance text
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey, width: 8),
                            ),
                          ),
                          Transform.rotate(
                            angle: pi +
                                (_animation.value /
                                    500 *
                                    pi), // Adjust the scaling
                            child: Container(
                              width: 140,
                              height: 4,
                              color: Colors.green,
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow,
                            ),
                          ),
                          Text(
                            _animation.value.toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20), // Spacing between balance and animation
                  Text(
                    'Balance: ${widget.messCredits.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Previous Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, // Number of columns (days)
                ),
                itemCount: activityData.length,
                itemBuilder: (context, index) {
                  return DayCell(isActive: activityData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSpeedometer extends StatelessWidget {
  final double messCredits;

  CustomSpeedometer({required this.messCredits});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 8),
            ),
          ),
          Transform.rotate(
            angle: pi + (messCredits / 500 * pi), // Adjust the scaling
            child: Container(
              width: 140,
              height: 2,
              color: Colors.yellow,
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
          ),
          Text(
            messCredits.toStringAsFixed(2),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class DayCell extends StatelessWidget {
  final bool isActive;

  DayCell({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2), // Adjust spacing between cells
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        border: Border.all(color: Colors.white), // Optional border
      ),
    );
  }
}
