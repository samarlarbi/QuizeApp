class Question {
  final String id;
  final String category;

  final String title;
  final Map<String, bool> options;

  Question(
      {required this.id,
      required this.category,
      required this.title,
      required this.options});
      @override
  String toString() {
    // TODO: implement toString
    return   'question id  : $id /n title : $title /n categorie : $category  / options : $options';
  }
}
