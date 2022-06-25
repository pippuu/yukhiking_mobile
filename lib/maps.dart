// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapSample extends StatefulWidget {
//   const MapSample({Key? key}) : super(key: key);

//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller = Completer();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(-6.974461, 107.63005),
//     zoom: 14.4746,
//   );

//   static const Marker _kTelkomMarker = Marker(
//     markerId: MarkerId('_kTelkom'),
//     infoWindow: InfoWindow(title: 'Telkom University'),
//     icon: BitmapDescriptor.defaultMarker,
//     position: LatLng(-6.974461, 107.63005),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text('Maps Test'),
//         )
//       ),
//       body: GoogleMap(
//         mapType: MapType.normal,
//         markers: {
//           _kTelkomMarker,
//         },
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//     );
//   }
// }
