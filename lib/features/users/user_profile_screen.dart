import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone/features/users/widgets/property_card.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('User'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.teal,
                      foregroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/10137?v=4',
                      ),
                      child: Text('@user'),
                    ),
                    Gaps.v24,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '@username',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.h4,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.blue,
                          size: Sizes.size16,
                        ),
                      ],
                    ),
                    Gaps.v16,
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const PropertyCard(
                            value: '97',
                            property: 'Followers',
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                            color: Colors.grey.shade400,
                          ),
                          const PropertyCard(
                            value: '10M',
                            property: 'Following',
                          ),
                          VerticalDivider(
                            width: Sizes.size40,
                            thickness: Sizes.size1,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                            color: Colors.grey.shade400,
                          ),
                          const PropertyCard(
                            value: '194.3M',
                            property: 'Likes',
                          ),
                        ],
                      ),
                    ),
                    Gaps.v24,
                    FractionallySizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size56,
                              vertical: Sizes.size12,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(Sizes.size4),
                            ),
                            child: const Text(
                              'Follow',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Gaps.h4,
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: Sizes.size1,
                              ),
                              borderRadius: BorderRadius.circular(Sizes.size4),
                            ),
                            child: const SizedBox(
                              width: Sizes.size48,
                              height: Sizes.size48,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.youtube,
                                ),
                              ),
                            ),
                          ),
                          Gaps.h4,
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: Sizes.size1,
                              ),
                              borderRadius: BorderRadius.circular(Sizes.size4),
                            ),
                            child: const SizedBox(
                              width: Sizes.size48,
                              height: Sizes.size48,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.caretDown,
                                  size: Sizes.size18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.size32),
                      child: Text(
                        'All highlights and where to watch live matches on FIFA World Cup 2022',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Sizes.size14,
                        ),
                      ),
                    ),
                    Gaps.v14,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size14,
                        ),
                        Gaps.h4,
                        Text(
                          'https://www.tiktok.com/@user',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v16,
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: PersistentTabBar(),
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                  childAspectRatio: 9 / 12,
                ),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Column(
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 9 / 12,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/placeholder.jpg",
                            image:
                                "https://images.unsplash.com/photo-1730047624345-cc3924ef8b83?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2fHx8ZW58MHx8fHx8",
                          ),
                        ),
                        const Positioned(
                          bottom: 4,
                          left: 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.play,
                                size: Sizes.size18,
                                color: Colors.white,
                              ),
                              Gaps.h6,
                              Text(
                                '4.1M',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text('Likes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
