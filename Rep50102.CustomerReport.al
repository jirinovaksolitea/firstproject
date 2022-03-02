report 50102 "Customer Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'CustomerReport.rdlc';
    Caption = 'Customers (RDLC)';

    dataset
    {
        dataitem(Customer; Customer)
        {
            //PrintOnlyIfDetail = true;
            column(Identifier; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Address; Address)
            {

            }
            column(City; City)
            {

            }
            column("LedgerCount"; AmountCount)
            {

            }
            column("AmountLCY_P"; GetTotalAmountLCY)
            {

            }
            column("AmountLCY_T"; AmountSum)
            {

            }

            trigger OnAfterGetRecord()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
            begin
                CustLedgerEntry.Init();
                CustLedgerEntry.SetLoadFields("Amount (LCY)");
                CustLedgerEntry.SetRange("Customer No.", "No.");
                AmountCount := CustLedgerEntry.Count();
                AmountSum := 0;
                if CustLedgerEntry.FindSet() then begin
                    repeat
                        AmountSum += CustLedgerEntry."Amount (LCY)";
                    until CustLedgerEntry.Next() = 0;
                end;
            end;

            /*dataitem(CustomerLedgers; "Cust. Ledger Entry")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Customer No." = field("No.");
                column(CustomerLedgersCustomerNo;
                "Customer No.")
                {

                }
                column(CustomerLedgersAmountLCY; "Amount (LCY)")
                {

                }
            }*/
        }
    }

    trigger OnInitReport()
    begin
        //AmountCount := 0;
        //AmountSum := 0;
    end;

    var
        AmountCount: Integer;
        AmountSum: Decimal;

}
/*číslo, meno, adresa, mesto

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
}*/
