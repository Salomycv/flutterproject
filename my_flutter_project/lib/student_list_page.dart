import 'package:flutter/material.dart';
import './student.dart';
import './student_details_page.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  bool isGridView = false;
  List<Student> students = [
    Student(id: 1, name: 'Anu', age: '25', address: 'Kerala', contactno: '1234567890'),
    Student(id: 2, name: 'Anitha', age: '22', address: 'Kerala', contactno: '9876543210'),
    // Add more students
  ];

  List<Student> filteredStudents = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the list of filtered students with all students initially
    filteredStudents = List.of(students);
  }

  void _filterStudents(String query) {
    setState(() {
      // Filter students based on the query
      filteredStudents = students
          .where((student) => student.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title:const Text(
          "Students List",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: _StudentSearchDelegate(students),
              );
            },
            icon:const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
            icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
          ),
        ],
      ),
      backgroundColor: Colors.indigoAccent,
      body: isGridView ? _buildGridView() : _buildListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle adding new student
          Navigator.pushNamed(context, '/add_student', arguments: students);
        },
        child:const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: filteredStudents.length,
      itemBuilder: (context, index) {
        var student = filteredStudents[index];
        return ListTile(
          leading:const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/image/dp.jpg'),
          ),
          title: Text(student.name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentDetailsPage(student: student),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: filteredStudents.length,
      itemBuilder: (context, index) {
        var student = filteredStudents[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentDetailsPage(student: student),
              ),
            );
          },
          child: Card(
            elevation: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const  CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/image/dp.jpg'),
                ),
              const  SizedBox(height: 8),
                Text(
                  student.name,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StudentSearchDelegate extends SearchDelegate<String> {
  final List<Student> students;

  _StudentSearchDelegate(this.students);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final List<Student> filteredResults = students.where((student) => student.name.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        var student = filteredResults[index];
        return ListTile(
          title: Text(student.name),
          onTap: () {
            // Handle tap on search result
            close(context, student.name);
          },
        );
      },
    );
  }
}
