import 'package:flutter/material.dart';

class BelajarAppBar extends StatelessWidget {
  const BelajarAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                const SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  expandedHeight: 200.0,
                  floating: true, // Set this to true
                  snap: true, // Set this to true
                  pinned: false, // Set this to false
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image(
                      image: AssetImage('assets/exam3d.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    const TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.grey,
                      tabs: [
                        Tab(icon: Icon(Icons.school), text: "Ujian"),
                        Tab(icon: Icon(Icons.history), text: "Riwayat"),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              print("Ujian $index");
                            },
                            child: ListTile(
                              title: Text('Ujian $index'),
                              leading: const Icon(Icons.menu_book,
                                  color: Colors.black),
                            ),
                          );
                        },
                        childCount: 10, // Change this as needed
                      ),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              print("Riwayat $index");
                            },
                            child: ListTile(
                              title: Text('Riwayat Ujian $index'),
                              leading: const Icon(
                                Icons.history_edu,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                        childCount: 10, // Change this as needed
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
