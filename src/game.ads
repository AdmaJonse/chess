with Ada.Strings.Unbounded;
with Board;
with Common_Types;
with Player;

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
  type Object_Access is access Object;
   
   
  --  Create a new Game object.
  --
  --  @return  The new Game object.
  --  
  function Make 
    (Game_Board : in Board.Object_Access)  
     return Object_Access;
  
  
  --  Check if the current game board is in a check state.
  --
  --  @param This  the game object
  --
  --  @return  boolean indicating whether the game is in a check state.
  --
  function Is_Check
    (This : in Object) 
     return Boolean;
   
  
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
  
  function Get_Board 
    (This : in Object) 
     return Board.Object_Access;
   
  procedure Set_Turn 
    (This   : in out Object;
     Colour : in Common_Types.Colour_Type);
  
  function Get_Turn 
    (This : in Object)
     return Common_Types.Colour_Type;
  
private
   
  type Object is tagged record
    Game_Board   : Board.Object_Access;
    Current_Turn : Common_Types.Colour_Type := Common_Types.White;
  end record;

end Game;
