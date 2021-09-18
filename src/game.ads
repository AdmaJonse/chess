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
  type Object_Access is access all Object;
   
   
  --  Initialize the singleton game object.
  --
  --  @param Game_Board  the game board object.
  --  
  procedure Initialize (Game_Board : in Board.Object_Access);
  
  
  --  Check if the current game board is in a check state.
  --
  --  @return  boolean indicating whether the game is in a check state.
  --
  function Is_Check return Boolean;
   
  
  --  Check if the current game board is in a checkmate state.
  --
  --  @return  boolean indicating whether the game is in a checkmate state.
  --
  function Is_Checkmate return Boolean;
   
  
  --  Check if the current game board is in a draw state.
  --
  --  @return  boolean indicating whether the game is in a draw state.
  --
  function Is_Draw return Boolean;
   
  
  --  Check if the game is in a game over state.
  --  
  --  @return  boolean indicating whether the game is in a game over state.
  --
  function Is_Game_Over return Boolean;
  
  
  --  Return the game board for this chess game.
  --
  --  @return  the game board for this chess game
  --
  function Get_Board return Board.Object_Access;
  
  
  --  Set the current board state.
  --
  --  @param Board  the board that will be set.
  --
  procedure Set_Board (Game_Board : in Board.Object_Access);
   
  
  --  Set the colour that will move next.
  --
  --  @param Colour  the colour that will move next
  --
  procedure Set_Turn (Colour : in Common_Types.Colour_Type);
  
  
  --  Return the colour that will move next in this chess game.
  --
  --  @return  the colour that will move next
  --
  function Get_Turn return Common_Types.Colour_Type;
  
private
   
  type Object is tagged record
    Game_Board   : Board.Object_Access;
    Current_Turn : Common_Types.Colour_Type := Common_Types.White;
  end record;
  
  This : Game.Object_Access := null;

end Game;
