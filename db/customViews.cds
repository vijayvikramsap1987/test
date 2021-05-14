namespace customcds.db;

using {shopApp.model as shopapp} from './shopAppModel';

context ProductViews {
    define view![ProductViews] as
        select from shopapp.ProductDetails.Product {
            ID           as![ProductID],
            name         as![ProductName],
            description  as![ProductDescription],
            Category     as![ProductCategory],
            availability as![ProductAvailability]
        }
        where
            availability = false;
}
