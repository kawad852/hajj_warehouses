import 'package:shared/shared.dart';

class ChooseBranchScreen extends StatefulWidget {
  const ChooseBranchScreen({super.key});

  @override
  State<ChooseBranchScreen> createState() => _ChooseBranchScreenState();
}

class _ChooseBranchScreenState extends State<ChooseBranchScreen> {
  late Future<QuerySnapshot<BranchModel>> _future;

  void _initialize() {
    _future = kFirebaseInstant.branches.orderByDesc.get();
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
        final branches = snapshot.data!.docs;
        return Scaffold(
          bottomNavigationBar: BottomButton(
            text: "التالي",
            onPressed:
                MySharedPreferences.selectedBranchId.isNotEmpty
                    ? () {
                      context.goToNavBar();
                    }
                    : null,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: context.mediaQuery.width, height: 100),
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
                      color: context.colorPalette.grey708,
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
                    final branch = branches[index].data();
                    final isSelected = MySharedPreferences.selectedBranchId == branch.id;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          MySharedPreferences.selectedBranchId = branch.id;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? context.colorPalette.grey708 : Colors.transparent,
                          borderRadius: BorderRadius.circular(kRadiusSecondary),
                          border: Border.all(color: context.colorPalette.grey708),
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
