class AllCourses {
  List<Data>? data;
  int? take;
  int? skip;

  AllCourses({this.data, this.take, this.skip});

  AllCourses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    take = json['take'];
    skip = json['skip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['take'] = this.take;
    data['skip'] = this.skip;
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? description;
  String? price;
  bool? free;
  Null? discount;
  String? duration;
  String? status;
  String? updatedAt;
  String? createdAt;
  Poster? poster;
  int? videoLessonCount;
  int? audioLessonCount;
  int? documentLessonCount;
  int? modulesCount;

  Data(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.free,
      this.discount,
      this.duration,
      this.status,
      this.updatedAt,
      this.createdAt,
      this.poster,
      this.videoLessonCount,
      this.audioLessonCount,
      this.documentLessonCount,
      this.modulesCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    free = json['free'];
    discount = json['discount'];
    duration = json['duration'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    poster =
        json['poster'] != null ? new Poster.fromJson(json['poster']) : null;
    videoLessonCount = json['videoLessonCount'];
    audioLessonCount = json['audioLessonCount'];
    documentLessonCount = json['documentLessonCount'];
    modulesCount = json['modulesCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['free'] = this.free;
    data['discount'] = this.discount;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    if (this.poster != null) {
      data['poster'] = this.poster!.toJson();
    }
    data['videoLessonCount'] = this.videoLessonCount;
    data['audioLessonCount'] = this.audioLessonCount;
    data['documentLessonCount'] = this.documentLessonCount;
    data['modulesCount'] = this.modulesCount;
    return data;
  }
}

class Poster {
  String? id;
  String? name;
  Null? externalId;
  String? size;
  String? width;
  String? height;
  String? externalUrl;
  String? url;
  String? provider;
  String? parentId;
  String? extension;
  bool? isPublic;

  Poster(
      {this.id,
      this.name,
      this.externalId,
      this.size,
      this.width,
      this.height,
      this.externalUrl,
      this.url,
      this.provider,
      this.parentId,
      this.extension,
      this.isPublic});

  Poster.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    externalId = json['external_id'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    externalUrl = json['external_url'];
    url = json['url'];
    provider = json['provider'];
    parentId = json['parent_id'];
    extension = json['extension'];
    isPublic = json['is_public'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['external_id'] = this.externalId;
    data['size'] = this.size;
    data['width'] = this.width;
    data['height'] = this.height;
    data['external_url'] = this.externalUrl;
    data['url'] = this.url;
    data['provider'] = this.provider;
    data['parent_id'] = this.parentId;
    data['extension'] = this.extension;
    data['is_public'] = this.isPublic;
    return data;
  }
}
