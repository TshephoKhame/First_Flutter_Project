import 'package:first_flutter_project/mock/mock_stories.dart';
import 'package:first_flutter_project/model/story_list.dart';
import 'package:first_flutter_project/product_view.dart';
import 'package:flutter/material.dart';

class ViewMore extends StatefulWidget {
  const ViewMore({super.key});

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  final Stories showStories = StoryData.fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Stories"),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: _renderStories(showStories, context),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _renderStories(Stories showStories, BuildContext context) {
  final result = <Widget>[];
  for (int i = 0; i < showStories.stories.length; i++) {
    result.add(
      _clickableCardBody(
        context,
        showStories.stories[i].image,
        showStories.stories[i].sname,
        showStories.stories[i].sbody,
        showStories.stories[i].iD,
      ),
    );
  }
  return result;
}

Widget _clickableCardBody(
    BuildContext context, String picture, String sname, String sbody, int iD) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => ProductView(iD: iD),
        ),
      );
    },
    child: SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(
                  picture,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    sname,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Text(
                    sbody,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: (() {
                          print("Comment");
                        }),
                        icon: const Icon(Icons.comment_rounded),
                        style: IconButton.styleFrom(
                          iconSize: 15,
                        ),
                      ),
                      IconButton(
                        onPressed: (() {
                          print("Share");
                        }),
                        icon: const Icon(Icons.share),
                        style: IconButton.styleFrom(
                          iconSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
