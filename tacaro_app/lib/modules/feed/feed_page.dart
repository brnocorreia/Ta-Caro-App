import 'package:flutter/cupertino.dart';
import 'package:tacaro_app/shared/theme/app_theme.dart';
import 'package:tacaro_app/shared/widgets/app_list_tile.dart';
import 'package:tacaro_app/shared/widgets/card_chart.dart';
import 'package:tacaro_app/shared/widgets/card_product.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardChart(
                    value: 365.0,
                    percent: 0.5,
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Text(
                    "Preço dos produtos",
                    style: AppTheme.textStyles.label,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 126,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CardProduct(
                        like: index % 2 == 0,
                      )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 27,
                  ),
                  Text(
                    "Suas últimas compras",
                    style: AppTheme.textStyles.label,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  AppListTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
