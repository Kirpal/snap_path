import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snap_path/app/app.dart';

typedef PreferenceInitializer = Future<SharedPreferences> Function();

class AppPreferences extends ChangeNotifier {
  AppPreferences({PreferenceInitializer? initialize})
      : _initialize = initialize ?? SharedPreferences.getInstance;

  final PreferenceInitializer _initialize;

  SetPreference<T> setWith<T>(SetPreference<T> setPreference) => (key, value) {
        setPreference(key, value);
        notifyListeners();
      };

  /// Read the preferences and initialize fields
  ///
  /// You must call this before accessing any preferences
  Future<void> initialize() async {
    final preferences = await _initialize();

    canGetLocation = Preference(
      name: 'canGetLocation',
      defaultValue: false,
      getPreference: preferences.getBool,
      setPreference: setWith(preferences.setBool),
    );
    controlsVisible = Preference(
      name: 'controlsVisible',
      defaultValue: true,
      getPreference: preferences.getBool,
      setPreference: setWith(preferences.setBool),
    );
    initialized = Preference(
      name: 'initialized',
      defaultValue: false,
      getPreference: preferences.getBool,
      setPreference: setWith(preferences.setBool),
    );
    showIntro = Preference(
      name: 'showIntro',
      defaultValue: true,
      getPreference: preferences.getBool,
      setPreference: setWith(preferences.setBool),
    );
    isMetric = Preference(
      name: 'isMetric',
      defaultValue: false,
      getPreference: preferences.getBool,
      setPreference: setWith(preferences.setBool),
    );
    metersPerSecond = Preference(
      defaultValue: 3.3528,
      name: 'metersPerSecond',
      setPreference: setWith(preferences.setDouble),
      getPreference: preferences.getDouble,
    );
    themeMode = Preference(
      defaultValue: ThemeMode.system,
      name: 'themeMode',
      getPreference: (key) {
        final index = preferences.getInt(key);
        if (index != null) return ThemeMode.values[index];
        return null;
      },
      setPreference: setWith(
        (key, value) => preferences.setInt(
          key,
          value.index,
        ),
      ),
    );
  }

  late final Preference<bool> canGetLocation;
  late final Preference<bool> controlsVisible;
  late final Preference<bool> initialized;
  late final Preference<bool> showIntro;
  late final Preference<bool> isMetric;
  late final Preference<double> metersPerSecond;
  late final Preference<ThemeMode> themeMode;
}
