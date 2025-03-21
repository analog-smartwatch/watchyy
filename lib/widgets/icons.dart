import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

enum OperatingSystem {
  ios,
  android;
}

class WAIcons {
  OperatingSystem currentOS() {
    return switch (Platform.operatingSystem) {
      'ios' => OperatingSystem.ios,
      'android' => OperatingSystem.android,
      _ => OperatingSystem.android,
    };
  }

  static final IconData home = switch (WAIcons().currentOS()) {
    OperatingSystem.ios => IonIcons.home,
    _ => Icons.home_rounded,
  };

  static final IconData download = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.download_for_offline,
    _ => Bootstrap.cloud_arrow_down_fill,
  };

  static final IconData search = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.search,
    _ => IonIcons.search,
  };

  static final IconData refresh = switch (WAIcons().currentOS()) {
    _ => Icons.refresh,
  };

  static final IconData link = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.link_rounded,
    _ => Bootstrap.link_45deg,
  };

  static final IconData favorite = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.favorite,
    _ => CupertinoIcons.heart_fill,
  };

  static final IconData favoriteOutline = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.favorite_border,
    _ => CupertinoIcons.heart,
  };

  static final IconData check = switch (WAIcons().currentOS()) {
    _ => Icons.check,
  };

  static final IconData checkOutline = switch (WAIcons().currentOS()) {
    _ => Icons.check_circle_outline_rounded,
  };

  static final IconData description = switch (WAIcons().currentOS()) {
    _ => Icons.description,
  };

  static final IconData chevronUp = switch (WAIcons().currentOS()) {
    _ => Icons.expand_less,
  };

  static final IconData chevronDown = switch (WAIcons().currentOS()) {
    _ => Icons.expand_more,
  };

  static final IconData info = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.info,
    _ => CupertinoIcons.info,
  };

  static final IconData more = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.more_horiz,
    _ => CupertinoIcons.ellipsis_circle,
  };

  static final IconData chevronRight = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.chevron_right,
    _ => Icons.chevron_right_rounded,
  };

  static final IconData chevronLeft = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.chevron_left,
    _ => Icons.chevron_left_rounded,
  };

  static final IconData downloading = switch (WAIcons().currentOS()) {
    _ => Icons.downloading,
  };

  static final IconData arrowBack = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.arrow_back,
    _ => CupertinoIcons.arrow_left,
  };

  static final IconData close = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.close,
    _ => IonIcons.close,
  };

  static final IconData cancel = switch (WAIcons().currentOS()) {
    _ => Icons.cancel,
  };

  static final IconData done = switch (WAIcons().currentOS()) {
    _ => Icons.done,
  };

  static final IconData share = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.share,
    _ => CupertinoIcons.share,
  };

  static final IconData delete = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.delete_rounded,
    _ => IonIcons.trash,
  };

  static final IconData bug = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.bug_report_rounded,
    _ => IonIcons.bug,
  };

  static final IconData book = switch (WAIcons().currentOS()) {
    _ => Bootstrap.book,
  };

  static final IconData alertCircle = switch (WAIcons().currentOS()) {
    _ => IonIcons.alert_circle,
  };

  static final IconData chatbox = switch (WAIcons().currentOS()) {
    _ => IonIcons.chatbox,
  };

  static final IconData arrowRight = switch (WAIcons().currentOS()) {
    _ => FontAwesome.arrow_right_solid,
  };

  static final IconData arrowLeft = switch (WAIcons().currentOS()) {
    _ => FontAwesome.arrow_left_solid,
  };

  static final IconData history = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.history,
    _ => CupertinoIcons.clock,
  };

  static final IconData help = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.help,
    _ => CupertinoIcons.question_circle,
  };

  static final IconData settings = switch (WAIcons().currentOS()) {
    OperatingSystem.android => Icons.settings,
    _ => CupertinoIcons.settings,
  };

  static final IconData filter = switch (WAIcons().currentOS()) {
    _ => IonIcons.filter,
  };

  static final IconData warning = switch (WAIcons().currentOS()) {
    _ => IonIcons.warning,
  };

  static final IconData cross = switch (WAIcons().currentOS()) {
    _ => IonIcons.close,
  };

  static final IconData text = switch (WAIcons().currentOS()) {
    _ => Bootstrap.file_text,
  };

  static final IconData watch = switch (WAIcons().currentOS()) {
    _ => IonIcons.watch,
  };
}
