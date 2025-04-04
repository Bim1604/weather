class GeoModel {
  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  GeoModel(
      {this.name,
        this.localNames,
        this.lat,
        this.lon,
        this.country,
        this.state});

  GeoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localNames = json['local_names'] != null
        ? LocalNames.fromJson(json['local_names'])
        : null;
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (localNames != null) {
      data['local_names'] = localNames!.toJson();
    }
    data['lat'] = lat;
    data['lon'] = lon;
    data['country'] = country;
    data['state'] = state;
    return data;
  }
}

class LocalNames {
  String? es;
  String? ru;
  String? ur;
  String? zh;
  String? en;
  String? pt;
  String? fr;
  String? uk;
  String? he;
  String? hi;
  String? ko;
  String? lt;

  LocalNames(
      {this.es,
        this.ru,
        this.ur,
        this.zh,
        this.en,
        this.pt,
        this.fr,
        this.uk,
        this.he,
        this.hi,
        this.ko,
        this.lt});

  LocalNames.fromJson(Map<String, dynamic> json) {
    es = json['es'];
    ru = json['ru'];
    ur = json['ur'];
    zh = json['zh'];
    en = json['en'];
    pt = json['pt'];
    fr = json['fr'];
    uk = json['uk'];
    he = json['he'];
    hi = json['hi'];
    ko = json['ko'];
    lt = json['lt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['es'] = es;
    data['ru'] = ru;
    data['ur'] = ur;
    data['zh'] = zh;
    data['en'] = en;
    data['pt'] = pt;
    data['fr'] = fr;
    data['uk'] = uk;
    data['he'] = he;
    data['hi'] = hi;
    data['ko'] = ko;
    data['lt'] = lt;
    return data;
  }
}
