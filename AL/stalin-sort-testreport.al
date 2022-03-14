report 50100 "StalinSort"
{
    ProcessingOnly = true;

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Table)
                {
                    field(TableNo; TableNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Table no.';
                        Lookup = true;
                        trigger OnLookup(var Text: Text): Boolean
                        var
                            AllObjWithCaption: Record AllObjWithCaption;
                            TableObjects: Page "Table Objects";
                        begin
                            TableObjects.SetTableView(AllObjWithCaption);
                            TableObjects.LookupMode(true);
                            if TableObjects.RunModal() = Action::LookupOK then begin
                                TableObjects.GetRecord(AllObjWithCaption);
                                TableNo := AllObjWithCaption."Object ID";
                            end;
                        end;

                    }
                    field(FieldNo; FieldNo)
                    {
                        Caption = 'Field no.';
                        Lookup = true;
                        trigger OnLookup(var Text: Text): Boolean
                        var
                            Field: Record Field;
                            FieldsLookup: Page "Fields Lookup";
                        begin
                            Field.Reset();
                            Field.SetRange(TableNo, TableNo);
                            FieldsLookup.SetTableView(Field);
                            FieldsLookup.LookupMode(true);
                            if FieldsLookup.RunModal() = Action::LookupOK then begin
                                FieldsLookup.GetRecord(Field);
                                FieldNo := Field."No.";
                            end;
                        end;
                    }
                    field(RunTrigger; RunTrigger)
                    {
                        Caption = 'Run trigger';
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        if TableNo = 0 then Error('"Table no." must have a value');
        if FieldNo = 0 then Error('"Field no." must have a value');
    end;

    trigger OnPostReport()
    var
        StalinSort: Codeunit StalinSort;
        RecRef: RecordRef;
    begin
        RecRef.Open(TableNo);
        StalinSort.StalinSort(RecRef, FieldNo, RunTrigger);
    end;

    var
        TableNo: Integer;
        FieldNo: Integer;
        RunTrigger: Boolean;
}