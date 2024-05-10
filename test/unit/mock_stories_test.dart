import 'package:test/test.dart';
import 'package:first_flutter_project/mock/mock_stories.dart';

void main() {
  test('Test fetch for stories', () {
    final stories = StoryData.fetchData();
    expect(stories, isNotNull);
    expect(stories.stories, isNotEmpty);
    expect(stories.stories.length, greaterThan(0));
  });
}
