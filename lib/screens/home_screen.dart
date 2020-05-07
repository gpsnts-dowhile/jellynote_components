import 'package:flutter/material.dart';
import 'package:jellynotescomponents/screens/jellynote_home_screen.dart';

class Screen {
  String screenName;
  dynamic screen;

  Screen(this.screenName, this.screen);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Screen> appScreens = [
    Screen('Jellynot Home', JellynoteHomeScreen())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8
        ),
        child: ListView.builder(
          itemCount: appScreens.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Container(
              color: Colors.grey,
              child: ListTile(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => appScreens[index].screen)
                  )
                },
                title: Text('${appScreens[index].screenName}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
