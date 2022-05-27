import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/map/map.dart';
import 'package:snap_path/search/search.dart';

class SearchBar extends StatefulWidget {
  const SearchBar();

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late FocusNode _focusNode;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listenWhen: (a, b) => a.searchBarEmpty != b.searchBarEmpty,
      listener: (context, state) {
        if (state.searchBarEmpty) {
          _textEditingController.clear();
        }
      },
      child: GestureDetector(
        onTap: _focusNode.requestFocus,
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
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) => Opacity(
                    opacity: state.searchBarEmpty ? 1 : 0,
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
              ),
              Positioned(
                left: 40,
                right: 40,
                child: TextField(
                  autofocus: true,
                  controller: _textEditingController,
                  focusNode: _focusNode,
                  onEditingComplete: () => FocusScope.of(context).unfocus(),
                  onChanged: (value) => context
                      .read<SearchBloc>()
                      .add(SearchEvent.searchBarChanged(value: value)),
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.search,
                  decoration: null,
                ),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) => !state.searchBarEmpty
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          shape: const CircleBorder(),
                          color: Theme.of(context).backgroundColor,
                          child: IconButton(
                            constraints: const BoxConstraints(
                                maxHeight: 40, maxWidth: 40),
                            icon: const Icon(FeatherIcons.x),
                            color: Theme.of(context).accentColor,
                            iconSize: 20,
                            onPressed: () => context
                                .read<SearchBloc>()
                                .add(const SearchEvent.cleared()),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
