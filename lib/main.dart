import 'package:speedometer/pages/speedometer_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //в примере на сайте в первоначальном виджете идет почему-то только название
  //я хз как это работает, но ладно, будем делать матрёшку
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //тут только тайтл, в виджет вложенный виджет уже с боттомбаром

      title: "Speedometer",
        theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      home: TheOnlyWidget(), //да, боттомбар именно тут
    );
  }
}

class TheOnlyWidget extends StatefulWidget {
  const TheOnlyWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TheOnlyWidgetState();
}

class _TheOnlyWidgetState extends State<TheOnlyWidget> {
  //наш основной виджет, который будет содержать в себе BottomNavigationBar,
  //в котором уже будут переключаться страницы в зависимости от выбора иконки

  int _currentIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  //в этом куске кода - текущий индекс иконки и его смена при нажатии


  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Statistics',
    ),
    /*Text(
      'Index 1: Speedometer',
    ),*/
    SpeedometerPage(),
    Text(
      'Index 2: Profile',
    ),
    //TODO: вместо текстовых виджетов добавить в список три разных страницы
  ];
  //тут мы сделали список виджетов, которые пока что будут нам заменять страницы,
  //так как я не успеваю со всем разобраться. позже аменю виджеты на страницы


  @override
  Widget build(BuildContext context) {
    //я не помню, но, возможно, надо заменить на MaterialApp(),
    //хз, короче, я не соображаю уже
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      //в центре у нас стоит тот виджет, индекс которого соответствует
      //индексу нажатой нами иконки на боттомбаре

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer_outlined),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speed_outlined),
            label: "Speedometer",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }

}