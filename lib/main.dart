import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/ui/bottom_sheet/bottom_sheet.dart';
import 'package:snap_path/colors.dart';
import 'package:snap_path/models/initial_route.dart';
import 'package:snap_path/ui/map/map_wrapper.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/repositories/map_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MapApp());
}

class MapApp extends StatelessWidget {
  static final _apiKey = const String.fromEnvironment('MAPBOX_KEY');
  final AppState _appState;
  final PathDrawingState _pathDrawingState;
  
  MapApp() :
  _appState = AppState(
    location: Location(),
    mapController: MapController(),
    mapKey: _apiKey,
  ),
  _pathDrawingState = PathDrawingState(
    mapRepository: MapboxRepository(
      apiKey: _apiKey,
    ),
  ) {
    InitialRoute.initialize(_pathDrawingState, _appState);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PathDrawingState>.value(value: _pathDrawingState),
        ChangeNotifierProvider<AppState>.value(value: _appState),
      ],
      child: Selector<AppState, ThemeMode>(
        selector: (contex, state) => state.themeMode,
        builder: (context, themeMode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Snap Path',
            themeMode: themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              canvasColor: Colors.transparent,
              primarySwatch: Colors.purple,
              backgroundColor: LightAppColors.background,
              primaryColor: LightAppColors.primary,
              accentColor: LightAppColors.foreground,
              disabledColor: LightAppColors.foreground2,
              scaffoldBackgroundColor: LightAppColors.background,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              canvasColor: Colors.transparent,
              primarySwatch: Colors.purple,
              backgroundColor: DarkAppColors.background,
              primaryColor: DarkAppColors.primary,
              accentColor: DarkAppColors.foreground,
              disabledColor: DarkAppColors.foreground2,
              scaffoldBackgroundColor: DarkAppColors.background,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MapPage(),
          );
        }
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.background,
      body: Selector<AppState, bool>(
        selector: (context, state) => state.initialized,
        builder: (context, initialized, child) => initialized ? MapWrapper() : Container(),
      ),
      bottomSheet: MapBottomSheet(mediaQuery: MediaQuery.of(context)),
    );
  }
}
