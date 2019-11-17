import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'pages/dogs_list.dart';

void main() {
  group('Counter App', () {

//    final ruby = find.text('Ruby');
//    final submit = find.byValueKey('submit');
    final plusIcon = find.byTooltip('plusik');
//    final nameInput = find.byValueKey('name');
//    final slider = find.byValueKey('slider');
//    final locatioInput = find.byValueKey('location');
//    final desriptionInput = find.byValueKey('desription');

    FlutterDriver driver;


    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Adding new dog...', () async {


//      await driver.tap(ruby);
//
//      await driver.scroll(slider, -200, 0, Duration(milliseconds: 500));
//      await driver.scroll(slider, 300, 0, Duration(milliseconds: 500));
//      await driver.scroll(slider, -100, 0, Duration(milliseconds: 500));
//
      DogsListClass dogsListClass = new DogsListClass(driver);


      await dogsListClass.clickPlusIcon();
      await dogsListClass.enterDogName('Bohun');
      await dogsListClass.enterDogLocation('Wroclaw');
      await dogsListClass.enterDogDescription("He's really smart dog");
      await dogsListClass.clickSubmitButton();

      });

    });
}