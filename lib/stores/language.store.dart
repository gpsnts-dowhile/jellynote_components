import 'package:mobx/mobx.dart';

part 'language.store.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  @observable
  String currentLanguage = 'pt';

  @action
  void setLanguage(String language) {
    currentLanguage = language;
  }

  String get getLanguage => currentLanguage;
}