import 'package:flutter/material.dart';
import 'package:plan_execute/Ui/home/components/cutom_drawer.dart';

class CustomDrawerWrapper extends StatefulWidget {
  final CustomDrawerController controller;
  final double drawerWidth;
  final Widget drawer;
  final Widget body;
  CustomDrawerWrapper(
      {required this.drawerWidth,
      required this.body,
      required this.controller,
      required this.drawer,
      Key? key})
      : super(key: key);

  @override
  _CustomDrawerWrapperState createState() => _CustomDrawerWrapperState();
}

class _CustomDrawerWrapperState extends State<CustomDrawerWrapper>
    with SingleTickerProviderStateMixin {
  ScrollController? scrollController;
  double scrolloffset = 0.0;
  AnimationController? iconAnimationController;
  @override
  void initState() {
    iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));
    iconAnimationController
      ?..animateTo(1.0,
          duration: const Duration(milliseconds: 0),
          curve: Curves.fastOutSlowIn);
    scrollController =
        ScrollController(initialScrollOffset: widget.drawerWidth);
    scrollController!
      ..addListener(() {
        if (scrollController!.offset <= 0) {
          if (scrolloffset != 1.0) {
            setState(() {
              scrolloffset = 1.0;
              try {
                // widget.drawerIsOpen!(true);
              } catch (_) {}
            });
          }
          iconAnimationController?.animateTo(0.0,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        } else if (scrollController!.offset > 0 &&
            scrollController!.offset < widget.drawerWidth.floor()) {
          iconAnimationController?.animateTo(
              (scrollController!.offset * 100 / (widget.drawerWidth)) / 100,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        } else {
          if (scrolloffset != 0.0) {
            setState(() {
              scrolloffset = 0.0;
            });
          }
          iconAnimationController?.animateTo(1.0,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        }
      });
    widget.controller.addListener(() {
      onDrawerClick();
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) => getInitState());
    super.initState();
  }

  Future<bool> getInitState() async {
    scrollController?.jumpTo(
      widget.drawerWidth,
    );
    return true;
  }

  void onDrawerClick() {
    //if scrollcontroller.offset != 0.0 then we set to closed the drawer(with animation to offset zero position) if is not 1 then open the drawer
    if (scrollController!.offset != 0.0) {
      scrollController?.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController?.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        controller: scrollController,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: size.height,
          width: size.width + widget.drawerWidth,
          child: Row(
            children: [
              SizedBox(
                width: widget.drawerWidth,
                child: AnimatedBuilder(
                  animation: iconAnimationController!,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      //transform we use for the stable drawer  we, not need to move with scroll view
                      transform: Matrix4.translationValues(
                          scrollController!.offset, 0.0, 0.0),
                      child: widget.drawer,
                      // child: HomeDrawer(
                      //   screenIndex: widget.screenIndex == null
                      //       ? DrawerIndex.HOME
                      //       : widget.screenIndex,
                      //   iconAnimationController: iconAnimationController,
                      //   callBackIndex: (DrawerIndex indexType) {
                      //     onDrawerClick();
                      //     try {
                      //       widget.onDrawerCall!(indexType);
                      //     } catch (e) {}
                      //   },
                      // ),
                    );
                  },
                ),
                // child: Transform(
                //   transform: Matrix4.translationValues(
                //       scrollController?.offset ?? widget.drawerWidth, 0.0, 0.0),
                //   child: CustomDrawer(),
                // ),
              ),
              SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: AppTheme.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 24),
                      ],
                    ),
                    child: Material(child: widget.body),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDrawerController extends ValueNotifier<bool> {
  CustomDrawerController(bool value) : super(false);
  openDrawer() {
    value = true;
    notifyListeners();
  }

  closeDrawer() {
    value = false;
    notifyListeners();
  }

  bool get isOpen => value;
}
