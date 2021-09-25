with Common_Types;
with Piece;

use Common_Types;

--  @summary
--  A square on the chess board
--
--  @description
--  
--
package Square is
   
  No_Contents_Error : Exception;
  
  --  The Square object.
  --
  type Object is tagged private;
   
   
  --  Access the Square object.
  --
  type Object_Access is access all Object'Class;
  
  
  --  A two-dimensional array of square objects indexed by the file and rank. 
  --
  type Square_Array is array (File_Type, Rank_Type) of Object_Access;
  
  Null_Squares : constant Square_Array := (others => (others => null));
   
   
  --  Create a new Square object.
  --
  --  @return  The new Square object.
  --  
  function Make 
    (Contents : in Piece.Object_Access := null)
     return Object_Access;
  
  
  --  Return a boolean indicating whether or not this square is empty.
  --
  --  @param This  the square object
  --
  --  @return  a boolean indicating whether or not this square is empty.
  --
  function Is_Empty 
    (This : in Object) 
     return Boolean;
  
  
  --  Return the contents of this Square object.
  --
  --  @param This  the Square object
  --
  --  @return  the contents of this Square
  --
  function Get_Contents 
    (This : in Object'Class) 
     return Piece.Object_Access;
  
  
  --  Set the contents of the Square object.
  --
  --  @param This      the Square object
  --  @param Contents  the contents to be set
  --
  procedure Set_Contents 
    (This     : in out Object'Class;
     Contents : in Piece.Object_Access);
  
  
  --  Empty the contents of the Square object.
  --
  --  @param This  the Square object
  --
  procedure Set_Empty 
    (This : in out Object'Class);
                          
  
private
   
   
  type Object is tagged record
    Contents : Piece.Object_Access := null;
  end record;

   
end Square;
