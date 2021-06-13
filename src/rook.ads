with Common_Types;
with Piece;

--  @summary
--  The Rook piece object
--
--  @description
--  The Rook implementation. Like all pieces, the Rook extends the abstract
--  Piece object.
--
package Rook is

  type Object is new Piece.Object with null record;

  type Object_Access is access Object'Class;

  --  Return a boolean indicating whether a move between the current and the
  --  given square valid for a piece of this type.
  --
  --  @param This  the piece object
  --  @param To    the rank and file of the destination
  --
  --  @return  a boolean indicating whether or not the move is valid
  --
  function Is_Valid_Move
    (This    : in Object;
     To      : in Common_Types.Position_Type;
     Capture : in Boolean := False)
     return Boolean;


  --  Return a string representation of this piece.
  --
  --  @param This  the piece object
  --
  --  @return  a string representing this piece.
  --
  function Image
    (This : in Object)
     return Character;


  --  Create a new piece.
  --
  --  @param Colour    the colour of the new piece
  --  @param Position  the position of the new piece
  --
  --  @return  an access type referencing the new piece.
  --
  function Make
    (Colour   : in Common_Types.Colour_Type;
     Position : in Common_Types.Position_Type)
     return Object_Access;

end Rook;
