import 'package:flutter/material.dart';
import 'package:jellynotescomponents/components/list_separated_component.dart';
import 'package:jellynotescomponents/models/instruments.dart';
import 'package:jellynotescomponents/themes/app_colors.dart';

class SongJumbotron extends StatefulWidget {
  final Size size;
  final String songName;
  final List<dynamic> tags;
  final List<dynamic> instruments;

  SongJumbotron({
    this.size,
    this.songName,
    this.tags,
    this.instruments
  }) : assert(size != null),
    assert(songName != null),
    assert(tags != null),
    assert(instruments != null);

  @override
  _SongJumbotronState createState() => _SongJumbotronState();
}

class _SongJumbotronState extends State<SongJumbotron> {
  Size _size;
  List<dynamic> _tags;
  List<dynamic> _instruments;

  Instrument _selectedInstrument;

  Widget _buildTags(List<dynamic> tags) {
    return ListSeparatedComponent(
      items: tags,
      separatorWidth: 20,
      itemBuilder: ((BuildContext ctx, int i) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 25,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppColors.darkGrey ,
              )
          ),
          child: Center(
            child: Text(
              tags[i],
              style: TextStyle(
                fontSize: 16,
                color: AppColors.darkGrey,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPlayableInstruments(List<Instrument> instruments) {
    return ListSeparatedComponent(
      items: instruments,
      separatorWidth: 10,
      itemBuilder: ((BuildContext ctx, int i) {
        return GestureDetector(
          onTap: () {
            setState(() => _selectedInstrument = instruments[i]);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Center(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      iconSize: 36,
                      icon: Image.asset(instruments[i].iconPath, width: 36,),
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        setState(() => _selectedInstrument = instruments[i]);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 2.5,
                        bottom: 7.5,
                      ),
                      child: Text(instruments[i].instrumentName),
                    ),
                    _selectedInstrument?.index == i
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green,
                          ),
                          height: 2.5,
                          width: 40,
                        )
                      : Container(),
                  ],
                )
            ),
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    _size = widget.size;
    _tags = widget.tags;
    _instruments = widget.instruments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container( // Page header
      width: _size.width,
      height: 350,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.songName,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Text(
                    'Leonard Cohen',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.darkGrey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    height: 45,
                    width: _size.width * .8,
                    child: Center(
                      child: _buildTags(_tags),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    height: 100,
                    width: _size.width * .8,
                    child: Center(
                      child: _buildPlayableInstruments(_instruments),
                    ),
                  ),
                ),

                Text('${_selectedInstrument?.index}')

              ],
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 45,
              width: 45,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.print,
                      color: AppColors.ruby,
                      size: 32,
                    ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check_circle,
                      size: 24,
                      color: Colors.green,
                    ),
                  )

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
