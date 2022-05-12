import 'package:flutter/material.dart';
import '../../utils/tools/logging.dart';

class LoadMoreWidget extends StatelessWidget {
  
  final int count;
  final bool nextPage;
  final bool isLoading;
  final Future<void> Function(bool) loadMore;
  final Widget Function(int) itemViewer;

  const LoadMoreWidget({
    Key? key, 
    required this.count, 
    required this.nextPage, 
    required this.isLoading,
    required this.loadMore,
    required this.itemViewer}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    final log = logger(LoadMoreWidget);
    log.w('count = $count, isLoading = $isLoading');
    return Container(
                height: 400.0,
                  child: Stack(
                    children: [
                      (count < 1 && isLoading)
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        itemCount: count,
                        itemBuilder: (_, int index) {

                          if ((index + 1) >= count && nextPage && isLoading == false ) _loadMore();
                          // if (isLoading) {
                          //   log.w('index = $index, length = $count, nextPage = $nextPage, isLoading = $isLoading');
                          //   // return Center(child:  CircularProgressIndicator());
                          //   return Container();
                          // } else
                            if (count > 0)
                            return itemViewer(index);
                          else
                            return Container();
                        },
                      ),

                      // loadmin
                      if (count > 1 && isLoading) Center(child: CircularProgressIndicator())

                    ],
                  ),
              );
  }


  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    await loadMore(false);
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    await loadMore(true);
  }
  
  
}
