with Ada.Text_IO;
with Board;
with Common_Types;
with Game;

use Common_Types;

package body Knight is

  function Path_1
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File + 2,
      Rank => Position.Rank + 1));

  function Path_2
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File + 2,
      Rank => Position.Rank - 1));

  function Path_3
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File - 2,
      Rank => Position.Rank + 1));

  function Path_4
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File - 2,
      Rank => Position.Rank - 1));

  function Path_5
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File + 1,
      Rank => Position.Rank + 2));

  function Path_6
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File - 1,
      Rank => Position.Rank + 2));

  function Path_7
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File + 1,
      Rank => Position.Rank - 2));

  function Path_8
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File - 1,
      Rank => Position.Rank - 2));

  ------------------------------------------------------------------------------
  --
  function Make
    (Colour   : in Colour_Type;
     Position : in Position_Type)
     return Object_Access is

  begin

    return new Object'(Colour   => Colour,
                       Position => Position);

  end Make;

  ------------------------------------------------------------------------------
  --
  function Image
    (This : in Object)
     return Character is

    use type Colour_Type;

  begin

    return (if This.Colour = White then 'N' else 'n');

  end Image;

  ------------------------------------------------------------------------------
  --
  function Is_Valid_Move
    (This    : in Object;
     To      : in Common_Types.Position_Type;
     Capture : in Boolean := False)
     return Boolean is

    use type File_Type;
    use type Rank_Type;

    Valid : Boolean := False;

  begin

    -- The same square is always invalid
    if This.Position.File = To.File and This.Position.Rank = To.Rank then
      return False;
    end if;

    Valid := (abs(This.Position.Rank - To.Rank) = 2 and abs(This.Position.File - To.File) = 1) or
             (abs(This.Position.Rank - To.Rank) = 1 and abs(This.Position.File - To.File) = 2);

    return Valid;

  end Is_Valid_Move;

  ------------------------------------------------------------------------------
  --
  function Get_Paths
    (This : in Object)
     return Piece.Path_Vector.Vector is

    Paths : Piece.Path_Vector.Vector := Piece.Path_Vector.Empty_Vector;

  begin

    Paths.Append (Path_1'Access);
    Paths.Append (Path_2'Access);
    Paths.Append (Path_3'Access);
    Paths.Append (Path_4'Access);
    Paths.Append (Path_5'Access);
    Paths.Append (Path_6'Access);
    Paths.Append (Path_7'Access);
    Paths.Append (Path_8'Access);

    return Paths;

  end Get_Paths;

  ----------------------------------------------------------------------------
  --
  function Get_Blocked_Squares
    (This : in Object)
     return Position_Vector.Vector is

    On_Board  : constant Board.Object_Access      := Game.Get_Board;
    Paths     : constant Piece.Path_Vector.Vector := This.Get_Paths;
    Positions : Position_Vector.Vector            := Position_Vector.Empty_Vector;

  begin

    for Path of Paths loop

      declare
        Position : Position_Type := This.Position;
      begin

        Position := Path (Position);

        -- Special Case: A knight can only be blocked if a piece of its own
        --               colour occupies the square already.
        if not On_Board.Get_Square (Position).Is_Empty and then
          On_Board.Get_Square (Position).Get_Contents.Colour = This.Colour then

          Positions.Append (Position);

        end if;

      exception

        when Constraint_Error =>

          -- we've reached the edge of the board
          null;

      end;

    end loop;

    return Positions;

  end Get_Blocked_Squares;

end Knight;
