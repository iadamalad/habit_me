class HabitModel{
  int id;
  String title;
  int frequency;

  HabitModel({this.title, this.frequency});
  HabitModel.withID({this.id, this.title, this.frequency});

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title']= title;
    map['frequency'] = frequency;
    return map;
  }

  factory HabitModel.from(Map<String, dynamic> map){
    return HabitModel.withID(id: map['id'], title: map['title'], frequency: map['frequency']);
  }
}