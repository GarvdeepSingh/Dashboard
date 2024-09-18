
import 'package:adstacks_dashboard/util/responsive.dart';

import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left-side: 'Home' text for larger screens, Menu button for mobile and tablet screens
        if (!Responsive.isMobile(context) && !Responsive.isTablet(context))
          Text(
            'Home',
            style: TextStyle(
              color: const Color.fromARGB(255, 186, 186, 186),
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          )
        else
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.grey, size: 25),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Handle drawer open
            },
          ),

        // Center: Align search bar to right
        if (!Responsive.isMobile(context))
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 300, // Set the width of the search bar here
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF30223E), // Dark purple color
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0), // Rounded corners
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Adjust padding
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 21,
                    ),
                  ),
                ),
              ),
            ),
          ),

        // Right-side: Icons for both mobile and non-mobile screens
        Row(
          children: [
            if (Responsive.isMobile(context) || Responsive.isTablet(context))
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
                onPressed: () {
                  // Handle search icon tap
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
              ),
            IconButton(
              icon: const Icon(Icons.file_copy_outlined, color: Colors.grey, size: 25),
              onPressed: () {
                // Add your logic for the file button
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.grey, size: 25),
              onPressed: () {
                // Add your logic for notifications
              },
            ),
            IconButton(
              icon: const Icon(Icons.power_settings_new, color: Colors.grey, size: 25),
              onPressed: () {
                // Add your logic for logout or power action
              },
            ),
            // Avatar icon removed
          ],
        ),
      ],
    );
  }
}

// Custom Search Delegate for handling search when search icon is tapped
class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Add your logic to show the search results here
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Add your logic to show suggestions as the user types here
    return Container();
  }
}