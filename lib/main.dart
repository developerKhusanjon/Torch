import 'package:flutter/material.dart';
import 'package:torch_compat/torch_compat.dart';

void main() => runApp(MaterialApp(
  title: "Torch",
  theme: ThemeData(
    primarySwatch: Colors.grey,
  ),
  home: Torch(),
));

class Torch extends StatefulWidget {
  @override
  _TorchState createState() => _TorchState();
}

class _TorchState extends State<Torch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283737),
      body: Center(
        child: IconButton(
          alignment: Alignment.center,
          iconSize: 160,
          onPressed: () {
              if(isOn) {
                setState(() {
                  isOn = false;
                });
                TorchCompat.turnOff();
              }else{
                setState(() {
                  isOn = true;
                });
                TorchCompat.turnOn();
              }
          },
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(
                color: isOn?Colors.cyanAccent.shade400:Colors.transparent,
                blurRadius: 25,
                spreadRadius: 10
              )]
            ),
            child: Icon(
              Icons.power_settings_new,
              color: isOn ? Colors.white : Colors.grey.shade500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    TorchCompat.dispose();
    super.dispose();
  }
}
