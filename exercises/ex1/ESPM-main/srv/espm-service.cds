using { sap.ui.espm as my } from '../db/schema';

@path: 'service/ESPM'
service ESPMService {
    entity Customers as projection on my.Customers;
    entity ProductCategories as projection on my.ProductCategories;
    entity Products as projection on my.Products;
    entity ProductTexts as projection on my.ProductTexts;
    entity PurchaseOrderHeaders as projection on my.PurchaseOrderHeaders;
    entity PurchaseOrderItems as projection on my.PurchaseOrderItems;
    entity SalesOrderHeaders as projection on my.SalesOrderHeaders;
    entity SalesOrderItems as projection on my.SalesOrderItems;
    entity Stock as projection on my.Stock;
    entity Suppliers as projection on my.Suppliers;
}
