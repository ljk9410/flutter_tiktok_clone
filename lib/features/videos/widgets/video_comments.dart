import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;
  final ScrollController _scrollController = ScrollController();

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopCommenting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onSubmmit() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;

    return Container(
      height: mediaQuerySize.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("2224 comments"),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _stopCommenting,
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    top: Sizes.size10,
                    left: Sizes.size16,
                    right: Sizes.size16,
                    bottom: Sizes.size96 + Sizes.size48,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: Sizes.size20,
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "쩡경",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size14,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Gaps.v4,
                            const Text(
                                "안녕하세요 쩡경입니다 만나서 반갑습니다 이것은 댓글 컴포넌트 입니다."),
                          ],
                        ),
                      ),
                      Gaps.h10,
                      Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size20,
                            color: Colors.grey.shade500,
                          ),
                          Gaps.v2,
                          Text(
                            '52.2K',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: Sizes.size20),
                ),
              ),
              Positioned(
                bottom: 0,
                width: mediaQuerySize.width,
                child: BottomAppBar(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: Sizes.size20,
                        backgroundColor: Colors.grey.shade500,
                        foregroundColor: Colors.white,
                        child: const Text("쩡경"),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: TextField(
                          onTap: _onStartWriting,
                          textInputAction: TextInputAction.newline,
                          onSubmitted: (value) {},
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size12),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12,
                              horizontal: Sizes.size12,
                            ),
                            hintText: "Add a comment...",
                            hintStyle: const TextStyle(
                              fontSize: Sizes.size14,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                right: Sizes.size12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min, // Row의 크기를 최소화
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.at,
                                    color: Colors.black,
                                    size: Sizes.size20,
                                  ),
                                  Gaps.h10,
                                  const FaIcon(
                                    FontAwesomeIcons.gift,
                                    color: Colors.black,
                                    size: Sizes.size20,
                                  ),
                                  Gaps.h10,
                                  const FaIcon(
                                    FontAwesomeIcons.faceSmile,
                                    color: Colors.black,
                                    size: Sizes.size20,
                                  ),
                                  if (_isWriting) ...[
                                    Gaps.h10,
                                    GestureDetector(
                                      onTap: _onSubmmit,
                                      child: FaIcon(
                                        FontAwesomeIcons.circleArrowUp,
                                        color: Theme.of(context).primaryColor,
                                        size: Sizes.size20,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: Sizes.size14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
