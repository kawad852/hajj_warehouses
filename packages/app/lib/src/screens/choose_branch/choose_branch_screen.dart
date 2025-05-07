import 'package:shared/shared.dart';

class ChooseBranchScreen extends StatefulWidget {
  final bool showAppBar;

  const ChooseBranchScreen({super.key, this.showAppBar = false});

  @override
  State<ChooseBranchScreen> createState() => _ChooseBranchScreenState();
}

class _ChooseBranchScreenState extends State<ChooseBranchScreen> {
  late Future<List<BranchModel>> _future;

  void _initialize() {
    _future = context.appProvider.getBranches();
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BigFutureBuilder(
      future: _future,
      onComplete: (context, snapshot) {
        final branches = snapshot.data!;
        return Scaffold(
          appBar: widget.showAppBar ? AppBar() : null,
          bottomNavigationBar: BottomButton(
            text: widget.showAppBar ? "إختيار" : "التالي",
            onPressed:
                MySharedPreferences.branch != null
                    ? () {
                      context.goToNavBar();
                    }
                    : null,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: context.mediaQuery.width, height: widget.showAppBar ? 20 : 100),
              const CustomSvg(MyIcons.logo),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "اهلاً ومرحباً بك في ",
                    style: TextStyle(
                      color: context.colorPalette.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "“مطابخ الفارس”",
                    style: TextStyle(
                      color: context.colorPalette.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "اختر الفرع",
                  style: TextStyle(
                    color: context.colorPalette.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: branches.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final branch = branches[index];
                    final isSelected = MySharedPreferences.branch?.id == branch.id;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          MySharedPreferences.branch = LightBranchModel(
                            id: branch.id,
                            name: branch.name,
                          );
                        });
                        context.userProvider.userDocRef.update({
                          MyFields.branch: MySharedPreferences.branch!.toJson(),
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? context.colorPalette.primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(kRadiusSecondary),
                          border: Border.all(color: context.colorPalette.primary),
                        ),
                        child: Text(
                          branch.name,
                          style: TextStyle(
                            color:
                                isSelected
                                    ? context.colorPalette.white
                                    : context.colorPalette.black001,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
