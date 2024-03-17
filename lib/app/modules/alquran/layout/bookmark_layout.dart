import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelajarnupatrang/app/data/model/bookmark.dart';

import '../../../constant/size_config.dart';
import '../controllers/alquran_controller.dart';

class BookmarkLayout extends GetView<AlquranController> {
  const BookmarkLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return FutureBuilder(
      future: controller.getAllBookmark(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text('Tidak Ada Data'),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: sizeConfig.getProportionateScreenHeight(20),
          ),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data = snapshot.data![index];
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.bookmark_add,
                        color: Colors.brown,
                      ),
                      SizedBox(
                        width: sizeConfig.getProportionateScreenWidth(10),
                      ),
                      Text(
                        'QS. ${data['nameOfSurah']} : Ayat ${data['numberOfVerses']}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        borderRadius: BorderRadius.circular(360),
                        onTap: () {
                          controller.deleteBookmark(data['id']);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(
                            sizeConfig.getProportionateScreenWidth(2.5),
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
