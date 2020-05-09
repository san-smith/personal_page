import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_page/internal/app_config.dart';
import 'package:url_launcher/url_launcher.dart';

import 'social_button.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            AppConfig.DARK_COLOR,
            AppConfig.PRIMARY_COLOR,
          ],
        ),
      ),
      child: Center(
        child: Wrap(
          children: <Widget>[
            _getBox(
              _getLeftCard(),
            ),
            _getBox(
              _getRightCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getLeftCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _getAvatar(),
          SizedBox(height: 20),
          Text(
            'san-smith',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              SocialButton(
                child: FaIcon(FontAwesomeIcons.at),
                toolTip: 'san-smith@mail.ru',
                onTap: _onEmailTap,
              ),
              SocialButton(
                child: FaIcon(FontAwesomeIcons.telegramPlane),
                toolTip: '@san_smith',
                onTap: _onTelegramTap,
              ),
              SocialButton(
                child: FaIcon(FontAwesomeIcons.github),
                toolTip: 'san-smith',
                onTap: _onGitHubTap,
              ),
              SocialButton(
                child: Image.asset(
                  'assets/images/habr_icon.png',
                  height: 35,
                ),
                toolTip: '@san-smith',
                onTap: _onHabrTap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getRightCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _getInfoRow(
            title: 'Обо мне',
            child: _getInfoText(
              '''Я занимаюсь разработкой кроссплатформенных мобильных приложений, преподаю в вузе, а ещё занимаюсь наукой и получил степень кандидата физико-математических наук.
Технологии и языки, которые я использую в работе:''',
            ),
          ),
          SizedBox(height: 10),
          _getInfoRow(child: _getInfoText('''• Flutter
• Dart
• React Native
• TypeScript
• Python
• Git
''')),
          SizedBox(height: 20),
          _getInfoRow(
              title: 'Образование',
              child: Column(
                children: <Widget>[
                  _getEducationRow(
                      'Алтайская государственная педагогическая академия',
                      '2013'),
                  SizedBox(height: 5),
                  _getEducationRow(
                      'Алтайский государственный технический университет им. И.И. Ползунова',
                      '2016'),
                  SizedBox(height: 5),
                  _getEducationRow(
                      'Алтайский государственный университет', '2018'),
                  SizedBox(height: 5),
                  _getEducationRow('Защита кандидатской диссертации', '2018'),
                ],
              )),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _getBox(Widget child) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 500,
        maxWidth: 500,
      ),
      child: child,
    );
  }

  Widget _getAvatar() {
    return Container(
      width: 200,
      height: 200,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: Image.asset('assets/images/avatar_1.jpg').image,
      ),
    );
  }

  Widget _getInfoRow({String title, Widget child}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 100,
          child: Text(
            title ?? '',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(width: 20),
        Flexible(
          child: child,
        ),
      ],
    );
  }

  Widget _getInfoText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    );
  }

  Widget _getEducationRow(String text, String year) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(child: _getInfoText(text)),
        SizedBox(width: 20),
        Text(
          year,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  void _onEmailTap() async {
    const url = 'mailto:san-smith@mail.ru';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void _onTelegramTap() async {
    const url = 'https://t.me/san_smith';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void _onHabrTap() async {
    const url = 'https://habr.com/ru/users/san-smith/';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void _onGitHubTap() async {
    const url = 'https://github.com/san-smith';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
