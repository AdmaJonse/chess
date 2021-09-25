with Ada.Containers.Vectors;
with Common_Types;

use Common_Types;

--  @summary
--  Chess Piece  
--
--  @description
--  The basic unit of the game of Chess. This is an abstract class that will be
--  extended by each piece type. An implementation of this abstract object will
--  define the set of valid moves by this piece, as well as its representaiton
--  on the board.
--
package Piece is
   
  
  --  The Piece object. This is an abstract type that is used as the base class
  --  for all Piece types. It defines common behaviour that will be implemented
  --  by all pieces.
  --
  type Object is abstract tagged record
    Colour   : Colour_Type := Common_Types.White;
    Position : Position_Type;
  end record;
   
  
  type Object_Access is access all Object'Class;
  
  
  --  A vector of Piece objects.
  --
  package Piece_Vector is new Ada.Containers.Vectors
    (Index_Type   => Natural,
     Element_Type => Object_Access);
  
  --  Return a boolean indicating whether or not the contents of the given piece
  --  vectors are the same.
  --
  --  @param Left   the first piece vector
  --  @param Right  the second piece vector
  --
  --  @return  a boolean indicating whether or not the contents of the piece
  --           vectors are the same.
  --
  function Is_Match 
    (Left, Right : in Piece_Vector.Vector) 
     return Boolean;
  
  
  --  Return a string representation of the given piece vector.
  --
  --  @param Pieces  the piece vector
  --
  --  @return  the string representation of the piece vector.
  --
  function Image
    (Pieces : in Piece_Vector.Vector)
     return String;
  
  
  --  Return a boolean indicating wheter or not the given move is legal.
  --
  --  @param This     the piece object
  --  @param To       the position that the piece is moving to
  --  @param Capture  a boolean indicating whether this move will capture an
  --                  opponent piece.
  --
  --  @return  a boolean indicating whether or not the move is legal.
  --
  function Is_Valid_Move 
    (This    : in Object;
     To      : in Position_Type;
     Capture : in Boolean := False)
     return Boolean is abstract;

  
  --  Return a string representation of the given piece.
  --
  --  @param This  the piece object
  --
  --  @return  a string representation of the piece.
  --
  function Image
    (This : in Object) 
     return Character is abstract;
  
  
  --  A function that defines the pattern used for a possible move in one direction.
  --  The path function will take the given position and return a legal position
  --  that the piece could move to when taking this path. The path function may
  --  be applied to the next position in order to determine another legal position
  --  for certain pieces types (ie: rook, bishop, queen), but not for others that
  --  are limited to a single move or jump (ie: pawn, king, knight).
  --
  --  @param Position  the initial position of the piece
  -- 
  --  @return  the next position when moving in the direction defined by this path.
  --  
  type Path_Function is access function 
    (Position : in Position_Type) 
     return Position_Type;
  
  
  --  A vector of path functions.
  --
  package Path_Vector is new Ada.Containers.Vectors
    (Index_Type   => Natural,
     Element_Type => Path_Function);
  
  
  --  Return the vector of path functions defining all possible paths for the
  --  given piece.
  --
  --  @param This  the piece object
  --
  --  @return  the vector of possible paths
  --
  function Get_Paths
    (This : in Object)
     return Path_Vector.Vector is abstract;
  
  
  --  Return a position vector describing the possible moves for the given piece.
  --
  --  @param This  the piece object
  --
  --  @return  a vector of possible positions for the piece to move to
  --
  function Get_Valid_Moves
    (This : in Object_Access)
     return Position_Vector.Vector;
  
  
  --  Return a vector of positions that are blocked by other pieces. The only
  --  positions that will be included in this vector are those that would have 
  --  been valid moves if not for the blocking piece. All squares that contain 
  --  other pieces owned by the player are considered blocked. If the opponent's 
  --  piece is in the square, it is not considered blocked, but it may block 
  --  moves to positions on the rank or file behind that piece.
  --
  --  This is the abstract function that each piece type must override.
  --
  --  @param This  the piece object
  --
  --  @return  the vector of positions that are blocked
  --
  function Get_Blocked_Squares 
    (This : in Object)
     return Position_Vector.Vector is abstract;
  
  
  -- TODO: This pattern doesn't feel right. There should be a way to define this
  --       blocking function and only override it for the special cases.
  
  
  --  Return a vector of positions that are blocked by other pieces. The only
  --  positions that will be included in this vector are those that would have 
  --  been valid moves if not for the blocking piece. All squares that contain 
  --  other pieces owned by the player are considered blocked. If the opponent's 
  --  piece is in the square, it is not considered blocked, but it may block 
  --  moves to positions on the rank or file behind that piece.
  --
  --  This is the standard blocking check that will be used by most piece types
  --  provided that they are not special cases (ie: pawns or knights). 
  --
  --  @param This  the piece object
  --
  --  @return  the vector of positions that are blocked.
  --
  function Get_Blocked
    (This : in Object_Access)
     return Position_Vector.Vector;
  
  
  --  Return the path function that can be used by the given piece to get to the
  --  given position.
  --
  --  @param This      the piece object.
  --  @param Position  the position to reach
  --
  --  @return  the path function that can be used to reach the position.
  --
  function Get_Path_To_Square
    (This     : in Object_Access;
     Position : in Position_Type)
     return Path_Function;
  
end Piece;
