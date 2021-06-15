class IdVerification {
  final String cnicfronturl;
  final String cnicbackurl;
  final String selfiurl;
  final String userId;
  List<String> members;
  IdVerification(
      {this.cnicfronturl,
      this.cnicbackurl,
      this.selfiurl,
      this.userId,
      this.members});
  factory IdVerification.fromJson(Map<String, dynamic> json) {
    return IdVerification(
        cnicfronturl: json['cnicfronturl'] ?? ' ',
        cnicbackurl: json['cnicbackurl'] ?? '',
        selfiurl: json['selfiurl'] ?? '',
        userId: json['userid']);
  }

  Map<String, dynamic> toMap() {
    return {
      'cnicfronturl': cnicfronturl,
      'cnicbackurl': cnicbackurl,
      'selfiurl': selfiurl,
      'userid': userId,
    };
  }
}
