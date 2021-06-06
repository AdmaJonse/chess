with Common_Types;
with Piece;

--  @summary
--  A square on the chess board
--
--  @description
--  
--
package Square is
   
  --  The Square object.
  --
  type Object is tagged private;
   
   
  --  Access the Square object.
  --
  type Object_Access is access Object'Class;
   
   
  --  Create a new Square object.
  --
  --  @return  The new Square object.
  --  
  function Make 
    (File     : in Common_Types.File;
     Rank     : in Common_Types.Rank;
     Contents : in Piece.Object_Access := null)
     return Object_Access;
  
  
  --  Return a string representation of the Square object.
  --
  --  @param This  the Square object
  --
  --  @return  the string representation of the Square object.
  --
  function Image 
    (This : in Object_Access) 
     return String;
  
  
  --  Return a boolean indicating whether or not this square is empty.
  --
  --  @param This  the square object
  --
  --  @return  a boolean indicating whether or not this square is empty.
  --
  function Is_Empty 
    (This : in Object) 
     return Boolean;
  
  
  --  Return the Rank from the Square object.
  --
  --  @param This  the Square object
  --
  --  @return  the Rank of this Square
  --
  function Get_Rank 
    (This : in Object'Class) 
     return Common_Types.Rank;
  
  
  --  Return the File from the Square object.
  --
  --  @param This  the Square object
  --
  --  @return  the File of this Square
  --
  function Get_File 
    (This : in Object'Class) 
     return Common_Types.File;
  
  
  --  Return the contents of this Square object.
  --
  --  @param This  the Square object
  --
  --  @return  the contents of this Square
  --
  function Get_Contents 
    (This : in Object'Class) 
     return Piece.Object_Access;
  
  
  --  Set the contents of the Square object.
  --
  --  @param This      the Square object
  --  @param Contents  the contents to be set
  --
  procedure Set_Contents 
    (This     : in out Object'Class;
     Contents : in Piece.Object_Access);
  
  
  --  Empty the contents of the Square object.
  --
  --  @param This      the Square object
  --
  procedure Set_Empty 
    (This : in out Object'Class);
                          
  
private
   
   
  type Object is tagged record
    File     : Common_Types.File;
    Rank     : Common_Types.Rank;
    Contents : Piece.Object_Access := null;
  end record;

   
end Square;
