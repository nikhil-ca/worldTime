import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setUpTime() async{

    WorldTime now = WorldTime(location: 'Berlin', flag: 'Germany.png', url: 'Europe/Berlin');
    await now.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location': now.location,
      'flag': now.flag,
      'time': now.time,
      'isDayTime': now.isDayTime,
    });

  }

  @override
  void initState()  {
    super.initState();
    setUpTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[300],
      body: Center(
         child: SpinKitPouringHourGlass(
            color: Colors.deepPurpleAccent,
            size: 50.0,
          ),
      )
    );
  }
}
