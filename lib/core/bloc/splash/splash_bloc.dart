import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gru_chang_thai/app/app.dart';
import 'package:flutter_gru_chang_thai/core/bloc/application/application_bloc.dart';
import 'package:flutter_gru_chang_thai/core/get_it.dart';
import 'package:flutter_gru_chang_thai/core/models/get_home_product_rq.dart';
import 'package:flutter_gru_chang_thai/core/models/get_home_product_rs.dart';
import 'package:flutter_gru_chang_thai/core/models/get_master_config_rq.dart';
import 'package:flutter_gru_chang_thai/core/models/get_master_config_rs.dart';
import 'package:flutter_gru_chang_thai/core/service/master_service.dart';
import 'package:flutter_gru_chang_thai/core/service/product_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final ApplicationBloc applicationBloc;
  final ProductService _productService = getIt<ProductService>();
  final MasterService _masterService = getIt<MasterService>();

  SplashBloc(this.applicationBloc) : super(InitialSplashLoadState()) {
    // SplashLoadInitEvent
    on<SplashLoadInitEvent>((event, emit) => mapSplashLoadInitEventToState(event, emit));
  }

  Future<void> mapSplashLoadInitEventToState(SplashLoadInitEvent event, Emitter<SplashState> emit) async {
    try {
      emit(LoadingSplashLoadInitState(mode: 'Initial data'));

      GetMasterConfigRs getMasterDataRs = await _masterService.getMasterConfig(GetMasterConfigRq());

      // update session
      applicationBloc.add(ApplicationUpdateStateModelEvent(config: getMasterDataRs));

      await Future.delayed(const Duration(seconds: 2));

      emit(LoadingSplashLoadInitState(mode: 'Complete'));

      emit(SuccessSplashLoadInitState());
    } catch (e) {
      debugPrint('$e');
      emit(ErrorSplashLoadInitState());
    }
  }
}
