import 'package:flutter/material.dart';
import './database_Helper.dart';
import './student.dart';


class StudentDetailsPage extends StatelessWidget{
  final Student student;
 const StudentDetailsPage({super.key, required this.student});

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title:const Text('Student Details',
      style: TextStyle(fontSize: 23),),
    ),
    body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
         Text('Name: ${student.name}'),
            Text('Age: ${student.age}'),
            Text('Address: ${student.address}'),
            Text('Contact Number: ${student.contactno}'),

        const SizedBox(height: 20.0,),
        
        Row(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          ElevatedButton(
                  onPressed: () {
                    // Navigate to edit student page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => EditStudentPage(student: student),
                    //   ),
                    Navigator.pushNamed(context, '/edit_student', arguments: student);
                  },
                  child:const Text('Edit'),
                ),

              const  SizedBox(width: 20),
               
                ElevatedButton(
                  onPressed: () {
                    // Show confirmation dialog before deleting
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:const Text('Delete Student'),
                          content:const Text('Are you sure you want to delete this student?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child:const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Delete the student from the database
                                DatabaseHelper.instance.deleteStudent(student.id);
                                // Navigate back to previous page
                                Navigator.of(context).pop();
                              },
                              child:const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child:const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
      }

}
