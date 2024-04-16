import 'package:flutter/material.dart';
import 'package:my_flutter_project/student.dart';
import './edit_student.dart';
import './student_list_page.dart';
import './add_student_page.dart';
import './student_details_page.dart';

void main() {
  runApp(const MaterialApp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
  //   return MaterialApp(theme: ThemeData(
  //       primarySwatch: Colors.blue,),
  //     initialRoute: '/',
  //     routes: {
  //       '/': (context) => const StudentListPage(),
  //       '/add_students': (context) => const AddstudentPage(),
  //       '/student_details':(context) {
  //          final Student student = ModalRoute.of(context)!.settings.arguments as Student;
  //         return StudentDetailsPage(student: student);
  //       },
  //        '/edit_student': (context) {
  //         final Student student = ModalRoute.of(context)!.settings.arguments as Student;
  //         return EditStudentPage(student: student);
  //        }
  //     },
  //     onGenerateRoute: (RouteSettings settings) {
  //       if (settings.name == '/edit_student') {
  //         final Student student = settings.arguments as Student;
  //         return MaterialPageRoute(
  //           builder: (context) => EditStudentPage(student: student),
  //         );
  //       }
  //       // Define other routes with parameters here
  //        return MaterialPageRoute(
  //           builder: (context) => const StudentListPage(),
  //         );
  //      // Implement other routes or return null
  //     },
  //   );

 
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(color:Colors.white, child:Text('Flutter Demo Home Page')),
    );
  }
}