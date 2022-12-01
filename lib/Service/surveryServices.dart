class SurverySurvices {
  dynamic dynamicData;
  dynamic get getdynamicData => dynamicData;
  List<SurveryCheckBoxModel> surveryListTitle = <SurveryCheckBoxModel>[
    SurveryCheckBoxModel('Existing morgage?', 'none'),
    SurveryCheckBoxModel('Survery', 'none'),
    SurveryCheckBoxModel('Washer', 'none'),
    SurveryCheckBoxModel('Dryer', 'none'),
    SurveryCheckBoxModel('Range', 'none'),
    SurveryCheckBoxModel('Gas utility available?', 'none'),
    SurveryCheckBoxModel('Water on?', 'none'),
    SurveryCheckBoxModel('Sewer', 'none'),
    SurveryCheckBoxModel('Backed tax owed?', 'none'),
    SurveryCheckBoxModel('Leins on property?', 'none'),
    SurveryCheckBoxModel('Is property?', 'none'),
    SurveryCheckBoxModel('Is there a lock box for inspections?', 'none'),
    SurveryCheckBoxModel('Open to owner financed?', 'none'),
    SurveryCheckBoxModel(
        'Are you looking for a new primary home after selling current home?',
        'none'),
    SurveryCheckBoxModel('Do you need assistance finding a new home?', 'none'),
    SurveryCheckBoxModel(
        'Do you need help finding a morgage lender if your selling?', 'none'),
    SurveryCheckBoxModel('Foundation', 'none'),
    SurveryCheckBoxModel('Have Basement?', 'none'),
  ];
}

class SurveryCheckBoxModel {
  String title;
  String isChecked;

  SurveryCheckBoxModel(this.title, this.isChecked);
}
