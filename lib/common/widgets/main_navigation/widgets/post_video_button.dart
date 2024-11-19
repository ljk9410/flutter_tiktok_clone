import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatefulWidget {
  final void Function() onTap;
  final bool inverted;

  const PostVideoButton({
    super.key,
    required this.onTap,
    required this.inverted,
  });

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedOpacity(
        opacity: _isPressed ? 0.5 : 1,
        duration: const Duration(milliseconds: 100),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size4,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                right: 19,
                child: Container(
                  height: 32,
                  width: 25,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
                  decoration: BoxDecoration(
                    color: const Color(0xff61d4f0),
                    borderRadius: BorderRadius.circular(Sizes.size8),
                  ),
                ),
              ),
              Positioned(
                left: 19,
                child: Container(
                  height: 32,
                  width: 25,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(Sizes.size8),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size11,
                ),
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.inverted ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(Sizes.size9),
                ),
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  color: widget.inverted ? Colors.white : Colors.black,
                  size: Sizes.size20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
