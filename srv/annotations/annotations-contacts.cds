using { CapProject as serviceCAP } from '../service';

annotate serviceCAP.Contacts with {
    // @title : 'Contacts'
    ID @Common : { 
        Text : fullName,
        TextArrangement : #TextOnly
     };
     fullName @title: 'Full Name';
     phoneNumber @title: 'Phone Number';
     email @title: 'Email';
} ;

annotate serviceCAP.Contacts with @(
     UI.FieldGroup #ContactDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type   : 'UI.DataField',
                Value   : fullName
            },
            {
                $Type   : 'UI.DataField',
                Value   : phoneNumber
            },
            {
                $Type   : 'UI.DataField',
                Value   : email
            }
        ]
    } ,
);

