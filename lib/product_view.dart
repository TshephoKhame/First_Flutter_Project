import 'package:first_flutter_project/mock/mock_stories.dart';
import 'package:first_flutter_project/model/story_list.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final int iD;

  const ProductView({super.key, required this.iD});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final Stories showStories = StoryData.fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _renderheading(showStories, widget.iD),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12,
          child: Column(
            children: _renderSelectedStory(showStories, widget.iD),
          ),
        ),
      ),
    );
  }
}

Widget _renderheading(Stories showStories, int iD) {
  final index = showStories.stories.indexWhere((story) => story.iD == iD);
  return Text(showStories.stories[index].sname);
}

List<Widget> _renderSelectedStory(Stories showStories, int iD) {
  final result = <Widget>[];
  final index = showStories.stories.indexWhere((story) => story.iD == iD);

  if (index != -1) {
    result.add(
      _focus(
        showStories.stories[index].image,
        showStories.stories[index].catagory,
        showStories.stories[index].sbody,
      ),
    );
  }

  return result;
}

Widget _focus(String image, String sname, String sbody) {
  return ListView(
    shrinkWrap: true,
    children: [
      Image.asset(
        image,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 35.0, 0),
        child: Text(
          sname,
          softWrap: true,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 10.0),
        child: Text(sbody),
      ),
    ],
  );
}
