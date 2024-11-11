import 'package:flutter/material.dart';
import 'package:notes_ap/data_base/data_base.dart';
import 'package:notes_ap/second_page.dart';
class SecondPage extends StatelessWidget {
  final _databaseinstance=DataBaseService.instance;
  final TextEditingController _titlecontroller=TextEditingController();
  final TextEditingController _Descriptioncontroller=TextEditingController();
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
                      controller:_titlecontroller,
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
                      controller:_Descriptioncontroller,
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
                      onPressed: () {
                        String title = _titlecontroller.text;
                        String description = _Descriptioncontroller.text;

                        // Inserting into database
                        _databaseinstance.insertUser(title, description);
                        print('Data inserted: Title: $title, Description: $description');
                        //clearing the text fields
                        _titlecontroller.clear();
                        _Descriptioncontroller.clear();
                        //showing a dialog
                         showDialog(
                         context: context,
                          builder: (BuildContext context) {
                                 return AlertDialog(
                           title: const Text("Note Added"),
                           content: const Text("Your note has been successfully added!"),
                               actions: [
                               TextButton(
                            onPressed: () {
                            Navigator.of(context).pop();
                                 },
                           child: const Text("OK"),
                         ),
                          ],
                          );
                         },
                      );
                         },

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
