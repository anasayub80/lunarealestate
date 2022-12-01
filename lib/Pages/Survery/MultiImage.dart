// ignore_for_file: unused_local_variable




// class MultiImageWidget extends StatelessWidget {
//   const MultiImageWidget({multiple_images_picker
//     Key? key,
//     required this.controller,
//     required this.images,
//   }) : super(key: key);

//   final MultiImagePickerController controller;
//   final List<File> images;

//   @override
//   Widget build(BuildContext context) {
//     return MultiImagePickerView(
//       controller: controller,
//       padding: const EdgeInsets.all(10),
//       onChange: (p0) {
//         images.add(File(p0.toString()));
//         print(images);
//       },
//       initialContainerBuilder: (context, pickerCallback) {
//         return Column(
//           children: [
//             SizedBox(
//               height: 45,
//             ),
//             GestureDetector(
//               onTap: pickerCallback,
//               child: Image.asset(
//                 'assets/icons/add.png',
//                 height: 145,
//                 width: 145,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             SizedBox(
//               height: 45,
//             ),
//             Text(
//               'Select Images to Upload',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16.0,
//               ),
//             ),
//           ],
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//         );
//       },
//       addMoreBuilder: (context, pickerCallback) {
//         return GestureDetector(
//           onTap: pickerCallback,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset(
//               'assets/icons/add.png',
//               fit: BoxFit.fill,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
