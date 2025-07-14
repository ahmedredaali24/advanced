import 'package:advanced_app/presentation/resources/color_manger.dart';
import 'package:advanced_app/presentation/resources/const_manager.dart';
import 'package:advanced_app/presentation/resources/route_manager.dart';
import 'package:advanced_app/presentation/resources/string_manager.dart';
import 'package:advanced_app/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<SliderObject> _getSliderData() {
    return [
      SliderObject(
        title: AppString.onBoardingTitle1,
        subTitle: AppString.onBoardingSupTitle1,
        image: ImageAsset.onboardingLogo1,
      ),
      SliderObject(
        title: AppString.onBoardingTitle2,
        subTitle: AppString.onBoardingSupTitle2,
        image: ImageAsset.onboardingLogo2,
      ),
      SliderObject(
        title: AppString.onBoardingTitle3,
        subTitle: AppString.onBoardingSupTitle3,
        image: ImageAsset.onboardingLogo3,
      ),
      SliderObject(
        title: AppString.onBoardingTitle4,
        subTitle: AppString.onBoardingSupTitle4,
        image: ImageAsset.onboardingLogo4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      appBar: AppBar(
        backgroundColor: ColorManger.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManger.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(_list[index]);
          }),
      bottomSheet: Container(
        color: ColorManger.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RouteName.loginRoute);
                },
                child: Text(
                  AppString.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManger.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAsset.leftArrowIc),
              ),
              onTap: () {
                _pageController.animateToPage(_getPreviousIndex(),
                    duration:
                        Duration(milliseconds: AppConstant.sliderAnimationTime),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAsset.rightArrowIc),
              ),
              onTap: () {
                _pageController.animateToPage(_getNextIndex(),
                    duration:
                        Duration(milliseconds: AppConstant.sliderAnimationTime),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
        ],
      ),
    );
  }

  int _getPreviousIndex() {
    int previousIndex = --_currentPage;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = ++_currentPage;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentPage) {
      return SvgPicture.asset(ImageAsset.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAsset.solidCircleIc);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(
    this._sliderObject, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}
