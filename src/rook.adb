package body Rook is

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

    return (if This.Colour = Common_Types.White then 'R' else 'r');

  end Image;

  ------------------------------------------------------------------------------
  --
  function Is_Valid_Move
    (This    : in Object;
     To      : in Common_Types.Position_Type;
     Capture : in Boolean := False)
     return Boolean is

    use type Common_Types.File_Type;
    use type Common_Types.Rank_Type;

    Valid : Boolean := False;

  begin

    -- The same square is always invalid
    if This.Position.File = To.File and This.Position.Rank = To.Rank then
      return False;
    end if;

    -- Any square on the current rank or file
    Valid := (This.Position.File = To.File  and This.Position.Rank /= To.Rank) or
             (This.Position.File /= To.File and This.Position.Rank = To.Rank);

    return Valid;

  end Is_Valid_Move;

end Rook;
