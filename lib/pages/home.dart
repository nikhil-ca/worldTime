import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'day.png':'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[800] as Color;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton.icon(
                  onPressed: () async{
                    dynamic result  = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = result;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location_outlined,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                  label: Text(
                    'Change Location',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                  ) ,
                  )
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['location'],
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  ),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/${data['flag']}'),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Text(
                data['time'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )

            ],
          )),
        ),
      ),

    );
  }
}
