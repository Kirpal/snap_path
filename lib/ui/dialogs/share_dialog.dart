import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/utils.dart';
import 'package:snap_path/ui/widgets/copy_field.dart';
import 'package:snap_path/ui/dialogs/rounded_dialog.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class ShareDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedDialog(
      title: 'Share',
      items: [
        Selector<PathDrawingState, List<LatLng>>(
          selector: (context, state) => state.coordinates,
          builder: (context, coordinates, child) => FutureBuilder<String>(
            future: generateShareLink(coordinates),
            builder: (context, snapshot) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 20,
                    child: CopyField(text: snapshot.data,)
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    iconSize: 20,
                    color: Theme.of(context).primaryColor,
                    icon: Icon(FeatherIcons.share2,),
                    onPressed: snapshot.hasData ? () {
                      WcFlutterShare.share(sharePopupTitle: 'Share Link', text: snapshot.data, mimeType: 'text/plain');
                    } : null,
                  ),
                ],
              );
            }
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: OutlineButton(
            color: Theme.of(context).primaryColor,
            highlightedBorderColor: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryColor,
            child: Text('Export GPX'),
            onPressed: () => shareGpx(context.read<PathDrawingState>().elevation.unfiltered),
          ),
        ),
      ],
      action: 'Close',
    );
  }
}
