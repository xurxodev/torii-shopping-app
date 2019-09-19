class PageResult<T>{
  List<T> items;
  int page;
  int totalPages;

  PageResult(this.items, this.page, this.totalPages);
}