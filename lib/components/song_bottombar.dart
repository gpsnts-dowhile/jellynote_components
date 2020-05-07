import 'package:flutter/material.dart';
import 'package:jellynotescomponents/stores/language.store.dart';
import 'package:jellynotescomponents/themes/app_colors.dart';

class SongBottomBar extends StatefulWidget {
  final LanguageStore store;

  SongBottomBar({this.store}) : assert(store != null);

  @override
  _SongBottomBarState createState() => _SongBottomBarState();
}

class _SongBottomBarState extends State<SongBottomBar> {
  double _tempo = 120;
  LanguageStore _store;

  @override
  void initState() {
    _store = widget.store;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 12
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20.0,
            offset: Offset(
              15.0,
              15.0,
            ),
          )
        ],
      ),
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: IconButton(
              tooltip: _store.getLanguage == 'pt' ? "Play" : "Représenter",
              iconSize: 36,
              icon: Icon(
                Icons.play_circle_filled,
                color: AppColors.ruby,
              ),
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            ),
          ),

          Container(
            width: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      splashColor: Colors.transparent, // inkwell color
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                width: 0.25,
                                color: Colors.black45
                            )
                        ),
                        width: 24,
                        height: 24,
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            size: 18,
                            color: AppColors.royalBlue,
                          ),
                        ),
                      ),
                      onTap: () => setState(() => _tempo--),
                    ),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Tempo'),
                    Text('$_tempo')
                  ],
                ),

                ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      splashColor: Colors.transparent, // inkwell color
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 0.25,
                              color: Colors.black45,
                            )
                        ),
                        width: 24,
                        height: 24,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 18,
                            color: AppColors.royalBlue,
                          ),
                        ),
                      ),
                      onTap: () => setState(() => _tempo++),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            child: IconButton(
              tooltip: _store.getLanguage == 'pt' ? "Transpor notas" : "Transpozes les notes",
              iconSize: 36,
              icon: Image.asset('assets/images/icon_sharps.png'),
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            ),
          ),

          Container(
            child: IconButton(
              tooltip: _store.getLanguage == 'pt' ? "Notas, tablaturas ou ambos" : "Partition, Tablature ou les deux" ,
              iconSize: 36,
              icon: Image.asset('assets/images/icon_tabs_nums.png'),
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            ),
          ),

          Container(
            child: IconButton(
              tooltip: _store.getLanguage == 'pt' ? "Modo estudo" : "Mode Etude",
              iconSize: 36,
              icon: Image.asset('assets/images/icon_goggles.png'),
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            ),
          ),

        ],
      ),
    );
  }
}
