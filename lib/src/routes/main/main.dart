import 'dart:async';
//import 'dart:html' as html;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({final Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  var _visible = false;

  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 400),
      () => setState(() => _visible = true),
    );
    _animation = Tween<double>(begin: 1, end: 0.6).animate(
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat(reverse: true),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: -10,
                left: -10,
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Html(
                      key: const Key("constant forever"),
                      shrinkWrap: true,
                      data: '<a href="https://github.com/you"> '
                          '<img loading="lazy" width="149" height="149" '
                          'src="https://github.blog/wp-content/uploads/2008/12/forkme_left_darkblue_121621.png?resize=149%2C149" '
                          'class="attachment-full size-full" alt="Fork me on GitHub" data-recalc-dims="1"> '
                          '</a>',
                      onImageTap: (
                        final url,
                        final context,
                        final attributes,
                        final element,
                      ) =>
                          launch("https://github.com/osumpi"),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      child: Image.asset(
                        'assets/images/banner.png',
                        isAntiAlias: true,
                        colorBlendMode: BlendMode.hardLight,
                        filterQuality: FilterQuality.high,
                        opacity: _animation as Animation<double>,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    child: const Text(
                      "Connecting things | IoT Automation Framework",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
