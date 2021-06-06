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
  
  
  function Get_Game_Board (This : in Object) return String;
  
  function Get_Square 
    (This     : in Object_Access;
     Position : in String) 
     return Square.Object_Access;
  
  function Get_Square 
    (This : in Object_Access;
     File : in Common_Types.File;
     Rank : in Common_Types.Rank) 
     return Square.Object_Access;
  
  procedure Print (This : in Object'Class);
   
private
   
  type Object is tagged record
    Squares : Square_Array;
  end record;

end Board;
