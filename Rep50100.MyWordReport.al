report 50100 "My Word Report"
{
    DefaultLayout = Word;
    WordLayout = 'MyWordReport.docx';

    dataset
    {
        dataitem("Customer Category"; "Customer Category")
        {
            //PrintOnlyIfDetail = true;
            column(Identifier; No)
            {

            }
            column(Description; Description)
            {

            }
            dataitem(FreeGiftsNested; FreeGifts)
            {
                //DataItemLinkReference = "Customer Category";
                //DataItemLink = CustomerCategoryCode = field(No);
                column(ItemNoNested; ItemNo)
                {

                }
            }
        }

        dataitem(FreeGifts; FreeGifts)
        {
            column(Language; Language)
            {

            }
            column(ItemNo; ItemNo)
            {

            }
        }
    }
}