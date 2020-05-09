import 'package:flutter/material.dart';
import 'package:personal_page/internal/app_config.dart';

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
        child: Text('Раздел находится в разработке'),
      ),
    );
  }
}
