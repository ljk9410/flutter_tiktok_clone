import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InterestItemButton extends StatefulWidget {
  const InterestItemButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestItemButton> createState() => _InterestItemButtonState();
}

class _InterestItemButtonState extends State<InterestItemButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size20,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(Sizes.size16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
