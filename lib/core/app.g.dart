import 'package:currency_app/core/entites/user_entity.dart';
import 'package:flutter/material.dart';

import '../theme/styles/colors.dart';

UserEntity? me = UserEntity();

OutlineInputBorder outBoard = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(color: ColorManger.whiteColor));