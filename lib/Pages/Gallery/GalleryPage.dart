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
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  List img = [
    "20230313_153002.jpg",
    "20230412_115009.jpg",
    "20230412_115036.jpg",
    "20230417_173334.jpg",
    "20230428_110118.jpg",
    "20230517_130221.jpg",
    "20230616_171851.jpg",
    "20240206_093946.jpg",
    "20230718_151310.jpg",
    "20230828_111032.jpg",
    "Front Right.JPG",
    "20240907_125548.jpg",
    "inline-909ddc952569738a28be9e9895995a95.jpg",
    "20230828_111147.jpg",
    "20240130_110505.jpg",
    "Resized_20210320_132531_629897463582730.jpeg",
    "20230616_172333.jpg",
    "Back Left.JPG",
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
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: img.length,
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
                        url: "assets/house_images/${img[index]}",
                      );
                    },
                  ),
                ],
              ).addPadding(horizontal: 25),
            ),
            SizedBox(
              height: 50,
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
                child: ImageView(
                  url: url,
                  isLocal: true,
                ),
                type: PageTransitionType.fade));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          url,
          fit: BoxFit.fill,
          // loadingBuilder: (context, child, loadingProgress) {
          //   if (loadingProgress == null) return child;
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // },
        ),
      ),
    );
  }
}
