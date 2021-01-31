class MyGroupsModel {
  final String icon;
  final String title;
  final String description;

  MyGroupsModel({this.icon, this.title, this.description});
}

List<MyGroupsModel> groups = [
  MyGroupsModel(
      icon: 'assets/userimages/user3.png',
      title: 'plumbers group',
      description: 'this group description..'),
  MyGroupsModel(
      icon: 'assets/userimages/user3.png',
      title: 'painter group',
      description: 'this group description..'),
  MyGroupsModel(
      icon: 'assets/userimages/user3.png',
      title: 'electricians group',
      description: 'this group description..'),
  MyGroupsModel(
      icon: 'assets/userimages/user3.png',
      title: 'carpenter group',
      description: 'this group description..'),
];
