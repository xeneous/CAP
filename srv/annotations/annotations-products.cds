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
    subCategory @Common:  // Filtro dependiente
    {
        Text: subCategory.subCategory,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'VH_SubCategories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterIn',
                    LocalDataProperty : category_ID,
                    ValueListProperty : 'category_ID'
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : subCategory_ID,
                    ValueListProperty : 'ID'
                }
            ]
        },             
    };
    category @Common: 
    {
        Text: category.category,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'VH_Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : category_ID,
                    ValueListProperty : 'ID'
                }
            ]
        },     
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
    UI.HeaderInfo : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Product',
        TypeNamePlural : 'Products',
        Title : {
            $Type : 'UI.DataField',
            Value : productName
        },
        Description : {
            $Type : 'UI.DataField',
            Value : product
        }
    },
    UI.SelectionFields : [
        product,
        supplier_ID, 
        category_ID, 
        subCategory_ID,
        statu_code
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
    },
    UI.FieldGroup #Header_A : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type   : 'UI.DataField',
                Value   : supplier_ID
            },
            {
                $Type   : 'UI.DataField',
                Value   : category_ID
            },
            {
                $Type   : 'UI.DataField',
                Value   : subCategory_ID
            }
        ]
    }
    ,
    UI.FieldGroup #ProductDescription : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type   : 'UI.DataField',
                Value   : description
            }
        ]
    },
    UI.FieldGroup #ProductStatu : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type   : 'UI.DataField',
                Value   : statu_code,
                Criticality : statu.criticality,
                Label : ''
                
            }
        ]
    },
    UI.FieldGroup #Price : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type   : 'UI.DataField',
                Value   : price,
                Label   : ''
            }
        ]
    },    
    UI.HeaderFacets : [
        {
                $Type   : 'UI.ReferenceFacet',
                Target   : '@UI.FieldGroup#Header_A',
                ID : 'HeaderA'
        },
        {
                $Type   : 'UI.ReferenceFacet',
                Target   : '@UI.FieldGroup#ProductDescription',
                ID : 'ProductDescription',
                Label : 'Product Description'
        },
        {
                $Type   : 'UI.ReferenceFacet',
                Target   : '@UI.FieldGroup#ProductStatu',
                ID : 'ProductStatu',
                Label : 'Availability'
        },
        {
                $Type   : 'UI.ReferenceFacet',
                Target   : '@UI.FieldGroup#Price',
                ID : 'Price',
                Label : 'Price'
        }       
    ]
);


