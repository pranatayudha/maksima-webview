import '../../ui/views/beranda/beranda_viewmodel.dart';
import '../../ui/views/beranda/prakarsa/prakarsa_viewmodel_ritel.dart';
import '../../ui/views/pipeline/pipeline_viewmodel_ritel.dart';
import '../app/app.locator.dart';

class LocatorHelper {
  static void unregThenRegViewModels() {
    locator.unregister<BerandaViewModel>();
    locator.unregister<PipelineViewModelRitel>();
    locator.unregister<PrakarsaViewModelRitel>();

    locator.registerSingleton(BerandaViewModel());
    locator.registerSingleton(PipelineViewModelRitel());
    locator.registerSingleton(PrakarsaViewModelRitel());
  }

  static void unregThenRegBerandaViewModels() {
    locator.unregister<BerandaViewModel>();
    locator.registerSingleton(BerandaViewModel());
  }
}
