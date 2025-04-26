import 'package:app/screens_exports.dart';
import 'package:app/src/screens/base/widgets/user_info_widget.dart';
import 'package:shared/shared.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int _currentIndex = 0;
  late PageController _pageController;

  final items = [
    MyIcons.home,
    MyIcons.warehouse,
    MyIcons.addTask,
    MyIcons.calendar,
    MyIcons.profile,
  ];

  final itemsSelected = [
    MyIcons.homeSelected,
    MyIcons.warehouseSelected,
    MyIcons.addTask,
    MyIcons.calendarSelected,
    MyIcons.profileSelected,
  ];

  final screens = [
    const HomeScreen(),
    const WarehouseScreen(),
    Container(),
    const CalenderScreen(),
    const ProfileScreen(),
  ];

  void _onSelect(int index) {
    if (index != 2) {
      setState(() {
        _currentIndex = index;
      });
      _pageController.jumpToPage(_currentIndex);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const TaskDialog();
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool withNotch = MediaQuery.of(context).viewPadding.bottom > 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 80,
        title: const UserInfoWidget(),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: context.colorPalette.greyD9D),
                borderRadius: BorderRadius.circular(kRadiusTertiary),
              ),
              child: const CustomSvg(MyIcons.notification),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: withNotch ? 85 : 75,
        width: context.mediaQuery.width,
        decoration: BoxDecoration(
          color: context.colorPalette.white,
          boxShadow: [
            BoxShadow(
              color: context.colorPalette.grey708,
              offset: const Offset(0.0, 1.0),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Row(
          children:
              screens.map((element) {
                final index = screens.indexOf(element);
                return NavBarItem(
                  onTap: () {
                    _onSelect(index);
                  },
                  isSelected: _currentIndex == index,
                  icon: _currentIndex == index ? itemsSelected[index] : items[index],
                );
              }).toList(),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
    );
  }
}
