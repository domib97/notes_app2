import 'package:flutter/material.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/arrow_up_don.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/comment_tweta_body.dart';
import 'package:notes_app2/inspiration/1/views/app_home_view/widgets/home_view/widgets/popupBoutton.dart';

import '../../../../../shared/styles/mode/cubit.dart';

class TwetaView extends StatefulWidget {
  const TwetaView({super.key, this.color, this.titel});

  final Color? color;
  final String? titel;

  @override
  State<TwetaView> createState() => _TwetaViewState();
}

class _TwetaViewState extends State<TwetaView> {
  int es = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CommentTwetaBody(),
          ),
        );
      },
      child: Card(
        color: ModeCubit.get(context).isDark
            ? const Color(0xff26252A)
            : Colors.cyan,
        elevation: 20,
        child: const Column(
          children: [
            Row(
              children: [
                // IconButton list
                //

                Padding(
                  padding: EdgeInsetsDirectional.only(start: 16.0),
                  child: Icon(
                    Icons.location_on,
                    size: 12,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "El Shorouk City",
                      ),
                      Text(
                        " . 1min",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: PopupButton(),
                ),
              ],
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        maxLines: 3,
                        "هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: ArrowUpDon()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
