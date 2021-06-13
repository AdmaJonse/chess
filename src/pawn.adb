package body Pawn is

  ------------------------------------------------------------------------------
  --
  function Make
    (Colour   : in Common_Types.Colour_Type;
     Position : in Common_Types.Position_Type)
     return Object_Access is

  begin

    return new Object'(Colour   => Colour,
                       Position => Position);

  end Make;

  ------------------------------------------------------------------------------
  --
  function Image
    (This : in Object)
     return Character is

    use type Common_Types.Colour_Type;

  begin

    return (if This.Colour = Common_Types.White then 'P' else 'p');

  end Image;

  ------------------------------------------------------------------------------
  --
  function Is_Valid_Move
    (This    : in Object;
     To      : in Common_Types.Position_Type;
     Capture : in Boolean := False)
     return Boolean is

    use Common_Types;

    use type Common_Types.File_Type;
    use type Common_Types.Rank_Type;

    Valid : Boolean := False;

    Starting_Rank : constant Common_Types.Rank_Type :=
      (if This.Colour = Common_Types.White then 2 else 7);

  begin

    -- The same square is always invalid
    if This.Position.File = To.File and This.Position.Rank = To.Rank then
      return False;
    end if;

    -- TODO: Special case: en passant

    if This.Colour = Common_Types.White then

      if Capture then

        Valid := abs (To.File - This.Position.File) = 1 and
                 To.Rank = This.Position.Rank + 1;

      elsif This.Position.Rank = Starting_Rank then

        Valid := To.File = This.Position.File and
                 (To.Rank = This.Position.Rank + 1 or
                  To.Rank = This.Position.Rank + 2);
      else

        Valid := To.File = This.Position.File and
                 To.Rank = This.Position.Rank + 1;

      end if;

    else

      if Capture then

        Valid := abs (To.File - This.Position.File) = 1 and
                 To.Rank = This.Position.Rank - 1;

      elsif This.Position.Rank = Starting_Rank then

        Valid := To.File = This.Position.File and
                 (To.Rank = This.Position.Rank - 1 or
                  To.Rank = This.Position.Rank - 2);

      else

        Valid := To.File = This.Position.File and
                 To.Rank = This.Position.Rank - 1;

      end if;

    end if;

    return Valid;

  end Is_Valid_Move;

end Pawn;
