import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'view_state_model.dart';

abstract class ViewStateRefreshModel<T> extends ViewStateModel {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;

  initData() async {
    setBusy();
    await refresh();
  }

  //
  Future<T> refresh() async {
    T t = await loadData();
    onCompleted(t);
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    setIdle();
    return t;
  }

  // 加载数据
  Future<T> loadData();

  onCompleted(T data) {}
}
