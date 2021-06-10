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
    Colour : Common_Types.Colour := Common_Types.White;
  end record;
   
  type Object_Access is access Object'Class;
  
  package Piece_Vector is new Ada.Containers.Vectors
    (Index_Type   => Natural,
     Element_Type => Object_Access);
  
  function Is_Valid_Move 
    (This : in Object;
     From : in Common_Types.Position_Type;
     To   : in Common_Types.Position_Type)
     return Boolean is abstract;

  function Image
    (This : in Object) 
     return Character is abstract;
  
  function Get_Colour
    (This : in Object) 
     return Common_Types.Colour is (This.Colour);
  
end Piece;
