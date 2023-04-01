import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salamapp/qibla%20location/loading_indicator.dart';
import 'package:salamapp/qibla%20location/locationerror.dart';

// ignore: use_key_in_widget_constructors
class QiblahMaps extends StatefulWidget {
  // ignore: prefer_const_declarations
  static final meccaLatLong = const LatLng(21.422487, 39.826206);
  final meccaMarker = Marker(
    markerId: const MarkerId("mecca"),
    position: meccaLatLong,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    draggable: false,
  );

  @override
  // ignore: library_private_types_in_public_api
  _QiblahMapsState createState() => _QiblahMapsState();
}

class _QiblahMapsState extends State<QiblahMaps> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng position = const LatLng(10.195384, 78.394964);

  Future<Position?>? _future;
  final _positionStream = StreamController<LatLng>.broadcast();

  @override
  void initState() {
    _future = _checkLocationStatus();
    super.initState();
  }

  @override
  void dispose() {
    _positionStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: FutureBuilder(
        future: _future,
        builder: (_, AsyncSnapshot<Position?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          }
          if (snapshot.hasError) {
            return LocationErrorWidget(
              error: snapshot.error.toString(),
            );
          }

          if (snapshot.data != null) {
            final loc =
                LatLng(snapshot.data!.latitude, snapshot.data!.longitude);
            position = loc;
          } else {
            _positionStream.sink.add(position);
          }

          return StreamBuilder(
            stream: _positionStream.stream,
            builder: (_, AsyncSnapshot<LatLng> snapshot) => GoogleMap(
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              compassEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: position,
                zoom: 11,
              ),
              // ignore: prefer_collection_literals
              markers: Set<Marker>.of(
                <Marker>[
                  widget.meccaMarker,
                  Marker(
                    draggable: true,
                    markerId: const MarkerId('Marker'),
                    position: position,
                    icon: BitmapDescriptor.defaultMarker,
                    onTap: _updateCamera,
                    onDragEnd: (LatLng value) {
                      position = value;
                      _positionStream.sink.add(value);
                    },
                    zIndex: 5,
                  ),
                ],
              ),
              // ignore: prefer_collection_literals
              circles: Set<Circle>.of([
                Circle(
                  circleId: const CircleId("Circle"),
                  radius: 10,
                  center: position,
                  fillColor: Theme.of(context).primaryColorLight.withAlpha(100),
                  strokeWidth: 1,
                  strokeColor:
                      Theme.of(context).primaryColorDark.withAlpha(100),
                  zIndex: 3,
                )
              ]),
              // ignore: prefer_collection_literals
              polylines: Set<Polyline>.of([
                Polyline(
                  polylineId: const PolylineId("Line"),
                  points: [position, QiblahMaps.meccaLatLong],
                  color: Theme.of(context).primaryColor,
                  width: 5,
                  zIndex: 4,
                )
              ]),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          );
        },
      ),
    );
  }

  Future<Position?> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled) {
      return await Geolocator.getCurrentPosition();
    }
    return null;
  }

  void _updateCamera() async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(position, 20));
  }
}
