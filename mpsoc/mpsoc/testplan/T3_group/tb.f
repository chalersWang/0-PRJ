//add the dir of tb here!!!            
+incdir+${VERIFY_HOME}/cfg             
+incdir+${VERIFY_HOME}/tb              
+incdir+${VERIFY_HOME}/env             
+incdir+${VERIFY_HOME}/tb              
+incdir+${VERIFY_HOME}/sva             
+incdir+${VERIFY_HOME}/sva/code        
+incdir+${VERIFY_HOME}/coverage        
+incdir+${VERIFY_HOME}/coverage/code   
+incdir+${VERIFY_HOME}/uvc             
+incdir+${VERIFY_HOME}/uvc/sysctrl  
+incdir+${VERIFY_HOME}/uvc/jtag  
+incdir+${VERIFY_HOME}/uvc/uart  
+incdir+${VERIFY_HOME}/uvc/gpio  
+incdir+${VERIFY_HOME}/uvc/qspi  
+incdir+${VERIFY_HOME}/uvc/switch  
+incdir+${VERIFY_HOME}/uvc/miiphy  
+incdir+${VERIFY_HOME}/uvc/efuse  
+incdir+${VERIFY_HOME}/reference       
+incdir+${VERIFY_HOME}/regmodel        
+incdir+${VERIFY_HOME}/testcase        
+incdir+${VERIFY_HOME}/testcase/sequence_lib

${VERIFY_HOME}/sva/VifMacroDefine.v                  

//add the .svh of env/uvc/testcase     
${VERIFY_HOME}/uvc/sysctrl/sysctrl_vif.sv    
${VERIFY_HOME}/uvc/sysctrl/sysctrl_UvcTop.svh    

${VERIFY_HOME}/uvc/jtag/jtag_vif.sv    
${VERIFY_HOME}/uvc/jtag/jtag_UvcTop.svh    

${VERIFY_HOME}/uvc/uart/uart_vif.sv    
${VERIFY_HOME}/uvc/uart/uart_UvcTop.svh    

${VERIFY_HOME}/uvc/gpio/gpio_vif.sv    
${VERIFY_HOME}/uvc/gpio/gpio_UvcTop.svh    

${VERIFY_HOME}/uvc/qspi/qspi_vif.sv    
${VERIFY_HOME}/uvc/qspi/qspi_UvcTop.svh    

${VERIFY_HOME}/uvc/switch/switch_vif.sv    
${VERIFY_HOME}/uvc/switch/switch_UvcTop.svh    

${VERIFY_HOME}/uvc/miiphy/miiphy_vif.sv    
${VERIFY_HOME}/uvc/miiphy/miiphy_UvcTop.svh    

${VERIFY_HOME}/uvc/efuse/efuse_vif.sv    
${VERIFY_HOME}/uvc/efuse/efuse_UvcTop.svh    

//add the virtual interface            
${VERIFY_HOME}/sva/mpsoc_vif.sv           
                                       
${VERIFY_HOME}/env/mpsoc_EnvTop.svh       

${VERIFY_HOME}/testcase/mpsoc_TestTop.svh 
                                       
${VERIFY_HOME}/tb/tb_top.sv            
