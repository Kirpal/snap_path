import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/models/search_page_state.dart';
import 'package:snap_path/models/search_result.dart';
import 'package:snap_path/ui/search/search_bar.dart';
import 'package:snap_path/ui/search/search_result_card.dart';

class SearchPage extends StatelessWidget {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: CustomScrollView(slivers: [
            SliverAppBar(
              primary: true,
              pinned: true,
              stretch: false,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).backgroundColor,
              actions: <Widget>[
                FlatButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
              title: SearchBar(focusNode: _focusNode),
            ),
            Selector<SearchPageState, List<SearchResult>>(
              selector: (context, state) => state.searchResults,
              builder: (context, searchResults, child) => SliverFixedExtentList(
                itemExtent: 72,
                delegate: SliverChildBuilderDelegate(
                  (context, index) => SearchResultCard(searchResults[index]),
                  childCount: searchResults.length,
                ),
              ),
            )
          ])),
    );
  }
}
