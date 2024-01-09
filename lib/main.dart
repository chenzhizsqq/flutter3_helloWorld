import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //testMyself
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),

      //GridView sample
      //home: const GridViewSample(),

      //ListView Sample
      //home: const ListViewSample(),

      //TabBarPage Sample
      //home: const TabBarPageSample(),

      //home: const ListViewPage(),

      //导航到一个新页面和返回 ElevatedButton
      //https://flutter.cn/docs/cookbook/navigation/navigation-basics
      home: const FirstRoute(),

      //导航到一个新页面和返回 CupertinoButton
      //home: const FirstRouteCupertinoButton(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Row 1'),
            Text('Row 2'),
            Text('Row 3'),
            Text('Row 4'),
            SizedBox(height: 20),
            DialogExample(),
          ],
        ),
      ),
    );
  }
}

//
class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          icon: const Icon(Icons.ac_unit_sharp), //图标
          title: const Text('AlertDialog'),
          titlePadding: const EdgeInsets.all(20),
          titleTextStyle: const TextStyle(
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          content: const Text('我是AlertDialog对话框'),
          contentPadding: const EdgeInsets.all(40),
          contentTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
          backgroundColor: Color(0xffffffff),
          elevation: 10.0,
          actionsOverflowDirection: VerticalDirection.down,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('确定')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('取消'))
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

//GridView sample
class GridViewSample extends StatelessWidget {
  const GridViewSample({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }),
        ),
      ),
    );
  }
}

//ListViewSample
class ListViewSample extends StatelessWidget {
  const ListViewSample({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160,
                color: Colors.red,
              ),
              Container(
                width: 160,
                color: Colors.blue,
              ),
              Container(
                width: 160,
                color: Colors.green,
              ),
              Container(
                width: 160,
                color: Colors.yellow,
              ),
              Container(
                width: 160,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarPageSample extends StatelessWidget {
  const TabBarPageSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Row(children: const [
                  Icon(Icons.directions_car),
                  SizedBox(width: 5),
                  Text("Car")
                ]),
                Row(children: const [
                  Icon(Icons.directions_transit),
                  SizedBox(width: 5),
                  Text("Transit")
                ]),
                Row(children: const [
                  Icon(Icons.directions_bike),
                  SizedBox(width: 5),
                  Text("Bike")
                ]),
                Row(children: const [
                  Icon(Icons.directions_boat),
                  SizedBox(width: 5),
                  Text("Boat")
                ]),
                Row(children: const [
                  Icon(Icons.directions_railway),
                  SizedBox(width: 5),
                  Text("Railway")
                ]),
                Row(children: const [
                  Icon(Icons.directions_bus),
                  SizedBox(width: 5),
                  Text("Bus")
                ]),
              ],
              isScrollable: true,
            ),
            //背景色
            title: const Text('导航栏'),
            automaticallyImplyLeading: true,
          ),
          body: const TabBarView(
            children: [
              Center(child: GridViewSample()),
              Center(child: Text("Transit")),
              Center(child: Text("Bike")),
              Center(child: Text("Boat")),
              Center(child: Text("Railway")),
              Center(child: Text("Bus"))
            ],
          )),
    );
  }
}

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

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class FirstRouteCupertinoButton extends StatelessWidget {
  const FirstRouteCupertinoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('First Route'),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const SecondRouteCupertinoButton()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRouteCupertinoButton extends StatelessWidget {
  const SecondRouteCupertinoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Second Route'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
