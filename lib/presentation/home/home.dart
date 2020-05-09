import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/main_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Stack(
      children: <Widget>[
        PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            MainPage(),
          ],
        ),
        Positioned(
          right: 20,
          top: 20,
          child: _getForkButton(),
        ),
      ],
    );
  }

  Widget _getForkButton() {
    return OutlineButton(
      textColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Fork me on GitHub!'),
          SizedBox(width: 10),
          FaIcon(FontAwesomeIcons.github),
        ],
      ),
      onPressed: _onGitHubTap,
    );
  }

  void _onGitHubTap() async {
    const url = 'https://github.com/san-smith/personal_page';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
