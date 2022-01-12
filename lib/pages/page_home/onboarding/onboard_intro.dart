import 'package:app_pets/pages/page_pet/create_pet_intro.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:app_pets/stores/example/store_global.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';

// class OnboardingIntro extends StatelessWidget {
//   final List<PageModel> onboardingPagesList = [];

//   PageModel _create_page_model(
//       String textTitle, String textBody, String img_path_way) {
//     return PageModel(
//       widget: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.only(bottom: 15.0),
//             child: Text(
//               textTitle,
//               style: const TextStyle(color: Colors.black, fontSize: 28),
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             child: Text(
//               textBody,
//               style: const TextStyle(color: Colors.black, fontSize: 16),
//             ),
//           ),
//           Expanded(
//             child: ImageLoader(img_path_way),
//           ),
//         ],
//       ),
//     );
//   }

//   OnboardingIntro() {
//     onboardingPagesList.add(_create_page_model(
//         "Bem-vindo(a) ao {app}!",
//         "Feito com carinho para que você possa dedicar mais tempo ao seu bichinho de estimação!",
//         'lib/assets/Pag1_pets.png'));

//     onboardingPagesList.add(_create_page_model(
//         "Melhore os laços com seu pet!",
//         "Cumprir com todas as responsabilidades do seu pet não só é importante para a saúde dele(a) como ajuda melhorar os laços entre o bichinho e dono(a)! ",
//         "lib/assets/Pag2_pets.png"));

//     onboardingPagesList.add(_create_page_model(
//         "Sobre o {app}",
//         "Lembre de todas as responsabilidades para seu pet gerenciando suas tarefas!",
//         "lib/assets/Pag3_pets.png"));

//     onboardingPagesList.add(_create_page_model(
//         "Então vamos começar!",
//         "Adicione seu primeiro pet! Selecione um ícone e uma cor para representá-lo ao usar o aplicativo.",
//         "lib/assets/Pag4_pets.png"));
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _store_global = Provider.of<StoreGlobal>(context);

//     return Scaffold(
//         body: Onboarding(
//       background: Colors.white,
//       isSkippable: false,
//       proceedButtonStyle: ProceedButtonStyle(
//           proceedButtonColor: const Color.fromRGBO(255, 89, 103, 1),
//           proceedpButtonText: const Text(
//             "Avançar",
//             style: const TextStyle(color: Colors.white),
//           ),
//           proceedButtonRoute: (context) {
//             _store_global.tutorialDone = true; // @TODO: SAVE THIS

//             return Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CreatePetIntro(),
//               ),
//               (route) => false,
//             );
//           }),
//       pages: onboardingPagesList,
//       indicator: Indicator(
//         activeIndicator: const ActiveIndicator(
//           color: Colors.grey,
//         ),
//         closedIndicator: const ClosedIndicator(
//           color: Colors.grey,
//         ),
//         indicatorDesign: IndicatorDesign.polygon(
//           polygonDesign: PolygonDesign(
//             polygon: DesignType.polygon_circle,
//           ),
//         ),
//       ),
//     ));
//   }
// }

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
    var _store_global = Provider.of<StoreGlobal>(context);
    return IntroSlider(
      // List slides
      slides: slides,

      colorActiveDot: Theme.of(context).primaryColor,

      //skip
      showSkipBtn: false,

      // Prev button
      showPrevBtn: true,
      renderPrevBtn: myButton("VOLTAR"),
      prevButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: myButton("AVANÇ12312312312AR"),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: myButton("PRONTO"),
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
