table 50102 "Customer Category"
{
    DrillDownPageId = "Customer Category List";
    LookupPageId = "Customer Category List";
    Caption = 'Customer Category';

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            NotBlank = true;

            trigger OnValidate()
            begin

            end;
        }

        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }

        field(3; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';
        }

        field(4; TotalCustomersForCategory; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Customer where("Customer Category" = field(No)));
            Caption = 'Total customers for category';
        }

        field(5; EnableNewsletter; Option)
        {
            OptionMembers = " ","Full","Limited";
            OptionCaption = ' ,Full,Limited';
            Caption = 'Enable Newsletter';
            DataClassification = CustomerContent;
        }

        field(6; FreeGiftsAvailable; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gifts Available';
        }

        field(7; "Category Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            Caption = 'Category FIlter';
        }

        field(8; "Filtered Category Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Customer where("Customer Category" = field("Category Filter")));
            Caption = 'Filtered category count';
        }

        field(9; "Created By"; Code[50])
        {
            Editable = false;
        }

        field(10; "Created On"; DateTime)
        {
            Editable = false;
        }
    }

    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Created By" := UserId();
        "Created On" := System.CurrentDateTime();
    end;

    trigger OnDelete()
    var
        GiftRec: Record "FreeGifts";
        CustomerRec: Record "Customer";
    begin
        GiftRec.FilterGroup(-1);
        GiftRec.SetRange(CustomerCategoryCode, Rec.No);
        GiftRec.SetRange(ItemNo, '1120');
        Message('FilterGroup = %1, Count = %2', GiftRec.FilterGroup(), Format(GiftRec.Count()));


        GiftRec.SetRange(CustomerCategoryCode, Rec.No);
        //GiftRec.DeleteAll();

        CustomerRec.SetRange("Customer Category", Rec.No);
        //CustomerRec.ModifyAll("Customer Category", '');

    end;

}