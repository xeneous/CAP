using {com.daf.logali as entities}  from '../db/schema';

Service CapProject {
    entity Products as projection on entities.Products;
    entity ProductDetails as projection on entities.ProductDetails;
    /** Value Helps */
    entity VH_Categories as projection on entities.Categories;
    entity VH_SubCategories as projection on entities.SubCategories;
};
