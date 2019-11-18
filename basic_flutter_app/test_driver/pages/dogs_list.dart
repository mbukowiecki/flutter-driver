import 'package:flutter_driver/flutter_driver.dart';

import '../utils/actions.dart';
import 'dog_details.dart';


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
  final locationInput = find.byValueKey('location');
  final descriptionInput = find.byValueKey('desription');


  Future<void> clickPlusIcon() async{
    await Actions.takeScreenshot(_driver, 'screenshots/dog_list.png');
    await _driver.tap(plusIcon);
  }

  Future<void> goToDogDetails() async{
    await _driver.tap(ruby);
  }

  Future<void> enterDogName(String name) async {
    await Actions.takeScreenshot(_driver, 'screenshots/dog_details.png');
    await _driver.tap(nameInput);
    await _driver.enterText(name);
  }

  Future<void> enterDogLocation(String location) async {
    await _driver.tap(locationInput);
    await _driver.enterText(location);
  }

  Future<void> enterDogDescription(String description) async {
    await _driver.tap(descriptionInput);
    await _driver.enterText(description);
  }

  Future<void> clickSubmitButton() async{
    await Actions.takeScreenshot(_driver, 'screenshots/add_new_dog.png');
    await _driver.tap(submit);
  }

  Future<DogDetails> submitDog() async{
    await clickPlusIcon();
    await enterDogName("Czarek");
    await enterDogLocation("Krakow");
    await enterDogDescription("Elo");
    await clickSubmitButton();
    return DogDetails(_driver);
  }
}