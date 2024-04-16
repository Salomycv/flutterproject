class Student{
  int id;
  String name;
  String age;
  String address;
  String contactno;

  Student({ required this.id, required this.name, required this.age, required this.address, required this.contactno});

Map<String, dynamic> toMap(){
  return{
    'id':id,
    'name':name,
    'age':age,
    'address':address,
    'contactno': contactno,
  };
}


// Define the copyWith method
  Student copyWith({
    int? id,
    String? name,
    String? age,
    String? address,
    String? contactno,
  })
  {
    return Student(
    id:id ?? this.id ,
      name: name ?? this.name,
      age: age ?? this.age,
      address: address ?? this.address,
      contactno: contactno ?? this.contactno,
    );
  }
}
