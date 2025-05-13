import 'package:app/src/screens/branch/branch_input_screen.dart';
import 'package:shared/shared.dart';

class BranchesScreen extends StatefulWidget {
  final bool showAppBar;

  const BranchesScreen({super.key, this.showAppBar = true});

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  late Stream<List<BranchModel>> _stream;
  late LightBranchModel? _selectedBranch;

  void _initialize() {
    _stream = kFirebaseInstant.branches.whereMyCompany.orderByDesc.snapshots().map((e) {
      return e.docs.map((e) => e.data()).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _initialize();
    _selectedBranch = MySharedPreferences.branch;
  }

  @override
  Widget build(BuildContext context) {
    return BigStreamBuilder(
      stream: _stream,
      onComplete: (context, snapshot) {
        final branches = snapshot.data!;
        return Scaffold(
          appBar:
              widget.showAppBar
                  ? AppBar(
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.navigate((context) {
                            return const BranchInputScreen();
                          });
                        },
                        child: Text("إضافة فرع"),
                      ),
                    ],
                  )
                  : null,
          bottomNavigationBar:
              branches.isNotEmpty
                  ? BottomButton(
                    text:
                        widget.showAppBar
                            ? context.appLocalization.select
                            : context.appLocalization.next,
                    onPressed:
                        _selectedBranch != null
                            ? () {
                              context.userProvider.selectBranch(_selectedBranch!);
                              context.goToNavBar();
                            }
                            : null,
                  )
                  : null,
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
                    context.appLocalization.welcomeTo,
                    style: TextStyle(
                      color: context.colorPalette.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    context.appLocalization.alFarisKitchens,
                    style: TextStyle(
                      color: context.colorPalette.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (branches.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    context.appLocalization.selectBranch,
                    style: TextStyle(
                      color: context.colorPalette.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              else
                StretchedButton(
                  onPressed: () {
                    context.navigate((context) {
                      return const BranchInputScreen();
                    });
                  },
                  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: const Text("إضافة فرع"),
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
                    final isSelected = _selectedBranch?.id == branch.id;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedBranch = LightBranchModel(
                            name: branch.name,
                            id: branch.id,
                            companyId: branch.companyId,
                          );
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
