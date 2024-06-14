import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/Gallery/ImageView.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:page_transition/page_transition.dart';

import '../../Admin/AppTheme.dart';

// ignore: must_be_immutable
class GalleryPage extends StatefulWidget {
  String from;
  GalleryPage({required this.from});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  getData() {
    Future.delayed(Duration(seconds: 3), () {
      return myList;
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  List myList = [
    'https://lunaenterprises.info/wp-content/uploads/2022/09/688e32cd90dbb711edc5812f7d05975d.jpg',
    'https://lunaenterprises.info/wp-content/uploads/2022/09/Cat-Mountain-Residence_2.jpg',
    'https://lunaenterprises.info/wp-content/uploads/2022/09/Far-Pond-House_1.jpg',
    'https://lunaenterprises.info/wp-content/uploads/2022/09/688e32cd90dbb711edc5812f7d05975d.jpg',
    'https://lunaenterprises.info/wp-content/uploads/2022/09/Cat-Mountain-Residence_2.jpg',
    'https://lunaenterprises.info/wp-content/uploads/2022/09/Far-Pond-House_1.jpg',
    'https://lunaenterprises.info/wp-content/uploads/2022/09/688e32cd90dbb711edc5812f7d05975d.jpg',
    'https://lunaenterprises.info/wp-content/uploads/2022/09/Cat-Mountain-Residence_2.jpg',
    'https://lunaenterprises.info/wp-content/uploads/2022/09/Far-Pond-House_1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
        child: Column(
          children: [
            Visibility(
                visible: widget.from != 'nav',
                replacement: SizedBox(
                  height: 35,
                ),
                child: CustomAppBarWithCircleback().addPadding(horizontal: 8)),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gallery',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppThemes.primaryColor,
                          color: AppThemes.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      20.height,
                      FutureBuilder<dynamic>(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.data != '0') {
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: myList.length,
                              gridDelegate: SliverWovenGridDelegate.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                pattern: [
                                  WovenGridTile(1),
                                  WovenGridTile(
                                    5 / 7,
                                    crossAxisRatio: 0.9,
                                    alignment: AlignmentDirectional.centerEnd,
                                  ),
                                ],
                              ),
                              itemBuilder: (context, index) {
                                return GridChild(
                                  url: myList[index],
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: Text(
                                '...',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ).addPadding(horizontal: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class GridChild extends StatelessWidget {
  const GridChild({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: ImageView(url: url), type: PageTransitionType.fade));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          url,
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
