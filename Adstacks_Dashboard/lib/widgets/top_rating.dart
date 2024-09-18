import 'package:flutter/material.dart';

class TopRatingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ETHEREUM 2.0',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Top Rating Project',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Trending project and high rating Project Created by team.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.deepPurple, // text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Text('Learn More'),
            ),
          ),
        ],
      ),
    );
  }
}

// class ResponsivePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           if (constraints.maxWidth > 600) {
//             // For larger screens like tablets
//             return Row(
//               children: [
//                 Expanded(
//                   child: TopRatingCard(),
//                 ),
//                 Expanded(
//                   child: SomeOtherWidget(),
//                 ),
//               ],
//             );
//           } else {
//             // For smaller screens like phones
//             return ListView(
//               children: [
//                 TopRatingCard(),
//                 SomeOtherWidget(),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// Example widget to represent other parts of the page
// class SomeOtherWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       color: Colors.blueAccent,
//       child: Center(
//         child: Text(
//           'Other Content Here',
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//       ),
//     );
//   }
// }

// void main() => runApp(MaterialApp(home: ResponsivePage()));