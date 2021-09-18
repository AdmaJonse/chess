with Ada.Strings.Unbounded;

use Ada.Strings.Unbounded;

package body Common_Types is

  ------------------------------------------------------------------------------
  --
  function Image (This : in Position_Vector.Vector) return String is

    Positions : Position_Vector.Vector := This;
    Output    : Unbounded_String := Null_Unbounded_String;

  begin

    for Position in Positions.Iterate loop

      Output := Output & To_Unbounded_String (Image (Positions.Reference (Position)) & " ");

    end loop;

    return Ada.Strings.Fixed.Trim (To_String (Output), Ada.Strings.Both);

  end Image;

  ------------------------------------------------------------------------------
  --
  function To_Position
    (Position : in String)
     return Common_Types.Position_Type is

  begin

    if Position'Length /= 2 then
      raise Invalid_Square;
    end if;

    return (File => Position (Position'First),
            Rank => Common_Types.Rank_Type'Value ((1 => Position (Position'Last))));

  end To_Position;

end Common_Types;
