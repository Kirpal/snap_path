import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:snap_path/models/search_result.dart';

class SearchResultMarker extends Marker {
  final SearchResult searchResult;

  SearchResultMarker(this.searchResult, void Function() onClose)
      : super(
            width: 180,
            height: 122,
            anchorPos: AnchorPos.align(AnchorAlign.top),
            point: searchResult?.center ?? LatLng(0, 0),
            builder: (ctx) {
              if (searchResult == null) {
                return Container();
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    child: Container(
                        height: 74,
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: AutoSizeText(searchResult.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: Colors.black)),
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
                                      customBorder: CircleBorder(),
                                      onTap: onClose,
                                      child: Icon(
                                        FeatherIcons.x,
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AutoSizeText(
                              searchResult.subtitle,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              maxFontSize: 12,
                              minFontSize: 5,
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        )),
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
                          )),
                      Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.deepPurple[700],
                      ),
                    ],
                  ),
                ],
              );
            });
}
