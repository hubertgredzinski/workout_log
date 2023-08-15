// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:workout_log/app/core/enums/enums.dart';
// import 'package:workout_log/domain/models/strength_history_model.dart';
// import 'package:workout_log/domain/repositories/strength_history_repository.dart';
// import 'package:workout_log/features/history/_strength_history/cubit/strength_history_cubit.dart';

// class MockStrengthRepository extends Mock
//     implements StrengthHistoryRepository {}

// void main() {
//   late StrengthHistoryCubit sut;
//   late MockStrengthRepository repository;
//   setUp(
//     () {
//       repository = MockStrengthRepository();
//       sut = StrengthHistoryCubit(strengthHistoryRepository: repository);
//     },
//   );

//   group('start', () {
//     setUp(
//       () {
//         when(() => repository.getStrengthStream()).thenAnswer((_) => []);
//       },
//     );
//     blocTest<StrengthHistoryCubit, StrengthHistoryState>(
//       'emits Status.loading then Status.loading then Status.success with results',
//       build: () => sut,
//       act: (cubit) => cubit.start(),
//       expect: () => [
//         StrengthHistoryState(
//           status: Status.loading,
//         ),
//         StrengthHistoryState(
//           status: Status.success,
//           strengthDocuments: [
//             StrengthHistoryModel(
//               bodypart: '1',
//               date: DateTime.now(),
//               exercise: '1',
//               reps: '1',
//               sets: '1',
//               weight: '1',
//               id: '1',
//             ),
//           ],
//         ),
//       ],
//     );
//   });
// }
