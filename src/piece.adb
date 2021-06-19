with Ada.Text_IO;
with Board;
with Game;

package body Piece is

  ------------------------------------------------------------------------------
  --
  function Get_Valid_Positions
    (This : in Object_Access)
     return Position_Vector.Vector is


    Blocked   : Position_Vector.Vector := This.Get_Blocked_Squares;
    Positions : Position_Vector.Vector := Position_Vector.Empty_Vector;

  begin

    for File in Common_Types.File_Type loop
      for Rank in Common_Types.Rank_Type loop

        declare
          Position : Common_Types.Position_Type := (File, Rank);
        begin
          if not Blocked.Contains (Position) and This.Is_Valid_Move (Position) then
            Positions.Append (Position);
          end if;
        end;
      end loop;
    end loop;

    return Positions;

  end Get_Valid_Positions;

end Piece;
