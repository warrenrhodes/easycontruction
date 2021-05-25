import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/image/index3.png",
                  height: 150,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Easy Construction",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                Image.asset(
                  "assets/image/images3.jpg",
                  height: 80,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
