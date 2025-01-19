// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [CupertinoSheetRoute].

void main() {
  runApp(const AnimationPracticeApp());
}

class AnimationPracticeApp extends StatelessWidget {
  const AnimationPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(title: 'Cupertino Sheet', home: SlideTransitionPage());
    // return const MaterialApp(title: 'Cupertino Sheet', home: HomePage());
  }
}

class SlideTransitionPage extends StatefulWidget {
  const SlideTransitionPage({super.key});

  @override
  State<SlideTransitionPage> createState() => _SlideTransitionPageState();
}

class _SlideTransitionPageState extends State<SlideTransitionPage> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // ref: https://stackoverflow.com/questions/77322077/flutter-is-there-a-good-tutorial-on-offset
    // https://b1san-blog.com/post/flutter/flutter-layout/
    animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.6, 0),
    ).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _startAnim,
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.lightGreen,
                    child: SlideTransition(
                      position: animation,
                      child: const Icon(
                        Icons.ac_unit,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _startAnim() {
    _ctrl.reset();
    _ctrl.forward();
  }
}