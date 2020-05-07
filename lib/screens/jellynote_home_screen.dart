import 'package:flutter/material.dart';

import 'package:jellynotescomponents/screens/jellynote_placeholder_screen.dart';
import 'package:jellynotescomponents/screens/jellynote_song_screen.dart';
import 'package:jellynotescomponents/stores/language.store.dart';
import 'package:jellynotescomponents/themes/app_colors.dart';

class CountryFlag {
  String language;
  String imagePath;

  CountryFlag(this.language, this.imagePath);
}

class JellynoteHomeScreen extends StatefulWidget {
  @override
  _JellynoteHomeScreenState createState() => _JellynoteHomeScreenState();
}

class _JellynoteHomeScreenState extends State<JellynoteHomeScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  CountryFlag _selectedLanguage;
  List<CountryFlag> _appLanguages;

  LanguageStore _languageStore = LanguageStore();

  dynamic _currentScreen;
  Map<String, dynamic> _screens;

  @override
  void initState() {
    _appLanguages = [
      CountryFlag('pt', 'assets/images/pt_flag.png'),
      CountryFlag('fr', 'assets/images/fr_flag.png'),
    ];
    _selectedLanguage = _appLanguages[0];
    _languageStore.setLanguage(_appLanguages[0].language);

    _screens = {
      'song': SongScreen(_languageStore),
      'placeholder': PlaceholderScreen()
    };
    _currentScreen = _screens['song'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Usuário:'),
                    Text('irineu.licks@gmail.com')
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey
              ),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('assets/images/icon_my_account.png'),
                color: Colors.black,
                size: 24,
              ),
              title: Text('Minha Conta'),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
              onTap: () {
                setState(() => _currentScreen = _screens['song']);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('assets/images/icon_my_tabs.png'),
                color: Colors.black,
                size: 24,
              ),
              title: Text('Minhas Partituras'),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
              onTap: () {
                setState(() => _currentScreen = _screens['placeholder']);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('assets/images/icon_my_score.png'),
                color: Colors.black,
                size: 24,
              ),
              title: Text('Placar'),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
              onTap: () {
                setState(() => _currentScreen = _screens['placeholder']);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => _drawerKey.currentState.openDrawer(),
          child: Container(
            child: Center(
              child: ImageIcon(
                AssetImage('assets/images/menu_icon.png'),
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'assets/images/jellynotes.png',
                width: 96,
              ),

              Container(
                width: 48,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<CountryFlag>(
                    value: _selectedLanguage,
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    onChanged: (dynamic value) {
                      setState(() {
                        _languageStore.setLanguage(value.language);
                        _selectedLanguage = value;
                      });
                    },
                    items: _appLanguages?.map((CountryFlag value) {
                      return DropdownMenuItem<CountryFlag>(
                        value: value,
                        child: Center(
                          child: Image.asset(
                            value.imagePath,
                            width: 24,
                          ),
                        ),
                      );
                    })?.toList(),
                  ),
                ),
              )

            ],
          ),
        ),
        actions: <Widget>[
          Container(
            width: 48,
            child: Icon(
              Icons.search,
              color: AppColors.royalBlue,
              size: 36,
            ),
          )
        ],
      ),

      body: _currentScreen,

    );
  }
}
