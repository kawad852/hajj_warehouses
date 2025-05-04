import 'package:shared/shared.dart';

class ChatBubble extends StatelessWidget {
  final String? msg;
  final bool isMe;
  final bool hasError;

  const ChatBubble(this.msg, {super.key, required this.isMe, this.hasError = false});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(kRadiusSecondary);
    return Align(
      alignment: isMe ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
      child: Builder(
        builder: (context) {
          if (hasError) {
            return const Icon(Icons.error);
          }
          if (msg == null) {
            return LoadingAnimationWidget.staggeredDotsWave(
              color: context.colorPalette.primary,
              size: 50,
            );
          }
          return Container(
            constraints: BoxConstraints(maxWidth: context.mediaQuery.width / 1.2),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: const EdgeInsetsDirectional.only(top: 5),
            decoration: BoxDecoration(
              color: isMe ? context.colorPalette.primary : context.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadiusDirectional.only(
                topStart: isMe ? Radius.zero : radius,
                topEnd: isMe ? radius : Radius.zero,
                bottomStart: radius,
                bottomEnd: radius,
              ),
            ),
            child: Text(
              msg!,
              style: TextStyle(
                color: isMe ? context.colorScheme.onPrimary : context.colorScheme.onSurface,
              ),
              textDirection: context.isRTL ? TextDirection.rtl : TextDirection.ltr,
            ),
          );
        },
      ),
    );
  }
}
