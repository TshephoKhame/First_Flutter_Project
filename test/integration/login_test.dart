import 'package:flutter_test/flutter_test.dart';
import '../../lib/Login.dart';

void main() {
  testWidgets('Test login page', (WidgetTester tester) async {
    await tester.pumpWidget(const login());
  });
}
