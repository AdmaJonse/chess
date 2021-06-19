with Board;
with Common_Types;
with Player;

--  @summary
--  A chess move
--
--  @description
--
--
package Move is
   
  --  The Move object.
  --
  type Object is tagged private;
   
   
  --  Access the Move object.
  --
  type Object_Access is access all Object'Class;
   
   
  --  Create a new Move object.
  --
  --  @return  The new Move object
  --  
  function Make return Object_Access;
  
  
  --  Prompt the given user for a move.
  --
  --  
  --  @param Player  the colour of the player to move
  --
  --  @return  a string representing the player's move
  --
  function Get_Move 
    (Player : in Common_Types.Colour_Type) 
     return Object;
  
  
  --  Perform this move on the given board object.
  --
  --  @param This  the move object
  --
  procedure Perform_Move (This : in Object);
  
  
  --  Return a string representation of this move object.
  --
  --  @param This  the move object
  --
  --  @return  the string representation of the move.
  --
  function Image (This : in Object) return String;
   
  
  --  Return the From square from this Move object.
  --
  --  @param This  the move object
  --
  --  @return  The From square
  --
  function Get_From 
    (This : in Object) 
     return Common_Types.Position_Type;
  
  
  --  Return the To square from this Move object.
  --
  --  @param This  the move object
  --
  --  @return  The To square
  --
  function Get_To 
    (This : in Object) 
     return Common_Types.Position_Type;
  
  
  --  Return the capture boolean from this move object.
  --
  --  @param This  the move object
  --
  --  @return  the capture boolean
  --
  function Is_Capture 
    (This : in Object)
     return Boolean;
  
  
private
   
   
  type Object is tagged record
    By      : Common_Types.Colour_Type;
    From    : Common_Types.Position_Type;
    To      : Common_Types.Position_Type;
    Capture : Boolean := False;
  end record;

   

end Move;
