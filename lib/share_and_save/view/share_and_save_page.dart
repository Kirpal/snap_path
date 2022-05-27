import 'package:flutter/material.dart' hide Route;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:route/route.dart';
import 'package:saved_route_repository/saved_route_repository.dart';
import 'package:snap_path/app/app.dart';
import 'package:snap_path/map/map.dart';
import 'package:snap_path/share_and_save/share_and_save.dart';
import 'package:snap_path/snap_path_ui/snap_path_ui.dart';
import 'package:snap_path/utils/share_utils.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class ShareAndSavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShareAndSaveBloc(
        savedRouteRepository: context.read<SavedRouteRepository>(),
      )..add(const ShareAndSaveEvent.started()),
      child: ShareAndSavePageView(),
    );
  }
}

class ShareAndSavePageView extends StatelessWidget {
  ShareAndSavePageView() : _animatedListKey = GlobalKey();

  final GlobalKey<SliverAnimatedListState> _animatedListKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            primary: true,
            pinned: true,
            stretch: false,
            backgroundColor: Theme.of(context).backgroundColor,
            actions: <Widget>[
              IconButton(
                icon: const Icon(FeatherIcons.settings),
                color: Theme.of(context).accentColor.withOpacity(0.4),
                onPressed: () {
                  showDialog(
                      context: context, builder: (context) => SettingsDialog());
                },
              ),
            ],
            leading: IconButton(
              icon: const Icon(FeatherIcons.arrowLeft),
              color: Theme.of(context).accentColor,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          _CurrentRouteSection(
            onRouteSaved: (route) {
              _animatedListKey.currentState?.insertItem(0);
              context
                  .read<ShareAndSaveBloc>()
                  .add(ShareAndSaveEvent.routeSaved(route));
            },
          ),
          const SliverToBoxAdapter(
            child: Text(
              'Saved Routes',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              sliver: _SavedRouteBody(animatedListKey: _animatedListKey),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrentRouteSection extends StatelessWidget {
  _CurrentRouteSection({required this.onRouteSaved});

  final ValueChanged<Route> onRouteSaved;

  @override
  Widget build(BuildContext context) {
    final route = context.select((DrawRouteBloc b) => b.state.route);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 48),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: 1.2,
                child: ColoredBox(
                  color: Theme.of(context).disabledColor,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth *
                          MediaQuery.of(context).devicePixelRatio;
                      return Image.network(route.getPreviewUrl(
                          width.round(), (width / 1.2).round()));
                    },
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder<String>(
            future: ShareUtils.generateShareLink(route),
            builder: (context, snapshot) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 20,
                    child: CopyField(
                      text: snapshot.data,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    iconSize: 20,
                    color: Theme.of(context).primaryColor,
                    icon: const Icon(
                      FeatherIcons.share2,
                    ),
                    onPressed: snapshot.hasData
                        ? () {
                            WcFlutterShare.share(
                                sharePopupTitle: 'Share Link',
                                text: snapshot.data,
                                mimeType: 'text/plain');
                          }
                        : null,
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                textStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
              child: const Text('Export GPX'),
              onPressed: () => ShareUtils.shareGpx(
                context.read<DrawRouteBloc>().state.route.coordinates,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                primary: Theme.of(context).backgroundColor,
              ),
              child: const Text('Save Route'),
              onPressed: () => onRouteSaved(route),
            ),
          ),
        ]),
      ),
    );
  }
}

class _SavedRouteBody extends StatelessWidget {
  _SavedRouteBody({required this.animatedListKey});

  final GlobalKey<SliverAnimatedListState> animatedListKey;

  @override
  Widget build(BuildContext context) {
    final state = context.select((ShareAndSaveBloc b) => b.state);
    return state.when(
      loading: () => const _SavedRouteLoading(),
      loaded: (savedRoutes) {
        if (savedRoutes.isNotEmpty) {
          return _SavedRouteGrid(
            animatedListKey: animatedListKey,
            savedRoutes: savedRoutes,
          );
        } else {
          return const _EmptySavedRouteBody();
        }
      },
    );
  }
}

class _SavedRouteLoading extends StatelessWidget {
  const _SavedRouteLoading();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(),
    );
  }
}

class _SavedRouteGrid extends StatelessWidget {
  _SavedRouteGrid({
    required this.savedRoutes,
    required this.animatedListKey,
  });

  final List<Route> savedRoutes;
  final GlobalKey<SliverAnimatedListState> animatedListKey;

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: animatedListKey,
      initialItemCount: savedRoutes.length,
      itemBuilder: (context, index, animation) => SavedRouteCard(
        index: index,
        route: savedRoutes[index],
        onRouteDeleted: () {
          animatedListKey.currentState?.removeItem(
              index, (context, animation) => SizedBox(),
              duration: Duration(seconds: 1));
          context
              .read<ShareAndSaveBloc>()
              .add(ShareAndSaveEvent.routeDeleted(savedRoutes[index]));
        },
      ),
    );
  }
}

class _EmptySavedRouteBody extends StatelessWidget {
  const _EmptySavedRouteBody();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Opacity(
            opacity: 0.8,
            child: AspectRatio(
              aspectRatio: 1,
              child:
                  SvgPicture.asset('assets/illustrations/map_illustration.svg'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            'No routes found',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor.withOpacity(0.6),
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
