with Common_Types;
with Piece;

package Pawn is

  type Object is new Piece.Object with null record;

  type Object_Access is access Object'Class;

  function Is_Valid_Move
    (This      : in Object;
     From_File : in Common_Types.File;
     From_Rank : in Common_Types.Rank;
     To_File   : in Common_Types.File;
     To_Rank   : in Common_Types.Rank)
     return Boolean;

  procedure Move
    (This : in Object;
     File : in Common_Types.File;
     Rank : in Common_Types.Rank) is null;

  function Image
    (This : in Object)
     return Character;

  function Make
    (Colour : in Common_Types.Colour)
     return Object_Access;

end Pawn;
