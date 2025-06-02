using { CapProject as serviceCAP } from '../service';

annotate serviceCAP.Products with {
    product     @title        : 'Product';
    productName @title        : 'Product Name';
    category    @title        : 'Category';
    subCategory @title        : 'SubCategory';
    supplier    @title        : 'Supplier';
    statu       @title        : 'Statu';
    rating      @title        : 'Rating';
    price       @title        : 'Price'  @Measures.ISOCurrency: currency;
    currency    @Common.IsCurrency: true;
};

annotate serviceCAP.Products with {
    statu @Common: 
    {
        Text: statu.name,
        TextArrangement : #TextOnly,
        
    };
    subCategory @Common: 
    {
        Text: subCategory.subCategory,
        TextArrangement : #TextOnly,
        
    };
    category @Common: 
    {
        Text: category.category,
        TextArrangement : #TextOnly,
        
    };
    supplier @Common:
    {
        Text : supplier.supplierName,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Suppliers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : supplier_ID,
                    ValueListProperty : 'ID'
                }
            ]
        },
    }
};
    

annotate serviceCAP.Products with @(
    Capabilities.FilterRestrictions : {
        $Type : 'Capabilities.FilterRestrictionsType',
        FilterExpressionRestrictions : [
            {
                $Type  : 'Capabilities.FilterExpressionRestrictionType',
                AllowedExpressions : 'SearchExpression'
            }
        ]
    },
    UI.HeaderInfo : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Product',
        TypeNamePlural : 'Products'
    },
    UI.SelectionFields : [
        product,
        supplier_ID, 
        category_ID, 
        subCategory_ID
    ],
    UI.LineItem :[
        {
            $Type   : 'UI.DataField',
            Value   : product  
        },
        {
            $Type   : 'UI.DataField',
            Value   : productName  
        },
        {
            $Type   : 'UI.DataField',
            Value   : category_ID
        },
        {
            $Type   : 'UI.DataField',
            Value   : subCategory_ID
        },
        {
            $Type   : 'UI.DataField',
            Value   : statu_code,
            Criticality : statu.criticality,
            ![@HTML5.CssDefaults] : {
                    $Type : 'HTML5.CssDefaultsType',
                    width : '10rem',
                },
        },                      
        {
            $Type   : 'UI.DataFieldForAnnotation',
            Target   : '@UI.DataPoint',
            ![@HTML5.CssDefaults] : {
                    $Type : 'HTML5.CssDefaultsType',
                    width : '10rem',
                },
        },
        {
            $Type   : 'UI.DataField',
            Value   : price
        }  
    ],
    UI.DataPoint: {
        $Type : 'UI.DataPointType',
        Visualization : #Rating, 
        Value : rating
    }
);


