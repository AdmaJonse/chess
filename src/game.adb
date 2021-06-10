package body Game is

  ------------------------------------------------------------------------------
  --
  function Make 
    (Game_Board : in Board.Object_Access) 
     return Object_Access is
  begin
    
    return new Object'(Game_Board   => Game_Board,
                       Current_Turn => Common_Types.White);
    
  end Make;
   
  ------------------------------------------------------------------------------
  --
  function Is_Checkmate 
    (This : in Object) 
     return Boolean is
  begin
      
    -- TODO
    return False;
      
  end Is_Checkmate;
  
  ------------------------------------------------------------------------------
  --
  function Is_Check
    (This : in Object) 
     return Boolean is
  begin
      
    -- TODO
    return False;
      
  end Is_Check;
   
  ------------------------------------------------------------------------------
  --
  function Is_Draw 
    (This : in Object) 
     return Boolean is
  begin
      
    -- TODO
    return False;
      
  end Is_Draw;
  
  ------------------------------------------------------------------------------
  --
  function Get_Board 
    (This : in Object) 
     return Board.Object_Access is (This.Game_Board);
  
  ------------------------------------------------------------------------------
  --
  procedure Set_Turn 
    (This   : in out Object;
     Colour : in Common_Types.Colour) is
  begin
    
    This.Current_Turn := Colour;
    
  end Set_Turn;
  
  ------------------------------------------------------------------------------
  --
  function Get_Turn 
    (This : in Object)
     return Common_Types.Colour is (This.Current_Turn);
  
end Game;
