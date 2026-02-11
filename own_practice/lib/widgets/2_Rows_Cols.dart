import 'package:flutter/material.dart';
class Rows_Cols extends StatelessWidget {
  const Rows_Cols({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rows, Columns & Layout'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==============================================================
            // EXAMPLE 1: Basic Row
            // ==============================================================
            const Text(
              '1. Basic Row (Horizontal Layout)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Children arranged horizontally:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(8),
              child: Row(
                // Align children on main (horizontal) axis
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const SizedBox(width: 10), // Spacing between items
                  Container(width: 50, height: 50, color: Colors.green),
                  const SizedBox(width: 10),
                  Container(width: 50, height: 50, color: Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 30)
         ],
        ),
      ),
    );
  }
}
