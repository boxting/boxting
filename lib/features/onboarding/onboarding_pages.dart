import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'onboarding_model.dart';

class OnboardingPages extends HookWidget {
  final List<OnboardingModel> pages;
  final Color bgColor;
  final Color themeColor;
  final ValueChanged<String> skipClicked;
  final ValueChanged<String> getStartedClicked;

  OnboardingPages({
    Key key,
    @required this.pages,
    @required this.bgColor,
    @required this.themeColor,
    @required this.skipClicked,
    @required this.getStartedClicked,
  }) : super(key: key);

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final _currentPage = useState<int>(0);
    List<Widget> _buildPageIndicator() {
      List<Widget> list = [];
      for (int i = 0; i < pages.length; i++) {
        list.add(i == _currentPage.value
            ? StepIndicator(isActive: true, themeColor: themeColor)
            : StepIndicator(isActive: false, themeColor: themeColor));
      }
      return list;
    }

    List<Widget> buildOnboardingPages() {
      final children = <Widget>[];
      for (int i = 0; i < pages.length; i++) {
        children.add(ShowPageData(page: pages[i]));
      }
      return children;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        skipClicked("Skip Tapped");
                      },
                      child: Text(
                        'Saltar',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 475.0,
                    color: Colors.transparent,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) => _currentPage.value = page,
                      children: buildOnboardingPages(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _currentPage.value != pages.length - 1
                      ? Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 20, bottom: 10),
                              child: FloatingActionButton(
                                backgroundColor: bgColor,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: themeColor,
                                ),
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Text(''),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage.value == pages.length - 1
          ? GetStartedButton(
              getStartedTapped: () => _getStartedTapped(),
              themeColor: themeColor,
            )
          : Container(),
    );
  }

  void _getStartedTapped() {
    getStartedClicked("Get Started Tapped");
  }
}

class ShowPageData extends StatelessWidget {
  final OnboardingModel page;

  const ShowPageData({Key key, this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(page.imagePath),
              height: 250.0,
              width: 250.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            page.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: page.titleColor,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            page.description,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: page.descripColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  final bool isActive;
  final Color themeColor;
  const StepIndicator({
    Key key,
    @required this.isActive,
    @required this.themeColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? themeColor : Color(0xFF929794),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  final VoidCallback getStartedTapped;
  final Color themeColor;
  const GetStartedButton({
    Key key,
    @required this.getStartedTapped,
    @required this.themeColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 5.0,
        bottom: 30.0,
      ),
      child: BoxtingButton(
        onPressed: getStartedTapped,
        child: Text(
          'Empezar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
