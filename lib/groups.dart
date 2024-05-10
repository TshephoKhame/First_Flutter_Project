import 'package:first_flutter_project/view_more.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_project/mock/mock_stories.dart';
import 'package:first_flutter_project/model/story_list.dart';
import 'dart:math' as math;

class groups extends StatefulWidget {
  const groups({super.key});

  @override
  State<groups> createState() => _groupsState();
}

class _groupsState extends State<groups> {
  final Stories showStories = StoryData.fetchData();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: _returnCategory(showStories, context),
      ),
    );
  }
}

List<Widget> _returnCategory(Stories showStories, BuildContext context) {
  // List to store unique categories
  List<String> categories = [];

  // Extract unique categories from the stories
  for (var story in showStories.stories) {
    if (!categories.contains(story.catagory)) {
      categories.add(story.catagory);
    }
  }

  // Create widgets for each category
  List<Widget> categoryWidgets = categories.map(
    (category) {
      return GestureDetector(
        onTap: () => _navigateToViewMore(context),
        child: Container(
          color: Color.fromARGB(31, 189, 185, 185),
          width: MediaQuery.of(context).size.width * 0.50,
          padding: const EdgeInsets.fromLTRB(
            10.0,
            30.0,
            10.0,
            20.0,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black12,
                ),
                margin: const EdgeInsets.all(10.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 60.0, horizontal: 18),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    },
  ).toList();

  // Return a column of category widgets
  return [
    Wrap(
      // Spacing between rows
      children: categoryWidgets,
    ),
  ];
}

void _navigateToViewMore(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => const ViewMore(),
    ),
  );
}

Color _generateRandomDarkColor() {
  final random = math.Random();
  final double minBrightness = 0.1; // Minimum brightness value
  final int maxValue = 255; // Maximum value for RGB components

  // Generate random RGB values with lower bounds to ensure darker colors
  final red = minBrightness + (random.nextDouble() * (1.0 - minBrightness));
  final green = minBrightness + (random.nextDouble() * (1.0 - minBrightness));
  final blue = minBrightness + (random.nextDouble() * (1.0 - minBrightness));

  // Convert RGB values to Color
  return Color.fromRGBO(
    (red * maxValue).toInt(),
    (green * maxValue).toInt(),
    (blue * maxValue).toInt(),
    1.0, // Alpha value (opacity)
  );
}
