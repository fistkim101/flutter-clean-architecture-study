import 'dart:async';

class OnBoardingViewModel {
  late List<String> pageTitles;
  int currentPageIndex = 0;
  StreamController<Slide> _slideStreamController = StreamController<Slide>();

  Stream<Slide> get slideStream => _slideStreamController.stream;

  void update() {
    Slide slide = Slide(
        currentPage: currentPageIndex,
        title: pageTitles[currentPageIndex],
        totalPageCount: pageTitles.length);
    _slideStreamController.sink.add(slide);
  }

  void init() {
    pageTitles = pageTitles = ['first', 'second', 'third'];
    update();
  }

  void dispose() {
    _slideStreamController.close();
  }

  void nextPage() {
    currentPageIndex++;
    update();
  }

  void previousPage() {
    currentPageIndex--;
    update();
  }
}

class Slide {
  final int currentPage;
  final String title;
  final int totalPageCount;

  const Slide({
    required this.currentPage,
    required this.title,
    required this.totalPageCount,
  });

  @override
  String toString() {
    return 'Slide{currentPage: $currentPage, title: $title, totalPageCount: $totalPageCount}';
  }
}
