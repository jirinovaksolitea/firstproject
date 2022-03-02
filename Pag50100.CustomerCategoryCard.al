page 50100 CustomerCategoryCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Customer Category";
    Caption = 'Customer Category Card';

    //Defines the names for promoted categories for actions.
    //PromotedActionCategories = 'New,Process,Report,Manage,New Document,Request Approval,Customer';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = All;

                }
                field(Description; Description)
                {
                    ApplicationArea = All;

                }
            }

            group("Others")
            {
                field(Default; Default)
                {
                    ApplicationArea = All;

                }
                field(TotalCustomersForCategory; TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    Caption = 'Number of uses';

                }
                field(EnableNewsletter; EnableNewsletter)
                {
                    ApplicationArea = All;
                }
                field(FreeGiftsAvailable; FreeGiftsAvailable)
                {
                    ApplicationArea = All;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = All;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            //Defines action that display under the 'Actions' menu.
            action("New Sales Quote")
            {
                ApplicationArea = All;
                RunObject = page "Sales Quote";
                Promoted = true;
                PromotedCategory = New;
                Image = NewSalesQuote;
                trigger OnAction();
                begin

                end;
            }
            action("Banks Account")
            {
                ApplicationArea = All;
                RunObject = page "Customer Bank Account List";
                Promoted = true;

                //Promotes the action to the category named 'Customer'.
                PromotedCategory = Category7;
                Image = BankAccount;
                trigger OnAction();
                begin

                end;
            }

        }
        area(Reporting)
        {

            //Defines action that display under the 'Report' menu.
            action("Statement")
            {
                ApplicationArea = All;
                RunObject = codeunit "Customer Layout - Statement";
                trigger OnAction();
                begin

                end;
            }
        }
    }
    var
        myInt: Integer;
}