import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'pages/dog_details.dart';
import 'pages/dogs_list.dart';

void main() {
  group('Counter App', ()
  {
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
      DogsListClass dogsListClass = new DogsListClass(driver);

      await dogsListClass.clickPlusIcon();
      await dogsListClass.enterDogName('Bohun');
      await dogsListClass.enterDogLocation('Wroclaw');
      await dogsListClass.enterDogDescription("He's really smart dog");
      await dogsListClass.clickSubmitButton();
    });

    test('Move slider', () async {
      DogsListClass dogsListClass = new DogsListClass(driver);
      DogDetails dogDetails = new DogDetails(driver);

      await dogsListClass.goToDogDetails();
      await dogDetails.slideLeft();
      await dogDetails.slideRight();
      await dogDetails.clickBackArrow();
    });

    test('Rate dog', () async {
      DogsListClass dogsListClass = new DogsListClass(driver);
      DogDetails dogDetails = new DogDetails(driver);

      await dogsListClass.goToDogDetails();
      await dogDetails.slideLeft();
      await dogDetails.clickSubmit();
      await dogDetails.assertThatErrorMessageAppears();
    });
  });
}