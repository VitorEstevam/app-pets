import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:app_pets/stores/example/store_global.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';

class OnboardingIntro extends StatelessWidget {
  
  final List<PageModel> onboardingPagesList = []; 
 
  PageModel _create_page_model (String textTitle, String textBody, String img_path_way){
   return PageModel(
      widget: Column(
        children: [
          Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                textTitle, 
                style: TextStyle(color: Colors.black, fontSize: 28),
                ),
              ),
          Container(
            width: double.infinity,
            child: Text(
              textBody,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Expanded(
            child: ImageLoader(img_path_way), 
          ),
        ],
      ),
    );
  }
  
  OnboardingIntro(){
    onboardingPagesList.add(_create_page_model( "Bem-vindo(a) ao {app}!",  
                                                "Feito com carinho para que você possa dedicar mais tempo ao seu bichinho de estimação!", 
                                                'lib/assets/Pag1_pets.png'));
  
    onboardingPagesList.add(_create_page_model( "Melhore os laços com seu pet!",  
                                                "Cumprir com todas as responsabilidades do seu pet não só é importante para a saúde dele(a) como ajuda melhorar os laços entre o bichinho e dono(a)! ", 
                                                "lib/assets/Pag2_pets.png"));
                                                
    onboardingPagesList.add(_create_page_model( "Sobre o {app}",  
                                                "Lembre de todas as responsabilidades para seu pet gerenciando suas tarefas!", 
                                                "lib/assets/Pag3_pets.png"));

    onboardingPagesList.add(_create_page_model( "Então vamos começar!",  
                                                "Adicione seu primeiro pet! Selecione um ícone e uma cor para representá-lo ao usar o aplicativo.", 
                                                "lib/assets/Pag4_pets.png"));
  }

  @override
  Widget build(BuildContext context) {
    var _store_global = Provider.of<StoreGlobal>(context);
    
    return Scaffold(
      body: Onboarding( 
        background: Colors.white,
        isSkippable: false,

        proceedButtonStyle: ProceedButtonStyle(
          proceedButtonColor: Color.fromRGBO(255, 89, 103, 1),
          proceedpButtonText: Text("Avançar", style: TextStyle(color: Colors.white),),
          proceedButtonRoute: (context) {
            
            _store_global.tutorialDone = true; // @TODO: SAVE THIS

            return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => TabBarHandler(),
              ),
              (route) => false, 
            );
          }),
        pages: onboardingPagesList,
        indicator: Indicator(
          activeIndicator: ActiveIndicator(color: Colors.grey, ),
          closedIndicator: ClosedIndicator(color: Colors.grey, ),
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