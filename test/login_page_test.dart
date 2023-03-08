// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:login_page/main.dart';

void main() {
  group('Login Page', () {
    testWidgets('Test invalid email and password', (WidgetTester tester) async {
      await tester.pumpWidget(LoginPage());

      // Enter invalid email and password
      await tester.enterText(find.byKey(Key('email')), 'invalid-email');
      await tester.enterText(find.byKey(Key('password')), 'pass');

      // Check that the login button is disabled
      final loginButton =
          tester.widget<ElevatedButton>(find.byKey(Key('login')));
      expect(loginButton.enabled, false);
    });

    testWidgets('Test valid email and password', (WidgetTester tester) async {
      await tester.pumpWidget(LoginPage());

      // Enter valid email and password
      await tester.enterText(find.byKey(Key('email')), 'john@example.com');
      await tester.enterText(find.byKey(Key('password')), 'password');

      // Check that the login button is enabled
      final loginButton =
          tester.widget<ElevatedButton>(find.byKey(Key('login')));
      expect(loginButton.enabled, true);

      // Tap the login button
      await tester.tap(find.byKey(Key('login')));

      // Verify that the login is successful
      expect(find.text('Welcome John'), findsOneWidget);
    });
  });
}
