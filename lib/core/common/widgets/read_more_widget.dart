import 'package:flutter/material.dart';
import 'package:laza/core/common/app_text_styles.dart';
import 'package:readmore/readmore.dart';

class ReadMoreWidget extends StatelessWidget {
  const ReadMoreWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      style: AppTextStyle.we400Si15ColGrey,
      text,
      trimMode: TrimMode.Line,
      trimLines: 2,
      colorClickableText: Colors.black,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
