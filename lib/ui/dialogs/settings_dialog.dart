import 'package:distance/distance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/ui/widgets/radio_item.dart';
import 'package:intl/intl.dart';
import 'package:snap_path/ui/dialogs/rounded_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsDialog extends StatelessWidget {
  /// Format a given pace in m/s as "mm:ss per mi or km"
  static String _formatPace(double metersPerSecond, bool metric) {
    double metersPerUnit;
    if (metric) {
      metersPerUnit = const Distance(kilometers: 1).inMeters;
    } else {
      metersPerUnit = const Distance(miles: 1).inMeters;
    }

    final pace = Duration(seconds: (metersPerUnit / metersPerSecond).round());
    final minutes = pace.inMinutes;
    final seconds =
        NumberFormat('00', 'enUS').format(pace.inSeconds - (minutes * 60));

    return '$minutes:$seconds';
  }

  /// Given a pace as "mm:ss per mi or km", calculate the m/s
  static double _parsePace(String pace, bool metric) {
    double metersPerUnit;
    if (metric) {
      metersPerUnit = const Distance(kilometers: 1).inMeters;
    } else {
      metersPerUnit = const Distance(miles: 1).inMeters;
    }

    final minutes = int.tryParse(pace.split(':')[0]);
    final seconds = int.tryParse(pace.split(':')[1]);

    return metersPerUnit / ((minutes * 60) + seconds);
  }

  @override
  Widget build(BuildContext context) {
    return RoundedDialog(
      title: 'Settings',
      items: [
        Selector<AppState, ThemeMode>(
            selector: (context, state) => state.themeMode,
            builder: (context, themeMode, child) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    FeatherIcons.sun,
                    color: Theme.of(context).primaryColor,
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Theme:',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Flexible(
                          child: RadioItem(
                            onSelected: () => context
                                .read<AppState>()
                                .updatePreference(
                                    'themeMode', ThemeMode.system.index),
                            text: 'Auto',
                            selected: themeMode == ThemeMode.system,
                          ),
                        ),
                        Flexible(
                          child: RadioItem(
                            onSelected: () => context
                                .read<AppState>()
                                .updatePreference(
                                    'themeMode', ThemeMode.light.index),
                            text: 'Light',
                            selected: themeMode == ThemeMode.light,
                          ),
                        ),
                        Flexible(
                          child: RadioItem(
                            onSelected: () => context
                                .read<AppState>()
                                .updatePreference(
                                    'themeMode', ThemeMode.dark.index),
                            text: 'Dark',
                            selected: themeMode == ThemeMode.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
        Selector<AppState, bool>(
            selector: (context, state) => state.isMetric,
            builder: (context, metric, child) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    FeatherIcons.globe,
                    color: Theme.of(context).primaryColor,
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Distance Units:',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Flexible(
                          child: RadioItem(
                            onSelected: () => context
                                .read<AppState>()
                                .updatePreference('isMetric', true),
                            text: 'km',
                            selected: metric,
                          ),
                        ),
                        Flexible(
                          child: RadioItem(
                            onSelected: () => context
                                .read<AppState>()
                                .updatePreference('isMetric', false),
                            text: 'mi',
                            selected: !metric,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
        Selector<AppState, bool>(
            selector: (context, state) => state.isMetric,
            builder: (context, metric, child) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    FeatherIcons.watch,
                    color: Theme.of(context).primaryColor,
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Your pace:',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                            width: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: TextEditingController(
                                  text: _formatPace(
                                      context.select<AppState, double>(
                                          (state) => state.metersPerSecond),
                                      metric)),
                              keyboardType: TextInputType.datetime,
                              onChanged: (value) {
                                if (RegExp(r'^[0-9]+:[0-9]{2}$')
                                    .hasMatch(value)) {
                                  final metersPerSecond =
                                      _parsePace(value, metric);

                                  context.read<AppState>().updatePreference(
                                      'metersPerSecond', metersPerSecond);
                                }
                              },
                            )),
                        Text('min / ${metric ? 'km' : 'mi'}')
                      ],
                    ),
                  ),
                ],
              );
            }),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: const Text('Feedback'),
                onPressed: () => launch('mailto:demian@kirp.al'),
              ),
              FlatButton(
                child: const Text('Licenses'),
                onPressed: () =>
                    Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (context) => const LicensePage(
                    applicationName: 'Snap Path',
                    applicationLegalese: 'Copyright (c) 2020, Kirpal Demian',
                  ),
                )),
              ),
            ],
          ),
        ),
      ],
      action: 'Done',
    );
  }
}
