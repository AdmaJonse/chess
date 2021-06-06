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
   
  
  --  Check if the given move string is valid.
  --
  --  @param Move  string representing the move
  --
  --  @return  boolean indicating whether move is valid
  --
  function Is_Valid 
    (Move : in String) 
     return Boolean;
  
  
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
  
  procedure Perform_Move 
    (This     : in Object;
     On_Board : in Board.Object_Access);
  
  
  procedure Print (This : in Object);
   
  function Get_From (This : in Object) return Square.Object_Access;
  function Get_To (This : in Object) return Square.Object_Access;
  
private
   
   
  type Object is tagged record
    By   : Common_Types.Colour;
    From : Square.Object_Access;
    To   : Square.Object_Access;
  end record;

   

end Move;
