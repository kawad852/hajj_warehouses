import '../../shared.dart';

const kScreenMargin = 16.0;
const kBurgerImage =
    "https://www.foodandwine.com/thmb/DI29Houjc_ccAtFKly0BbVsusHc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/crispy-comte-cheesburgers-FT-RECIPE0921-6166c6552b7148e8a8561f7765ddf20b.jpg";
const kProviderLogo =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/McDonald%27s_square_2020.svg/1200px-McDonald%27s_square_2020.svg.png";

const kRadiusPrimary = 5.0;
const kRadiusSecondary = 10.0;
const kRadiusTertiary = 15.0;

const kMaxWidth = 600.0;

class MyTheme {
  static final String fontFamily = GoogleFonts.cairo().fontFamily!;

  static const double radiusPrimary = 20;
  static const double radiusSecondary = 16;
  static const double radiusTertiary = 10;

  static bool isLightTheme(BuildContext context) =>
      context.colorScheme.brightness == Brightness.light;

  static Color surfaceTintColor(BuildContext context) => ElevationOverlay.applySurfaceTint(
    context.colorScheme.surface,
    context.colorScheme.surfaceTint,
    1,
  );

  ThemeData materialTheme(
    BuildContext context,
    ColorScheme colorScheme, {
    Color? fillColor,
    CardThemeData? cardThemeData,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      fontFamily: GoogleFonts.cairo().fontFamily!,
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (BuildContext context) {
          return const CustomBack();
        },
      ),
      appBarTheme: const AppBarTheme(centerTitle: true),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: fillColor,
        constraints: const BoxConstraints(maxWidth: 500),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error),
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error),
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
      ),
      cardTheme: cardThemeData,
    );
  }
}
