with Board;
with Common_Types;
with Game;

use Common_Types;

package body Pawn is

  function Path_1
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File,
      Rank => Position.Rank + 1));

  function Path_2
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File,
      Rank => Position.Rank + 2));

  function Path_3
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File + 1,
      Rank => Position.Rank + 1));

  function Path_4
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File - 1,
      Rank => Position.Rank + 1));

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

    return (if This.Colour = Common_Types.White then 'P' else 'p');

  end Image;

  ------------------------------------------------------------------------------
  --
  function Is_Valid_Move
    (This    : in Object;
     To      : in Position_Type;
     Capture : in Boolean := False)
     return Boolean is

    use Common_Types;

    use type Common_Types.File_Type;
    use type Common_Types.Rank_Type;

    Valid : Boolean := False;

    Starting_Rank : constant Rank_Type :=
      (if This.Colour = White then 2 else 7);

  begin

    -- The same square is always invalid
    if This.Position.File = To.File and This.Position.Rank = To.Rank then
      return False;
    end if;

    -- TODO: Special case: en passant

    if This.Colour = White then

      if Capture then

        Valid := abs (To.File - This.Position.File) = 1 and
                 To.Rank = This.Position.Rank + 1;

      elsif This.Position.Rank = Starting_Rank then

        Valid := To.File = This.Position.File and
                 (To.Rank = This.Position.Rank + 1 or
                  To.Rank = This.Position.Rank + 2);
      else

        Valid := To.File = This.Position.File and
                 To.Rank = This.Position.Rank + 1;

      end if;

    else

      if Capture then

        Valid := abs (To.File - This.Position.File) = 1 and
                 To.Rank = This.Position.Rank - 1;

      elsif This.Position.Rank = Starting_Rank then

        Valid := To.File = This.Position.File and
                 (To.Rank = This.Position.Rank - 1 or
                  To.Rank = This.Position.Rank - 2);

      else

        Valid := To.File = This.Position.File and
                 To.Rank = This.Position.Rank - 1;

      end if;

    end if;

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

    return Paths;

  end Get_Paths;

  ------------------------------------------------------------------------------
  --
  function Get_Blocked_Squares
    (This : in Object)
     return Position_Vector.Vector is

    On_Board  : constant Board.Object_Access := Game.Get_Board;
    Positions : Position_Vector.Vector       := Position_Vector.Empty_Vector;

  begin

    -- TODO: Handle en passant

    declare
      Position : Position_Type := This.Position;
    begin

      Position.Rank := Position.Rank + 1;

      if not On_Board.Get_Square (Position).Is_Empty then

        Positions.Append (Position);

      end if;

    exception

      when Constraint_Error =>

        -- we've reached the edge of the board
        null;

    end;

    declare
      Position : Position_Type := This.Position;
    begin

      Position.Rank := Position.Rank + 2;

      if not On_Board.Get_Square (Position).Is_Empty then

        Positions.Append (Position);

      end if;

    exception

      when Constraint_Error =>

        -- we've reached the edge of the board
        null;

    end;

    declare
      Position : Position_Type := This.Position;
    begin

      Position.Rank := Position.Rank + 1;
      Position.File := Position.File + 1;

      if On_Board.Get_Square (Position).Is_Empty or else
         On_Board.Get_Square (Position).Get_Contents.Colour = This.Colour then

        Positions.Append (Position);

      end if;

    exception

      when Constraint_Error =>

        -- we've reached the edge of the board
        null;

    end;

    -- TODO: Being lazy. Replace this with paths like the others.
    declare
      Position : Position_Type := This.Position;
    begin

      Position.Rank := Position.Rank + 1;
      Position.File := Position.File - 1;

      if On_Board.Get_Square (Position).Is_Empty or else
        On_Board.Get_Square (Position).Get_Contents.Colour = This.Colour then

        Positions.Append (Position);

      end if;

    exception

      when Constraint_Error =>

        -- we've reached the edge of the board
        null;

    end;

    return Positions;

  end Get_Blocked_Squares;

end Pawn;
