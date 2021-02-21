-- File: main_ada_delay_until.adb
-- Date: Sun 21 Feb 2021 03:57:40 PM +08
-- Author: WRY wruslan.ump@gmail.com
-- ========================================================

-- IMPORT STANDARD ADA PACKAGES
with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

-- IMPORT USER-DEFINED ADA PACKAGES
with pkg_ada_dtstamp;

-- ========================================================
procedure main_ada_delay_until
-- ========================================================
	with SPARK_Mode => on
is 

   -- RENAME STANDARD ADA PACKAGES FOR CONVENIENCE
   package ATIO    renames Ada.Text_IO;
   package ART     renames Ada.Real_Time;
   package ASU     renames Ada.Strings.Unbounded;
   
   -- RENAME USER-DEFINED ADA PACKAGES FOR CONVENIENCE
   package PADTS   renames pkg_ada_dtstamp;
   
   the_datestamp : ASU.Unbounded_String;
   the_timestamp : ASU.Unbounded_String;
      
begin
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Running inside GNAT Studio Community");
   PADTS.dtstamp; ATIO.Put_Line ("Executing main_ada_delay_until.adb");
   
   -- =====================================================
   -- TIME DELAYS
   -- =====================================================
   ATIO.New_Line;
   for idx in 1..5 loop
      PADTS.dtstamp;
      ATIO.Put_Line("exec_delay_time : loop number = " & Integer'image(idx));
      -- Type fractions of Real numbers allowed (in Seconds)
      PADTS.exec_delay_time(ART.To_Time_Span(1.7503));  
   end loop;
   
   ATIO.New_Line;
   for idx in 1..3 loop
      PADTS.dtstamp;
      ATIO.Put_Line("exec_delay_sec  : loop number = " & Integer'image(idx));
      -- Only type Positive integers
      PADTS.exec_delay_sec(2); 
   end loop;
   
   ATIO.New_Line;
   for idx in 1..3 loop
      PADTS.dtstamp;
      ATIO.Put_Line("exec_delay_msec : loop number = " & Integer'image(idx));
      -- Only type Positive integers
      PADTS.exec_delay_msec(1_000);
   end loop;
   
   ATIO.New_Line;
   for idx in 1..3 loop
      PADTS.dtstamp;
      ATIO.Put_Line("exec_delay_usec : loop number = " & Integer'image(idx));
      -- Only type Positive integers
      PADTS.exec_delay_usec(2_000);
   end loop;
   
   ATIO.New_Line;
   for idx in 1..3 loop
      PADTS.dtstamp;
      ATIO.Put_Line("exec_delay_nsec : loop number = " & Integer'image(idx));
      -- Only type Positive integers (Cannot exceed maximum Positive type)
      PADTS.exec_delay_nsec(20_000_000);
   end loop;
   
   -- =====================================================
   -- DATE STRING AND TIME STRING
   -- =====================================================
   ATIO.New_Line;
   the_datestamp := PADTS.get_datestamp (ART.Clock);
   ATIO.Put_Line("the_datestamp = " & To_String(the_datestamp));
     
   ATIO.New_Line;
   the_timestamp := PADTS.get_timestamp (ART.Clock);
   ATIO.Put_Line("the_timestamp = " & To_String(the_timestamp));
   
   -- ====================================================
   
   ATIO.New_Line; PADTS.dtstamp; ATIO.Put_Line ("Alhamdulillah 3 times WRY");
-- ========================================================   
end main_ada_delay_until;
-- ========================================================
