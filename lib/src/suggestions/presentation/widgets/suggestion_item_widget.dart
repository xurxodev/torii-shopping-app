import 'package:flutter/material.dart';
import 'package:torii_shopping/src/suggestions/domain/entities/suggestion.dart';

class SuggestionItemWidget extends StatelessWidget {
  final Suggestion suggestion;
  final GestureTapCallback onTap;

  SuggestionItemWidget({Key key, @required this.suggestion, this.onTap});

  @override
  Widget build(BuildContext context) {

    return
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 16.0,right: 16.0, bottom: 8.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
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
