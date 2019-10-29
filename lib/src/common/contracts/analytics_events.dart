abstract class AnalyticsEvent {
  final String name;
  final params = new Map<String, dynamic>();

  AnalyticsEvent(this.name);
}

class SearchEvent extends AnalyticsEvent {
  SearchEvent(String searchTerm) : super("search") {
    this.params["search_term"] = searchTerm;
  }
}

class SelectContentEvent extends AnalyticsEvent {
  SelectContentEvent(ContentType contentType, String itemId)
      : super("select_content") {
    this.params["content_type"] = contentType.toString().split(".")[1];
    this.params["item_id"] = itemId;
  }
}

enum ContentType { carousel_banner, list_banner }
