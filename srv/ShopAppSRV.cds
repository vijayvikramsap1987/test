using {shopApp.model as shopapp} from '../db/shopAppModel';
using {customcds.db as customcds} from '../db/customViews';


@path : '/ShopAPPSRV'
service ShopAppSRV {

    entity OrderDetails        as projection on shopapp.OrderDetails.Order;

    entity OrderItems          as projection on shopapp.OrderDetails.OrderItems {
        * , products : redirected to shopapp.ProductDetails.Product
    };

    entity CustomerDetails     as projection on shopapp.UserDetails.Customer;
    entity EmployeeDetails     as projection on shopapp.UserDetails.Employee;
    entity NotAvailableProduct as projection on customcds.ProductViews.ProductViews;

}
