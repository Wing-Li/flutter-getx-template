class UserInfo {
  Account? account;
  String? authToken;

  UserInfo({
    this.account,
    this.authToken,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        account: json["account"] != null ? Account.fromJson(json["account"]) : null,
        authToken: json["token"] != null ? json["token"] : null,
      );

  Map<String, dynamic> toJson() => {
        "account": account?.toJson(),
        "token": authToken,
      };
}

class Account {
  String? id;
  String? nickname;
  String? description;
  String? email;
  int? handle;
  int? completed;
  int? gender;
  String? birthday;
  List<Photo>? photos; // 用户照片，最多3张

  // 好友申请相关
  int? requestId;
  String? applyTs;
  int? isFriend;

  Account({
    this.id,
    this.nickname,
    this.description,
    this.email,
    this.handle,
    this.completed,
    this.gender,
    this.birthday,
    this.photos,
    this.requestId,
    this.applyTs,
    this.isFriend,
  });

  String? get avatarUrl => (photos?.isNotEmpty ?? false) ? photos?.first.url : null;

  int? get age => birthday != null ? DateTime.now().year - DateTime.parse(birthday!).year : null;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        nickname: json["nickname"],
        description: json["description"],
        email: json["email"],
        handle: json["handle"],
        completed: json["completed"],
        gender: json["gender"],
        birthday: json["birthday"],
        photos: json["photos"] != null ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))) : null,
        requestId: json["request_id"],
        applyTs: json["apply_ts"]?.toString(),
        isFriend: json["is_friend"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "description": description,
        "email": email,
        "handle": handle,
        "completed": completed,
        "gender": gender,
        "birthday": birthday,
        "photos": photos?.map((x) => x.toJson()).toList(),
        "request_id": requestId,
        "apply_ts": applyTs,
        "is_friend": isFriend,
      };
}

class Photo {
  String? url; // 资源上传接口返回的链接
  int? order; // 顺序 >=1 <=9，最多支持3张图片

  Photo({
    this.url,
    this.order,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json["url"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "order": order,
      };
}
