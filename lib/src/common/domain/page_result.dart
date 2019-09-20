class PageResult<T>{
  List<T> items;
  int page;
  int totalPages;

  PageResult(this.items, this.page, this.totalPages);

  factory PageResult.empty(){
    return new PageResult([], 1, 1);
  }
}