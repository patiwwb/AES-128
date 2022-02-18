library LIB_RTL;

configuration Counter_tb_conf of Counter_tb is
	for Counter_tb_arch
		for DUT : Counter
			use entity LIB_RTL.Counter(Counter_arch);
		end for;
	end for;
end Counter_tb_conf;
