using { CapProject as serviceCAP } from '../service';
using from './annotations-contacts.cds';

annotate serviceCAP.Suppliers with {
    @title : 'Suppliers'
    ID @Common : { 
        Text : supplierName,
        TextArrangement : #TextOnly
     };
     supplier @title: 'Supplier';
     supplierName @title: 'Supplier Name';
     webAddress @title: 'web Address';
} ;

annotate serviceCAP.Suppliers with @(
     UI.FieldGroup #SupplierDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type   : 'UI.DataField',
                Value   : supplier
            },
            {
                $Type   : 'UI.DataField',
                Value   : supplierName
            },
            {
                $Type   : 'UI.DataField',
                Value   : webAddress
            }
        ]
    } ,
);

