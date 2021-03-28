import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/search_page_state.dart';
import 'package:snap_path/ui/map/map_control_button.dart';

class SearchBar extends StatelessWidget {
  SearchBar({this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusNode.requestFocus,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Theme.of(context).disabledColor),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Hero(
              tag: 'SEARCH_ICON',
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).backgroundColor,
                ),
                child: MapControlButton(
                  icon: FeatherIcons.search,
                  enabled: true,
                  size: 40,
                ),
              ),
            ),
            Positioned(
              left: 41,
              child: Selector<SearchPageState, bool>(
                selector: (context, state) => state.searchBarEmpty,
                builder: (context, searchBarEmpty, child) => Opacity(
                  opacity: searchBarEmpty ? 1 : 0,
                  child: child,
                ),
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              right: 40,
              child: TextField(
                autofocus: true,
                controller:
                    context.select<SearchPageState, TextEditingController>(
                        (state) => state.controller),
                focusNode: focusNode,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
                onChanged: (value) {
                  final userLocation = context.read<AppState>().userLocation;
                  context
                      .read<SearchPageState>()
                      .searchBarOnChanged(value, userLocation.location);
                },
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.search,
                decoration: null,
              ),
            ),
            if (!context
                .select<SearchPageState, bool>((state) => state.searchBarEmpty))
              Align(
                alignment: Alignment.centerRight,
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  shape: const CircleBorder(),
                  color: Theme.of(context).backgroundColor,
                  child: IconButton(
                    constraints:
                        const BoxConstraints(maxHeight: 40, maxWidth: 40),
                    icon: const Icon(FeatherIcons.x),
                    color: Theme.of(context).accentColor,
                    iconSize: 20,
                    onPressed: () => context.read<SearchPageState>().clear(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
