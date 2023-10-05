import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedDay = 'Monday'; // Initial selected day
  Map<String, List<String>> menuMap = {
    'Monday': [
      'Scrambled Eggs, Bacon, Toast',
      'Grilled Chicken, Rice, Salad',
      'Pasta with Marinara Sauce, Garlic Bread'
    ],
    'Tuesday': [
      'Oatmeal with Berries',
      'Turkey Wrap with Veggies',
      'Salmon with Quinoa and Roasted Veggies'
    ],
    'Wednesday': ['chole bhature', 'Pulav Chole', 'Aloo-Bhujia'],
    // Add menu for other days
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3, // Adjust the opacity as needed
              child: Image.asset(
                'assets/diet.png', // Replace with your image asset
                height: 16.0,
                width: 16.0,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 16.0,
                  top: 16.0,
                ),
                child: Text(
                  'Let\'s see what we are having today!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              // Dropdown for selecting the day
              Container(
                margin: EdgeInsets.only(top: 16.0, right: 16.0),
                alignment: Alignment.topRight,
                child: DropdownButton<String>(
                  value: selectedDay,
                  onChanged: (String? newValue) {
                    // Use String? here to match the type
                    if (newValue != null) {
                      // Check for null before updating
                      setState(() {
                        selectedDay = newValue;
                      });
                    }
                  },
                  items: menuMap.keys.map<DropdownMenuItem<String>>(
                    (String day) {
                      return DropdownMenuItem<String>(
                        value: day,
                        child: Text(day),
                      );
                    },
                  ).toList(),
                ),
              ),

              // Meal cards based on selected day
              // Meal cards based on selected day
              buildMenuCard(
                MediaQuery.of(context).size.width,
                Colors.green,
                'Breakfast',
                menuMap[selectedDay]![
                    0], // Use ! to indicate that you expect the value to be non-null
              ),
              buildMenuCard(
                MediaQuery.of(context).size.width,
                Colors.purple,
                'Lunch',
                menuMap[selectedDay]![
                    1], // Use ! to indicate that you expect the value to be non-null
              ),
              buildMenuCard(
                MediaQuery.of(context).size.width,
                Colors.cyan,
                'Dinner',
                menuMap[selectedDay]![
                    2], // Use ! to indicate that you expect the value to be non-null
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMenuCard(
      double width, Color color, String title, String details) {
    return Card(
      color: color,
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Container(
        width: width, // Set the width to screen width
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$title Menu:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              details,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
