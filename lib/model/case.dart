// To parse this JSON data, do
//
//     final case = caseFromJson(jsonString);

import 'dart:convert';

Case caseFromJson(String str) => Case.fromJson(json.decode(str));

String caseToJson(Case data) => json.encode(data.toJson());

class Case {
  Case({
    this.continent,
    this.country,
    this.population,
    this.cases,
    this.deaths,
    this.tests,
    this.day,
    this.time,
  });

  String continent;
  String country;
  int population;
  Cases cases;
  Deaths deaths;
  Tests tests;
  DateTime day;
  DateTime time;

  factory Case.fromJson(Map<String, dynamic> json) => Case(
        continent: json["continent"],
        country: json["country"],
        population: json["population"],
        cases: Cases.fromJson(json["cases"]),
        deaths: Deaths.fromJson(json["deaths"]),
        tests: Tests.fromJson(json["tests"]),
        day: DateTime.parse(json["day"]),
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "continent": continent,
        "country": country,
        "population": population,
        "cases": cases.toJson(),
        "deaths": deaths.toJson(),
        "tests": tests.toJson(),
        "day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "time": time.toIso8601String(),
      };
}

class Cases {
  Cases({
    this.casesNew,
    this.active,
    this.critical,
    this.recovered,
    this.the1MPop,
    this.total,
  });

  dynamic casesNew;
  int active;
  dynamic critical;
  int recovered;
  String the1MPop;
  int total;

  factory Cases.fromJson(Map<String, dynamic> json) => Cases(
        casesNew: json["new"],
        active: json["active"],
        critical: json["critical"],
        recovered: json["recovered"],
        the1MPop: json["1M_pop"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "new": casesNew,
        "active": active,
        "critical": critical,
        "recovered": recovered,
        "1M_pop": the1MPop,
        "total": total,
      };
}

class Deaths {
  Deaths({
    this.deathsNew,
    this.the1MPop,
    this.total,
  });

  dynamic deathsNew;
  dynamic the1MPop;
  dynamic total;

  factory Deaths.fromJson(Map<String, dynamic> json) => Deaths(
        deathsNew: json["new"],
        the1MPop: json["1M_pop"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "new": deathsNew,
        "1M_pop": the1MPop,
        "total": total,
      };
}

class Tests {
  Tests({
    this.the1MPop,
    this.total,
  });

  dynamic the1MPop;
  dynamic total;

  factory Tests.fromJson(Map<String, dynamic> json) => Tests(
        the1MPop: json["1M_pop"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "1M_pop": the1MPop,
        "total": total,
      };
}
