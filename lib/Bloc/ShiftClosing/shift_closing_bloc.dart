import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/Api/apiProvider.dart';

abstract class ShiftClosingEvent {}

class ShiftClosing extends ShiftClosingEvent {
  String date;
  ShiftClosing(this.date);
}

// class SaveExpense extendsShiftClosingEvent {
//   String date;
//   String catId;
//   String name;
//   String method;
//   String amount;
//   String locId;
//   SaveExpense(
//       this.date, this.catId, this.name, this.method, this.amount, this.locId);
// }

class ShiftClosingBloc extends Bloc<ShiftClosingEvent, dynamic> {
  ShiftClosingBloc() : super(dynamic) {
    on<ShiftClosing>((event, emit) async {
      await ApiProvider().getShiftClosingAPI(event.date).then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
    // on<SaveExpense>((event, emit) async {
    //   await ApiProvider()
    //       .postExpenseAPI(event.date, event.catId, event.name, event.method,
    //       event.amount, event.locId)
    //       .then((value) {
    //     emit(value);
    //   }).catchError((error) {
    //     emit(error);
    //   });
    // });
  }
}
