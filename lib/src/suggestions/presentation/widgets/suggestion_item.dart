import 'package:flutter/material.dart';
import 'package:torii_shopping/src/suggestions/domain/entities/suggestion.dart';

class SuggestionItem extends StatelessWidget {
  final Suggestion suggestion;
  final GestureTapCallback onTap;

  SuggestionItem({Key key, @required this.suggestion, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        children: <Widget>[
          Text(suggestion.value),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: suggestion.suggestionCategories.length > 0
                ? Text("en " + suggestion.suggestionCategories[0].display,
                    style: Theme.of(context).textTheme.caption)
                : Column(),
          )
        ],
      ),
    );
  }
}
