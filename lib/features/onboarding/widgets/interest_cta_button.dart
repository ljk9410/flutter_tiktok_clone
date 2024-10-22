import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InterestCtaButton extends StatefulWidget {
  const InterestCtaButton({
    super.key,
  });

  @override
  State<InterestCtaButton> createState() => _InterestCtaButtonState();
}

class _InterestCtaButtonState extends State<InterestCtaButton> {
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
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: _isPressed ? 0.5 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(Sizes.size16),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Next',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: Sizes.size20,
            ),
          ),
        ),
      ),
    );
  }
}
