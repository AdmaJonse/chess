with Board;
with Common_Types;
with Player;
with Square;

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
  type Object_Access is access Object'Class;
   
   
  --  Create a new Move object.
  --
  --  @return  The new Move object
  --  
  function Make return Object_Access;
  
  
  --  Prompt the given user for a move.
  --
  --  @param  the colour of the player to move
  --
  --  @return  a string representing the player's move
  --
  function Get_Move 
    (On_Board : in Board.Object_Access;
     Player   : in Common_Types.Colour) 
     return Object;
  
  
  --  Perform this move on the given board object.
  --
  --  @param This      the move object
  --  @param On_Board  the board on which the move should be performed.
  --
  procedure Perform_Move 
    (This     : in Object;
     On_Board : in Board.Object_Access);
  
  
  --  Print a string representation of this move object.
  --
  --  @param This  the move object
  procedure Print (This : in Object);
   
  
  --  Return the From square from this Move object.
  --
  --  @param This  the move object
  --
  --  @return  The From square
  --
  function Get_From 
    (This : in Object) 
     return Square.Object_Access;
  
  
  --  Return the To square from this Move object.
  --
  --  @param This  the move object
  --
  --  @return  The To square
  --
  function Get_To 
    (This : in Object) 
     return Square.Object_Access;
  
  
private
   
   
  type Object is tagged record
    By   : Common_Types.Colour;
    From : Square.Object_Access;
    To   : Square.Object_Access;
  end record;

   

end Move;
