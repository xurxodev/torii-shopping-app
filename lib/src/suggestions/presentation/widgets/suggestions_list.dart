import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/blocs/BlocProvider.dart';
import 'package:torii_shopping/src/search/presentation/blocs/search_products_bloc.dart';
import 'package:torii_shopping/src/suggestions/domain/entities/suggestion.dart';
import 'package:torii_shopping/src/suggestions/presentation/widgets/suggestion_item.dart';

class SuggestionsList extends StatelessWidget {
  SearchProductsBloc bloc;

  Function(Suggestion suggestion) onSuggestionSelected;

  SuggestionsList({this.onSuggestionSelected});

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SearchProductsBloc>(context);

    return StreamBuilder<List<Suggestion>>(
      stream: bloc.suggestions,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildSuggestions(context, snapshot.data);
        } else if (snapshot.hasError) {
          return Text(
            "${snapshot.error}",
            overflow: TextOverflow.ellipsis,
          );
        }

        return Column();
      },
    );
  }

  Widget buildSuggestions(BuildContext context, List<Suggestion> suggestions) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return SuggestionItem(
            suggestion: suggestions[index],
            onTap: ()=> onSuggestionSelected(suggestions[index]),
          );
        },
      ),
      color: Colors.white,
    );
  }
}
