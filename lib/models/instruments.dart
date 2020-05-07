class Instrument {
  String iconPath;
  String instrumentName;
  int index;

  Instrument( {
    this.iconPath,
    this.instrumentName,
    this.index,
  }) : assert (iconPath != null),
    assert(instrumentName != null);
}