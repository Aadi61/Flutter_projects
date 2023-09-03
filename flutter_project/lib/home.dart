import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                'Good evening',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Helvetica'),
              ),
              SizedBox(
                width: 120,
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.notifications_none_outlined),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.history_outlined),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.settings_outlined),
              ),
            ],
          ),
          // GridView.builder(
          //    shrinkWrap: true,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2, // Number of columns
          //   ),
          //   itemBuilder: (BuildContext context, int index) {
          //     return Container(
          //       height: 20,
          //       width: 20,
          //       child: Card(color: Colors.grey,
          //       ),
          //     );
          //   },
          //   itemCount: 6, // Number of items
          // )
        Row(
          children: <Widget>[
            Container(
              height: 30,
              width: 30,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, index) {
                return Container(
                  child: Card(color: Colors.grey,),
                  height: 5,
                );
              }),
            )
          ],
        )
        ],
      ),
    );
  }
}
