
function void ReadFile(input string filename,output bit[63:0]UserDataQueue[$]);
	integer fr;
	integer res;
	logic[63:0]data;
	string str;

	fr=$fopen(filename,"r");
	if(fr==0)begin
		$display("%s cannt read file!",filename);
		$finish();
	end

	while(!$feof(fr))begin
		res=$fscanf(fr,"%h",data);
		//$display("debug:data=%h\n",data);
		UserDataQueue.push_back(data);
	end
	//$display("debug:data size=%h\n",UserDataQueue.size());

	$fclose(fr);

endfunction

function void ReadCfgFile(input string CfgFileName);
	integer      fr;
	bit[1023:0]   data;
	string        str;

	bit[1023:0]CfgData[string];

	fr=$fopen(CfgFileName,"r");
	if(fr==0)begin
		$display("%s cann't read!!!",CfgFileName);
		$finish();
	end

	while(!$feof(fr))begin
		$fscanf(fr,"%s %h",str,data);
		//mpsoc_cfg.CfgData[str]=data;
		CfgData[str]=data;
	end
	$fclose(fr);
endfunction

