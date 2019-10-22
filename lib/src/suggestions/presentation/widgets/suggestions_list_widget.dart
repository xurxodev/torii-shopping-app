import 'package:flutter/material.dart';
import 'package:toriishopping/src/common/presentation/blocs/BlocProvider.dart';
import 'package:toriishopping/src/common/presentation/snackbar.dart';
import 'package:toriishopping/src/search/presentation/blocs/search_products_bloc.dart';
import 'package:toriishopping/src/suggestions/domain/entities/suggestion.dart';
import 'package:toriishopping/src/suggestions/presentation/widgets/suggestion_item_widget.dart';

// ignore: must_be_immutable
class SuggestionsListWidget extends StatelessWidget {
  SearchProductsBloc bloc;

  Function(Suggestion suggestion) onSuggestionSelected;

  SuggestionsListWidget({this.onSuggestionSelected});

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SearchProductsBloc>(context);

    return StreamBuilder<List<Suggestion>>(
      stream: bloc.suggestions,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildSuggestions(context, snapshot.data);
        } else if (snapshot.hasError) {
          showSnackBarPostFrame(context, snapshot.error.toString());
          return Container();
        }

        return Column();
      },
    );
  }

  Widget buildSuggestions(BuildContext context, List<Suggestion> suggestions) {
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return SuggestionItemWidget(
            suggestion: suggestions[index],
            onTap: () => onSuggestionSelected(suggestions[index]),
          );
        },
      ),
      color: Colors.white,
    );
  }
}
