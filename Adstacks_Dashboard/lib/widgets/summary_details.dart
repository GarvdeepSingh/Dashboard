

import 'package:flutter/material.dart';

class SpecialOccasions extends StatelessWidget {
  const SpecialOccasions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Today Birthday Card
        OccasionCard(
          title: "Today Birthday",
          totalCount: 2,
          buttonText: "Birthday Wishing",
          avatars: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Anniversary Card
        OccasionCard(
          title: "Anniversary",
          totalCount: 3,
          buttonText: "Anniversary Wishing",
          avatars: [
            CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            CircleAvatar(
              backgroundColor: Colors.purpleAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

class OccasionCard extends StatelessWidget {
  final String title;
  final int totalCount;
  final String buttonText;
  final List<Widget> avatars;

  const OccasionCard({
    required this.title,
    required this.totalCount,
    required this.buttonText,
    required this.avatars,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF3A3A3A), // Background color
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Icon(Icons.star, color: Colors.amber),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: avatars
                .map((avatar) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: avatar,
                    ))
                .toList(),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: $totalCount",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add functionality for button here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(const MaterialApp(
//     home: Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SpecialOccasions(),
//       ),
//     ),
//   ));
// }
