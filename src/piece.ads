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
   
  type Object is abstract tagged record
    Colour   : Colour_Type := Common_Types.White;
    Position : Position_Type;
  end record;
   
  type Object_Access is access all Object'Class;
  
  package Piece_Vector is new Ada.Containers.Vectors
    (Index_Type   => Natural,
     Element_Type => Object_Access);
  
  function Is_Valid_Move 
    (This    : in Object;
     To      : in Position_Type;
     Capture : in Boolean := False)
     return Boolean is abstract;

  function Image
    (This : in Object) 
     return Character is abstract;
  
  type Path_Function is access function 
    (Position : in Position_Type) 
     return Position_Type;
  
  package Path_Vector is new Ada.Containers.Vectors
    (Index_Type   => Natural,
     Element_Type => Path_Function);
  
  function Get_Paths
    (This : in Object)
     return Path_Vector.Vector is abstract;
  
  function Get_Valid_Moves
    (This : in Object_Access)
     return Position_Vector.Vector;
  
  function Get_Blocked_Squares 
    (This : in Object)
     return Position_Vector.Vector is abstract;
  
  function Get_Blocked
    (This : in Object_Access)
     return Position_Vector.Vector;
  
  function Get_Path_To_Square
    (This     : in Object_Access;
     Position : in Position_Type)
     return Path_Function;
  
  function Construct 
    (Piece    : in Character;
     Position : in Position_Type)
     return Object_Access;
  
end Piece;
