import 'story.dart';

class StoryBrain {
  String getStory() => _storyData[_storyNumber].storyTitle;

  String getChoice1() => _storyData[_storyNumber].choice1;

  String getChoice2() => _storyData[_storyNumber].choice2;

  void setLanguage(String languageChoice) => _storyLanguage = languageChoice;

  bool buttonShouldBeVisible() {
    return _storyNumber <= 2 ? true : false;
  }

  void nextStory(int choiceNumber) {
    if (_storyNumber == 0) {
      choiceNumber == 1 ? _storyNumber = 2 : _storyNumber = 1;
    } else if (_storyNumber == 1) {
      choiceNumber == 1 ? _storyNumber = 2 : _storyNumber = 3;
    } else if (_storyNumber == 2) {
      choiceNumber == 1 ? _storyNumber = 5 : _storyNumber = 4;
    } else if (_storyNumber >= 3) {
      _restart();
    }
  }

  void _restart() => _storyNumber = 0;

  int _storyNumber = 0;

  static String _storyLanguage = 'English';

  List<Story> _storyData =
      _storyLanguage == 'English' ? _storyDataEnglish : _storyDataPortuguese;

  static List<Story> _storyDataEnglish = const [
    Story(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        storyTitle:
            'As he begins to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];
  static List<Story> _storyDataPortuguese = const [
    Story(
        storyTitle:
            'Seu carro furou um pneu em uma estrada sinuosa no meio do nada e não há sinal de celular. Você decide pegar carona. Uma caminhonete enferrujada para ao seu lado e um homem de chapéu de aba larga com olhos sem alma abre a porta do passageiro para você e pergunta: "Precisa de uma carona, garoto?"',
        choice1: 'Vou entrar. Obrigado pela ajuda!',
        choice2: 'É melhor perguntar a ele primeiro se ele é um assassino.'),
    Story(
        storyTitle: 'Ele acena lentamente, sem se abalar com a pergunta.',
        choice1: 'Pelo menos ele é honesto. Vou entrar.',
        choice2: 'Espera, eu sei trocar um pneu.'),
    Story(
        storyTitle:
            'Enquanto ele começa a dirigir, o estranho começa a falar sobre sua relação com a mãe. Ele fica cada vez mais irritado a cada minuto. Ele pede para você abrir o porta-luvas. Lá dentro você encontra uma faca ensanguentada, dois dedos decepados e uma fita cassete do Elton John. Ele estende a mão para abrir o porta-luvas.',
        choice1: 'Eu amo Elton John! Entrego a fita cassete para ele.',
        choice2: 'É ele ou eu! Você pega a faca e o esfaqueia.'),
    Story(
        storyTitle:
            'O que? Essa é uma saída fácil! Você sabia que acidentes de trânsito são a segunda principal causa de morte acidental para a maioria dos grupos etários adultos?',
        choice1: 'Reiniciar história',
        choice2: ''),
    Story(
        storyTitle:
            'Enquanto você atravessa o guardrail e despenca em direção as rochas pontiagudas abaixo, você reflete a respeito da ideia brilhante de esfaquear alguém enquanto dirige o carro em que você está.',
        choice1: 'Reiniciar história',
        choice2: ''),
    Story(
        storyTitle:
            'Você cria uma conexão com o assassino enquanto cantam juntos versos de "Can You Feel the Love Tonight". Ele te deixa na próxima cidade. Antes de você ir, ele pergunta se você conhece algum bom lugar para se livrar de corpos. Você responde: "Tente o píer".',
        choice1: 'Reiniciar história',
        choice2: '')
  ];
}
