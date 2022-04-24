import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseFemaleWeight extends StatelessWidget {
  const ChooseFemaleWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Align(
            child: SvgPicture.asset(
              "assets/weight/female/weight_gauge.svg",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
              child: Text(
            'Kilonuzu kg cinsinden giriniz',
            style: TextStyle(
              color: Color.fromRGBO(255, 69, 147, 1),
              fontWeight: FontWeight.bold,
            ),
          )),
          Row(
            children: [
              Expanded(
                  child: Align(
                child: SvgPicture.asset("assets/weight/female/water_drop.svg"),
              )),
              Expanded(
                  child: SizedBox(
                height: 200,
                child: CupertinoPicker(
                    itemExtent: 50,
                    onSelectedItemChanged: (index) {},
                    children: [
                      Center(child: Text("Cemile")),
                      Center(child: Text("Beyza")),
                      Center(child: Text("Düzen"))
                    ]),
              )),
            ],
          ),
          Spacer(),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Align(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {},
                    child: Icon(Icons.arrow_back_ios),
                  ),
                )),
                Expanded(
                    child: Align(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {},
                    child: const Text('NEXT'),
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
