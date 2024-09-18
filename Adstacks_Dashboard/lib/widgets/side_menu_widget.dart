
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: const Color(0xFF19202D),
      // color: const Color(0xFF171821), // Dark background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/adstacks.png',
                    height: 50,
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/avatar.png'), // Replace with actual image
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Pooja Mishra',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white, // Light text color for dark theme
                    ),
                  ),
                  const Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey, // Subdued color for secondary text
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(color: Colors.grey), // Divider color for dark theme
          // Menu items
          Expanded(
            child: ListView(
              children: [
                buildMenuEntry(Icons.home, "Home", 0),
                buildMenuEntry(Icons.groups, "Employees", 1),
                buildMenuEntry(Icons.checklist, "Attendance", 2),
                buildMenuEntry(Icons.calendar_today, "Summary", 3),
                buildMenuEntry(Icons.info_outline, "Information", 4),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  child: Text(
                    'WORKSPACES',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                buildWorkspaceEntry("Adstacks", Icons.workspaces),
                buildWorkspaceEntry("Finance", Icons.attach_money),

                const Divider(color: Colors.grey),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: const Text(
                    'Setting',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Handle setting tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Handle logout tap
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuEntry(IconData icon, String title, int index) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => setState(() {
        selectedIndex = index;
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? const Color(0xFF404040) : Colors.transparent, // Darker selection color
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWorkspaceEntry(String title, IconData icon) {
    return Theme(
      data: ThemeData.dark(), // Apply dark theme to ExpansionTile
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white), // Light text for dark theme
        ),
        children: [
          ListTile(
            title: Text('$title 1', style: const TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            title: Text('$title 2', style: const TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}