with Ada.Strings.Fixed;
with Piece;

package body Square is

  ------------------------------------------------------------------------------
  --
  function Make 
    (File     : in Common_Types.File;
     Rank     : in Common_Types.Rank;
     Contents : in Piece.Object_Access := null) 
     return Object_Access is
    
  begin
      
      return new Object'(File     => File,
                         Rank     => Rank,
                         Contents => Contents);
      
  end Make;
   
  ------------------------------------------------------------------------------
  --
  function Image 
    (This : in Object_Access) 
     return String is
  begin
    
    return This.File & Ada.Strings.Fixed.Trim (This.Rank'Img, Ada.Strings.Left);
    
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
     return Common_Types.Rank is (This.Rank);
  
  ------------------------------------------------------------------------------
  --
  function Get_File 
    (This : in Object'Class) 
     return Common_Types.File is (This.File);
  
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
