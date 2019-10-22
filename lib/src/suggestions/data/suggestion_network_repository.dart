import 'dart:convert';

import 'package:toriishopping/src/common/data/api_resository.dart';
import 'package:toriishopping/src/suggestions/domain/entities/suggestion.dart';
import 'package:toriishopping/src/suggestions/domain/entities/suggestion_category.dart';
import 'package:toriishopping/src/suggestions/domain/repositories/suggestion_repository.dart';

class SuggestionNetworkRepository extends ApiRepository
    implements SuggestionRepository {
  @override
  Future<List<Suggestion>> getSuggestions(String prefix) async {
    return await _fetchSuggestions(prefix);
  }

  Future<List<Suggestion>> _fetchSuggestions(String prefix) async {
    try {
      final response = await super.get('/suggestions?prefix=$prefix');

      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        final decodedJson = json.decode(response.body);
        return _parse(decodedJson);
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load post');
      }
    } on Exception catch (e) {
      print(e);
      throw e;
    }
  }

  List<Suggestion> _parse(List<dynamic> jsonSuggestions) {
    List<Suggestion> suggestions = new List<Suggestion>();

    jsonSuggestions.forEach((i) => suggestions.add(_parseSuggestion(i)));

    return suggestions;
  }

  Suggestion _parseSuggestion(Map<String, dynamic> json) {
    List<SuggestionCategory> categories = new List<SuggestionCategory>();

    (json['categories'] as List).forEach((c) =>
        categories.add(new SuggestionCategory(c['value'], c['display'])));

    return new Suggestion(json['value'], categories);
  }
}
