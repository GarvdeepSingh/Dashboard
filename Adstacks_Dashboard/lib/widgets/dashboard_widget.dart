

import 'package:adstacks_dashboard/util/responsive.dart';
import 'package:adstacks_dashboard/widgets/activity_details_card.dart';
import 'package:adstacks_dashboard/widgets/header_widget.dart';
import 'package:adstacks_dashboard/widgets/line_chart_card.dart';
import 'package:adstacks_dashboard/widgets/summary_widget.dart';
import 'package:adstacks_dashboard/widgets/top_rating.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 18),
            const HeaderWidget(),
            const SizedBox(height: 18),
             TopRatingCard(),
             const SizedBox(height: 18),
            const ActivityDetailsCard(),
            const SizedBox(height: 18),
            const LineChartCard(),
            const SizedBox(height: 18),
            // Uncomment if you want to include it
            // const BarGraphCard(),
            const SizedBox(height: 18),
            // Show SummaryWidget for both tablets and mobile devices
            if (Responsive.isTablet(context) || Responsive.isMobile(context))
              const SummaryWidget(),
          ],
        ),
      ),
    );
  }
}
