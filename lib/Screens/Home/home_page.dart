import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nyt/Screens/Details/details_page.dart';
import 'package:nyt/widgets/articalItem.dart';

import 'package:nyt/widgets/bottom_looader.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bloc/cubit.dart';
import 'bloc/states.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController? _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeCubit()..getstories(),
        child: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
          if (state is HomeGetListerrorState) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }, builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Scaffold(
            body: SmartRefresher(
              controller: _refreshController!,
              enablePullUp: true,
              header: MaterialClassicHeader(
                color: Colors.lightBlue,
              ),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = Text("pull up load");
                  } else if (mode == LoadStatus.loading) {
                    body = BottomLoader();
                  } else if (mode == LoadStatus.failed) {
                    body = Text("Load Failed!Click retry!");
                  } else if (mode == LoadStatus.canLoading) {
                    body = Text("release to load more");
                  } else {
                    body = Text("No more Data");
                  }
                  return Container(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              onRefresh: () {
                homeCubit.getstories();
                _refreshController!.refreshCompleted();
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    brightness: Brightness.light,
                    backgroundColor: Colors.white,
                    title: Text(
                      "NYT BEST STORIES",
                      style: TextStyle(color: Colors.black),
                    ),
                    centerTitle: true,
                    floating: true,
                    elevation: 3,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,
                        height: 10,
                        child: Container(),
                      ),
                    ),
                  ),
                  state is Homeloadingstate
                      ? SliverFillRemaining(
                          child: Container(
                              child: Center(
                            child: CircularProgressIndicator(),
                          )),
                        )
                      : state is HomeGetListerrorState
                          ? SliverFillRemaining(
                              child: Container(
                                  child: Center(
                                child: Text(
                                  state.error,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ArticleDetails(
                                                    article: homeCubit
                                                        .listAcrticls![index],
                                                  )));
                                    },
                                    child: ArticleItem(
                                        results:
                                            homeCubit.listAcrticls![index]),
                                  );
                                },
                                childCount: homeCubit.listAcrticls!.length,
                              ),
                            ),
                ],
              ),
            ),
          );
        }));
  }

  @override
  void dispose() {
    _refreshController!.dispose();
    super.dispose();
  }
}
//List<Results> x = await homeRepository.getstories();
