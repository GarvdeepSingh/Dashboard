
import 'package:adstacks_dashboard/widgets/scheduled_widget.dart';
import 'package:adstacks_dashboard/widgets/summary_details.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: const Color(0xFF19202D),
        // color: Color.fromRGBO(33, 34, 45, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 20),
              // // Chart(), // Uncomment if needed and ensure it's properly sized
              // Text(
              //   'Summary',
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              // ),
              SizedBox(height: 16),
              CustomCalendar(),
              SizedBox(height: 40),
              SpecialOccasions(),
            ],
          ),
        ),
      ),
    );
  }
}
