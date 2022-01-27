import 'package:app_pets/pages/page_pet/page_create_pet.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

dynamic setIntroState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("tutorial", true);
}

class OnboardingIntro extends StatefulWidget {
  const OnboardingIntro({Key? key}) : super(key: key);

  @override
  _OnboardingIntroState createState() => _OnboardingIntroState();
}

class _OnboardingIntroState extends State<OnboardingIntro> {
  List<Slide> slides = [];
  @override
  void initState() {
    super.initState();

    slides.add(createPageModel(
      
        "Bem-vindo(a) ao AppPets!",
        "Feito com carinho para que você possa dedicar mais tempo ao seu bichinho de estimação!",
        'lib/assets/onboarding/Boas-vindas-1.png'));

    slides.add(createPageModel(
        "Melhore os laços\ncom seu pet!",
        "Cumprir com todas as responsabilidades do seu pet não só é importante para a saúde dele(a) como ajuda melhorar os laços entre o bichinho e dono(a)! ",
        'lib/assets/onboarding/Boas-vindas-2.png'));

    slides.add(createPageModel(
        "Sobre o AppPets",
        "Lembre de todas as responsabilidades para seu pet gerenciando suas tarefas!",
        'lib/assets/onboarding/Boas-vindas-3.png'));

    slides.add(createPageModel(
        "Então vamos começar!",
        "Adicione seu primeiro pet! Selecione um ícone e uma cor para representá-lo ao usar o aplicativo.",
        'lib/assets/onboarding/Boas-vindas-4.png'));
  }

  Slide createPageModel(String textTitle, String textBody, String imgPath) {
    return Slide(
      title: textTitle,
      styleTitle: const TextStyle(
          color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
      description: textBody,
      styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      maxLineTitle: 2,
      marginTitle:
          const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0, top: 30),
      marginDescription:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      backgroundImage: imgPath,
      backgroundImageFit: BoxFit.cover,
      backgroundOpacity: 0.0,
    );
  }

  Widget myButton(title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(
          // color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    );
  }

  ButtonStyle backButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder(
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2))),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      // textStyle: MaterialStateProperty.all<TextStyle>(
      //   (TextStyle(color: Theme.of(context).primaryColor)),
      // ),
      foregroundColor:
          MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _store_global = Provider.of<StorePets>(context);
    return IntroSlider(
      // List slides
      slides: slides,

      colorActiveDot: Theme.of(context).primaryColor,

      //skip
      showSkipBtn: false,

      // Prev button
      showPrevBtn: true,
      renderPrevBtn: myButton("Voltar"),
      prevButtonStyle: backButtonStyle(),

      // Next button
      renderNextBtn: myButton("Avançar"),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: myButton("Pronto"),
      doneButtonStyle: myButtonStyle(),
      onDonePress: () {
        setIntroState();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PageCreatePet(),
          ),
        );
      },
    );
  }
}
