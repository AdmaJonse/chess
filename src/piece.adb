with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Board;
with Common_Types;
with Game;

use Ada.Strings.Unbounded;
use Common_Types;

package body Piece is

  ------------------------------------------------------------------------------
  --
  function Get_Valid_Moves
    (This : in Object_Access)
     return Position_Vector.Vector is

    On_Board  : constant Board.Object_Access := Game.Get_Board;
    Blocked   : Position_Vector.Vector := This.Get_Blocked_Squares;
    Positions : Position_Vector.Vector := Position_Vector.Empty_Vector;

  begin

    -- TODO: A move that puts your own king into check is not valid

    for File in File_Type loop
      for Rank in Rank_Type loop

        declare
          Position   : constant Position_Type := (File, Rank);
          Is_Capture : constant Boolean       := (if not On_Board.Get_Square (Position).Is_Empty then On_Board.Get_Square (Position).Get_Contents.Colour /= This.Colour else False);
        begin

            if not Blocked.Contains (Position) and
              This.Is_Valid_Move (Position, Is_Capture) then

              Positions.Append (Position);

            end if;

        end;
      end loop;
    end loop;

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
          Capture :=
            not Capture and then
            not Blocked and then
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

  ------------------------------------------------------------------------------
  --
  function Get_Path_To_Square
    (This     : in Object_Access;
     Position : in Position_Type)
     return Path_Function is

    On_Board  : constant Board.Object_Access := Game.Get_Board;

  begin

    for Path of This.Get_Paths loop

      declare
        Current_Position : Position_Type := This.Position;
      begin

        loop

          Current_Position := Path (Position);

          if Position = Current_Position then
            return Path;
          end if;

          -- check if the path is blocked
          if not On_Board.Get_Square (Position).Is_Empty then
            exit;
          end if;

        end loop;

      exception

        when Constraint_Error =>

          -- we've reached the edge of the board
          null;

      end;

    end loop;

    raise Path_Not_Found;

  end Get_Path_To_Square;

  ------------------------------------------------------------------------------
  --
  function Is_Match
    (Left, Right : in Piece_Vector.Vector)
     return Boolean is

    Match_Found : Boolean := False;

  begin

    for I of Left loop

      Match_Found := False;

      for J of Right loop

        if not Match_Found and I.all = J.all then
          Match_Found := True;
        end if;

      end loop;

      if not Match_Found then
        return False;
      end if;

    end loop;

    for I of Right loop

      Match_Found := False;

      for J of Left loop

        if not Match_Found and I.all = J.all then
          Match_Found := True;
        end if;

      end loop;

      if not Match_Found then
        return False;
      end if;

    end loop;

    return True;

  end Is_Match;

  ------------------------------------------------------------------------------
  --
  function Image
    (Pieces : in Piece_Vector.Vector)
     return String is

    Output : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;

  begin

    for P of Pieces loop

      Output := Output & To_Unbounded_String (Image (P.all.Position) & ":" & Image (P.all) & " ");

    end loop;

    return Ada.Strings.Fixed.Trim (To_String (Output), Ada.Strings.Both);

  end Image;

end Piece;
