import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import '../../../infra/infra.dart';
import '../daily/daily_page.dart';
import '../favorites/favorites_page.dart';

enum Tab { daily, favorites }

class IdeasPage extends StatefulWidget {
  const IdeasPage({super.key});

  @override
  State<IdeasPage> createState() => _IdeasPageState();
}

class _IdeasPageState extends State<IdeasPage> {
  List<Tab> get _tabs => [Tab.daily, Tab.favorites];

  Tab _selectedTab = Tab.daily;

  late PageController _pageController;

  late ScrollController _scrollController;

  bool _displayFab = true;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _scrollController = ScrollController()
      ..addListener(
        () {
          final scrollDirection =
              _scrollController.position.userScrollDirection;

          if (scrollDirection == ScrollDirection.reverse && _displayFab) {
            setState(() {
              _displayFab = false;
            });
          } else if (scrollDirection == ScrollDirection.forward) {
            setState(() {
              _displayFab = true;
            });
          }
        },
      );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ideas'.translate(),
              style: AppTextStyles.titleLarge,
            ),
            SvgPicture.asset(
              AppSvgs.instagramLogo,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomSegmentedPicker<Tab>(
                onChanged: (value) {
                  setState(() {
                    _selectedTab = value;
                    _displayFab = true;
                  });

                  _pageController.animateToPage(
                    _tabs.indexOf(_selectedTab),
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                },
                selected: _selectedTab,
                titleBuilder: (tab) {
                  return tab.name.translate();
                },
                options: _tabs,
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  DailyPage(
                    scrollController: _scrollController,
                  ),
                  const FavoritesPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFab(
        visible: _displayFab,
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: Color(0xFFF2F2F2),
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: AppTextStyles.labelExtraSmall,
          unselectedLabelStyle: AppTextStyles.labelExtraSmall,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppSvgs.ideasIcon),
              label: 'ideas'.translate(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppSvgs.strategyIcon),
              label: 'strategy'.translate(),
            ),
          ],
        ),
      ),
    );
  }
}
