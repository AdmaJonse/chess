with Common_Types;
with Piece;

--  @summary
--  The Bishop piece object
--
--  @description
--  The Bishop implementation. Like all pieces, the Bishop extends the abstract
--  Piece object.
--
package Bishop is

  type Object is new Piece.Object with null record;

  type Object_Access is access Object'Class;

  --  Return a boolean indicating whether a move between the given squares is
  --  valid for a piece of this type.
  --
  --  @param This  the piece object
  --  @param From  the rank and file of the From square
  --  @param To    the rank and file of the To square
  --
  --  @return  a boolean indicating whether or not the move is valid
  --
  function Is_Valid_Move
    (This : in Object;
     From : in Common_Types.Position_Type;
     To   : in Common_Types.Position_Type)
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
  --  @param Colour  the colour of the new piece
  --
  --  @return  an access type referencing the new piece.
  --
  function Make
    (Colour : in Common_Types.Colour)
     return Object_Access;

end Bishop;
