using { CapProject as serviceCAP } from '../service';

annotate serviceCAP.VH_SubCategories with {
    @title : 'Sub-Categories'
    ID @Common : { 
        Text : subCategory,
        TextArrangement : #TextOnly
     }
} ;