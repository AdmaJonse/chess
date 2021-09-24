--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Common_Types.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

--  begin read only
--  end read only
package body Common_Types.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Plus (Gnattest_T : in out Test);
   procedure Test_Plus_e1f1fa (Gnattest_T : in out Test) renames Test_Plus;
--  id:2.2/e1f1faae0151aef6/Plus/1/0/
   procedure Test_Plus (Gnattest_T : in out Test) is
   --  common_types.ads:25:3:"+"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

    AUnit.Assertions.Assert
      ('A' + 1 = 'B',
       "Character addition operation failed.");

    AUnit.Assertions.Assert
      ('B' + 1 = 'C',
       "Character addition operation failed.");

    AUnit.Assertions.Assert
      ('C' + 1 = 'D',
       "Character addition operation failed.");

    AUnit.Assertions.Assert
      ('D' + 1 = 'E',
       "Character addition operation failed.");

    AUnit.Assertions.Assert
      ('E' + 1 = 'F',
       "Character addition operation failed.");

    AUnit.Assertions.Assert
      ('F' + 1 = 'G',
       "Character addition operation failed.");

    AUnit.Assertions.Assert
      ('G' + 1 = 'H',
       "Character addition operation failed.");

    AUnit.Assertions.Assert
      ('H' + 1 = 'I',
       "Character addition operation failed.");

    AUnit.Assertions.Assert
      ('A' + 2 = 'C',
       "Character addition operation failed.");

    AUnit.Assertions.Assert
      ('B' + 3 = 'E',
       "Character addition operation failed.");

    AUnit.Assertions.Assert
      ('D' + 4 = 'H',
       "Character addition operation failed.");

--  begin read only
   end Test_Plus;
--  end read only


--  begin read only
   procedure Test_1_Minus (Gnattest_T : in out Test);
   procedure Test_Minus_8a953d (Gnattest_T : in out Test) renames Test_1_Minus;
--  id:2.2/8a953d6c9955b6f5/Minus/1/0/
   procedure Test_1_Minus (Gnattest_T : in out Test) is
   --  common_types.ads:38:3:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

    AUnit.Assertions.Assert
      ('B' - 'A' = 1,
       "Character subtraction operation failed.");

    AUnit.Assertions.Assert
      ('C' - 'A' = 2,
       "Character subtraction operation failed.");

    AUnit.Assertions.Assert
      ('A' - 'A' = 0,
       "Character subtraction operation failed.");

    AUnit.Assertions.Assert
      ('H' - 'A' = 7,
       "Character subtraction operation failed.");

--  begin read only
   end Test_1_Minus;
--  end read only


--  begin read only
   procedure Test_2_Minus (Gnattest_T : in out Test);
   procedure Test_Minus_035727 (Gnattest_T : in out Test) renames Test_2_Minus;
--  id:2.2/0357279e3234014f/Minus/0/0/
   procedure Test_2_Minus (Gnattest_T : in out Test) is
   --  common_types.ads:50:3:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

    AUnit.Assertions.Assert
      ('H' - 1 = 'G',
       "Character subtraction operation failed.");

    AUnit.Assertions.Assert
      ('G' - 2 = 'E',
       "Character subtraction operation failed.");

    AUnit.Assertions.Assert
      ('B' - 1 = 'A',
       "Character subtraction operation failed.");

    AUnit.Assertions.Assert
      ('F' - 3 = 'C',
       "Character subtraction operation failed.");

--  begin read only
   end Test_2_Minus;
--  end read only


--  begin read only
   procedure Test_To_Num (Gnattest_T : in out Test);
   procedure Test_To_Num_bafb01 (Gnattest_T : in out Test) renames Test_To_Num;
--  id:2.2/bafb018cefa3dd15/To_Num/1/0/
   procedure Test_To_Num (Gnattest_T : in out Test) is
   --  common_types.ads:62:3:To_Num
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

    AUnit.Assertions.Assert
      (To_Num ('A') = 1,
       "Conversion of Character to number operation failed.");

    AUnit.Assertions.Assert
      (To_Num ('B') = 2,
       "Conversion of Character to number operation failed.");

    AUnit.Assertions.Assert
      (To_Num ('C') = 3,
       "Conversion of Character to number operation failed.");

    AUnit.Assertions.Assert
      (To_Num ('D') = 4,
       "Conversion of Character to number operation failed.");

    AUnit.Assertions.Assert
      (To_Num ('E') = 5,
       "Conversion of Character to number operation failed.");

    AUnit.Assertions.Assert
      (To_Num ('F') = 6,
       "Conversion of Character to number operation failed.");

    AUnit.Assertions.Assert
      (To_Num ('G') = 7,
       "Conversion of Character to number operation failed.");

    AUnit.Assertions.Assert
      (To_Num ('H') = 8,
       "Conversion of Character to number operation failed.");

--  begin read only
   end Test_To_Num;
--  end read only


--  begin read only
   procedure Test_Equal (Gnattest_T : in out Test);
   procedure Test_Equal_261f94 (Gnattest_T : in out Test) renames Test_Equal;
--  id:2.2/261f9443efb00fd7/Equal/1/0/
   procedure Test_Equal (Gnattest_T : in out Test) is
   --  common_types.ads:85:3:"="
--  end read only

    pragma Unreferenced (Gnattest_T);

    use type Common_Types.Position_Type;

   begin

    AUnit.Assertions.Assert
      (('A', 1) = ('A', 1),
       "The equality operator test failed.");

    AUnit.Assertions.Assert
      (('H', 7) = ('H', 7),
       "The equality operator test failed.");

    AUnit.Assertions.Assert
      (Common_Types.Position_Type'('A', 1) /= Common_Types.Position_Type'('B', 1),
       "The inequality operator test failed.");

    AUnit.Assertions.Assert
      (Common_Types.Position_Type'('B', 1) /= Common_Types.Position_Type'('B', 2),
       "The inequality operator test failed.");

    AUnit.Assertions.Assert
      (Common_Types.Position_Type'('B', 1) /= Common_Types.Position_Type'('C', 1),
       "The inequality operator test failed.");

--  begin read only
   end Test_Equal;
--  end read only


--  begin read only
   procedure Test_1_Image (Gnattest_T : in out Test);
   procedure Test_Image_b116fe (Gnattest_T : in out Test) renames Test_1_Image;
--  id:2.2/b116fe1ec6179099/Image/1/0/
   procedure Test_1_Image (Gnattest_T : in out Test) is
   --  common_types.ads:96:3:Image
--  end read only

      pragma Unreferenced (Gnattest_T);

  begin

    declare
      P : Position_Vector.Vector := Position_Vector.Empty_Vector;
    begin

      P.Append (('A', 1));
      P.Append (('B', 2));
      P.Append (('D', 6));
      P.Append (('H', 3));

      AUnit.Assertions.Assert
        (Actual   => Image (P),
         Expected => "A1 B2 D6 H3",
         Message  => "Image operation for Position Vector failed.");

    end;

    declare
      P : Position_Vector.Vector := Position_Vector.Empty_Vector;
    begin

      P.Append (('B', 4));
      P.Append (('B', 2));
      P.Append (('B', 8));
      P.Append (('B', 3));

      AUnit.Assertions.Assert
        (Actual   => Image (P),
         Expected => "B4 B2 B8 B3",
         Message  => "Image operation for Position Vector failed.");

    end;

--  begin read only
   end Test_1_Image;
--  end read only


--  begin read only
   procedure Test_Is_Match (Gnattest_T : in out Test);
   procedure Test_Is_Match_037801 (Gnattest_T : in out Test) renames Test_Is_Match;
--  id:2.2/0378016913f7f22f/Is_Match/1/0/
   procedure Test_Is_Match (Gnattest_T : in out Test) is
   --  common_types.ads:98:3:Is_Match
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    declare
      A : Position_Vector.Vector := Position_Vector.Empty_Vector;
      B : Position_Vector.Vector := Position_Vector.Empty_Vector;
    begin

      AUnit.Assertions.Assert
        (Condition => Is_Match (A, B),
         Message   => "Position vector match check failed.");

    end;

    declare
      A : Position_Vector.Vector := Position_Vector.Empty_Vector;
      B : Position_Vector.Vector := Position_Vector.Empty_Vector;
    begin

      A.Append (('A', 4));
      A.Append (('B', 2));
      A.Append (('C', 8));
      A.Append (('D', 3));

      B.Append (('A', 4));
      B.Append (('B', 2));
      B.Append (('C', 8));
      B.Append (('D', 3));

      AUnit.Assertions.Assert
        (Condition => Is_Match (A, B),
         Message   => "Position vector match check failed.");

    end;

    declare
      A : Position_Vector.Vector := Position_Vector.Empty_Vector;
      B : Position_Vector.Vector := Position_Vector.Empty_Vector;
    begin

      A.Append (('A', 4));
      A.Append (('B', 2));
      A.Append (('C', 8));
      A.Append (('D', 3));

      B.Append (('D', 3));
      B.Append (('B', 2));
      B.Append (('C', 8));
      B.Append (('A', 4));


      AUnit.Assertions.Assert
        (Condition => Is_Match (A, B),
         Message   => "Position vector match check failed.");

    end;

    declare
      A : Position_Vector.Vector := Position_Vector.Empty_Vector;
      B : Position_Vector.Vector := Position_Vector.Empty_Vector;
    begin

      A.Append (('A', 4));
      A.Append (('B', 2));
      A.Append (('C', 8));

      B.Append (('D', 3));
      B.Append (('B', 2));
      B.Append (('C', 8));
      B.Append (('A', 4));


      AUnit.Assertions.Assert
        (Condition => not Is_Match (A, B),
         Message   => "Position vector match check failed.");

    end;

    declare
      A : Position_Vector.Vector := Position_Vector.Empty_Vector;
      B : Position_Vector.Vector := Position_Vector.Empty_Vector;
    begin

      A.Append (('A', 4));
      A.Append (('B', 2));
      A.Append (('C', 8));

      B.Append (('D', 3));
      B.Append (('B', 2));


      AUnit.Assertions.Assert
        (Condition => not Is_Match (A, B),
         Message   => "Position vector match check failed.");

    end;

--  begin read only
   end Test_Is_Match;
--  end read only


--  begin read only
   procedure Test_2_Image (Gnattest_T : in out Test);
   procedure Test_Image_e8714d (Gnattest_T : in out Test) renames Test_2_Image;
--  id:2.2/e8714df2a96a71bd/Image/0/0/
   procedure Test_2_Image (Gnattest_T : in out Test) is
   --  common_types.ads:108:3:Image
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

    AUnit.Assertions.Assert
      (Actual   => Image (('A', 1)),
       Expected => "A1",
       Message  => "Image operation for Position failed.");

    AUnit.Assertions.Assert
      (Actual   => Image (('B', 3)),
       Expected => "B3",
       Message  => "Image operation for Position failed.");

    AUnit.Assertions.Assert
      (Actual   => Image (('D', 7)),
       Expected => "D7",
       Message  => "Image operation for Position failed.");

    AUnit.Assertions.Assert
      (Actual   => Image (('H', 8)),
       Expected => "H8",
       Message  => "Image operation for Position failed.");

--  begin read only
   end Test_2_Image;
--  end read only


--  begin read only
   procedure Test_To_Position (Gnattest_T : in out Test);
   procedure Test_To_Position_07ecb2 (Gnattest_T : in out Test) renames Test_To_Position;
--  id:2.2/07ecb2e8968553f9/To_Position/1/0/
   procedure Test_To_Position (Gnattest_T : in out Test) is
   --  common_types.ads:116:3:To_Position
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (To_Position ("A1") = ('A', 1) ,
         "Conversion to Position_Type failed.");

--  begin read only
   end Test_To_Position;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end Common_Types.Test_Data.Tests;
