import 'package:flutter/material.dart';
import 'package:notes_ap/data_base/data_base.dart';
import 'package:notes_ap/second_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotesHomePage(),
    );
  }
}
class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
 final dataBase=DataBaseService.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true,
      ),
      /*body: Center(
        child: FutureBuilder(
          future: dataBase.getUserList(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return ListTile(
                  leading: Text('${user.id}', style: TextStyle(fontSize: 26),),
                  title: Text(user.Title, style: TextStyle(fontSize: 24),),
                  subtitle: Text(user.Description, style: TextStyle(fontSize: 24),),
                 /* trailing: IconButton(
                      onPressed: () {
                        print('------------clicked');
                        dataBase.updateUser('amr', 'ammar');
                        setState(() { });
                      },
                      icon: Icon(Icons.update)
                  ),
                  onLongPress: () {
                    dataBase.deleteUser(user.id);
                    setState(() { });
                  },*/
                );
              },
            );
          },
        ),
      ),*/
      floatingActionButton:ElevatedButton(
        onPressed:(){
          Navigator.push
            (context,
              MaterialPageRoute(
                  builder:(context)=> SecondPage()
              ));
        },
       child:Text("Add Notes"),

      )




      );
    }
  }

