import 'package:easthardware_pms/domain/models/payment_method.dart';

abstract class PaymentMethodRepository {
  Future<List<PaymentMethod>> getAllPaymentMethods();
  Future<PaymentMethod> getPaymentMethodById(int id);
  Future<PaymentMethod> insertPaymentMethod(PaymentMethod paymentMethod);
  Future<PaymentMethod> updatePaymentMethod(PaymentMethod paymentMethod);
  Future<void> deletePaymentMethod(int id);
}
