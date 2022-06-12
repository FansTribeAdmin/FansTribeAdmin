import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool setCodeStatus(DateTime expiryDate) {
  // Add your function code here!
  DateTime now = DateTime.now();
  if (now.compareTo(expiryDate) >= 0) {
    return true;
  }
  return false;
}

String statusLabel(CelebcodeRecord celebcodeRecord) {
  // Add your function code here!
  if (celebcodeRecord.isActive) {
    return 'Active';
  }
  return 'Inactive';
}
