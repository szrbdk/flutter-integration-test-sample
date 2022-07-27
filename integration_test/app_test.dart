import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";
import 'package:integration_test_example/main.dart' as app;
import 'package:integration_test_example/pages/scroll_and_find.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end test", () {
    testWidgets("Whole app", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // final cardFinder = find.byType(Card);
      // // print(cardFinder.evaluate());
      // expect(cardFinder, findsNWidgets(4));

      // await tester.tap(cardFinder.at(0));
      // await tester.pumpAndSettle();

      // final counterTextFinder = find.text("Counter");
      // await tester.tap(counterTextFinder);
      // await tester.pumpAndSettle();

      final counterCardFinderWithKey = find.byKey(const Key("CounterCardKey"));
      final swipeCardFinderWithKey = find.byKey(const Key("SwipeButtonKey"));
      final textFieldCardFinderWithKey = find.byKey(const Key("TextFieldButtonKey"));
      final scrollCardFinderWithKey = find.byKey(const Key("ScrollButtonKey"));

      await tester.tap(counterCardFinderWithKey);
      await tester.pumpAndSettle();

      final counterTextFinder = find.text("0");
      expect(counterTextFinder, findsOneWidget);

      final subtractButtonFinder = find.byKey(const Key("SubButton"));
      final addButtonFinder = find.byKey(const Key("AddButton"));

      await tester.tap(addButtonFinder);
      await tester.pumpAndSettle();
      await tester.tap(addButtonFinder);
      await tester.pumpAndSettle();
      await tester.tap(addButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text("3"), findsOneWidget);

      for (var i = 0; i < 5; i++) {
        await tester.tap(subtractButtonFinder);
        await tester.pumpAndSettle();
      }
      expect(find.text("-2"), findsOneWidget);

      final counterAppBarFinder = find.byWidgetPredicate((widget) {
        if (widget is AppBar) {
          final title = widget.title;
          if (title is Text && title.data == "Counter Page") {
            return true;
          }
        }
        return false;
      });

      expect(counterAppBarFinder, findsOneWidget);

      if (counterAppBarFinder.evaluate().isNotEmpty) {
        final backButtonFinder = find.byType(BackButton);
        expect(backButtonFinder, findsOneWidget);

        await tester.tap(backButtonFinder);
        await tester.pumpAndSettle();
      }

      await tester.tap(swipeCardFinderWithKey);
      await tester.pumpAndSettle();

      final carouselFinder = find.byType(CarouselSlider);

      await tester.fling(carouselFinder, const Offset(-200, 0), 1000);
      await tester.pumpAndSettle();
      await tester.fling(carouselFinder, const Offset(-200, 0), 1000);
      await tester.pumpAndSettle();
      await tester.fling(carouselFinder, const Offset(-200, 0), 1000);
      await tester.pumpAndSettle();
      await tester.fling(carouselFinder, const Offset(-200, 0), 1000);
      await tester.pumpAndSettle();

      final backButtonFinder = find.byType(BackButton);
      expect(backButtonFinder, findsOneWidget);

      await tester.tap(backButtonFinder);
      await tester.pumpAndSettle();

      await tester.tap(textFieldCardFinderWithKey);
      await tester.pumpAndSettle();

      final textFieldFinder = find.byKey(const Key("TextFieldKey2"));

      expect(textFieldFinder, findsOneWidget);

      await tester.tap(textFieldFinder);
      await tester.pumpAndSettle();

      await tester.enterText(textFieldFinder, "Sezer");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      await tester.tap(backButtonFinder);
      await tester.pumpAndSettle();

      await tester.tap(scrollCardFinderWithKey);
      await tester.pumpAndSettle();

      final listItemFinder = find.text("Item: 54");
      final listviewFinder = find.byKey(ScrollAndFind.listKey);

      await tester.dragUntilVisible(
        listItemFinder,
        listviewFinder,
        const Offset(0, -100),
        maxIteration: 100,
      );
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 300));

      if (listItemFinder.evaluate().isNotEmpty) {
        await tester.tap(listItemFinder);
        await tester.pumpAndSettle();
      }

      expect(find.text("54"), findsOneWidget);

      await tester.tap(backButtonFinder);
      await tester.pumpAndSettle();

      await tester.tap(backButtonFinder);
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(milliseconds: 2000));
    });
  });
}
