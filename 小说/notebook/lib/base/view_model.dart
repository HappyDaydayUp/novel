abstract class BaseViewModel {
  ViewModelTyple state;
  void loadData();
}

enum ViewModelTyple {
  loading,
  success,
  netErr,
  dataErr,
  dataEmpty,
}
