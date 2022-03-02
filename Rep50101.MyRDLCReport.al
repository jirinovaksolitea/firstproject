report 50101 "My RDLC Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'MyRDLCReport.rdlc';
    Caption = 'Customer categories (RDLC)';


    dataset
    {
        dataitem("Customer Category"; "Customer Category")
        {
            //DataItemTableView = sorting(No);
            RequestFilterFields = No, Description;
            column(Identifier; No)
            {

            }
            column(Description; Description)
            {

            }
            column(Variable; myInt)
            {

            }
            column(TestLabel; myLabel)
            {

            }
            dataitem(FreeGiftsNested; FreeGifts)
            {
                DataItemLinkReference = "Customer Category";
                DataItemLink = CustomerCategoryCode = field(No);
                DataItemTableView = sorting(ItemNo);
                column(ItemNoNested; ItemNo)
                {

                }
            }
            trigger OnPreDataItem()
            begin
                if defaultCategoriesOnly then
                    "Customer Category".SetFilter(No, '*DEFAULT*');
            end;
        }
        dataitem(FreeGifts; FreeGifts)
        {
            DataItemTableView = sorting(ItemNo);
            column(Language; Language)
            {

            }
            column(ItemNo; ItemNo)
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(defaultCategoriesOnly; defaultCategoriesOnly)
                    {
                        ApplicationArea = All;
                        Caption = 'Only default categories?';

                    }
                }
            }
        }

        actions
        {
            area(Reporting)
            {
                action(ActionName)
                {
                    Promoted = true;
                    ApplicationArea = All;
                    Caption = 'Custom Action';

                    trigger OnAction()
                    begin
                        Message('Custom Action fired.');
                    end;

                }
            }
        }
    }

    var
        myInt: Integer;
        myLabel: Label 'Mine test label variable';
        defaultCategoriesOnly: boolean;
}