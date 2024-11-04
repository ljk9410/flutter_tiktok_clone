import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool _isWriting = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(() {
      if (_messageController.text.isNotEmpty) {
        setState(() {
          _isWriting = true;
        });
      } else {
        setState(() {
          _isWriting = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: ListTile(
                contentPadding: const EdgeInsets.only(right: Sizes.size20),
                horizontalTitleGap: Sizes.size8,
                leading: Stack(
                  children: [
                    const CircleAvatar(
                      radius: Sizes.size20,
                      foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/12671318?v=4",
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(Sizes.size5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: Sizes.size3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                title: const Text(
                  "쩡경",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  "Active now",
                ),
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.flag,
                      color: Colors.black,
                      size: Sizes.size20,
                    ),
                    Gaps.h24,
                    FaIcon(
                      FontAwesomeIcons.ellipsis,
                      color: Colors.black,
                      size: Sizes.size20,
                    ),
                  ],
                )),
          ),
          body: Stack(
            children: [
              ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                  vertical: Sizes.size10,
                ),
                itemBuilder: (context, index) {
                  final isMine = index % 2 == 0;

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isMine
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size10,
                          vertical: Sizes.size8,
                        ),
                        decoration: BoxDecoration(
                          color: isMine
                              ? Colors.blue
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(Sizes.size20),
                            topRight: const Radius.circular(Sizes.size20),
                            bottomLeft: Radius.circular(
                              isMine ? Sizes.size20 : 0,
                            ),
                            bottomRight: Radius.circular(
                              isMine ? 0 : Sizes.size20,
                            ),
                          ),
                        ),
                        child: Text(
                          isMine ? 'This is Mine' : 'This is not Mine',
                          style: const TextStyle(
                            fontSize: Sizes.size14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Gaps.v10,
                itemCount: 10,
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: BottomAppBar(
                  color: Colors.grey.shade100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          style: const TextStyle(
                            fontSize: Sizes.size16,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              top: Sizes.size2,
                              bottom: Sizes.size2,
                              left: Sizes.size12,
                            ),
                            hintText: 'Send a message...',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            suffixIcon: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Gaps.h10,
                                FaIcon(FontAwesomeIcons.faceLaugh),
                              ],
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Sizes.size20),
                                topRight: Radius.circular(Sizes.size20),
                                bottomLeft: Radius.circular(Sizes.size20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gaps.h20,
                      SizedBox(
                        width: Sizes.size40,
                        height: Sizes.size40,
                        child: Container(
                          padding: const EdgeInsets.only(
                            right: Sizes.size3,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _isWriting ? Colors.blue : Colors.grey.shade300,
                          ),
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.paperPlane,
                              color: Colors.white,
                              size: Sizes.size20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
