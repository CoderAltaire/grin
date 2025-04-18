class AllFilesModel {
  String? _id;
  String? _name;
  String? _externalId;
  String? _size;
  String? _width;
  String? _height;
  String? _externalUrl;
  String? _url;
  String? _provider;
  String? _parentId;
  String? _extension;
  bool? _isPublic;

  AllFilesModel(
      {String? id,
      String? name,
      String? externalId,
      String? size,
      String? width,
      String? height,
      String? externalUrl,
      String? url,
      String? provider,
      String? parentId,
      String? extension,
      bool? isPublic}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (externalId != null) {
      this._externalId = externalId;
    }
    if (size != null) {
      this._size = size;
    }
    if (width != null) {
      this._width = width;
    }
    if (height != null) {
      this._height = height;
    }
    if (externalUrl != null) {
      this._externalUrl = externalUrl;
    }
    if (url != null) {
      this._url = url;
    }
    if (provider != null) {
      this._provider = provider;
    }
    if (parentId != null) {
      this._parentId = parentId;
    }
    if (extension != null) {
      this._extension = extension;
    }
    if (isPublic != null) {
      this._isPublic = isPublic;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get externalId => _externalId;
  set externalId(String? externalId) => _externalId = externalId;
  String? get size => _size;
  set size(String? size) => _size = size;
  String? get width => _width;
  set width(String? width) => _width = width;
  String? get height => _height;
  set height(String? height) => _height = height;
  String? get externalUrl => _externalUrl;
  set externalUrl(String? externalUrl) => _externalUrl = externalUrl;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get provider => _provider;
  set provider(String? provider) => _provider = provider;
  String? get parentId => _parentId;
  set parentId(String? parentId) => _parentId = parentId;
  String? get extension => _extension;
  set extension(String? extension) => _extension = extension;
  bool? get isPublic => _isPublic;
  set isPublic(bool? isPublic) => _isPublic = isPublic;

  AllFilesModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _externalId = json['external_id'];
    _size = json['size'];
    _width = json['width'];
    _height = json['height'];
    _externalUrl = json['external_url'];
    _url = json['url'];
    _provider = json['provider'];
    _parentId = json['parent_id'];
    _extension = json['extension'];
    _isPublic = json['is_public'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['external_id'] = this._externalId;
    data['size'] = this._size;
    data['width'] = this._width;
    data['height'] = this._height;
    data['external_url'] = this._externalUrl;
    data['url'] = this._url;
    data['provider'] = this._provider;
    data['parent_id'] = this._parentId;
    data['extension'] = this._extension;
    data['is_public'] = this._isPublic;
    return data;
  }
}
