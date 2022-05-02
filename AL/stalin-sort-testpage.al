page 50100 "StalinSort"
{
    ApplicationArea = All;
    Caption = 'Stalin Sort';
    PageType = Card;
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(content)
        {
            group(Introduction)
            {
                field(IntroductionFld; Introduction)
                {
                    Editable = false;
                    MultiLine = true;
                    ShowCaption = false;
                }
            }
            group(Howitworks)
            {
                Caption = 'How it works?';
                field(HowitworksFld; Howitworks)
                {
                    Editable = false;
                    MultiLine = true;
                    ShowCaption = false;
                }
            }
            group(Link)
            {
                Caption = 'GitHub';
                field(LinkFld; Link)
                {
                    Editable = false;
                    MultiLine = true;
                    ShowCaption = false;
                    ExtendedDatatype = URL;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(StalinSortList)
            {
                ApplicationArea = All;
                Caption = 'StalinSort (List)';
                Image = ShowList;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    StalinSort: Codeunit StalinSort;
                    TestList: List of [Integer];
                    Val: Integer;
                    ValText: Text;
                begin
                    TestList.Add(1);
                    TestList.Add(2);
                    TestList.Add(5);
                    TestList.Add(3);
                    TestList.Add(5);
                    TestList.Add(7);
                    foreach val in StalinSort.StalinSort(TestList) do
                        ValText += Format(val) + ', ';
                    Message(CopyStr(ValText, 1, StrLen(ValText) - 2));
                end;
            }

            action(StalinSortTable)
            {
                ApplicationArea = All;
                Caption = 'StalinSort (Table)';
                Image = RemoveLine;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    StalinSort: Report StalinSort;
                begin
                    StalinSort.RunModal();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Introduction := 'Stalin Sort is an efficient sorting algorithm, serving as a systematic method for placing the elements of a random access file or an array in order. Stalin Sort is also know as the best sorting algorithm of all times because of its AMAZING capacity of always ordering an array with an O(n) performance.';
        Howitworks := 'It’s simple, all you need to do is iterate through the array, checking if its elements are in order. Any element that isn’t in order you pull out, in other words, you send it to Gulag.';
        Link := 'https://github.com/gustavo-depaula/stalin-sort';
    end;

    var
        Introduction, Howitworks, Link : Text;
}