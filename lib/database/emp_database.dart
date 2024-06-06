// employee

class PostModel {
  final int empId;
  final String fName;
  final String gName;
  final String pass;

  PostModel({
    required this.empId,
    required this.fName,
    required this.gName,
    required this.pass,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      empId: json['emp_id'],
      fName: json['f_name'],
      gName: json['g_name'],
      pass: json['pass'],
    );
  }

  Map<String, dynamic> toJson() => {
        'emp_id': empId,
        'f_name': fName,
        'g_name': gName,
        'pass': pass,
      };
}
