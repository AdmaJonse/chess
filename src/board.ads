with Common_Types;
with Square;

--  @summary
--  The chess board
--
--  @description
--
--
package Board is
  
  type Square_Array is array (Common_Types.File, Common_Types.Rank) of Square.Object_Access;

  --  The Board object.
  --
  type Object is tagged private;
   
   
  --  Access the Board object.
  --
  type Object_Access is access Object;
   
   
  --  Create a new Board object.
  --
  --  @return  The new Board object.
  --  
  function Make return Object_Access;
  
  
  --  Return a string represntation of this board object.
  --
  --  @param This  the board object
  --
  --  @return  a string representing the board.
  --
  function Image 
    (This : in Object) 
     return String;
  
  
  --  Return the square from this board that corresponds to the given position
  --  string.
  --
  --  @param This      the board object
  --  @param Position  a string representing the position
  --
  --  @return  the square from the board corresponding to the position.
  --
  function Get_Square 
    (This     : in Object_Access;
     Position : in String) 
     return Square.Object_Access;
  
  
  --  Return the square from this board that corresponds to the given rank
  --  and file.
  --
  --  @param This  the board object
  --  @param File  the file of the square to return
  --  @param Rank  the rank of the square to return
  --
  --  @return  the square from the board corresponding to the rank and file.
  --
  function Get_Square 
    (This : in Object_Access;
     File : in Common_Types.File;
     Rank : in Common_Types.Rank) 
     return Square.Object_Access;
  
  
  --  Print this board object to the console.
  --
  --  @param This  the board object
  --
  procedure Print (This : in Object'Class);
   
private
   
  type Object is tagged record
    Squares : Square_Array;
  end record;

end Board;
