import 'package:flutter/material.dart';
import './database_Helper.dart';
import './student.dart';

class AddstudentPage extends StatefulWidget {
  const AddstudentPage({super.key});

  @override
  State<AddstudentPage> createState() => _AddstudentPageState();
}

class _AddstudentPageState extends State<AddstudentPage> {
final _formkey= GlobalKey<FormState>();
late int _id;
late String _name;
late String _age;
late String _address;
late String _contactno;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    home:Scaffold(
        appBar:AppBar(
        title:const Text('Add Student'),
        ),
        body: Padding(
          padding:const EdgeInsets.all(16.0),
          child: Form(key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            TextFormField(
                decoration:const InputDecoration(labelText: 'Name'),
                validator:(value) {
                  if(value == null|| value.isEmpty ){
                    return 'please enter student name';
                  }
                  else
                return null;
                },
                onSaved: (value) {
                  _name= value!;
                },
              ),
      
      TextFormField(
        decoration:const InputDecoration(labelText: 'Age'),
        validator: (value){
       if(value == null|| value.isEmpty ){
                    return 'please enter student age';
                  }
                  else
                  return null;
        },
         onSaved: (value) {
                  _age= value!;
                },
      ),
      
      TextFormField(
        decoration:const InputDecoration(labelText: 'Address'),
        validator: (value){
       if(value == null|| value.isEmpty ){
                    return 'please enter student address';
                  }
                  else
                  return null;
        },
         onSaved: (value) {
                  _address= value!;
                },
      ),
      
      TextFormField(
        decoration:const InputDecoration(labelText: 'Contact Number'),
        validator: (value){
       if(value == null|| value.isEmpty ){
                    return 'please enter student contact number';
                  }
                  else
                  return null;
        },
         onSaved: (value) {
                  _contactno= value!;
                },
      ),
      
      
      Row(
        children: [ElevatedButton(
      onPressed: () {
        if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();
      _saveStudent();
      Navigator.pop(context);
        }
      },
      child: const Text('Submit'),
        ),
      
      ElevatedButton(
        onPressed: (){
      Navigator.pop(context);
        },
        child:const Text('Cancel'),
        ),
       ],
      ),
            ],
          ),
      ),
    ),
    ),);
  }
        void _saveStudent() async{
      final newStudent= Student(
        id: _id,
        name: _name,
        age:_age,
        address: _address,
        contactno: _contactno,
      );
      
      
      try{
      await DatabaseHelper.instance.insertStudent(newStudent);
      print("Student added successfully");
      }
      catch(e){
      print("Error adding in student $e");
      }

     }
    }
