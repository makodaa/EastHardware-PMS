import 'package:easthardware_pms/domain/models/invoice_product.dart';

abstract class InvoiceProductRepository {
  Future<List<InvoiceProduct>> getAllInvoiceProducts();
  Future<InvoiceProduct?> getInvoiceProductById(int id);
  Future<List<InvoiceProduct?>> getInvoiceProductsByInvoiceId(int invoiceId);
  Future<void> createInvoiceProduct(InvoiceProduct invoiceProduct);
  Future<void> updateInvoiceProduct(InvoiceProduct invoiceProduct);
  Future<void> deleteInvoiceProduct(int id);
}
