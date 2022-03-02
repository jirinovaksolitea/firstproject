table 50103 "FreeGifts"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Free Gift List";
    LookupPageId = "Free Gift List";
    Caption = 'Free Gifts';

    fields
    {
        field(1; CustomerCategoryCode; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer Category";
            Caption = 'Customer Category Code';
        }

        field(2; ItemNo; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
            Caption = 'Item No.';
        }

        field(3; MinimumOrderQuantity; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Minimum Order Quantity';
        }

        field(4; GiftQuantity; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gift Quantity';
        }

        field(5; "Category Description"; Text[50])
        {
            FieldClass = FlowField;
            Caption = 'Category Description';
            CalcFormula = lookup("Customer Category".Description WHERE(No = field(CustomerCategoryCode)));

        }

        field(6; "Item Description"; Text[100])
        {
            FieldClass = FlowField;
            Caption = 'Item Description';
            CalcFormula = lookup("Item".Description where("No." = field(ItemNo)));
        }
        field(7; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Date Filter';
        }
        field(8; "Decimal Filter"; Decimal)
        {
            FieldClass = FlowFilter;
            Caption = 'Decimal Filter';
        }
        field(9; Language; Enum "Gift Language Enum")
        {
            DataClassification = CustomerContent;
            Caption = 'Language';
        }
    }
    keys
    {
        key(PK; CustomerCategoryCode, ItemNo)
        {
            Clustered = true;
        }
    }
}