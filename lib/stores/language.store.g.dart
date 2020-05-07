// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LanguageStore on _LanguageStore, Store {
  Computed<String> _$getLanguageComputed;

  @override
  String get getLanguage =>
      (_$getLanguageComputed ??= Computed<String>(() => super.getLanguage))
          .value;

  final _$currentLanguageAtom = Atom(name: '_LanguageStore.currentLanguage');

  @override
  String get currentLanguage {
    _$currentLanguageAtom.context.enforceReadPolicy(_$currentLanguageAtom);
    _$currentLanguageAtom.reportObserved();
    return super.currentLanguage;
  }

  @override
  set currentLanguage(String value) {
    _$currentLanguageAtom.context.conditionallyRunInAction(() {
      super.currentLanguage = value;
      _$currentLanguageAtom.reportChanged();
    }, _$currentLanguageAtom, name: '${_$currentLanguageAtom.name}_set');
  }

  final _$_LanguageStoreActionController =
      ActionController(name: '_LanguageStore');

  @override
  void setLanguage(String language) {
    final _$actionInfo = _$_LanguageStoreActionController.startAction();
    try {
      return super.setLanguage(language);
    } finally {
      _$_LanguageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentLanguage: ${currentLanguage.toString()},getLanguage: ${getLanguage.toString()}';
    return '{$string}';
  }
}
