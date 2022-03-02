page 50105 "Free Gift List"
{
    PageType = List;
    SourceTable = FreeGifts;
    UsageCategory = Lists;
    Caption = 'Free Gift Setup';

    CardPageId = 50101;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CustomerCategoryCode; CustomerCategoryCode)
                {
                    ApplicationArea = All;
                }
                field("Category Description"; "Category Description")
                {
                    ApplicationArea = All;
                    //Editable = false;

                    DrillDown = false;
                }
                field(ItemNo; ItemNo)
                {
                    ApplicationArea = All;
                }
                field("Item Description"; "Item Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                    DrillDown = true;
                }
                field(Language; Language)
                {
                    ApplicationArea = All;
                }
                field(MinimumOrderQuantity; MinimumOrderQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
                field(GiftQuantity; GiftQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
            }
        }
    }

}