import 'package:flutter/material.dart';
import 'package:torii_shopping/src/suggestions/domain/entities/suggestion.dart';

class SuggestionItem extends StatelessWidget {
  final Suggestion suggestion;
  final GestureTapCallback onTap;

  SuggestionItem({Key key, @required this.suggestion, this.onTap});

  @override
  Widget build(BuildContext context) {

    return
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 16.0,right: 16.0, bottom: 8.0),
            child: Row(
              children: <Widget>[
                Text(suggestion.value, style: Theme.of(context).textTheme.subhead,),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: suggestion.suggestionCategories.length > 0
                      ? Text("en " + suggestion.suggestionCategories[0].display,
                          style: Theme.of(context).textTheme.caption)
                      : Column(),
                )
              ],
            ),
          ),
        );
  }
}
