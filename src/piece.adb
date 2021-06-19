with Ada.Text_IO;
with Board;
with Common_Types;
with Game;

use Common_Types;

package body Piece is

  ------------------------------------------------------------------------------
  --
  function Get_Valid_Moves
    (This : in Object_Access)
     return Position_Vector.Vector is


    Blocked   : Position_Vector.Vector := This.Get_Blocked_Squares;
    Positions : Position_Vector.Vector := Position_Vector.Empty_Vector;

  begin

    for File in File_Type loop
      for Rank in Rank_Type loop

        declare
          Position : constant Position_Type := (File, Rank);
        begin
          if not Blocked.Contains (Position) and This.Is_Valid_Move (Position) then
            Positions.Append (Position);
          end if;
        end;
      end loop;
    end loop;

    Ada.Text_IO.Put_Line ("Valid Moves: " & Image (Positions));

    return Positions;

  end Get_Valid_Moves;

  ------------------------------------------------------------------------------
  --
  function Get_Blocked
    (This : in Object_Access)
     return Position_Vector.Vector is

    On_Board  : constant Board.Object_Access      := Game.Get_Board;
    Paths     : constant Piece.Path_Vector.Vector := This.Get_Paths;
    Positions : Position_Vector.Vector            := Position_Vector.Empty_Vector;


  begin

    for Path of Paths loop

      declare
        End_Found : Boolean       := False;
        Position  : Position_Type := This.Position;
        Blocked   : Boolean       := False;
        Capture   : Boolean       := False;
      begin

        loop

          Position := Path (Position);

          -- special case - if the first piece encountered is of the opposite
          -- colour, then it can be captured. The square is not blocked.
          Capture := not Capture and then not Blocked and then
            not On_Board.Get_Square (Position).Is_Empty and then
            On_Board.Get_Square (Position).Get_Contents.Colour /= This.Colour;

          if not On_Board.Get_Square (Position).Is_Empty then
            Blocked := True;
          end if;

          if not Capture and Blocked and not Positions.Contains (Position) then
            Positions.Append (Position);
          end if;

        end loop;

      exception

        when Constraint_Error =>

          -- we've reached the edge of the board
          null;

      end;

    end loop;

    return Positions;

  end Get_Blocked;

end Piece;
