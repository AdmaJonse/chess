with Ada.Strings.Fixed;
with Piece;

package body Square is

  ------------------------------------------------------------------------------
  --
  function Make 
    (Position : in Common_Types.Position_Type;
     Contents : in Piece.Object_Access := null) 
     return Object_Access is
    
  begin
      
      return new Object'(Position => Position,
                         Contents => Contents);
      
  end Make;
   
  ------------------------------------------------------------------------------
  --
  function Image 
    (This : in Object_Access) 
     return String is
  begin
    
    return This.Position.File & Ada.Strings.Fixed.Trim (This.Position.Rank'Img, Ada.Strings.Left);
    
  end Image;
  
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
  function Get_Rank 
    (This : in Object'Class) 
     return Common_Types.Rank_Type is (This.Position.Rank);
  
  ------------------------------------------------------------------------------
  --
  function Get_File 
    (This : in Object'Class) 
     return Common_Types.File_Type is (This.Position.File);
  
  ------------------------------------------------------------------------------
  --
  function Get_Position 
    (This : in Object'Class) 
     return Common_Types.Position_Type is (This.Position);
  
  ------------------------------------------------------------------------------
  --
  function Get_Contents 
    (This : in Object'Class) 
     return Piece.Object_Access is (This.Contents);
  
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
