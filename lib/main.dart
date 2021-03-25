import 'package:flutter/material.dart';
import 'package:flutter_11_weather_app/data_service.dart';
import 'package:flutter_11_weather_app/model.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _textFieldController = TextEditingController();

  final _dataService =  DataService();
  WeatherResponse _response;

  var cTemp;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              if(_response!=null)
               Column(
                 children: [
                   Image.network(_response.iconUrl),
                   Text('${cTemp}'+'°C',style: TextStyle(fontSize: 40,color: Colors.indigo,fontWeight: FontWeight.bold),),
                   Text(_response.weatherInfo.description)
                 ],
               ),
              SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(top:50.0),
                  child: TextField(
                    controller: _textFieldController,

                    decoration: InputDecoration(
                      labelText: "Enter City"
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: _searchWeather, child: Text("Search")),
            ],

          ),
        ),
      ),
    );
  }

   void _searchWeather() async
   {
        final response = await _dataService.getWeather(_textFieldController.text);
        double temp = response.temperatureInfo.temperature;

        setState(() {
          _response = response;
          cTemp = ((temp-32)*0.55).ceil();
        });
        print(cTemp);
   }
}
