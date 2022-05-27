import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:search_repository/search_repository.dart';
import 'package:snap_path/map/leaflet/leaflet.dart';

class SearchResultMarker extends OptionalMarker {
  SearchResultMarker({
    required SearchResult? searchResult,
    required VoidCallback onClose,
  }) : super(
          width: 200,
          height: 100,
          anchorPos: AnchorPos.align(AnchorAlign.top),
          point: searchResult?.center,
          builder: (ctx) {
            return SearchResultMarkerWidget(
              searchResult: searchResult!,
              onClose: onClose,
            );
          },
        );
}

class SearchResultMarkerWidget extends StatelessWidget {
  const SearchResultMarkerWidget({
    Key? key,
    required this.searchResult,
    required this.onClose,
  }) : super(key: key);

  final SearchResult searchResult;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, 10),
                color: Colors.black.withOpacity(0.1),
              )
            ],
          ),
          height: 52,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: AutoSizeText(
                        searchResult.title,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    AutoSizeText(
                      searchResult.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      maxFontSize: 10,
                      minFontSize: 5,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Ink(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12),
                ),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onClose,
                  child: const Icon(
                    FeatherIcons.x,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              top: 10,
              child: Container(
                color: Colors.white,
                width: 10,
                height: 10,
              ),
            ),
            Icon(
              Icons.location_on,
              size: 40,
              color: Colors.deepPurple[700],
            ),
          ],
        ),
      ],
    );
  }
}
