import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_client/location_client.dart';
import 'package:search_repository/search_repository.dart';
import 'package:snap_path/search/search.dart';
import 'package:snap_path/search/widgets/search_bar.dart';
import 'package:snap_path/search/widgets/search_result_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage();

  static Route<SearchResult> route() => MaterialPageRoute(
        builder: (context) => const SearchPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        searchRepository: context.read<SearchRepository>(),
        locationClient: context.read<LocationClient>(),
      ),
      child: SearchPageView(),
    );
  }
}

class SearchPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              primary: true,
              pinned: true,
              stretch: false,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).backgroundColor,
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
              title: const SearchBar(),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) => SliverFixedExtentList(
                itemExtent: 72,
                delegate: SliverChildBuilderDelegate(
                  (_, index) => SearchResultCard(state.searchResults[index]),
                  childCount: state.searchResults.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
