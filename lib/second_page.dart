import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.greenAccent,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Card(
            elevation: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
              ),
              width: 400,
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                      decoration: const InputDecoration(
                        hintText: 'Title',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                      decoration: const InputDecoration(
                        hintText: 'Description',
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                  ),
                  Container(
                    width: 150,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
