with Ada.Text_IO; use Ada.Text_IO;

procedure StalinSort is
    StartIdx : Integer := 1;
    EndIdx : Integer := 6; -- array size is 6
    type IntArray is array (Positive range <>) of Integer;
    Tab : constant IntArray (startIdx .. EndIdx) := (1, 2, 5, 3, 5, 7);
    -- to set array size to 0, replace (1, 2, 5, 3, 5, 7) with (others => 0)
    Curr : Integer := 0;
    NumElementsSurvived : Integer := 0;
begin
    if EndIdx >= StartIdx then
        Curr := Tab(1);
    end if;
    Put ("[");
    for I in StartIdx .. EndIdx loop
        if Tab (I) >= Curr then
            Put (Integer'Image (Tab (I)));
            Curr := Tab(I);
            NumElementsSurvived := NumElementsSurvived + 1;
        end if;
    end loop;
    if NumElementsSurvived < 1 then
        Put ("]");
    else
        Put (" ]");
    end if;
end StalinSort;

