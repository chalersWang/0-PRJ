                                                      
///dump vpd file                                      
`ifdef DUMP_VPD_FILE                                  
  reg[1023:0]vpdfile;                                 
  initial                                             
  begin                                               
      if($value$plusargs("VPDNAME=%s",vpdfile))     
          begin                                       
              $vcdplusfile(vpdfile);                  
              $vcdpluson();                           
          end                                         
  end                                                 
`endif                                                
                                                      
//dump fsdb file
`ifdef DUMP_FSDB_FILE
    string fsdbfile;
    initial
    begin
        if($value$plusargs("UVM_TESTNAME=%s",fsdbfile))begin
            $display("\n\n\n\n\n");
            $display("******************************");
            $display("** UVM_TESTNAME=%s ********",fsdbfile);
            $display("******************************");
            $display("\n\n\n\n\n");

            //begin
            /*$fsdbAutoSwitchDumpfile Format:*/
            /*$fsdbAutoSwitchDumpfile(File size(MB), File_name, number_of_file)*/
            //$fsdbAutoSwitchDumpfile(2048,fsdbfile,10,"fsdb.log");

            /*Specify the fsdb file name for the dump waveform*/
            $fsdbDumpfile($sformatf("%s/sim/sim.fsdb",fsdbfile));

            /*0 indicates that dump starts from xxx_top for all layers*/
            $fsdbDumpvars(0,tb_top,"+mda");

            /*dump a two-dimensional array. vcs compile with -debug_all*/
            //$fsdbDumpMDA();

            /*Start and end dump times. If no start and end times are set,*/
            /*the default dump time is from the start to the end of the simulation*/
            //#0      $fsdbDumpon();
            //#10000  $fsdbDumpoff();
            $fsdbDumpon();
        end
    end
`endif                                         
