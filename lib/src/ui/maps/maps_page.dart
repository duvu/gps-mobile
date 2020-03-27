import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
        options: new MapOptions(
          center: new LatLng(51.5, -0.09),
          zoom: 13.0
        ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': 'pk.eyJ1IjoiaG9haXZ1YmsiLCJhIjoiY2oya3YzbHFuMDAwMTJxazN6Y3k0Y2syNyJ9.4avYQphrtbrrniI_CT0XSA',
            'id': 'mapbox.streets',
          },
        ),
//        new MarkerLayerOptions(
//          markers: [
//            new Marker(
//              width: 80.0,
//              height: 80.0,
//              point: new LatLng(51.5, -0.09),
//              builder: (ctx) => new Container(
//                child: new FlutterLogo(),
//              )
//            )
//          ]
//        )
      ],
    );
  }

}