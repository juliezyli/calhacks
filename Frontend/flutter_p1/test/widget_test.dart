// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_p1/main.dart';

void main() {
  testWidgets('Navigate to First Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that we start on the home page 
    expect(find.text('Cupertino Starter App'), findsOneWidget);

    // Verify that the button to go to the first page is present
    expect(find.text('Go to First Page'), findsOneWidget);

    // Tap the 'Go to First Page' button and trigger a frame
    await tester.tap(find.text('Go to First Page'));
    await tester.pumpAndSettle(); 

    // Verify that we are now on the First Page.
    expect(find.text('First Page'), findsOneWidget);
    
    // Verify that the button to show input is present on the First Page.
    expect(find.text('Show Input'), findsOneWidget);
  });

  testWidgets('Navigate to Second Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that we start on the home page.
    expect(find.text('Cupertino Starter App'), findsOneWidget);

    // Verify that the button to go to the second page is present.
    expect(find.text('Go to Second Page'), findsOneWidget);

    // Tap the 'Go to Second Page' button and trigger a frame.
    await tester.tap(find.text('Go to Second Page'));
    await tester.pumpAndSettle(); // Wait for navigation to complete.

    // Verify that we are now on the Second Page.
    expect(find.text('Second Page'), findsOneWidget);

    // Verify that the button to submit is present on the Second Page.
    expect(find.text('Submit'), findsOneWidget);
  });
}