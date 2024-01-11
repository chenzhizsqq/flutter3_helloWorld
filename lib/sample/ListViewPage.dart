import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var itemCount = 50;
  //加载更多
  var isLoading = false;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      //监听滑动到最后
      if (isLoading == false &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
          _loadMore();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('滚动组件刷新'),
      ),
      body: Column(
        children: [
          // const ListTile(title: Text('固定头部'),),
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.yellow,
            child: const ListTile(
              title: Text('固定头部'),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.separated(
                  padding: const EdgeInsets.all(30),
                  controller: _scrollController, //监听
                  itemBuilder: (BuildContext context, int index) {
                    if (index == itemCount) {
                      return _getLoadMore();
                    }
                    return Container(
                      height: 50,
                      child: ListTile(
                        title: Text('$index'),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.black38,
                      height: 1,
                    );
                  },
                  itemCount: itemCount + 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getLoadMore() {
    if (isLoading == true) {
      return Container(
        alignment: Alignment.center,
        child: const SizedBox(
          width: 25.0,
          height: 25.0,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
          ),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: const Text('上拉加载'),
      );
    }
  }

  //上拉刷新
  Future _onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      print('刷新完成');
      setState(() {
        itemCount = 50;
      });
    });
  }

  //下拉加载
  Future _loadMore() {
    // 请求接口
    return Future.delayed(Duration(seconds: 2), () {
      setState(() {
        print('加载完成');
        isLoading = false;
        itemCount += 50;
      });
    });
  }
}
