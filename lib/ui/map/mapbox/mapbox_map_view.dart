// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:latlong/latlong.dart' as latlong;
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:snap_path/models/map_view_state.dart';
// import 'package:provider/provider.dart';
// import 'package:snap_path/models/path_drawing.dart';

// class MapboxMapView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double pixelRatio = MediaQuery.of(context).devicePixelRatio;
//     return MapboxMap(
//       onMapCreated: (controller) => context.read<AppState>().updateController(controller),
//       myLocationEnabled: context.select<AppState, bool>((state) => state.canGetLocation),
//       myLocationTrackingMode: MyLocationTrackingMode.Tracking,
//       myLocationRenderMode: MyLocationRenderMode.NORMAL,
//       initialCameraPosition: CameraPosition(
//         target: LatLng(42.349761, -71.078618), // context.select<AppState, LatLng>((state) => state.userLocation)??
//         zoom: 14
//       ),
//       attributionButtonMargins: Point<double>(10, 150) * pixelRatio,
//       logoViewMargins: Point<double>(10, 150) * pixelRatio,
//       compassViewMargins: Point<double>(10, MediaQuery.of(context).padding.top + 10) * pixelRatio,
//       styleString: 'mapbox://styles/kjdemian/ckah637x600q21imtjexsuvdt',
//       onMapClick: (point, coords) {
//         context.read<PathDrawingState>().addPoint(latlong.LatLng(coords.latitude, coords.longitude));
//         context.read<AppState>().moveTo(coords);
//       },
//     );
//     // FlutterMap(
//     //   layers: [
//     //     TileLayerOptions(
//     //       urlTemplate: "https://api.mapbox.com/styles/v1/{username}/{id}/"
//     //           "tiles/256/{z}/{x}/{y}?access_token={accessToken}",
//     //       additionalOptions: {
//     //         'accessToken': 'pk.eyJ1Ijoia2pkZW1pYW4iLCJhIjoiY2p2OGYzcHJzMDl1ODQxcW4wdnJvYXkwdyJ9.cT-HrPEB5NhR0tGzndrJng',
//     //         'username': 'kjdemian',
//     //         'id': 'ckah637x600q21imtjexsuvdt',
//     //       },
//     //     ),
//     //     DrawLineLayerOptions(),
//     //     MarkerLayerOptions(
//     //       markers: [
//     //         ...context.select<PathDrawingState, List<LatLng>>((pathDrawing) => pathDrawing.distanceMarkers(false))
//     //           .asMap().entries.skip(1)
//     //           .map((entry) => DistanceMarker(distance: entry.key, point: entry.value)),
//     //         if (context.select<AppState, LatLng>((state) => state.userLocation) != null)
//     //           Marker(
//     //             width: 20,
//     //             height: 20,
//     //             point: context.select<AppState, LatLng>((state) => state.userLocation),
//     //             builder: (ctx) => Container(
//     //               decoration: BoxDecoration(
//     //                 color: Colors.blue,
//     //                 borderRadius: BorderRadius.circular(10),
//     //                 border: Border.all(width: 3, color: Colors.white),
//     //                 boxShadow: [
//     //                   BoxShadow(blurRadius: 5, color: Colors.blue.withOpacity(0.6))
//     //                 ]
//     //               ),
//     //             )
//     //           ),
//     //         if (context.select<PathDrawingState, LatLng>((state) => state.highlightedPoint) != null)
//     //           Marker(
//     //             width: 15,
//     //             height: 15,
//     //             point: context.select<PathDrawingState, LatLng>((state) => state.highlightedPoint),
//     //             builder: (ctx) => Container(
//     //               decoration: BoxDecoration(
//     //                 color: AppColors.background,
//     //                 borderRadius: BorderRadius.circular(10),
//     //                 border: Border.all(width: 3, color: AppColors.primary),
//     //               ),
//     //             )
//     //           ),
//     //       ],
//     //     ),
//     //     DrawHandleLayerOptions(),
//     //   ]
//     // );
//   }
// }