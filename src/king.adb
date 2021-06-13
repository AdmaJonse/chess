package body King is

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

    return (if This.Colour = Common_Types.White then 'K' else 'k');

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

  begin

    -- The same square is always invalid
    if This.Position.File = To.File and This.Position.Rank = To.Rank then
      return False;
    end if;

    Valid :=
      -1 <= This.Position.Rank - To.Rank and
      This.Position.Rank - To.Rank <= 1 and
      -1 <= This.Position.File - To.File and
      This.Position.File - To.File <= 1;

    return Valid;

  end Is_Valid_Move;

end King;
