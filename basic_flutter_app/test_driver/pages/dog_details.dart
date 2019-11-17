import 'package:flutter_driver/flutter_driver.dart';

class DogDetails{

  FlutterDriver _driver;

  DogDetails(FlutterDriver driver){
    this._driver = driver;
  }

  final slider = find.byValueKey('slider');

  Future<void> slideLeft() async {
    await _driver.scroll(slider, -200, 0, Duration(milliseconds: 500));
  }

  Future<void> slideRight() async {
    await _driver.scroll(slider, 200, 0, Duration(milliseconds: 500));
  }

}