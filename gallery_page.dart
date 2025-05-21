import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://img.freepik.com/free-photo/students-knowing-right-answer_329181-14271.jpg?ga=GA1.1.1682015544.1694440268&semt=ais_hybrid&w=740',
    'https://img.freepik.com/free-photo/successful-child-with-graduation-cap-backpack-full-books_1098-3455.jpg?ga=GA1.1.1682015544.1694440268&semt=ais_hybrid&w=740',
    'https://img.freepik.com/premium-photo/happy-school-children-holding-stationery-front-school-building_611135-4202.jpg?ga=GA1.1.1682015544.1694440268&semt=ais_hybrid&w=740'
  ];

  GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C61F6),
      body: Stack(
        children: [
          Positioned(
            top: 20.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.w),
                  topRight: Radius.circular(10.w),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: ListView.separated(
                    padding: EdgeInsets.only(bottom: 4.h),
                    itemCount: 10,
                    separatorBuilder: (_, __) => SizedBox(height: 2.h),
                    itemBuilder: (context, index) {
                      final imageUrl1 = imageUrls[index % imageUrls.length];
                      final imageUrl2 =
                          imageUrls[(index + 1) % imageUrls.length];

                      return Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 20.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.w),
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl1),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Container(
                              height: 25.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.w),
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl2),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Row(
                  children: [
                    IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },),
                    SizedBox(width: 4.w),
                    Text(
                      "School Gallery",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
