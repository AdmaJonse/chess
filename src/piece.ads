with Common_Types;

--  @summary
--  Chess Piece  
--
--  @description
--  The basic unit of the game of Chess. This is an abstract class that will be
--  extended by each piece type.
--
package Piece is
   
  type Object is abstract tagged record
    Colour : Common_Types.Colour := Common_Types.White;
  end record;
   
  type Object_Access is access Object'Class;
  
  function Is_Valid_Move 
    (This : in Object;
     From_File : in Common_Types.File;
     From_Rank : in Common_Types.Rank;
     To_File   : in Common_Types.File;
     To_Rank   : in Common_Types.Rank)
     return Boolean is abstract;
  
  procedure Move 
    (This : in Object;
     File : in Common_Types.File;
     Rank : in Common_Types.Rank) is abstract;

  function Image
    (This : in Object) 
     return Character is abstract;
  
  function Get_Colour
    (This : in Object) 
     return Common_Types.Colour is (This.Colour);
  
end Piece;