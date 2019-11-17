import 'package:flutter_driver/flutter_driver.dart';


class DogsListClass{

  FlutterDriver _driver;

  DogsListClass(FlutterDriver driver){
    this._driver = driver;
  }

  final ruby = find.text('Ruby');
  final submit = find.byValueKey('submit');
  final plusIcon = find.byTooltip('plusik');
  final nameInput = find.byValueKey('name');
  final slider = find.byValueKey('slider');
  final locatioInput = find.byValueKey('location');
  final desriptionInput = find.byValueKey('desription');


  Future<void> clickPlusIcon() async{
    await _driver.tap(plusIcon);
  }

  Future<void> enterDogName(String name) async {
    await _driver.tap(nameInput);
    await _driver.enterText(name);
  }

  Future<void> enterDogLocation(String location) async {
    await _driver.tap(locatioInput);
    await _driver.enterText(location);
  }

  Future<void> enterDogDescription(String description) async {
    await _driver.tap(desriptionInput);
    await _driver.enterText(description);
  }

  Future<void> clickSubmitButton() async{
    await _driver.tap(submit);
  }
}