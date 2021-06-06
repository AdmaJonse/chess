package body Game is

  ------------------------------------------------------------------------------
  --
  function Make return Object_Access is (new Object);
   
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
  
end Game;
