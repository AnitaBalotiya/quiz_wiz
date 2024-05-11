class Questions {
  late String question;
  late String answer;
  late List options;

  Questions();

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['question'] ?? '';
    answer = json['answer'] ?? '';
    options = json['options'] ?? '';
  }
}
