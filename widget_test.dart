import 'package:flutter_test/flutter_test.dart';
import 'package:yareazmoonja/main.dart';

void main() {
  testWidgets('app starts successfully', (tester) async {
    await tester.pumpWidget(const YareAzmoonApp());
    expect(find.text('یار آزمون جزا'), findsOneWidget);
    expect(find.text('برنامه امروز'), findsOneWidget);
  });
}
