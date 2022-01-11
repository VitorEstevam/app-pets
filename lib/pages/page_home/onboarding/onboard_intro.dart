import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingIntro extends StatelessWidget {

  final List<PageModel> onboardingPagesList = []; 
  
  PageModel _create_page_model (String textTitle, String textBody, String img_path_way){
   return PageModel(
      widget: Column(
              children: [
                Container(
                    width: double.infinity,
                    child: Text(textTitle, style: pageTitleStyle)),
                Container(
                  width: double.infinity,
                  child: Text(
                    textBody,
                    style: pageInfoStyle,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 45.0),
                    child: Image.asset(img_path_way,
                        color: pageImageColor)),
              ],
            ),
    );
  }

  OnboardingIntro(){
    onboardingPagesList.add(_create_page_model( "Bem-vindo(a) ao {app}!",  
                                                "Feito com carinho para que você possa dedicar mais tempo ao seu bichinho de estimação!", 
                                                "assets/intro_images/Pag1_pets.png"));
  
    onboardingPagesList.add(_create_page_model( "Melhore os laços com seu pet!",  
                                                "Cumprir com todas as responsabilidades do seu pet não só é importante para a saúde dele(a) como ajuda melhorar os laços entre o bichinho e dono(a)! ", 
                                                "assets/intro_images/Pag2_pets.png"));
                                                
    onboardingPagesList.add(_create_page_model( "Sobre o {app}",  
                                                "Lembre de todas as responsabilidades para seu pet gerenciando suas tarefas!", 
                                                "assets/intro_images/Pag2_pets.png"));

    onboardingPagesList.add(_create_page_model( "Então vamos começar!",  
                                                "Adicione seu primeiro pet! Selecione um ícone e uma cor para representá-lo ao usar o aplicativo.", 
                                                "assets/intro_images/Pag2_pets.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding( 
        isSkippable: false,
        proceedButtonStyle: ProceedButtonStyle(
            proceedButtonRoute: (context) {
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
                (route) => false,
              );
            }),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.polygon(
            polygonDesign: PolygonDesign(
              polygon: DesignType.polygon_circle,
            ),
          ),
        ),
      )
    );
  }
}