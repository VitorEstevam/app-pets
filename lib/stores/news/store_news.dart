import 'package:app_pets/classes/news.dart';
import 'package:mobx/mobx.dart';

// run builder on cmd to generate the code

// Include this
part 'store_news.g.dart';

class StoreNews = _StoreNews with _$StoreNews;

String lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet tincidunt urna. Donec maximus iaculis turpis. Duis non massa eu massa mollis bibendum at quis ex. Suspendisse eu elementum nibh, vitae semper metus. Vivamus vulputate velit sit amet ex fringilla, eu finibus massa mollis. Cras lobortis volutpat odio ac auctor. Praesent lobortis convallis erat, eu tincidunt elit tincidunt ac. Duis pulvinar dapibus dui ut facilisis. Vestibulum semper dignissim eros a fringilla. Pellentesque scelerisque tellus ipsum, vitae pharetra orci vehicula gravida. Aenean eget sem nisi. Phasellus nisi risus, pellentesque ac sapien a, pellentesque interdum mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent ullamcorper purus metus, id accumsan leo consequat eu. Vestibulum sed lacus nec metus vehicula tempus id eget ex. Nulla a quam nec dui volutpat vehicula sit amet facilisis ligula.\n\nSed mauris eros, viverra ac vestibulum in, volutpat nec sem. Donec non ipsum vitae nulla interdum rutrum ut sed sem. Nullam a diam nunc. Cras at massa et velit porta pharetra eu in eros. Praesent interdum tortor et dignissim fringilla. Quisque laoreet congue ex ullamcorper aliquet. Quisque id ullamcorper diam. Pellentesque posuere nec arcu eget condimentum. Etiam fringilla risus et orci viverra luctus. Curabitur eget ipsum mi. Integer malesuada urna quis orci scelerisque, non fringilla risus volutpat.";

// Create the class
abstract class _StoreNews with Store {
  @observable
  ObservableList<News> news = ObservableList<News>.of([
    News(
        title: "Como acostumar seu cachorro com a coleira",
        header: "lib/assets/news/news_passeio.jpg",
        text:
            "Passear com seu pet pode ser desafiador. Alguns pets não estão muito acostumados a esta prática, e acabam puxando a coleira ou ficando muito agitados.\nMuitos pets não gostam da coleira porque não estão acostumados com ela. A técnica para evitar que o cachorro puxe a guia durante o passeio é familiarizar seu amigo com a coleira.\nComece colocando a coleira em seu pet em momentos dentro de casa. Deixe-o brincar um pouco, solto, para se acostumar à sensação da coleira no pescoço.\nDepois, coloque a guia e passeie em um local familiar, como dentro de casa ou no jardim. Quando perceber que seu amigo está passeando tranquilamente, já acostumado com a coleira, é hora de ir para fora!",
        taskTitle: "Passear com o cachorro"),
    News(
        title: "Fortaleza promove Dia “D” de vacinação contra raiva para cães e gatos neste sábado",
        header: "lib/assets/news/news_vacina.jpg",
        text:
            "A Prefeitura de Fortaleza inicia, por meio da Secretaria Municipal da Saúde (SMS), a campanha de vacinação contra raiva animal e promove, neste sábado (06/11), o Dia “D”. Serão 227 pontos de vacinação, incluindo as Unidades de Vigilância de Zoonoses (UVZ), com atendimento das 8h às 16h, para cães e gatos a partir de três meses de idade.\nO Ministério da Saúde preconiza que 80% dos cães sejam vacinados, anualmente, na cidade. Fortaleza alcançou esta meta nos últimos dois anos. Os 20% restantes equivalem ao número de animais abaixo da idade mínima ou que já foram imunizados em clínicas veterinárias particulares. Não há metas preconizadas para gatos pelo MS. Em números absolutos, a meta é vacinar cerca de 440 mil animais, entre cães e gatos, este ano.\nPara realizar a imunização dos seus animais de estimação, os tutores devem levar a carteira de vacinação do animal. Quem não possui o documento recebe a carteirinha no ato da vacinação, com o registro da aplicação.",
        taskTitle: "Passear com o cachorro"),
    News(
        title: "Comida ou ração: você sabe qual a melhor opção para o seu pet?",
        header: "lib/assets/news/news_comida.jpg",
        text:
            "Enquanto alguns tutores preferem dar alimentos naturais aos pets, outros optam apenas pela ração tradicional. De acordo com a médica veterinária Maria Cecilia de Lima Rorig, antes de mudar a dieta do animal, é necessário pensar nas necessidades de cada um dos peludinhos.\nAssim, se você quer começar a substituir a ração por comida ‘de gente’, a médica explica que é possível, porém, é muito importante procurar um profissional especializado, como um nutricionista veterinário, e conferir o que ele indica para o seu bichinho.\n“Muitas vezes, essas alimentações naturais já são vendidas prontas, congeladas. Não é a comida caseira, que sai direto do nosso prato, com tempero”, diz. Ela ainda complementa esclarecendo que o tutor pode adquirir essa dieta pronta ou então aprender a preparar esse alimento especialmente para a necessidade do animal."),
  ]);
}
