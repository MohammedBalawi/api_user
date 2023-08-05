class StudentImage {
 late String image;
 late int studentId;
 late int id;
 late String imageUrl;



  StudentImage.fromJson (Map<String, dynamic> json) {
    image = json[' image'];
    studentId = json['student_id'];
    id = json['id'];
    imageUrl = json[' image_url'];
  }
    Map<String, dynamic> tojson() {
      final Map<String, dynamic> data = new Map<String, dynamic> ();
      data['image'] = this.image;
      data['student_id'] = this.studentId;
      data['id'] = this.id;
      data ['image_url'] = this.imageUrl;
      return data;
    }
}
