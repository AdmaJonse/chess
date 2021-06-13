with Ada.Containers.Vectors;
with Common_Types;

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
   
  type Object is abstract tagged record
    Colour   : Common_Types.Colour_Type := Common_Types.White;
    Position : Common_Types.Position_Type;
  end record;
   
  type Object_Access is access Object'Class;
  
  package Piece_Vector is new Ada.Containers.Vectors
    (Index_Type   => Natural,
     Element_Type => Object_Access);
  
  function Is_Valid_Move 
    (This    : in Object;
     To      : in Common_Types.Position_Type;
     Capture : in Boolean := False)
     return Boolean is abstract;

  function Image
    (This : in Object) 
     return Character is abstract;
  
end Piece;
