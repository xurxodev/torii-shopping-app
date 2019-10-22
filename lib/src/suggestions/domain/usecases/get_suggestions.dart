import 'package:toriishopping/src/suggestions/domain/repositories/suggestion_repository.dart';

import '../entities/suggestion.dart';

class  GetSuggestionsUseCase {
  SuggestionRepository _productRepository;

  GetSuggestionsUseCase(this._productRepository);

  Future<List<Suggestion>> execute(String prefix) {
    return _productRepository.getSuggestions(prefix);
  }
}
