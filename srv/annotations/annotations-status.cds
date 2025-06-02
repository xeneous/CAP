using { CapProject as serviceCAP } from '../service';

annotate serviceCAP.Status with {
    code @title : 'Statu Name'
    @Common : { 
        Text : name, 
        TextArrangement : #TextOnly,
        }
} ;
