import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InviteCreationgLoadingWidget extends StatelessWidget {
  const InviteCreationgLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          loop: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                width: 350,
                height: 48,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.grey,
                    height: 350,
                    width: 350,
                  )),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey,
                height: 24,
                width: 350,
              ),
              Container(
                color: Colors.grey,
                height: 24,
                width: 350,
              ),
              Container(
                color: Colors.grey,
                height: 24,
                width: 350,
              ),
              Container(
                color: Colors.grey,
                height: 24,
                width: 350,
              ),
              ElevatedButton(
                  onPressed: () {},
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 32,
                    width: 64,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
