// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:workout_log/data/strength_history_data_source.dart';
// import 'package:workout_log/domain/models/strength_history_model.dart';
// import 'package:workout_log/domain/repositories/strength_history_repository.dart';

// class MockStrengthDataSource extends Mock
//     implements StrengthHistoryDataSource {}

// void main() {
//   late StrengthHistoryRepository sut;
//   late MockStrengthDataSource strengthDataSource;

//   setUp(() {
//     strengthDataSource = MockStrengthDataSource();
//     sut = StrengthHistoryRepository(strengthDataSource: strengthDataSource);
//   });

//   group('getStrengthStream', () {
//     test('should call strengthDataSource.getStrengthStream method', () {
//       final Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot;
//       //1
//       when(
//         () => strengthDataSource
//             .getStrengthDataSource()
//             .map((querySnapshot) => querySnapshot.docs.map(
//                   (document) {
//                     return StrengthHistoryModel(
//                         bodypart: '1',
//                         date: ('2' as Timestamp).toDate(),
//                         exercise: '3',
//                         reps: '4',
//                         sets: '5',
//                         weight: '6',
//                         id: '7');
//                   },
//                 ).toList()),
//       ).thenAnswer(
//         (_) => querySnapshot.map(
//           (document) {
//             return [
//               StrengthHistoryModel(
//                   id: '1',
//                   bodypart: '2',
//                   date: ('3' as Timestamp).toDate(),
//                   exercise: '4',
//                   reps: '5',
//                   sets: '6',
//                   weight: '7')
//             ];
//           },
//         ),
//       );
//       //2
//       final results = sut.getStrengthStream();
//       //3
//       expect(
//         results,
//         StrengthHistoryModel(
//             id: '1',
//             bodypart: '2',
//             date: ('3' as Timestamp).toDate(),
//             exercise: '4',
//             reps: '5',
//             sets: '6',
//             weight: '7'),
//       );
//     });
//   });
// }
