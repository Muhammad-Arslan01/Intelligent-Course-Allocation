
import 'dart:convert';

Preferences preferencesFromMap(String str) => Preferences.fromMap(json.decode(str));

String preferencesToMap(Preferences data) => json.encode(data.toMap());

class Preferences {
    Preferences({
        required this.noOfPreferences,
    });

    String noOfPreferences;

    factory Preferences.fromMap(Map<String, dynamic> json) => Preferences(
        noOfPreferences: json["no of preferences"],
    );

    Map<String, dynamic> toMap() => {
        "no of preferences": noOfPreferences,
    };
}