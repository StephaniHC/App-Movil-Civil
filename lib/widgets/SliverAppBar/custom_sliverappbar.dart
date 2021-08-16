import 'package:app_movil_civil/widgets/SliverAppBar/image_circle_widget.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final List<Widget> cards;
  final String title;
  final String subtitle;
  final String fotoUrl;
  final Function logout;

  CustomSliverAppBar({
    @required this.expandedHeight,
    @required this.cards,
    @required this.title,
    @required this.subtitle,
    @required this.fotoUrl,
    this.logout,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        // _crearFondo(context),
        Container(
          color: Theme.of(context).primaryColor,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: _crearFondo(context),
          ),
        ),
        SafeArea(
          child: Center(
            child: Opacity(
              opacity: shrinkOffset / expandedHeight,
              child: Text(
                this.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          // top: expandedHeight / 7 - shrinkOffset,

          top: expandedHeight * .3 -
              MediaQuery.of(context).padding.top -
              shrinkOffset,
          // top: MediaQuery.of(context).padding.top - shrinkOffset,
          left: MediaQuery.of(context).size.width * .05,
          right: MediaQuery.of(context).size.width * .05,
          child: SafeArea(
            child: Column(
              children: [
                Center(
                    child: Opacity(
                  opacity: (1 - shrinkOffset / expandedHeight),
                  child: ImageCircleWidget(
                    padding: 5.0,
                    fotoUrl: this.fotoUrl,
                    height: MediaQuery.of(context).size.height / 9,
                  ),
                )),
                SizedBox(height: 5),
                Center(
                  child: Opacity(
                    opacity: (1 - shrinkOffset / expandedHeight),
                    child: Text(
                      this.subtitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          // top: expandedHeight / 7 - shrinkOffset,

          top: expandedHeight * .3 -
              MediaQuery.of(context).padding.top -
              shrinkOffset,
          // top: MediaQuery.of(context).padding.top - shrinkOffset,
          left: MediaQuery.of(context).size.width * .05,
          right: MediaQuery.of(context).size.width * .05,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Opacity(
                    opacity: (1 - shrinkOffset / expandedHeight),
                    child: ElevatedButton(
                      // style: TextButton.styleFrom(
                      //     backgroundColor: Colors.blue, primary: Colors.white),
                      onPressed: logout,
                      child: Icon(
                        Icons.logout,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   // top: expandedHeight * .65 - shrinkOffset,
        //   top: MediaQuery.of(context).padding.top - shrinkOffset,
        //   left: MediaQuery.of(context).size.width * .05,
        //   right: MediaQuery.of(context).size.width * .05,
        //   child: Center(
        //     child: Opacity(
        //       opacity: (1 - shrinkOffset / expandedHeight),
        //       child: Text(
        //         this.subtitle,
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.w700,
        //           fontSize: 23,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Positioned(
          top: expandedHeight - expandedHeight / 6 - shrinkOffset,
          left: MediaQuery.of(context).size.width * .05,
          right: MediaQuery.of(context).size.width * .05,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: this.cards),
            ),
          ),
        ),
      ],
    );
  }

  Widget _crearFondo(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    final size = MediaQuery.of(context).size;

    final circulo = (double w, [double h]) => Container(
        width: w,
        height: h ?? w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(180),
          color: Color.fromARGB(53, 255, 255, 255),
        ));

    var ctsw = size.width / 375;
    var ctsh = size.height * .5 / 382;
    return Container(
        height: size.height * .5,
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: color,
          ),
          Positioned(top: 150 * ctsh, left: 8 * ctsw, child: circulo(30)),
          Positioned(top: 89 * ctsh, left: 31 * ctsw, child: circulo(69)),
          Positioned(top: -20 * ctsh, left: 69 * ctsw, child: circulo(120)),
          Positioned(top: 113 * ctsh, left: 125 * ctsw, child: circulo(22)),
          Positioned(top: 169 * ctsh, left: 245 * ctsw, child: circulo(53)),
          Positioned(top: 100 * ctsh, left: 297 * ctsw, child: circulo(95)),
          Positioned(top: 86 * ctsh, left: 271 * ctsw, child: circulo(52)),
          Positioned(top: 5 * ctsh, left: 290 * ctsw, child: circulo(60)),
          Positioned(top: 49 * ctsh, left: 221 * ctsw, child: circulo(30)),
        ]));
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
