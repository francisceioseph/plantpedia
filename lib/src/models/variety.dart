class Variety {
  String year;
  String type;
  bool synonym;
  String status;
  List<Sources> sources;
  String slug;
  String scientificName;
  int mainSpeciesId;
  String link;
  bool isMainSpecies;
  int id;
  String familyCommonName;
  bool completeData;
  String commonName;
  String bibliography;
  String author;

  Variety({
    this.year,
    this.type,
    this.synonym,
    this.status,
    this.sources,
    this.slug,
    this.scientificName,
    this.mainSpeciesId,
    this.link,
    this.isMainSpecies,
    this.id,
    this.familyCommonName,
    this.completeData,
    this.commonName,
    this.bibliography,
    this.author,
  });

  Variety.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    type = json['type'];
    synonym = json['synonym'];
    status = json['status'];
    if (json['sources'] != null) {
      sources = new List<Sources>();
      json['sources'].forEach((v) {
        sources.add(new Sources.fromJson(v));
      });
    }
    slug = json['slug'];
    scientificName = json['scientific_name'];
    mainSpeciesId = json['main_species_id'];
    link = json['link'];
    isMainSpecies = json['is_main_species'];
    id = json['id'];
    familyCommonName = json['family_common_name'];
    completeData = json['complete_data'];
    commonName = json['common_name'];
    bibliography = json['bibliography'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['type'] = this.type;
    data['synonym'] = this.synonym;
    data['status'] = this.status;
    if (this.sources != null) {
      data['sources'] = this.sources.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    data['scientific_name'] = this.scientificName;
    data['main_species_id'] = this.mainSpeciesId;
    data['link'] = this.link;
    data['is_main_species'] = this.isMainSpecies;
    data['id'] = this.id;
    data['family_common_name'] = this.familyCommonName;
    data['complete_data'] = this.completeData;
    data['common_name'] = this.commonName;
    data['bibliography'] = this.bibliography;
    data['author'] = this.author;
    return data;
  }
}

class Sources {
  int speciesId;
  String sourceUrl;
  String name;
  String lastUpdate;

  Sources({this.speciesId, this.sourceUrl, this.name, this.lastUpdate});

  Sources.fromJson(Map<String, dynamic> json) {
    speciesId = json['species_id'];
    sourceUrl = json['source_url'];
    name = json['name'];
    lastUpdate = json['last_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['species_id'] = this.speciesId;
    data['source_url'] = this.sourceUrl;
    data['name'] = this.name;
    data['last_update'] = this.lastUpdate;
    return data;
  }
}
