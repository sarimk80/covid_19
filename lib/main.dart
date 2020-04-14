import 'package:covid_19/bloc/bloc.dart';
import 'package:covid_19/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoder/geocoder.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StatisticsBloc statisticsBloc;
  MapboxMapController _mapController;

  void _onMapCreated(MapboxMapController controller) {
    _mapController = controller;
  }

  @override
  void initState() {
    statisticsBloc = StatisticsBloc();
    statisticsBloc.add(Fetch());
    super.initState();
  }

  @override
  void dispose() {
    statisticsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: statisticsBloc,
        builder: (context, state) {
          if (state is LoadingStatisticsState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedStatisticsState) {
            _mapController.addCircle(CircleOptions());
            return MapboxMap(
              onMapCreated: _onMapCreated,
              styleString: Global.styleUrl,
              initialCameraPosition:
                  CameraPosition(target: LatLng(32.0, 67.0), zoom: 2),
            );
          }
          if (state is ErrorStatisticsState) {
            return Center(
              child: Text("Error " + state.error),
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<LatLng> countryToLatLon(String country) async {
    var coordinates = await Geocoder.local.findAddressesFromQuery(country);
    var first = coordinates.first;

    return LatLng(first.coordinates.latitude, first.coordinates.longitude);
  }
}
