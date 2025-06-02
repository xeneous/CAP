using { CapProject as serviceCAP } from '../service';

annotate serviceCAP.VH_Categories with {
    @title : 'Categories'
    ID @Common : { 
        Text : category,
        TextArrangement : #TextOnly
     }
} ;
