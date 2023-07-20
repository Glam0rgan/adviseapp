class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
    this.turnpage = '',
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;
  String turnpage;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/breakfast.png',
      titleTxt: '性格测试',
      kacl: 0,
      meals: <String>[],
      startColor: '#FA7D82',
      endColor: '#FFB295',
      turnpage: 'CTest',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/lunch.png',
      titleTxt: '查大学',
      kacl: 0,
      meals: <String>[],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
      turnpage: 'FSchool',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/snack.png',
      titleTxt: '查专业',
      kacl: 0,
      meals: <String>[],
      startColor: '#FE95B6',
      endColor: '#FF5287',
      turnpage: 'SSubject',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/dinner.png',
      titleTxt: '同分去向',
      kacl: 0,
      meals: <String>[],
      startColor: '#6F72CA',
      endColor: '#1E1466',
      turnpage: 'FSchool',
    ),
  ];
}
