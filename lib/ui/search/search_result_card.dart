import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/search_page_state.dart';
import 'package:snap_path/models/search_result.dart';

class SearchResultCard extends StatelessWidget {
  SearchResultCard(this.result);

  final SearchResult result;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AppState>().selectResult(result);
        context.read<SearchPageState>().selectResult(result);
        Navigator.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(
                  color: Theme.of(context).disabledColor.withOpacity(0.5))),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).disabledColor),
              ),
              margin: const EdgeInsets.only(right: 8),
              child: const Icon(FeatherIcons.mapPin),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(result.title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                  AutoSizeText(
                    result.subtitle,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
