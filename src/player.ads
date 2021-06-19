with Ada.Strings.Unbounded;

--  @summary
--  The player of the chess game
--
--  @description
--
--
package Player is
   
   --  The Player object.
   --
   type Object is tagged private;
   
   
   --  Access the Player object.
   --
   type Object_Access is access all Object'Class;
   
   
   --  Create a new Player object.
   --
   --  @return  The new Player object.
   --  
   function Make return Object_Access;
   
   
private
   
   
   type Object is tagged record
      Name : Ada.Strings.Unbounded.Unbounded_String;
   end record;
   

end Player;
