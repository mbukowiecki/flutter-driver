import 'package:flutter_driver/flutter_driver.dart';

import '../utils/actions.dart';

class DogDetails{

  FlutterDriver _driver;

  DogDetails(FlutterDriver driver){
    this._driver = driver;
  }

  final submit = find.byValueKey('submit');
  final slider = find.byValueKey('slider');
  final backArrow = find.pageBack();
  final error = find.text("They're good dogs, Brant.");

  Future<void> clickSubmit() async {
    await _driver.tap(submit);
  }

  Future<void> clickBackArrow() async {
    await _driver.tap(backArrow);
  }

  Future<void> slideLeft() async {
    await _driver.scroll(slider, -200, 0, Duration(milliseconds: 500));
    await Actions.takeScreenshot(_driver, 'screenshots/slided_left.png');
  }

  Future<void> slideRight() async {
    await _driver.scroll(slider, 200, 0, Duration(milliseconds: 500));
  }
  
  Future<void> assertThatErrorMessageAppears() async {
    await Actions.takeScreenshot(_driver, 'screenshots/error_message.png');
    await _driver.waitFor(error);
  }

}