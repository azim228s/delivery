import 'package:delivery/screens/base/base_presenter.dart';
import 'package:delivery/screens/delivery_screen/delivery_view_model.dart';

class DeliveryPresenter extends BasePresenter<DeliveryViewModel>{
  DeliveryPresenter(DeliveryViewModel model) : super(model);

  //TODO: upgrade status and done ones move up
  //TODO: confirm delivery and remove order from list
}