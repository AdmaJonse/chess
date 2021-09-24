with Ada.Strings.Fixed;
with Piece;

package body Square is

  ------------------------------------------------------------------------------
  --
  function Make 
    (Contents : in Piece.Object_Access := null) 
     return Object_Access is
    
  begin
      
      return new Object'(Contents => Contents);
      
  end Make;
  
  ------------------------------------------------------------------------------
  --
  function Is_Empty 
    (This : in Object) 
     return Boolean is
    
    use type Piece.Object_Access;
    
  begin
    
    return This.Contents = null;
    
  end Is_Empty;
  
  ------------------------------------------------------------------------------
  --
  function Get_Contents 
    (This : in Object'Class) 
     return Piece.Object_Access is
  begin
    
    if This.Is_Empty then
      raise No_Contents_Error;
    end if;
      
    return This.Contents;
    
  end Get_Contents;
  
  ------------------------------------------------------------------------------
  --
  procedure Set_Contents 
    (This     : in out Object'Class;
     Contents : in Piece.Object_Access) is
  begin
    
    This.Contents := Contents;
    
  end Set_Contents;
     
  ------------------------------------------------------------------------------
  --
  procedure Set_Empty 
    (This : in out Object'Class) is
  begin
    
    This.Contents := null;
    
  end Set_Empty;
  
end Square;
