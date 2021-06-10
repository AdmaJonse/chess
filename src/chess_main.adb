with Ada.Text_IO;
with Board;
with Common_Types;
with Game;
with Move;
with Player;

procedure Chess_Main is
  
  use type Common_Types.Colour;
  
  Chess_Game  : constant Game.Object_Access := 
    Game.Make (Game_Board => Board.Make);
  
begin
   
  while not Chess_Game.Is_Game_Over loop
    
    Chess_Game.Get_Board.Print;
    
    declare
      The_Move : Move.Object := Move.Get_Move (Chess_Game.Get_Board, Chess_Game.Get_Turn);
    begin
      The_Move.Perform_Move (Chess_Game.Get_Board);
    end;
    
    -- TODO: Track move history in a separate object
    
    Chess_Game.Set_Turn 
      (if Chess_Game.Get_Turn = Common_Types.White then Common_Types.Black 
       else Common_Types.White);
    
  end loop;
  
exception
    
  when Common_Types.End_Game =>
    
    Ada.Text_IO.Put_Line ("Ending game...");
    
end Chess_Main;
