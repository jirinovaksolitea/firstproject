
tableextension 50106 CustomerExt extends Customer
{
    fields
    {
        field(50100; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }

        field(50101; "Customer Category"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Category';
            TableRelation = "Customer Category";
        }
    }
}

pageextension 50100 CustomerListExt extends "Customer List"
{
    layout
    {
        addafter(Name)//addlast(Control1)
        {
            field("Customer Category"; "Customer Category")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnOpenPage();
    begin
        //Message('Customer List > OnOpenPage trigger');
    end;

}

pageextension 50101 CustomerCardExt extends "Customer Card"
{
    layout
    {
        /*addafter(Name)*/
        addlast(General)
        {
            field(Description; Description)
            {
                ToolTip = 'Description field';
                ApplicationArea = All;

            }
            field("Customer Category"; "Customer Category")
            {
                ToolTip = 'Category field';
                ApplicationArea = All;
                TableRelation = "Customer Category";
            }
        }
    }

    trigger OnOpenPage();
    var
        CustCat1: Record "Customer Category";
        CustCat2: Record "Customer Category";
        CustomerCategoryUnit: codeunit "Customer Category Unit";
    begin
        //Message('Customer Card > OnOpenPage trigger');
        //MESSAGE('[' + FORMAT(Name) + ']:Name');
        //MESSAGE('[' + FORMAT(Address) + ']:Address');
        //MESSAGE('[' + FORMAT("Last Date Modified") + ']:Last Date Modified');

        Name := 'abc';

        rec."E-Mail" := 'test@mail.com';
        //rec.Modify();

        CustCat1.SetRange("No", 'DEFAULT');
        //Message('1=' + Format(CustCat1.Count()) + ', 2=' + Format(CustCat2.Count()));

    end;

    trigger OnAfterGetRecord()
    //var
    //    CustManagement: Codeunit "Customer Management";
    begin
        Name := 'abc';
    end;

}

tableextension 50100 PurchaseHeaderExt extends "Purchase Header"
{

}
