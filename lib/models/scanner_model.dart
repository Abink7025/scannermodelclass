class Scanner {
  String? name;
  String? email;
  int? rollno;

  Scanner({this.name, this.email, this.rollno});

  Scanner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    print(name);
    email = json['email'];
    print(email);

    rollno = json['rollno'];
    print(rollno);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['rollno'] = this.rollno;
    return data;
  }
}
