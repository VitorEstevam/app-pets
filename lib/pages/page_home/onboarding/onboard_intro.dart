import 'package:app_pets/pages/page_pet/create_pet_intro.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:app_pets/stores/example/store_pets.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';


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
        "Bem-vindo(a) ao {app}!",
        "Feito com carinho para que você possa dedicar mais tempo ao seu bichinho de estimação!",
        'lib/assets/Pag1_pets.jpg'));

    slides.add(createPageModel(
        "Melhore os laços com seu pet!",
        "Cumprir com todas as responsabilidades do seu pet não só é importante para a saúde dele(a) como ajuda melhorar os laços entre o bichinho e dono(a)! ",
        "lib/assets/Pag2_pets.jpg"));

    slides.add(createPageModel(
        "Sobre o {app}",
        "Lembre de todas as responsabilidades para seu pet gerenciando suas tarefas!",
        "lib/assets/Pag3_pets.jpg"));

    slides.add(createPageModel(
        "Então vamos começar!",
        "Adicione seu primeiro pet! Selecione um ícone e uma cor para representá-lo ao usar o aplicativo.",
        "lib/assets/Pag4_pets.jpg"));
  }

  Slide createPageModel(String textTitle, String textBody, String imgPath) {
    return Slide(
        title: textTitle,
        styleTitle: const TextStyle(
            color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
        description: textBody,
        styleDescription: const TextStyle(
            color: Colors.black,
            fontSize: 20.0),
        maxLineTitle: 2,
        marginTitle:
            const EdgeInsets.only(left: 20.0, right:20.0,bottom: 10.0, top: 30),
        marginDescription:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        backgroundImage: imgPath,
        backgroundImageFit: BoxFit.cover,
        backgroundOpacity: 0.0,);
  }

  Widget myButton(title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
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
      prevButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: myButton("Avançar"),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: myButton("Pronto"),
      doneButtonStyle: myButtonStyle(),
      onDonePress: (){
        _store_global.tutorialDone = true; // @TODO: SAVE THIS

         Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => CreatePetIntro(),
          ),
          (route) => false,
        );
      },
    );
  }
}
