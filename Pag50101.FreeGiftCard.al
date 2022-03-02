page 50101 FreeGiftCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "FreeGifts";
    Caption = 'Free Gift Card';

    layout
    {
        area(Content)
        {
            group(Category)
            {
                field(CustomerCategoryCode; CustomerCategoryCode)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                }
                field("Category Description"; "Category Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
            }
            group(Item)
            {
                field(ItemNo; ItemNo)
                {
                    ApplicationArea = All;
                    Caption = 'No';
                }
                field("Item Description"; "Item Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
            }
            group(Others)
            {
                field(Language; Language)
                {
                    ApplicationArea = All;
                }
                field(MinimumOrderQuantity; MinimumOrderQuantity)
                {
                    ApplicationArea = All;
                }
                field(GiftQuantity; GiftQuantity)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
