import 'package:app/src/screens/chatbot/widgets/chat_bubble.dart';
import 'package:app/src/screens/chatbot/widgets/chat_editor.dart';
import 'package:shared/shared.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> with AutomaticKeepAliveClientMixin {
  late ScrollController _scrollController;
  late TextEditingController _controller;
  bool _isSendButtonActive = true;

  UserProvider get _userProvider => context.userProvider;
  CollectionReference<MessageModel> get _messagesRef => _userProvider.messagesCollectionRef;

  void _sendMessage() {
    var messageJson =
        MessageModel(id: kUUID, prompt: _controller.text, createTime: DateTime.now()).toJson();
    _messagesRef.doc(messageJson['id']).set(MessageModel.fromJson(messageJson));
    setState(() {
      _controller.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = TextEditingController();
    _controller.addListener(() {
      final text = _controller.text;
      if (text.isEmpty) {
        setState(() {
          _isSendButtonActive = false;
        });
      }
      if (text.isNotEmpty && !_isSendButtonActive) {
        setState(() {
          _isSendButtonActive = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emptyMessages = [
      MessageModel(
        prompt: "context.appLocalization.emptyMsgPrompt1",
        response: "context.appLocalization.emptyMsgResponse1",
      ),
      MessageModel(
        prompt: "context.appLocalization.emptyMsgPrompt2",
        response: "context.appLocalization.emptyMsgResponse2",
      ),
    ];
    super.build(context);
    return CustomFirestoreQueryBuilder(
      query: _messagesRef.orderBy(MyFields.createTime, descending: true),
      // withBackgroundColor: true,
      onComplete: (context, snapshot) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              forceMaterialTransparency: true,
              title: Text(context.appLocalization.khaled),
            ),
            body: Column(
              children: [
                Expanded(
                  child:
                      snapshot.docs.isEmpty
                          ? Padding(
                            padding: const EdgeInsets.all(kScreenMargin),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    ChatBubble(emptyMessages[0].prompt, isMe: false),
                                    ChatBubble(emptyMessages[0].response, isMe: false),
                                  ],
                                ),
                              ],
                            ),
                          )
                          : ListView.separated(
                            controller: _scrollController,
                            itemCount: snapshot.docs.length,
                            reverse: true,
                            separatorBuilder: (context, index) => const SizedBox(height: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            itemBuilder: (context, index) {
                              if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                                snapshot.fetchMore();
                              }

                              if (index == snapshot.docs.length) {
                                return const FPLoading();
                              }

                              final message = snapshot.docs[index].data();

                              return Column(
                                children: [
                                  ChatBubble(message.prompt, isMe: true),
                                  ChatBubble(
                                    message.response,
                                    isMe: false,
                                    hasError: message.status?.state == "ERROR",
                                  ),
                                ],
                              );
                            },
                          ),
                ),
                ChatEditor(
                  controller: _controller,
                  onPressed:
                      _controller.text.trim().isNotEmpty
                          ? () async {
                            _sendMessage();
                            if (_scrollController.hasClients) {
                              _scrollController.animateTo(
                                _scrollController.position.minScrollExtent,
                                duration: const Duration(milliseconds: 350),
                                curve: Curves.easeIn,
                              );
                            }
                          }
                          : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
