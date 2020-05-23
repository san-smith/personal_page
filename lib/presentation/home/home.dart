import 'package:blocify/blocify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_page/presentation/home/widgets/experience_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/main_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController();
  DataBloc<int> _pageBloc = DataBloc(0);

  @override
  void dispose() {
    _pageBloc.close();
    super.dispose();
  }

  static List<Widget> _pages = [
    MainPage(),
    ExperiencePage(),
  ];

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
        PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          pageSnapping: false,
          onPageChanged: _onPageChanged,
          itemCount: _pages.length,
          itemBuilder: (context, index) => _pages[index],
        ),
        // Positioned(
        //   right: 20,
        //   top: 30,
        //   child: _getForkButton(),
        // ),
        Align(
          alignment: Alignment.topCenter,
          child: _goUpButton(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _goDownButton(),
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

  Widget _goUpButton() {
    return BlocBuilder<DataBloc<int>, DataState<int>>(
      bloc: _pageBloc,
      builder: (context, state) {
        if (state.data != 0) {
          return IconButton(
            icon: FaIcon(FontAwesomeIcons.angleUp),
            onPressed: _prevPage,
          );
        }
        return Container();
      },
    );
  }

  Widget _goDownButton() {
    return BlocBuilder<DataBloc<int>, DataState<int>>(
      bloc: _pageBloc,
      builder: (context, state) {
        if (state.data != _pages.length - 1) {
          return IconButton(
            icon: FaIcon(FontAwesomeIcons.angleDown),
            onPressed: _nextPage,
          );
        }
        return Container();
      },
    );
  }

  void _onGitHubTap() async {
    const url = 'https://github.com/san-smith/personal_page';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void _prevPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void _onPageChanged(int index) {
    _pageBloc.add(DataSetEvent(index));
  }
}
