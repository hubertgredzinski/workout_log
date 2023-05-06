// import 'package:bloc_test/bloc_test.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:workout_log/app/core/enums/enums.dart';
// import 'package:workout_log/data/strength_history_data_source.dart';
// import 'package:workout_log/domain/models/strength_history_model.dart';
// import 'package:workout_log/domain/repositories/strength_history_repository.dart';
// import 'package:workout_log/features/history_training/_strength_history/cubit/strength_history_cubit.dart';

// class MockStrengthRepository extends Mock implements StrengthRepository {}

// void main() {
//   final StrengthDataSource strengthDataSource;
//   late StrengthHistoryCubit sut;
//   late MockStrengthRepository repository;
//   setUp(
//     () {
//       repository = MockStrengthRepository();
//       sut = StrengthHistoryCubit(strengthRepository: repository);
//     },
//   );

//   group(
//     'start',
//     () {
//       group(
//         'success',
//         () {
//           setUp(
//             () {
//               //1
//               when(() => repository.getStrengthStream()).thenAnswer(
//                 (_)  =>
//                     strengthDataSource.getStrengthDataSource().map(
//       (querySnapshot) {
//         return querySnapshot.docs.map(
//           (document) {
//             return StrengthHistoryModel(
//               id: '1',
//               bodypart: '2',
//               date: ('3' as Timestamp).toDate(),
//               exercise: '4',
//               reps: '5',
//               sets: '6',
//               weight:  '7'
//             );
//           },
//         ).toList();
//       },
//     );

//               );
//             },
//           );
// //2

//           blocTest<StrengthHistoryCubit, StrengthHistoryState>(
//             'emits Status.loading then Status.success with results',
//             build: () => sut,
//             act: (cubit) => cubit.start(),
//             //3
//             expect: () => [
//               StrengthHistoryState(status: Status.loading),
//               StrengthHistoryState(strengthDocuments: [
//                 StrengthHistoryModel(
//                     id: '1',
//                     bodypart: '2',
//                     date: ('3' as Timestamp).toDate(),
//                     exercise: '4',
//                     reps: '5',
//                     sets: '6',
//                     weight: '7')
//               ], status: Status.success),
//             ],
//           );
//         },
//       );

//       group(
//         'failure',
//         () {
//           setUp(
//             () {
//               //1
//               when(() => repository.getStrengthStream).thenThrow(
//                 Exception('test-exception-error'),
//               );
//             },
//           );
// //2
//           blocTest<StrengthHistoryCubit, StrengthHistoryState>(
//             'emits Status.loading then Status.error with error message',
//             build: () => sut,
//             act: (cubit) => cubit.start(),
//             //3
//             expect: () => [
//               StrengthHistoryState(status: Status.loading),
//               StrengthHistoryState(
//                 errorMessage: 'Exception: test-exception-error',
//                 status: Status.error,
//               ),
//             ],
//           );
//         },
//       );
//     },
//   );
// }
