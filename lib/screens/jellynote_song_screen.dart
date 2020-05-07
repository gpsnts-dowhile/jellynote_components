import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jellynotescomponents/components/song_bottombar.dart';

import 'package:jellynotescomponents/components/song_jumbotron.dart';
import 'package:jellynotescomponents/models/instruments.dart';
import 'package:jellynotescomponents/stores/language.store.dart';
import 'package:jellynotescomponents/themes/app_colors.dart';

class SongScreen<T extends LanguageStore> extends StatefulWidget {
  final LanguageStore store;
  SongScreen(this.store, { Key key }) : super(key: key);

  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState<T extends LanguageStore> extends State<SongScreen> with AutomaticKeepAliveClientMixin {
  int _tempo = 120;
  bool _isFav = false;

  LanguageStore _store;
  List<String> _tags;
  List<Instrument> _instruments = [
    Instrument(
      iconPath: 'assets/images/icon_piano.png',
      instrumentName: 'Piano',
      index: 0,
    ),
    Instrument(
      iconPath: 'assets/images/icon_piano.png',
      instrumentName: 'Piano',
      index: 1,
    ),
    Instrument(
      iconPath: 'assets/images/icon_piano.png',
      instrumentName: 'Piano',
      index: 2,
    ),
    Instrument(
      iconPath: 'assets/images/icon_piano.png',
      instrumentName: 'Piano',
      index: 3,
    ),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _store = widget.store;
    _tags = _store.getLanguage == 'pt' ? [ 'Solo', 'Easy' ] : [ 'Solo', 'Facile' ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _isFav = !_isFav);
        },
        backgroundColor: Colors.white,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightElevation: 0,
        elevation: 2.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _isFav
              ? Image.asset(
                  'assets/images/icon_heart.png',
                  width: 24,
                )
              : Image.asset(
                  'assets/images/icon_heart_filled.png',
                  width: 24,
                ),

            _isFav
              ? Text(
                  _store.getLanguage == 'pt' ? 'Salvar' : 'Ajouter aux favoris',
                  style: TextStyle(
                    color: AppColors.ruby,
                    fontSize: _store.getLanguage == 'pt' ? 10 : 5,
                  ),
                  textAlign: TextAlign.center,
                )
              : Text(
              _store.getLanguage == 'pt' ? 'Salvo' : 'Favoris',
                  style: TextStyle(
                    color: AppColors.ruby,
                    fontSize: _store.getLanguage == 'pt' ? 10 : 8,
                  ),
                  textAlign: TextAlign.center,
                )
          ],
        ),
      ),

      bottomNavigationBar: SongBottomBar(
        store: _store,
      ),

      body: SingleChildScrollView(
          child: Container(
            width: _size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  SongJumbotron(
                    instruments: _instruments,
                    tags: _tags,
                    songName: 'Hallelujah',
                    size: _size,
                  ),
              ],
            ),
          ),
        ),
      );
  }
}
