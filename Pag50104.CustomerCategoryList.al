page 50104 "Customer Category List"
{
    PageType = List;
    SourceTable = "Customer Category";
    UsageCategory = Lists; //To be inserted in D365BC Search
    Caption = 'Customer Category List';

    CardPageId = 50100;

    HelpLink = 'https://www.google.cz';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Default; Default)
                {
                    ApplicationArea = All;
                }
                field(TotalCustomersForCategory; TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Total Customers for Category';

                    DrillDown = true;
                }
                field("Filtered Category Count"; "Filtered Category Count")
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
        area(factboxes)
        {
        }
    }

    actions
    {
        area(Reporting)
        {
            action("My Report (Word)")
            {
                Promoted = true;
                PromotedCategory = Report;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Report.Run(Report::"My Word Report");
                end;
            }
            action("My Report (RDLC)")
            {
                Promoted = true;
                PromotedCategory = Report;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Report.Run(Report::"My RDLC Report");
                end;
            }
            action("Customer Report")
            {
                Promoted = true;
                PromotedCategory = Report;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Report.Run(Report::"Customer Report");
                end;
            }
        }

        area(Processing)
        {
            action("Hello world message")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message('Hello World');
                end;
            }

            action("Show Gifts")
            {
                Promoted = true;
                PromotedCategory = Process;

                ApplicationArea = All;
                Image = ListPage;
                RunObject = Page "Free Gift List";
                //RunPageLink = "No." = field("No.");
            }

            action("System action")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Options: Text[30];
                    Selected: Integer;
                    Text000: Label 'Save,Delete,Exit,Find';
                    Text001: Label 'You selected option %1.';
                    Text002: Label 'Choose one of the following options:';
                begin
                    Options := Text000;
                    // Sets the default to option 3  
                    Selected := Dialog.StrMenu(Options, 3, Text002);
                    Message(Text001, Selected);
                end;
            }
        }

        area(Creation)
        {
            action("Create Default Category")
            {
                Promoted = true;
                PromotedCategory = New;
                ApplicationArea = All;
                ToolTip = 'Creates a default Customer Category';
                Caption = 'Create default category';

                trigger OnAction();
                var
                    CustomerCategory: Record "Customer Category";
                    CustomerCategoryUnit: codeunit "Customer Category Unit";
                begin
                    //!Integration event raised
                    OnBeforeCreateDefaultCategoryAction(Rec);

                    CUstomerCategory.Init();
                    CustomerCategory.No := CustomerCategoryUnit.FreeIdentifier();
                    CustomerCategory.Description := 'Default Customer Category';
                    CustomerCategory.Default := true;
                    if not CustomerCategory.Insert(true) then
                        Message('Customer Category Insert failed');

                    //!Integration event raised
                    OnAfterCreateDefaultCategoryAction(Rec);
                end;
            }
        }

    }

    trigger OnOpenPage()
    var
        CategoryCodeUnit: codeunit "Customer Category Unit";
        TestRefs: array[2] of RecordRef;
    //TestRef: RecordRef;
    //Msg: Text;
    begin
        TestRefs[1].Open(Database::"Customer Category");
        TestRefs[2].Open(Database::FreeGifts);
        //Message('%1::Count = %2, %3::Count = %4', Database::"Customer Category", TestRefs[1].Count(), Database::FreeGifts, TestRefs[2].Count());
        TestRefs[1].Close();
        TestRefs[2].Close();
        // Msg := Format(Database::"Customer Category") + ' - ';//'50102 - ';
        // TestRef.Open(Database::"Customer Category");//50102);
        // Msg += Format(TestRef.Count());
        // TestRef.Close();
        // Msg += ', ' + Format(Database::FreeGifts) + ' - ';//', 50103 - ';
        // TestRef.Open(Database::FreeGifts);//50103);
        // Msg += Format(TestRef.Count());
        // TestRef.Close();
        // Message(Msg);

        //if Dialog.Confirm(Format(System.WindowsLanguage())) then;

        //CategoryCodeUnit.ProcShowOption(1);
    end;

    [IntegrationEvent(true, true)]
    local procedure OnBeforeCreateDefaultCategoryAction(var CustomerCategory: Record "Customer Category")
    begin
    end;

    [IntegrationEvent(true, true)]
    local procedure OnAfterCreateDefaultCategoryAction(var CustomerCategory: Record "Customer Category")
    begin
    end;
}