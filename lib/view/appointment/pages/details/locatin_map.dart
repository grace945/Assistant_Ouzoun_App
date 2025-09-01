import 'dart:async';
import 'dart:convert';
import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/class/custom_app_bar.dart';

class LocatinMap extends StatefulWidget {
  final double endLat;
  final double endLng;
  const LocatinMap({super.key, required this.endLat, required this.endLng});

  @override
  State<LocatinMap> createState() => _LocatinMapState();
}

class _LocatinMapState extends State<LocatinMap> {
  final MapController controller = MapController();
  LocationData? currentlocation;
  List<LatLng> routespiont = [];
  List<Marker> marker = [];
  late StreamSubscription<LocationData> _locationSubscription;
  final String apikey = '5b3ce3597851110001cf62489c949def393d41b1969ee9ef553bc24e';

  @override
  void initState() {
    super.initState(); //
    getcurrentlocation().then((_) {
      getroutes();
    });
  }

  Future<void> getcurrentlocation() async {
    final location = Location();
    try {
      final userlocation = await location.getLocation();
      setState(() {
        currentlocation = userlocation;
        marker.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(userlocation.latitude!, userlocation.longitude!),
            child: Icon(Icons.my_location, color:Colors.red, size: 30.0),
          ),
        );
      });
    } on Exception {
      currentlocation = null;
    }
    _locationSubscription = location.onLocationChanged.listen((
        LocationData newlocation,
        ) {
      if (!mounted) return;
      setState(() {
        currentlocation = newlocation;
      });
    });
  }

  Future<void> getroutes() async {
    if (currentlocation == null) return;
    final start = LatLng(
      currentlocation!.latitude!,
      currentlocation!.longitude!,
    );
    final response = await http.get(
      Uri.parse(
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apikey&start=${start.longitude},${start.latitude}&end=${widget.endLng},${widget.endLat}',
      ),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coors =
      data['features'][0]['geometry']['coordinates'];
      setState(() {
        routespiont = coors.map((coord) => LatLng(coord[1], coord[0])).toList();
        marker.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(widget.endLat, widget.endLng),
            child: Icon(Icons.location_on_sharp, color: greenlight, size: 30.0),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(subtitle: "location helper", title: "Map"),
      body: currentlocation == null
          ? Center(child: CircularProgressIndicator())
          : SizedBox.expand(
        child: FlutterMap(
          mapController: controller,
          options: MapOptions(
            initialCenter: LatLng(
              currentlocation!.latitude!,
              currentlocation!.longitude!,
            ),
            initialZoom: 15.0,
          ),
          children: [
            TileLayer(
              urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.assistantapp',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayer(markers: marker),
            if (routespiont
                .isNotEmpty)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: routespiont,
                    strokeWidth: 3.0,
                    color: green,
                  ),
                ],
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentlocation != null) {
            controller.move(
              LatLng(currentlocation!.latitude!, currentlocation!.longitude!),
              15,
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _locationSubscription.cancel();
    super.dispose();
  }
}
