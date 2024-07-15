import 'package:project_one/packages.dart';

class BannerItem {
  String img;
  String name;
  DateTime date;
  BannerItem(this.name, this.img, this.date);
}

List<BannerItem> banneritems = [
  BannerItem("bab tuma", "images/img1.jpg", DateTime(2024, 06, 12)),
  BannerItem("shahba", "images/img2.jpg", DateTime(2024, 06, 10)),
  BannerItem("jaramana", "images/img3.jpg", DateTime(2024, 06, 25)),
  BannerItem("aleppo", "images/img4.jpg", DateTime(2024, 06, 06)),
];

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewState();
}

class _PageViewState extends State<PageViewWidget> {
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      // margin: const EdgeInsets.symmetric(vertical: 20),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Recommended",
            style: TextStyle(
                color: Colors.deepOrangeAccent[100],
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          height: context.height,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _selectedindex = value;
              });
            },
            controller: PageController(viewportFraction: 0.7),
            itemCount: 4,
            itemBuilder: (context, index) {
              var _scale = (_selectedindex == index) ? 1.0 : 0.8;
              return TweenAnimationBuilder(
                curve: Curves.ease,
                tween: Tween(begin: _scale, end: _scale),
                duration: const Duration(milliseconds: 350),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(banneritems[index].img))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(banneritems[index].name,
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent[100],
                                    fontSize: 14)),
                            Text(
                              banneritems[index].date.toString(),
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent[100],
                                  fontSize: 12),
                            )
                          ]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
