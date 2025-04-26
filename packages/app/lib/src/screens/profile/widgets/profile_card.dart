import 'package:shared/shared.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String icon;
  final void Function() onTap;
  const ProfileCard({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(kRadiusSecondary),
        onTap: onTap,
        child: Ink(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: context.colorPalette.greyF2F,
            borderRadius: BorderRadius.circular(kRadiusSecondary),
          ),
          child: Row(
            children: [
              CustomSvg(icon),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
