const {
    Customers,
    Products,
    Suppliers,
    ProductTexts,
    PurchaseOrderHeaders,
    SalesOrderHeaders
} = cds.entities('sap.ui.espm');

module.exports = async (srv) => {

    srv.before("CREATE", "Customers", async (req) => {
        const noOfEntries = await SELECT.one.from(Customers).columns('MAX(CustomerID) as Number');
        req.data.CustomerID = noOfEntries.Number + 1;
    });

    srv.before("CREATE", "Products", async (req) => {
        const noOfEntries = await SELECT.one.from(Products).columns('MAX(ProductID) as Number');
        req.data.ProductID = noOfEntries.Number + 1;
    });

    srv.before("CREATE", "Suppliers", async (req) => {
        const noOfEntries = await SELECT.one.from(Suppliers).columns('MAX(SupplierID) as Number');
        req.data.SupplierID = noOfEntries.Number + 1;
    });

    srv.before("CREATE", "ProductTexts", async (req) => {
        const noOfEntries = await SELECT.one.from(ProductTexts).columns('MAX(ID) as Number');
        req.data.ID = noOfEntries.Number + 1;
    });

    srv.before("CREATE", "PurchaseOrderHeaders", async (req) => {
        const noOfEntries = await SELECT.one.from(PurchaseOrderHeaders).columns('MAX(PurchaseOrderID) as Number');
        req.data.PurchaseOrderID = noOfEntries.Number + 1;
    });

    srv.before("CREATE", "SalesOrderHeaders", async (req) => {
        const noOfEntries = await SELECT.one.from(SalesOrderHeaders).columns('MAX(SalesOrderID) as Number');
        req.data.SalesOrderID = noOfEntries.Number + 1;
    });

};
