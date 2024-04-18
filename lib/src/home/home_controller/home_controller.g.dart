// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_HomeControllerBase.loading'))
      .value;

  late final _$fahrenheitTempAtom =
      Atom(name: '_HomeControllerBase.fahrenheitTemp', context: context);

  @override
  String get temperature {
    _$fahrenheitTempAtom.reportRead();
    return super.temperature;
  }

  @override
  set temperature(String value) {
    _$fahrenheitTempAtom.reportWrite(value, super.temperature, () {
      super.temperature = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_HomeControllerBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_HomeControllerBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$fetchCurrentLocationWeatherAsyncAction = AsyncAction(
      '_HomeControllerBase.fetchCurrentLocationWeather',
      context: context);

  @override
  Future<void> fetchCurrentLocationWeather() {
    return _$fetchCurrentLocationWeatherAsyncAction
        .run(() => super.fetchCurrentLocationWeather());
  }

  late final _$fetchWeatherAsyncAction =
      AsyncAction('_HomeControllerBase.fetchWeather', context: context);

  @override
  Future<void> fetchWeather(double latitude, double longitude) {
    return _$fetchWeatherAsyncAction
        .run(() => super.fetchWeather(latitude, longitude));
  }

  @override
  String toString() {
    return '''
fahrenheitTemp: ${temperature},
description: ${description},
error: ${error},
loading: ${loading}
    ''';
  }
}
