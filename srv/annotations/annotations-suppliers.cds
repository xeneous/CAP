using { CapProject as serviceCAP } from '../service';

annotate serviceCAP.Suppliers with {
    ID @Common : { 
        Text : supplierName,
        TextArrangement : #TextOnly
     }
} ;
