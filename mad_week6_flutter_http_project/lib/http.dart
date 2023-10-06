class Http {

  final String userId;
  final String id;
  final String title;

  const Http({required this.userId, required this.id, required this.title});

  factory Http.fromJson(Map<String, dynamic> json) {
    return Http(
        userId: json['userId'],
        id: json['id'],
        title: json['title']
    );
  }

}

