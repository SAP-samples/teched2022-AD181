namespace sap.ui.espm;

using {
    Country ,
    Currency ,
    Language ,
    User ,
    cuid ,
    extensible ,
    managed ,
    temporal
} from '@sap/cds/common';



entity Customers {
    key CustomerID   : Integer64
            @Core.Computed;
        City         : String(40);
        Country      : String(3);
        DateOfBirth  : Date;
        EmailAddress : String(255);
        FirstName    : String(40);
        HouseNumber  : String(10);
        LastName     : String(40);
        PhoneNumber  : String(30);
        PostalCode   : String(10);
        Street       : String(60);
        SalesOrders  : Association to many SalesOrderHeaders
                           on SalesOrders.Customer = $self;
}

entity Suppliers {
    key SupplierID   : Integer64
            @Core.Computed;
        City         : String(40);
        Country      : String(3);
        EmailAddress : String(255);
        HouseNumber  : String(10);
        PhoneNumber  : String(30);
        PostalCode   : String(10);
        Street       : String(60);
        SupplierName : String(80);
        Products     : Association to many Products
                           on Products.Supplier = $self;
}

entity Products {
    key ProductID        : Integer64
            @Core.Computed;
        Category         : String(40);
        CategoryName     : String(40);
        CurrencyCode     : String(5);
        DimensionDepth   : Decimal(13, 4);
        DimensionHeight  : Decimal(13, 4);
        DimensionUnit    : String(3);
        DimensionWidth   : Decimal(13, 4);
        LongDescription  : String(255);
        Name             : String(80);
        Price            : Decimal(23, 3);
        QuantityUnit     : String(3);
        ShortDescription : String(255);
        Weight           : Decimal(13, 3);
        WeightUnit       : String(3);
        Picture          : LargeBinary
            @Core.MediaType : 'image/jpeg';
        Supplier         : Association to one Suppliers;
}

entity ProductCategories {
    key Category         : String(40)
            @Core.Computed;
        CategoryName     : String(40);
        MainCategory     : String(40);
        MainCategoryName : String(40);
        NumberOfProducts : Integer64;

}

entity ProductTexts {
    key ID               : Integer64
    @Core.Computed;
        Language         : String(2);
        LongDescription  : String(255);
        Name             : String;
        ProductID        : Integer64;
        ShortDescription : String(255);
}

entity PurchaseOrderHeaders {
    key PurchaseOrderID : Integer64
            @Core.Computed;
        CurrencyCode    : String(5);
        GrossAmount     : Decimal(15, 3);
        NetAmount       : Decimal(15, 3);
        TaxAmount       : Decimal(15, 3);
        Supplier        : Association to one Suppliers;
        Items           : Association to many PurchaseOrderItems
                              on Items.Header = $self;
}

entity PurchaseOrderItems {
    key PurchaseOrderID : Integer64;
    key ItemNumber      : Integer;
        CurrencyCode    : String(5);
        GrossAmount     : Decimal(15, 3);
        NetAmount       : Decimal(15, 3);
        Quantity        : Decimal(13, 3);
        QuantityUnit    : String(3);
        TaxAmount       : Decimal(15, 3);
        Product         : Association to one Products;
        Header          : Association to one PurchaseOrderHeaders;
}


entity SalesOrderHeaders {
    key SalesOrderID        : Integer64
            @Core.Computed;
        CreatedAt           : DateTime;
        CurrencyCode        : String(5);
        GrossAmount         : Decimal(15, 3);
        LifeCycleStatus     : String(1) not null;
        LifeCycleStatusName : String(255) not null;
        NetAmount           : Decimal(15, 3);
        TaxAmount           : Decimal(15, 3);
        Customer            : Association to one Customers;
        Items               : Association to many SalesOrderItems
                                  on Items.Header = $self;
}


entity SalesOrderItems {
    key SalesOrderID : Integer64;
    key ItemNumber   : Integer;
        CurrencyCode : String(5);
        DeliveryDate : DateTime;
        GrossAmount  : Decimal(15, 3);
        NetAmount    : Decimal(15, 3);
        Quantity     : Decimal(15, 3);
        QuantityUnit : String(3);
        TaxAmount    : Decimal(15, 3);
        Product      : Association to one Products;
        Header       : Association to one SalesOrderHeaders;
}

entity Stock {
    key ProductID       : Integer64;
        LotSize         : Decimal(13, 3);
        MinStock        : Decimal(13, 3);
        Quantity        : Decimal(13, 3);
        QuantityLessMin : Boolean;
}