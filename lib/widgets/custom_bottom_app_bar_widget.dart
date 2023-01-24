import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomBottomAppBar extends StatefulWidget {
  final int pagesQuantity;
  int currentIndexPage;
  PageController pageController;
  CustomBottomAppBar(
      {Key? key,
      required this.pagesQuantity,
      required this.currentIndexPage,
      required this.pageController})
      : super(key: key);

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  late final PageController _pageController = widget.pageController;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: widget.currentIndexPage == 0
                  ? MaterialStateProperty.all(Colors.transparent)
                  : MaterialStateProperty.all(Colors.black),
            ),
            label: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.arrow_back),
                Text('Página Anterior'.toUpperCase()),
              ],
            ),
            icon: const SizedBox(),
            onPressed: () {
              if (widget.currentIndexPage > 0) {
                //setState(() {
                widget.currentIndexPage--;
                //});
                _pageController.animateToPage(widget.currentIndexPage,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear);
              }
            },
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: widget.pagesQuantity,
            effect: SwapEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Colors.black,
              dotColor: Colors.grey.shade300,
            ),
          ),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor:
                  widget.currentIndexPage < widget.pagesQuantity - 1
                      ? MaterialStateProperty.all(Colors.black)
                      : MaterialStateProperty.all(Colors.transparent),
            ),
            label: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.arrow_forward),
                Text('Próxima Página'.toUpperCase()),
              ],
            ),
            icon: const SizedBox(),
            onPressed: () {
              if (widget.currentIndexPage < widget.pagesQuantity - 1) {
                //setState(() {
                widget.currentIndexPage++;
                //});

                _pageController.animateToPage(widget.currentIndexPage,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear);
              }
            },
          ),
        ],
      ),
    );
  }
}
