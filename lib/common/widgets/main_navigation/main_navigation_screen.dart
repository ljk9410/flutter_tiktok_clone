import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Record Video')),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.5, // 경계선의 그림자 높이
        shadowColor: Colors.black, // 그림자 색상
        surfaceTintColor: Colors.transparent, // Material 3 틴트 색상 제거
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavTab(
              text: 'Home',
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              selectedIndex: _selectedIndex,
              onTap: () => _onTap(0),
            ),
            NavTab(
              text: 'Discover',
              icon: FontAwesomeIcons.compass,
              selectedIcon: FontAwesomeIcons.solidCompass,
              isSelected: _selectedIndex == 1,
              selectedIndex: _selectedIndex,
              onTap: () => _onTap(1),
            ),
            Gaps.h32,
            PostVideoButton(
              onTap: _onPostVideoButtonTap,
              inverted: _selectedIndex != 0,
            ),
            Gaps.h32,
            NavTab(
              text: 'Inbox',
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              isSelected: _selectedIndex == 3,
              selectedIndex: _selectedIndex,
              onTap: () => _onTap(3),
            ),
            NavTab(
              text: 'Profile',
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              isSelected: _selectedIndex == 4,
              selectedIndex: _selectedIndex,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
