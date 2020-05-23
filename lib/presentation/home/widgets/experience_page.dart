import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_page/internal/app_config.dart';
import 'package:personal_page/presentation/home/widgets/social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperiencePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.topRight,
          colors: [
            AppConfig.DARK_COLOR,
            AppConfig.PRIMARY_COLOR,
          ],
        ),
      ),
      child: Center(
        child: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Проекты, в разработке которых принимал участие:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20),
        CarouselSlider(
          options: CarouselOptions(
            height: 600,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: [
            _getMeso(),
            _getMesoStore(),
            _getTonikWallet(),
            _getSnailz(),
            _getSqurl(),
          ],
        ),
      ],
    );
  }

  Widget _getMeso() {
    return _projectCard(
      imagePath: 'assets/images/meso.png',
      label: 'MESO - Продукты из любимых магазинов у дома.',
      playMarketUrl:
          'https://play.google.com/store/apps/details?id=com.meso.app&hl',
      appStoreUrl:
          'https://apps.apple.com/ru/app/meso-%D0%BF%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%82%D1%8B-%D1%81-%D0%B4%D0%BE%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%BE%D0%B9/id1469677894',
    );
  }

  Widget _getMesoStore() {
    return _projectCard(
      imagePath: 'assets/images/meso_store.png',
      label: 'MESO для магазинов',
      playMarketUrl:
          'https://play.google.com/store/apps/details?id=com.meso.store&hl',
      appStoreUrl:
          'https://apps.apple.com/ru/app/meso-%D0%B4%D0%BB%D1%8F-%D0%BC%D0%B0%D0%B3%D0%B0%D0%B7%D0%B8%D0%BD%D0%BE%D0%B2/id1508750789',
    );
  }

  Widget _getTonikWallet() {
    return _projectCard(
      imagePath: 'assets/images/tonik_wallet.png',
      label: 'Tonik Wallet',
      playMarketUrl:
          'https://play.google.com/store/apps/details?id=com.tonik.tonik_wallet',
    );
  }

  Widget _getSnailz() {
    return _projectCard(
      imagePath: 'assets/images/snailz.png',
      label: 'Snailz - Nail Salon Booking App',
      playMarketUrl:
          'https://play.google.com/store/apps/details?id=com.snailz.customer',
      appStoreUrl: 'https://apps.apple.com/us/app/snailz/id1231545925',
    );
  }

  Widget _getSqurl() {
    return _projectCard(
      imagePath: 'assets/images/squrl.png',
      label: 'Squrl - Your Everything app. To Buy. To Do. To Read.',
      playMarketUrl:
          'https://play.google.com/store/apps/details?id=com.squrlaway',
      appStoreUrl:
          'https://apps.apple.com/us/app/squrl-your-everything-app/id1355330956',
    );
  }

  Widget _projectCard({
    @required String imagePath,
    @required String label,
    String playMarketUrl,
    String appStoreUrl,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Image.asset(imagePath),
            flex: 5,
          ),
          SizedBox(height: 20),
          Flexible(
            child: Text(label),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (playMarketUrl != null)
                SocialButton(
                  child: FaIcon(FontAwesomeIcons.googlePlay),
                  onTap: () => _onMarketIconTap(playMarketUrl),
                ),
              if (appStoreUrl != null)
                SocialButton(
                  child: FaIcon(FontAwesomeIcons.apple),
                  onTap: () => _onMarketIconTap(appStoreUrl),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _onMarketIconTap(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
