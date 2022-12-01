import 'package:flutter/material.dart';
import 'package:lunarestate/Pages/Gallery/ImageView.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

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
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                CustomAppBar('Gallery'),
              ];
            },
            physics: NeverScrollableScrollPhysics(),
            body: Container(
              child: FutureBuilder<dynamic>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.data != '0') {
                    return SizedBox(
                      height: size.height,
                      width: size.width,
                      child: ListView.builder(
                        itemCount: myList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: ImageView(url: myList[index]),
                                        type: PageTransitionType.fade));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                  height: 220,
                                  width: size.width * 0.65,
                                  child: PhotoView(
                                    backgroundDecoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.01),
                                    ),
                                    imageProvider: NetworkImage(
                                      myList[index],
                                    ),
                                    // imageUrl: myList[index] ?? '',
                                    // height: 220,
                                    // width: size.width * 0.65,
                                    // fit: BoxFit.fill,
                                    loadingBuilder: (context, url) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: Shimmer.fromColors(
                                            highlightColor: Colors.white,
                                            baseColor: Colors.amber.shade600,
                                            child: Container(
                                              margin: EdgeInsets.only(right: 0),
                                              height: 155,
                                              width: size.width * 0.65,
                                              decoration: BoxDecoration(
                                                color: Colors.black26,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ))),
                                    //       period: Duration(seconds: 2),
                                    //     )),
                                    errorBuilder: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
              height: size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff141414).withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
            ),
          ),
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage(
                  'assets/images/tower.jpg',
                ),
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
