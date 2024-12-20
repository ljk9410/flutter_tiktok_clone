import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

enum Direction { left, right }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterTap() {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: SafeArea(
              child: AnimatedCrossFade(
                firstChild: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v40,
                    Text(
                      "Watch cool videos!",
                      style: TextStyle(
                        fontSize: Sizes.size36,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Videos are personalized for you based on your interests.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                secondChild: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v40,
                    Text(
                      "Follow the rules",
                      style: TextStyle(
                        fontSize: Sizes.size36,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Take care of one another!",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                crossFadeState: _showingPage == Page.first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 200),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: AnimatedOpacity(
              opacity: _showingPage == Page.first ? 0 : 1,
              duration: const Duration(milliseconds: 200),
              child: CupertinoButton(
                onPressed: _onEnterTap,
                color: Theme.of(context).primaryColor,
                child: const Text(
                  'Enter the App!',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
