using ShopAppSRV as service from '../../srv/ShopAppSRV';

annotate service.OrderDetails with @(UI : {
    SelectionFields : [
        orderItems.products.name,
        deliveredBy,
        orderItems.products.availability
    ],

    LineItem        : [
        {
            Label : 'Delivered By',
            Value : deliveredBy
        },
        {
            Label : 'Customer Name',
            Value : buyerDetails.custName
        },
        {
            Label : 'Product',
            Value : orderItems.products.name
        }
    ],
});
