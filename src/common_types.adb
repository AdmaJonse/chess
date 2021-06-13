package body Common_Types is

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
