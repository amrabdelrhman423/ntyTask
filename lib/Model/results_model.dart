import 'multimedia.dart';

class Results {
  String? section;
  String? subsection;
  String? title;
  String? abstract;
  String? url;
  String? uri;
  String? byline;
  String? itemType;
  String? updatedDate;
  String? createdDate;
  String? publishedDate;
  String? materialTypeFacet;
  String? kicker;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Multimedia>? multimedia;
  String? shortUrl;

  Results(
      {this.section,
      this.subsection,
      this.title,
      this.abstract,
      this.url,
      this.uri,
      this.byline,
      this.itemType,
      this.updatedDate,
      this.createdDate,
      this.publishedDate,
      this.materialTypeFacet,
      this.kicker,
      this.desFacet,
      this.orgFacet,
      this.perFacet,
      this.geoFacet,
      this.multimedia,
      this.shortUrl});

  Results.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    subsection = json['subsection'];
    title = json['title'];
    abstract = json['abstract'];
    url = json['url'];
    uri = json['uri'];
    byline = json['byline'];
    itemType = json['item_type'];
    updatedDate = json['updated_date'];
    createdDate = json['created_date'];
    publishedDate = json['published_date'];
    materialTypeFacet = json['material_type_facet'];
    kicker = json['kicker'];
    desFacet = json['des_facet'].cast<String>();
    orgFacet = json['org_facet'].cast<String>();
    perFacet = json['per_facet'].cast<String>();
    geoFacet = json['geo_facet'].cast<String>();
    if (json['multimedia'] != null) {
      // ignore: deprecated_member_use
      multimedia = <Multimedia>[];
      json['multimedia'].forEach((v) {
        multimedia!.add(Multimedia.fromJson(v));
      });
    }
    shortUrl = json['short_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section'] = this.section;
    data['subsection'] = this.subsection;
    data['title'] = this.title;
    data['abstract'] = this.abstract;
    data['url'] = this.url;
    data['uri'] = this.uri;
    data['byline'] = this.byline;
    data['item_type'] = this.itemType;
    data['updated_date'] = this.updatedDate;
    data['created_date'] = this.createdDate;
    data['published_date'] = this.publishedDate;
    data['material_type_facet'] = this.materialTypeFacet;
    data['kicker'] = this.kicker;
    data['des_facet'] = this.desFacet;
    data['org_facet'] = this.orgFacet;
    data['per_facet'] = this.perFacet;
    data['geo_facet'] = this.geoFacet;
    if (this.multimedia != null) {
      data['multimedia'] = this.multimedia!.map((v) => v.toJson()).toList();
    }
    data['short_url'] = this.shortUrl;
    return data;
  }
}
