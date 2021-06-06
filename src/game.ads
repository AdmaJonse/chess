with Ada.Strings.Unbounded;

--  @summary
--  The chess game
--
--  @description
--
--
package Game is

  --  The Game object.
  --
  type Object is tagged private;
   
   
  --  Access the Game object.
  --
  type Object_Access is access Object'Class;
   
   
  --  Create a new Game object.
  --
  --  @return  The new Player object.
  --  
  function Make return Object_Access;
   
  
  --  Check if the current game board is in a checkmate state.
  --
  --  @param This  the game object
  --
  --  @return  boolean indicating whether the game is in a checkmate state.
  --
  function Is_Checkmate 
    (This : in Object) 
     return Boolean;
   
  
  --  Check if the current game board is in a draw state.
  --
  --  @param This  the game object
  --
  --  @return  boolean indicating whether the game is in a draw state.
  --
  function Is_Draw 
    (This : in Object) 
     return Boolean;
   
  
  --  Check if the game is in a game over state.
  --
  --  @param This  the game object
  --  
  --  @return  boolean indicating whether the game is in a game over state.
  --
  function Is_Game_Over 
    (This : in Object) 
     return Boolean is (This.Is_Checkmate or This.Is_Draw);
   
private
   
  type Object is tagged record
    Name : Ada.Strings.Unbounded.Unbounded_String;
  end record;

end Game;
