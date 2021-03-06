with Ada.Text_IO;
with Board;
with Common_Types;
with Game;

use Common_Types;

package body Bishop is

  function Path_1
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File + 1,
      Rank => Position.Rank + 1));

  function Path_2
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File + 1,
      Rank => Position.Rank - 1));

  function Path_3
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File - 1,
      Rank => Position.Rank + 1));

  function Path_4
    (Position : in Position_Type)
     return Position_Type is
    ((File => Position.File - 1,
      Rank => Position.Rank - 1));

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

    return (if This.Colour = White then 'B' else 'b');

  end Image;

  ------------------------------------------------------------------------------
  --
  function Is_Valid_Move
    (This    : in Object;
     To      : in Position_Type;
     Capture : in Boolean := False)
     return Boolean is

    use type File_Type;
    use type Rank_Type;

    Valid : Boolean := False;

  begin

    -- The same square is always invalid
    if This.Position = To then
      return False;
    end if;

    Valid := abs (This.Position.Rank - To.Rank) = abs (This.Position.File - To.File);

    return Valid;

  end Is_Valid_Move;

  ------------------------------------------------------------------------------
  --
  function Get_Paths
    (This : in Object)
     return Piece.Path_Vector.Vector is

    use Piece.Path_Vector;

    Paths : Vector := Empty_Vector;

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

    The_Piece : constant Piece.Object_Access := This'Unrestricted_Access;

  begin

    -- TODO: This feels like the wrong way to be dispatching to a common
    --       implementation of Get_Blocked_Squares. Should fix this.

    return Piece.Get_Blocked (The_Piece);

  end Get_Blocked_Squares;

end Bishop;
