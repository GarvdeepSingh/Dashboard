

import 'package:flutter/material.dart';

class ActivityDetailsCard extends StatefulWidget {
  const ActivityDetailsCard({super.key});

  @override
  _ActivityDetailsCardState createState() => _ActivityDetailsCardState();
}

class _ActivityDetailsCardState extends State<ActivityDetailsCard> {
  List<Project> projects = [
    Project(
      title: 'Technology behind the Blockchain',
      projectId: '#1',
      isSelected: false,
      imagePath: 'assets/images/adstacks.png',
    ),
    Project(
      title: 'AI in Healthcare',
      projectId: '#2',
      isSelected: false,
      imagePath: 'assets/images/adstacks.png',
    ),
    Project(
      title: 'Future of Augmented Reality',
      projectId: '#3',
      isSelected: false,
      imagePath: 'assets/images/adstacks.png',
    ),
  ];

  final List<Creator> creators = [
    Creator(name: '@maddison_c21', artworks: 9821, rating: 0.9),
    Creator(name: '@karl.will02', artworks: 7032, rating: 0.7),
    Creator(name: '@jason_artworks', artworks: 8291, rating: 0.8),
    Creator(name: '@jason_artworks', artworks: 8291, rating: 0.8),
    
  ];

  void toggleProjectSelection(int index) {
    setState(() {
      projects[index].isSelected = !projects[index].isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // If the screen width is larger than 600px, show the two panels side by side.
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Project List
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF19202D), // Dark background
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'All Projects',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...projects.asMap().entries.map((entry) {
                        int index = entry.key;
                        Project project = entry.value;
                        return GestureDetector(
                          onTap: () => toggleProjectSelection(index),
                          child: ProjectCard(project: project),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Right Panel: Top Creators
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF19202D), // Dark background
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Top Creators',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...creators.map((creator) {
                        return CreatorCard(creator: creator);
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          // For smaller screens, stack the two panels one below the other.
          return Column(
            children: [
              // Project List
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF19202D), // Dark background
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'All Projects',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...projects.asMap().entries.map((entry) {
                      int index = entry.key;
                      Project project = entry.value;
                      return GestureDetector(
                        onTap: () => toggleProjectSelection(index),
                        child: ProjectCard(project: project),
                      );
                    }).toList(),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Creator List
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF19202D), // Dark background
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Top Creators',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...creators.map((creator) {
                      return CreatorCard(creator: creator);
                    }).toList(),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

// Project class to hold project data
class Project {
  final String title;
  final String projectId;
  bool isSelected;
  final String imagePath;

  Project({
    required this.title,
    required this.projectId,
    required this.isSelected,
    required this.imagePath,
  });
}

// Project card widget
class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: project.isSelected ? const Color.fromARGB(255, 80, 80, 80) : const Color(0xFF202738),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Image.asset(
            project.imagePath,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Project ${project.projectId} • See project details',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (project.isSelected)
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                // Handle edit action
              },
            ),
        ],
      ),
    );
  }
}

// Creator class to hold creator data
class Creator {
  final String name;
  final int artworks;
  final double rating;

  Creator({
    required this.name,
    required this.artworks,
    required this.rating,
  });
}

// Creator card widget
class CreatorCard extends StatelessWidget {
  final Creator creator;

  const CreatorCard({Key? key, required this.creator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'), // Replace with actual avatar
            radius: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  creator.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${creator.artworks} artworks',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: creator.rating, // Progress bar width factor
              child: Container(
                color: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}