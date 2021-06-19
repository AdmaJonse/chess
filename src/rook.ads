with Common_Types;
with Piece;

use Common_Types;

--  @summary
--  The Rook piece object
--
--  @description
--  The Rook implementation. Like all pieces, the Rook extends the abstract
--  Piece object.
--
package Rook is

  type Object is new Piece.Object with null record;

  type Object_Access is access all Object'Class;


  --  Create a new piece.
  --
  --  @param Colour    the colour of the new piece
  --  @param Position  the position of the new piece
  --
  --  @return  an access type referencing the new piece.
  --
  function Make
    (Colour   : in Colour_Type;
     Position : in Position_Type)
     return Object_Access;


  --  Return a boolean indicating whether a move between the current and the
  --  given square valid for a piece of this type.
  --
  --  @param This  the piece object
  --  @param To    the rank and file of the destination
  --
  --  @return  a boolean indicating whether or not the move is valid
  --
  overriding
  function Is_Valid_Move
    (This    : in Object;
     To      : in Position_Type;
     Capture : in Boolean := False)
     return Boolean;


  --  Return the an array of algorithms which can be used to find valid paths
  --  for this piece.
  --
  --  @param This  the piece object
  --
  --  @return  the array of path-finding algorithms.
  --
  overriding
  function Get_Paths
    (This : in Object)
     return Piece.Path_Vector.Vector;


  --  Return a string representation of this piece.
  --
  --  @param This  the piece object
  --
  --  @return  a string representing this piece.
  --
  overriding
  function Image
    (This : in Object)
     return Character;


  --  Return a vector of moves that are blocked for given piece based on the
  --  current state of the game board.
  --
  --  @param This  the piece object
  --
  --  @return  a vector of blocked moves
  --
  overriding
  function Get_Blocked_Squares
    (This : in Object)
     return Position_Vector.Vector;


end Rook;
