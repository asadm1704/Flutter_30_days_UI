import 'package:flutter/material.dart';

class Sized_container extends StatelessWidget {
  const Sized_container({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Center(
          child: Text(
            'My app',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Container with color ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'simple container with width,height and color',
              style: TextStyle(color: Colors.grey),
            ),
            Container(
              color: Colors.blue,
              height: 100,
              width: 200,
              child: Center(
                child: Text(
                  'Basic Container',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Container with padding and margin ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'padding=inside spacing and margin = outside spacing ',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Outer container to show margin effect
            Container(
              color: Colors.yellow.shade100,
              child: Container(
                // Margin: space OUTSIDE (yellow visible around)
                margin: const EdgeInsets.all(30),
                // Padding: space INSIDE (between blue and text)
                padding: const EdgeInsets.all(15),
                color: Colors.blue,
                child: const Text(
                  'I have padding & margin!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              'containers with rounded caroners  ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'using box decoration for rounded corners ',
              style: TextStyle(color: Colors.grey),
            ),
            Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                'Rounded corners!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 4: Container with Border & Shadow
            // ==============================================================
            const Text(
              '4. Container with Border & Shadow',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Adding border and boxShadow for depth:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
            
              width: 250,
              height: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.purple, width: 5),
                borderRadius:
                BorderRadius.circular(15),
                 boxShadow: [
                    BoxShadow(
                    color: Colors.purple.withOpacity(0.7),
                    blurRadius: 15, // How blurry the shadow is
                    spreadRadius: 4, // How far shadow spreads
                    offset: const Offset(4, 4), // Shadow position (x, y)
                  ),  
                 ]
              ),
              
              child: const Text(
                'Border and Shadows',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 5: Container with Gradient
            // ==============================================================
            const Text(
              '5. Container with Gradient',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Using LinearGradient for colorful backgrounds:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity, // Full width
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.red,
                    Colors.orange,
                    Colors.purple,
                    Colors.blue,
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'beatiful gradient!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 6: Circular Container
            // ==============================================================
            const Text(
              '6. Circular Container (Avatar Style)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Using BoxShape.circle for circular containers:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  // Make it circular
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'AW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 7: Nested Containers
            // ==============================================================
            const Text(
              '7. Nested Containers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Containers inside containers for complex layouts:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    bottomRight: const Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                // Nested container
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Nested!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            // ==============================================================
            // EXAMPLE 8: SizedBox for Spacing
            // ==============================================================
            const Text(
              '8. SizedBox for Spacing',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'SizedBox is perfect for adding fixed space:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                // SizedBox for horizontal spacing
                const SizedBox(width: 20),
                Container(width: 50, height: 50, color: Colors.green),
                // SizedBox for horizontal spacing
                const SizedBox(width: 20),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // SUMMARY BOX
            // ==============================================================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.pink.shade400, width: 2.5),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📝 Quick Tips:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• Use color OR decoration, not both together'),
                  Text('• padding = inside, margin = outside'),
                  Text('• Use SizedBox for simple spacing'),
                  Text(
                    '• BorderRadius for rounded, BoxShape.circle for circles',
                  ),
                  Text('• boxShadow adds depth and visual hierarchy'),
                  Text('• Gradients make beautiful backgrounds'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
