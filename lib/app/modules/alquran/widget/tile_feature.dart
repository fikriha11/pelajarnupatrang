import 'package:flutter/material.dart';

import '../../../constant/color.dart';
import '../../../constant/size_config.dart';

class TileFeature extends StatelessWidget {
  const TileFeature(
      {super.key, required this.title, required this.icon, this.action});
  final String title;
  final IconData icon;
  final Function()? action;

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return InkWell(
      onTap: action ?? () {},
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              icon,
              color: appBlueLight2,
              size: sizeConfig.getProportionateScreenWidth(30),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          Divider(
            thickness: 0.6,
            indent: sizeConfig.getProportionateScreenWidth(20),
            endIndent: sizeConfig.getProportionateScreenWidth(20),
          ),
        ],
      ),
    );
  }
}
