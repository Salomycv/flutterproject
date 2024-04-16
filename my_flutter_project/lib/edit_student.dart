import 'package:flutter/material.dart';
import 'package:my_flutter_project/student.dart';
import './database_Helper.dart';

class EditStudentPage extends StatefulWidget{
  final Student student;
  const EditStudentPage({Key? key, required this.student}):super(key: key);
  @override 
  _EditStudentPageState createState() => _EditStudentPageState();

}

class _EditStudentPageState extends State<EditStudentPage>{
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _addressController;
  late TextEditingController _contactnoController;


  void initState(){
super.initState();
_nameController=TextEditingController(text: widget.student.name);
_ageController=TextEditingController(text: widget.student.age);
_addressController=TextEditingController(text: widget.student.address);
_contactnoController=TextEditingController(text: widget.student.contactno);
  }

   
   @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    _contactnoController.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: _contactnoController,
                decoration: const InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _saveChanges();
                      Navigator.pop(context); // Navigate back to student details page
                    },
                    child: const Text('Save'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to student details page without saving changes
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveChanges() async {
    // Update student details in the database
    Student updatedStudent = widget.student.copyWith(
      name: _nameController.text,
      age: _ageController.text,
      address: _addressController.text,
      contactno: _contactnoController.text,
    );
    await DatabaseHelper.instance.updateStudent(updatedStudent);
    print('Student details updated successfully');
  }
}
