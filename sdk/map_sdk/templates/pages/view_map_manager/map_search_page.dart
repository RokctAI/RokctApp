import 'package:core_sdk/src/infrastructure/services/places/places_service.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:merchants_sdk/src/presentation/component/text_fields/search_text_field.dart';
import 'package:${package}/core/presentation/theme/theme.dart';

@RoutePage(name: 'ManagerMapSearchRoute')
class ManagerMapSearchPage extends StatefulWidget {
  const ManagerMapSearchPage({super.key});

  @override
  State<ManagerMapSearchPage> createState() => _MapSearchPageState();
}

class _MapSearchPageState extends State<ManagerMapSearchPage> {
  List<AutocompletePrediction> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              16.verticalSpace,
              SearchTextField(
                //autofocus: true,
                isBorder: true,
                onChanged: (title) async {
                  final res = await googlePlaces.getAutocomplete(title);
                  searchResult = res;
                  setState(() {});
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResult.length,
                  padding: EdgeInsets.only(bottom: 22.h),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.maybePop(searchResult[index].placeId);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          22.verticalSpace,
                          Text(
                            searchResult[index].mainText,
                            style: AppStyle.interNormal(size: 14),
                          ),
                          Text(
                            searchResult[index].secondaryText,
                            style: AppStyle.interNormal(size: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Divider(color: AppStyle.border),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

