import 'package:flutter/material.dart';

class ExtraFoodFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extra Food Order'),
      ),
      body: Center(
        child: Text(
          'Place your extra food order here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
