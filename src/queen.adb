package body Queen is

  ------------------------------------------------------------------------------
  --
  function Make
    (Colour : in Common_Types.Colour)
     return Object_Access is

  begin

    return new Object'(Colour => Colour);

  end Make;

  ------------------------------------------------------------------------------
  --
  function Image
    (This : in Object)
     return Character is

    use type Common_Types.Colour;

  begin

    return (if This.Get_Colour = Common_Types.White then 'Q' else 'q');

  end Image;

  ------------------------------------------------------------------------------
  --
  function Is_Valid_Move
    (This : in Object;
     From : in Common_Types.Position_Type;
     To   : in Common_Types.Position_Type)
     return Boolean is

    use Common_Types;

    use type Common_Types.File_Type;
    use type Common_Types.Rank_Type;

    Valid : Boolean := False;

  begin

    -- The same square is always invalid
    if From.File = To.File and From.Rank = To.Rank then
      return False;
    end if;

    Valid :=
      From.File = To.File or
      From.Rank = To.Rank or
      From.Rank - To.Rank = From.File - To.File;

    return Valid;

  end Is_Valid_Move;

end Queen;
