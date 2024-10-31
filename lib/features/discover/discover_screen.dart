import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  'Top',
  'Users',
  'Videos',
  'Sounds',
  'LIVE',
  'Shopping',
  'Brands',
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _searchTextController = TextEditingController();

  void _onSearchChanged(String value) {
    print(value);
  }

  void _onSearchSubmitted(String value) {
    print(value);
  }

  @override
  void initState() {
    super.initState();
    _searchTextController.value =
        const TextEditingValue(text: 'Default Search');
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: CupertinoSearchTextField(
            controller: _searchTextController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
          bottom: TabBar(
            onTap: (value) => FocusScope.of(context).unfocus(),
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.grey.shade200,
            labelStyle: const TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
            ),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              for (var tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(
                Sizes.size8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size8,
                mainAxisSpacing: Sizes.size8,
                childAspectRatio: 9 / 22,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size4),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: "assets/images/placeholder.jpg",
                        image:
                            "https://images.unsplash.com/photo-1730047624345-cc3924ef8b83?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2fHx8ZW58MHx8fHx8",
                      ),
                    ),
                  ),
                  Gaps.v10,
                  const Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "This is a very long long caption for my tiktok that im upload just now currently",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  Gaps.v6,
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: Sizes.size16,
                          foregroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/48317269?v=4",
                          ),
                        ),
                        Gaps.h4,
                        const Expanded(
                          child: Text(
                            'My avatar is going to be here',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.h4,
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                            Gaps.h2,
                            const Text(
                              '2.1M',
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
