import 'package:dynamic_link_initial_route_client/dynamic_link_initial_route_client.dart';
import 'package:elevation_repository/elevation_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_route_client/initial_route_client.dart';
import 'package:location_client/location_client.dart';
import 'package:mapbox_api_client/mapbox_api_client.dart';
import 'package:provider/provider.dart';
import 'package:route_repository/route_repository.dart';
import 'package:saved_route_repository/saved_route_repository.dart';
import 'package:search_repository/search_repository.dart';
import 'package:shared_file_initial_route_client/shared_file_initial_route_client.dart';
import 'package:snap_path/app/app.dart';
import 'package:snap_path/bottom_sheet/bottom_sheet.dart';
import 'package:snap_path/colors.dart';
import 'package:snap_path/map/map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialRouteClient = MultiInitialRouteClient(clients: [
    DynamicLinkInitialRouteClient(),
    SharedFileInitialRouteClient(),
  ]);
  await initialRouteClient.initialize();

  final apiClient = MapboxApiClient.production(mapboxKey);

  final appPreferences = AppPreferences();
  await appPreferences.initialize();

  runApp(MapApp(
    initialRouteClient: initialRouteClient,
    apiClient: apiClient,
    appPreferences: appPreferences,
  ));
}

class ResourceProviders extends StatelessWidget {
  ResourceProviders({
    required MapboxApiClient apiClient,
    required AppPreferences appPreferences,
    required InitialRouteClient initialRouteClient,
    required this.child,
  })  : _apiClient = apiClient,
        _appPreferences = appPreferences,
        _initialRouteClient = initialRouteClient;

  final MapboxApiClient _apiClient;
  final AppPreferences _appPreferences;
  final InitialRouteClient _initialRouteClient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider.value(value: _initialRouteClient),
        ChangeNotifierProvider.value(value: _appPreferences),
        RepositoryProvider(
          create: (context) => SearchRepository(apiClient: _apiClient),
        ),
        RepositoryProvider(
          create: (context) => RouteRepository(apiClient: _apiClient),
        ),
        RepositoryProvider(
          create: (context) => ElevationRepository(apiClient: _apiClient),
        ),
        RepositoryProvider(
          create: (context) => SavedRouteRepository(),
        ),
        RepositoryProvider(
          create: (context) => LocationClient(),
        ),
      ],
      child: child,
    );
  }
}

class MapApp extends StatelessWidget {
  MapApp({
    required MapboxApiClient apiClient,
    required AppPreferences appPreferences,
    required InitialRouteClient initialRouteClient,
  })  : _apiClient = apiClient,
        _appPreferences = appPreferences,
        _initialRouteClient = initialRouteClient;

  final MapboxApiClient _apiClient;
  final AppPreferences _appPreferences;
  final InitialRouteClient _initialRouteClient;

  @override
  Widget build(BuildContext context) {
    return ResourceProviders(
      apiClient: _apiClient,
      appPreferences: _appPreferences,
      initialRouteClient: _initialRouteClient,
      child: Selector<AppPreferences, ThemeMode>(
        selector: (contex, preferences) => preferences.themeMode.value,
        builder: (context, themeMode, child) {
          return BlocProvider(
            create: (context) => DrawRouteBloc(
              elevationRepository: context.read<ElevationRepository>(),
              routeRepository: context.read<RouteRepository>(),
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Snap Path',
              themeMode: themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.purple,
                backgroundColor: LightAppColors.background,
                primaryColor: LightAppColors.primary,
                accentColor: LightAppColors.foreground,
                disabledColor: LightAppColors.foreground2,
                scaffoldBackgroundColor: LightAppColors.background,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                appBarTheme: const AppBarTheme(brightness: Brightness.light),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.purple,
                backgroundColor: DarkAppColors.background,
                primaryColor: DarkAppColors.primary,
                accentColor: DarkAppColors.foreground,
                disabledColor: DarkAppColors.foreground2,
                scaffoldBackgroundColor: DarkAppColors.background,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                appBarTheme: const AppBarTheme(brightness: Brightness.dark),
              ),
              home: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => MapBloc(
                      locationClient: context.read<LocationClient>(),
                    )..add(const MapEvent.started()),
                  ),
                ],
                child: MapPage(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();

    _mapController = LeafletMapController();

    // Show the intro dialog the first time someone opens the app
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
      if (context.read<AppPreferences>().showIntro.value) {
        await showDialog(context: context, builder: (_) => IntroDialog());
        context.read<AppPreferences>().showIntro.update(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: Scaffold(
        // The keyboard should never actually launch here,
        // this makes the hero transition smoother though
        resizeToAvoidBottomInset: false,
        backgroundColor: LightAppColors.background,
        body: MapPageView(mapController: _mapController),
        bottomSheet: MapBottomSheet(
          mediaQuery: MediaQuery.of(context),
          moveMapToShow: (bounds, padding) => _mapController.showBounds(
            bounds,
            padding: padding,
          ),
        ),
      ),
    );
  }
}
