typedef GetPreference<T> = T? Function(String key);
typedef SetPreference<T> = void Function(String key, T value);

class Preference<T> {
  Preference({
    required String name,
    required T defaultValue,
    required GetPreference<T> getPreference,
    required SetPreference<T> setPreference,
  })   : _defaultValue = defaultValue,
        _name = name,
        _getPreference = getPreference,
        _setPreference = setPreference;

  final T _defaultValue;
  final String _name;
  final GetPreference<T> _getPreference;
  final SetPreference<T> _setPreference;

  T get value => _getPreference(_name) ?? _defaultValue;
  void update(T newValue) => _setPreference(_name, newValue);
}
