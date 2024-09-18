import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                  SizedBox(height: 10),
                  Text("Pooja Mishra", style: TextStyle(color: Colors.white)),
                  Text("Admin", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Employees'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Attendance'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Summary'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Information'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // If the width is greater than 600px, assume tablet view
          bool isTablet = constraints.maxWidth > 600;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Ethereum Project Banner
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.purple,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ETHEREUM 2.0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: isTablet ? 24 : 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Top Rating Project\nTrending project and high rating project created by the team.',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: isTablet ? 18 : 14),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.purple, backgroundColor: Colors.white),
                              child: const Text('Learn More'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // All Projects Section
                  Text('All Projects', style: TextStyle(fontSize: isTablet ? 24 : 18)),
                  const SizedBox(height: 10),
                  ProjectCard(
                      projectTitle: 'Technology behind the Blockchain',
                      isTablet: isTablet),
                  ProjectCard(projectTitle: 'Future of AI', isTablet: isTablet),

                  const SizedBox(height: 20),

                  // Top Creators Section
                  Text('Top Creators', style: TextStyle(fontSize: isTablet ? 24 : 18)),
                  const SizedBox(height: 10),
                  TopCreatorsCard(name: '@maddison_c21', artworks: 9821, isTablet: isTablet),
                  TopCreatorsCard(name: '@karl.will02', artworks: 7032, isTablet: isTablet),

                  const SizedBox(height: 20),

                  // Performance Graph Placeholder
                  Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: const Center(child: Text('Performance Graph Placeholder')),
                  ),

                  const SizedBox(height: 20),

                  // Birthday Section
                  ExpansionTile(
                    leading: const Icon(Icons.cake),
                    title: Text(
                      "Today's Birthday",
                      style: TextStyle(fontSize: isTablet ? 20 : 16),
                    ),
                    children: <Widget>[
                      ListTile(
                        leading: const CircleAvatar(
                            backgroundImage: AssetImage('assets/user.png')),
                        title: const Text('John Doe'),
                        trailing: IconButton(
                          icon: const Icon(Icons.cake),
                          onPressed: () {},
                        ),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                            backgroundImage: AssetImage('assets/user.png')),
                        title: const Text('Jane Doe'),
                        trailing: IconButton(
                          icon: const Icon(Icons.cake),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),

                  // Anniversary Section
                  ExpansionTile(
                    leading: const Icon(Icons.favorite),
                    title: Text(
                      "Anniversary",
                      style: TextStyle(fontSize: isTablet ? 20 : 16),
                    ),
                    children: <Widget>[
                      ListTile(
                        leading: const CircleAvatar(
                            backgroundImage: AssetImage('assets/user.png')),
                        title: const Text('John & Mary'),
                        trailing: IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {},
                        ),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                            backgroundImage: AssetImage('assets/user.png')),
                        title: const Text('Alex & Sarah'),
                        trailing: IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Custom Widget for Project Card
class ProjectCard extends StatelessWidget {
  final String projectTitle;
  final bool isTablet;

  ProjectCard({required this.projectTitle, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.folder),
        title: Text(
          projectTitle,
          style: TextStyle(fontSize: isTablet ? 18 : 14),
        ),
        subtitle: const Text('Project details here...'),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

// Custom Widget for Top Creators Card
class TopCreatorsCard extends StatelessWidget {
  final String name;
  final int artworks;
  final bool isTablet;

  TopCreatorsCard({required this.name, required this.artworks, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(backgroundImage: AssetImage('assets/user.png')),
        title: Text(
          name,
          style: TextStyle(fontSize: isTablet ? 18 : 14),
        ),
        trailing: Text(
          artworks.toString(),
          style: TextStyle(fontSize: isTablet ? 16 : 12),
        ),
      ),
    );
  }
}