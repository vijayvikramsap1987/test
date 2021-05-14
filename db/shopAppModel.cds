namespace shopApp.model;


using {common.db as common} from './common';
using {
    cuid,
    Currency
} from '@sap/cds/common';


context ProductDetails {

    entity Product : cuid {
        PARENT_KEY      : UUID;
        name            : String(30);
        imageUrl        : String;
        quantityLeft    : Decimal(3, 2);
        availability    : Boolean;
        pricePerUnit    : common.AmountP;
        CURRENCY_CODE   : Currency;
        discountPercent : Decimal(2, 2);
        quantityUnit    : String;
        description     : String;
        Category        : common.Category;
    }

}

context OrderDetails {
    entity Order : cuid {
        orderStatus  : common.orderStatus;
        deliveredBy  : String;
        buyerDetails : Composition of one UserDetails.Customer
                           on buyerDetails.PARENT_KEY = ID;
        orderItems   : Composition of many OrderItems
                           on orderItems.PARENT_KEY = ID;
        orderPayment : Composition of many PaymentDetails.Payment
                           on orderPayment.PARENT_KEY = ID;
    }


    entity OrderItems : cuid {
        PARENT_KEY : UUID;
        products   : Composition of many ProductDetails.Product
                         on products.PARENT_KEY = ID;
    }
}

context UserDetails {
    entity Employee : cuid {
        empName         : String;
        empEmail        : common.Email;
        phone           : common.Phone;
        empAddress      : Composition of many Address
                              on empAddress.PARENT_KEY = ID;
        empCompensation : Composition of many PaymentDetails.Compensation
                              on empCompensation.PARENT_KEY = ID;
    }


    entity Customer : cuid {
        custName    : String;
        PARENT_KEY  : UUID;
        custEmail   : common.Email;
        phone       : common.Phone;
        custAddress : Composition of many Address
                          on custAddress.PARENT_KEY = ID;
    }


    entity Address : cuid {
        PARENT_KEY  : UUID;
        state       : String;
        city        : String;
        pin         : String;
        address     : String;
        addressType : common.AddressType;
    }

}

context PaymentDetails {
    entity Payment : cuid {
        PARENT_KEY    : UUID;
        paidAmount    : common.AmountP;
        CURRENCY_CODE : Currency;
        pendingAmount : common.AmountP;
    }

    entity Compensation : cuid {
        PARENT_KEY    : UUID;
        salary        : common.AmountP;
        CURRENCY_CODE : Currency;
    }
}
