module	helloworld(i_clk,
			o_ledg,
			i_rts, i_uart_rx, o_cts,
			o_uart_tx);
	//
	input		i_clk;
	output	wire	o_ledg;
	input		i_rts, i_uart_rx;
	output		o_cts;
	output	wire	o_uart_tx;

	assign	o_cts = 1'b1;

	// If i_setup isnt set up as an input parameter, it needs to be set.
	// We do so here, to a setting appropriate to create a 115200 Baud
	// comms system from a 100MHz clock.  This also sets us to an 8-bit
	// data word, 1-stop bit, and no parity.
	wire	[29:0]	i_setup;
	assign		i_setup = 30'd868;	// 115200 Baud, if clk @ 100MHz

	reg	pwr_reset;
	initial	pwr_reset = 1'b1;
	always @(posedge i_clk)
		pwr_reset <= 1'b0;

	reg	[24:0]	ledctr;
	initial	ledctr = 0;
	always @(posedge i_clk)
		if (!o_uart_tx)
			ledctr <= 0;
		else if (ledctr != {(25){1'b1}})
			ledctr <= ledctr + 1'b1;
	assign	o_ledg = !ledctr[24];

 reg[87:0] message;
 	initial message = 88'b0110100001101001001000000110010101110110011001010111001001111001011011110110111001100101;

	reg [7:0] img [0:1023];
	integer ii;

	initial begin
		img[1023] <= 8'b00111101;
	img[1022] <= 8'b00110011;
	img[1021] <= 8'b00110101;
	img[1020] <= 8'b00100011;
	img[1019] <= 8'b00101000;
	img[1018] <= 8'b00100101;
	img[1017] <= 8'b00010010;
	img[1016] <= 8'b00000101;
	img[1015] <= 8'b00000011;
	img[1014] <= 8'b00000000;
	img[1013] <= 8'b00000111;
	img[1012] <= 8'b00001111;
	img[1011] <= 8'b00010010;
	img[1010] <= 8'b00010100;
	img[1009] <= 8'b00010100;
	img[1008] <= 8'b00010001;
	img[1007] <= 8'b00000000;
	img[1006] <= 8'b00000000;
	img[1005] <= 8'b00000010;
	img[1004] <= 8'b00010000;
	img[1003] <= 8'b00011010;
	img[1002] <= 8'b00100000;
	img[1001] <= 8'b00100101;
	img[1000] <= 8'b00101001;
	img[999] <= 8'b00101101;
	img[998] <= 8'b00101101;
	img[997] <= 8'b00110011;
	img[996] <= 8'b00011011;
	img[995] <= 8'b00011001;
	img[994] <= 8'b01011111;
	img[993] <= 8'b01100011;
	img[992] <= 8'b01100100;
	img[991] <= 8'b01000001;
	img[990] <= 8'b01010010;
	img[989] <= 8'b01011100;
	img[988] <= 8'b01001011;
	img[987] <= 8'b00110111;
	img[986] <= 8'b00100100;
	img[985] <= 8'b00011011;
	img[984] <= 8'b00010110;
	img[983] <= 8'b00001111;
	img[982] <= 8'b00001001;
	img[981] <= 8'b00001100;
	img[980] <= 8'b00010001;
	img[979] <= 8'b00010010;
	img[978] <= 8'b00010011;
	img[977] <= 8'b00010101;
	img[976] <= 8'b00010011;
	img[975] <= 8'b00000111;
	img[974] <= 8'b00001011;
	img[973] <= 8'b00010001;
	img[972] <= 8'b00011011;
	img[971] <= 8'b00101000;
	img[970] <= 8'b00110010;
	img[969] <= 8'b00110011;
	img[968] <= 8'b00101110;
	img[967] <= 8'b00101100;
	img[966] <= 8'b00110001;
	img[965] <= 8'b00110001;
	img[964] <= 8'b00000000;
	img[963] <= 8'b00010001;
	img[962] <= 8'b00001101;
	img[961] <= 8'b01001001;
	img[960] <= 8'b01011001;
	img[959] <= 8'b01001000;
	img[958] <= 8'b01010100;
	img[957] <= 8'b01010000;
	img[956] <= 8'b01001100;
	img[955] <= 8'b00111011;
	img[954] <= 8'b00101110;
	img[953] <= 8'b00101011;
	img[952] <= 8'b00011101;
	img[951] <= 8'b00010111;
	img[950] <= 8'b00001111;
	img[949] <= 8'b00010000;
	img[948] <= 8'b00010010;
	img[947] <= 8'b00010010;
	img[946] <= 8'b00010010;
	img[945] <= 8'b00010001;
	img[944] <= 8'b00001110;
	img[943] <= 8'b00010011;
	img[942] <= 8'b00011010;
	img[941] <= 8'b00100100;
	img[940] <= 8'b00110000;
	img[939] <= 8'b00111011;
	img[938] <= 8'b00111101;
	img[937] <= 8'b00111001;
	img[936] <= 8'b00110011;
	img[935] <= 8'b00110011;
	img[934] <= 8'b00101011;
	img[933] <= 8'b00001000;
	img[932] <= 8'b00000000;
	img[931] <= 8'b00000000;
	img[930] <= 8'b00000000;
	img[929] <= 8'b00001110;
	img[928] <= 8'b01010011;
	img[927] <= 8'b01001001;
	img[926] <= 8'b01010111;
	img[925] <= 8'b01001111;
	img[924] <= 8'b01001101;
	img[923] <= 8'b00110001;
	img[922] <= 8'b00100011;
	img[921] <= 8'b00110111;
	img[920] <= 8'b00110000;
	img[919] <= 8'b00011110;
	img[918] <= 8'b00010110;
	img[917] <= 8'b00010111;
	img[916] <= 8'b00011010;
	img[915] <= 8'b00011000;
	img[914] <= 8'b00010100;
	img[913] <= 8'b00010001;
	img[912] <= 8'b00001001;
	img[911] <= 8'b00011111;
	img[910] <= 8'b00100101;
	img[909] <= 8'b00110010;
	img[908] <= 8'b00111110;
	img[907] <= 8'b00111110;
	img[906] <= 8'b00111000;
	img[905] <= 8'b00111001;
	img[904] <= 8'b00111100;
	img[903] <= 8'b00110111;
	img[902] <= 8'b00011111;
	img[901] <= 8'b00000000;
	img[900] <= 8'b00000000;
	img[899] <= 8'b00000000;
	img[898] <= 8'b00000110;
	img[897] <= 8'b00000000;
	img[896] <= 8'b00110111;
	img[895] <= 8'b01010010;
	img[894] <= 8'b01011101;
	img[893] <= 8'b01011011;
	img[892] <= 8'b01011000;
	img[891] <= 8'b00110111;
	img[890] <= 8'b00100011;
	img[889] <= 8'b00111111;
	img[888] <= 8'b00110101;
	img[887] <= 8'b00100110;
	img[886] <= 8'b00100000;
	img[885] <= 8'b00100011;
	img[884] <= 8'b00100111;
	img[883] <= 8'b00100100;
	img[882] <= 8'b00100001;
	img[881] <= 8'b00011110;
	img[880] <= 8'b00011001;
	img[879] <= 8'b00110010;
	img[878] <= 8'b00111011;
	img[877] <= 8'b00111111;
	img[876] <= 8'b00111101;
	img[875] <= 8'b00111011;
	img[874] <= 8'b01000000;
	img[873] <= 8'b01000111;
	img[872] <= 8'b01001011;
	img[871] <= 8'b00110111;
	img[870] <= 8'b00100101;
	img[869] <= 8'b00000000;
	img[868] <= 8'b00000000;
	img[867] <= 8'b00000110;
	img[866] <= 8'b00000001;
	img[865] <= 8'b00010001;
	img[864] <= 8'b00010000;
	img[863] <= 8'b01010101;
	img[862] <= 8'b01001000;
	img[861] <= 8'b00111110;
	img[860] <= 8'b01000011;
	img[859] <= 8'b00111001;
	img[858] <= 8'b00110000;
	img[857] <= 8'b01001001;
	img[856] <= 8'b00110001;
	img[855] <= 8'b00101101;
	img[854] <= 8'b00101010;
	img[853] <= 8'b00101101;
	img[852] <= 8'b00110011;
	img[851] <= 8'b00110001;
	img[850] <= 8'b00110011;
	img[849] <= 8'b00110101;
	img[848] <= 8'b00110011;
	img[847] <= 8'b01000100;
	img[846] <= 8'b01010010;
	img[845] <= 8'b01010110;
	img[844] <= 8'b01001111;
	img[843] <= 8'b01010101;
	img[842] <= 8'b01100100;
	img[841] <= 8'b01100011;
	img[840] <= 8'b01010100;
	img[839] <= 8'b01001101;
	img[838] <= 8'b00011011;
	img[837] <= 8'b00000000;
	img[836] <= 8'b00001001;
	img[835] <= 8'b00000101;
	img[834] <= 8'b00001011;
	img[833] <= 8'b00001110;
	img[832] <= 8'b00001010;
	img[831] <= 8'b01001000;
	img[830] <= 8'b00101011;
	img[829] <= 8'b00100100;
	img[828] <= 8'b00100011;
	img[827] <= 8'b00100101;
	img[826] <= 8'b00100111;
	img[825] <= 8'b01001111;
	img[824] <= 8'b00111011;
	img[823] <= 8'b00110011;
	img[822] <= 8'b00110101;
	img[821] <= 8'b01000000;
	img[820] <= 8'b01001010;
	img[819] <= 8'b01001100;
	img[818] <= 8'b01001111;
	img[817] <= 8'b01010110;
	img[816] <= 8'b01011000;
	img[815] <= 8'b01100110;
	img[814] <= 8'b01110011;
	img[813] <= 8'b01111011;
	img[812] <= 8'b01111011;
	img[811] <= 8'b10000011;
	img[810] <= 8'b10000111;
	img[809] <= 8'b01110111;
	img[808] <= 8'b01011011;
	img[807] <= 8'b01010010;
	img[806] <= 8'b00000000;
	img[805] <= 8'b00000000;
	img[804] <= 8'b00000001;
	img[803] <= 8'b00001010;
	img[802] <= 8'b00001001;
	img[801] <= 8'b00000101;
	img[800] <= 8'b00001101;
	img[799] <= 8'b01010011;
	img[798] <= 8'b00100110;
	img[797] <= 8'b00011011;
	img[796] <= 8'b00010101;
	img[795] <= 8'b00100000;
	img[794] <= 8'b00100110;
	img[793] <= 8'b01010011;
	img[792] <= 8'b00111110;
	img[791] <= 8'b00111111;
	img[790] <= 8'b01000101;
	img[789] <= 8'b01010111;
	img[788] <= 8'b01100101;
	img[787] <= 8'b01100111;
	img[786] <= 8'b01101011;
	img[785] <= 8'b01110011;
	img[784] <= 8'b01110110;
	img[783] <= 8'b10010011;
	img[782] <= 8'b10010100;
	img[781] <= 8'b10011010;
	img[780] <= 8'b10100000;
	img[779] <= 8'b10011111;
	img[778] <= 8'b10010000;
	img[777] <= 8'b01111000;
	img[776] <= 8'b01100010;
	img[775] <= 8'b00110001;
	img[774] <= 8'b00000000;
	img[773] <= 8'b00000000;
	img[772] <= 8'b00000000;
	img[771] <= 8'b00000000;
	img[770] <= 8'b00000000;
	img[769] <= 8'b00000100;
	img[768] <= 8'b00000000;
	img[767] <= 8'b01100000;
	img[766] <= 8'b00110100;
	img[765] <= 8'b00011101;
	img[764] <= 8'b00100010;
	img[763] <= 8'b00001101;
	img[762] <= 8'b01100000;
	img[761] <= 8'b01011100;
	img[760] <= 8'b01010101;
	img[759] <= 8'b01001111;
	img[758] <= 8'b01011010;
	img[757] <= 8'b01110011;
	img[756] <= 8'b10000001;
	img[755] <= 8'b10000001;
	img[754] <= 8'b10000100;
	img[753] <= 8'b10000100;
	img[752] <= 8'b10010111;
	img[751] <= 8'b10100111;
	img[750] <= 8'b10110101;
	img[749] <= 8'b10111111;
	img[748] <= 8'b10110001;
	img[747] <= 8'b10101100;
	img[746] <= 8'b10101100;
	img[745] <= 8'b10001111;
	img[744] <= 8'b01100110;
	img[743] <= 8'b00011010;
	img[742] <= 8'b00000000;
	img[741] <= 8'b00000000;
	img[740] <= 8'b00000000;
	img[739] <= 8'b00000000;
	img[738] <= 8'b00000000;
	img[737] <= 8'b00000000;
	img[736] <= 8'b00000000;
	img[735] <= 8'b01100001;
	img[734] <= 8'b00101110;
	img[733] <= 8'b00010011;
	img[732] <= 8'b00101101;
	img[731] <= 8'b00110111;
	img[730] <= 8'b00011000;
	img[729] <= 8'b01101010;
	img[728] <= 8'b01100001;
	img[727] <= 8'b01111000;
	img[726] <= 8'b01110010;
	img[725] <= 8'b10011011;
	img[724] <= 8'b10110000;
	img[723] <= 8'b10101100;
	img[722] <= 8'b10101001;
	img[721] <= 8'b00110011;
	img[720] <= 8'b01001111;
	img[719] <= 8'b10011101;
	img[718] <= 8'b10000110;
	img[717] <= 8'b10000101;
	img[716] <= 8'b10000100;
	img[715] <= 8'b10001100;
	img[714] <= 8'b10001011;
	img[713] <= 8'b01111100;
	img[712] <= 8'b01111000;
	img[711] <= 8'b00001101;
	img[710] <= 8'b00000000;
	img[709] <= 8'b00000000;
	img[708] <= 8'b00000011;
	img[707] <= 8'b00000011;
	img[706] <= 8'b00000101;
	img[705] <= 8'b00000001;
	img[704] <= 8'b00000100;
	img[703] <= 8'b00101101;
	img[702] <= 8'b00101111;
	img[701] <= 8'b00100101;
	img[700] <= 8'b00101101;
	img[699] <= 8'b00110111;
	img[698] <= 8'b00011001;
	img[697] <= 8'b01111000;
	img[696] <= 8'b10100010;
	img[695] <= 8'b10001011;
	img[694] <= 8'b10000111;
	img[693] <= 8'b11000000;
	img[692] <= 8'b11001111;
	img[691] <= 8'b11000011;
	img[690] <= 8'b01010100;
	img[689] <= 8'b00011110;
	img[688] <= 8'b00010111;
	img[687] <= 8'b00110010;
	img[686] <= 8'b01010011;
	img[685] <= 8'b00101100;
	img[684] <= 8'b01001101;
	img[683] <= 8'b10000111;
	img[682] <= 8'b10010101;
	img[681] <= 8'b01001001;
	img[680] <= 8'b01010011;
	img[679] <= 8'b00000000;
	img[678] <= 8'b00000000;
	img[677] <= 8'b00000000;
	img[676] <= 8'b00000101;
	img[675] <= 8'b00000011;
	img[674] <= 8'b00000111;
	img[673] <= 8'b00001000;
	img[672] <= 8'b00001001;
	img[671] <= 8'b00011110;
	img[670] <= 8'b00101100;
	img[669] <= 8'b00110101;
	img[668] <= 8'b00110010;
	img[667] <= 8'b00111011;
	img[666] <= 8'b00110100;
	img[665] <= 8'b10000111;
	img[664] <= 8'b01100100;
	img[663] <= 8'b01100111;
	img[662] <= 8'b01100110;
	img[661] <= 8'b01111110;
	img[660] <= 8'b10001001;
	img[659] <= 8'b01110100;
	img[658] <= 8'b00100010;
	img[657] <= 8'b00001111;
	img[656] <= 8'b00000010;
	img[655] <= 8'b00011100;
	img[654] <= 8'b00111010;
	img[653] <= 8'b00010101;
	img[652] <= 8'b00100011;
	img[651] <= 8'b00100101;
	img[650] <= 8'b00011000;
	img[649] <= 8'b00111110;
	img[648] <= 8'b00000010;
	img[647] <= 8'b00000001;
	img[646] <= 8'b00000110;
	img[645] <= 8'b00000101;
	img[644] <= 8'b00000111;
	img[643] <= 8'b00000001;
	img[642] <= 8'b00000110;
	img[641] <= 8'b00001100;
	img[640] <= 8'b00001101;
	img[639] <= 8'b00011111;
	img[638] <= 8'b00110101;
	img[637] <= 8'b01000001;
	img[636] <= 8'b01000010;
	img[635] <= 8'b01010001;
	img[634] <= 8'b01001101;
	img[633] <= 8'b01101110;
	img[632] <= 8'b01011111;
	img[631] <= 8'b00111000;
	img[630] <= 8'b01011100;
	img[629] <= 8'b01000000;
	img[628] <= 8'b01000101;
	img[627] <= 8'b00111110;
	img[626] <= 8'b00110000;
	img[625] <= 8'b00011010;
	img[624] <= 8'b00001100;
	img[623] <= 8'b00101010;
	img[622] <= 8'b00111100;
	img[621] <= 8'b00110000;
	img[620] <= 8'b00110010;
	img[619] <= 8'b01001000;
	img[618] <= 8'b00111101;
	img[617] <= 8'b00110100;
	img[616] <= 8'b00001100;
	img[615] <= 8'b00001001;
	img[614] <= 8'b00010011;
	img[613] <= 8'b00001000;
	img[612] <= 8'b00000101;
	img[611] <= 8'b00000000;
	img[610] <= 8'b00000001;
	img[609] <= 8'b00000011;
	img[608] <= 8'b00000100;
	img[607] <= 8'b00100001;
	img[606] <= 8'b00011010;
	img[605] <= 8'b01010010;
	img[604] <= 8'b01101101;
	img[603] <= 8'b01101001;
	img[602] <= 8'b01010001;
	img[601] <= 8'b00101101;
	img[600] <= 8'b00001111;
	img[599] <= 8'b00111110;
	img[598] <= 8'b01010000;
	img[597] <= 8'b01100110;
	img[596] <= 8'b01001110;
	img[595] <= 8'b01000110;
	img[594] <= 8'b00111010;
	img[593] <= 8'b00011110;
	img[592] <= 8'b00100010;
	img[591] <= 8'b01000101;
	img[590] <= 8'b01000101;
	img[589] <= 8'b00111111;
	img[588] <= 8'b01010000;
	img[587] <= 8'b01100110;
	img[586] <= 8'b01101111;
	img[585] <= 8'b00011100;
	img[584] <= 8'b00001101;
	img[583] <= 8'b00000111;
	img[582] <= 8'b00010000;
	img[581] <= 8'b00001010;
	img[580] <= 8'b00001001;
	img[579] <= 8'b00000010;
	img[578] <= 8'b00001100;
	img[577] <= 8'b00000100;
	img[576] <= 8'b00001001;
	img[575] <= 8'b00010100;
	img[574] <= 8'b00101111;
	img[573] <= 8'b01100111;
	img[572] <= 8'b01010111;
	img[571] <= 8'b01111111;
	img[570] <= 8'b00111101;
	img[569] <= 8'b00100100;
	img[568] <= 8'b00001110;
	img[567] <= 8'b01100000;
	img[566] <= 8'b01110000;
	img[565] <= 8'b01101110;
	img[564] <= 8'b10000001;
	img[563] <= 8'b01101001;
	img[562] <= 8'b01001010;
	img[561] <= 8'b01000110;
	img[560] <= 8'b00110101;
	img[559] <= 8'b00111100;
	img[558] <= 8'b01100001;
	img[557] <= 8'b01011010;
	img[556] <= 8'b01100010;
	img[555] <= 8'b01100111;
	img[554] <= 8'b00011111;
	img[553] <= 8'b00010111;
	img[552] <= 8'b00001001;
	img[551] <= 8'b00000111;
	img[550] <= 8'b00001110;
	img[549] <= 8'b00001110;
	img[548] <= 8'b00010101;
	img[547] <= 8'b00010110;
	img[546] <= 8'b00101000;
	img[545] <= 8'b00011001;
	img[544] <= 8'b00100001;
	img[543] <= 8'b00100010;
	img[542] <= 8'b00100010;
	img[541] <= 8'b01011011;
	img[540] <= 8'b00110111;
	img[539] <= 8'b01110001;
	img[538] <= 8'b01101011;
	img[537] <= 8'b00011101;
	img[536] <= 8'b00011010;
	img[535] <= 8'b01010101;
	img[534] <= 8'b01100111;
	img[533] <= 8'b01100001;
	img[532] <= 8'b01011111;
	img[531] <= 8'b01101000;
	img[530] <= 8'b01100000;
	img[529] <= 8'b01001011;
	img[528] <= 8'b01000111;
	img[527] <= 8'b01010100;
	img[526] <= 8'b01011111;
	img[525] <= 8'b01100010;
	img[524] <= 8'b01101101;
	img[523] <= 8'b01110111;
	img[522] <= 8'b00100001;
	img[521] <= 8'b00000111;
	img[520] <= 8'b00010011;
	img[519] <= 8'b00000101;
	img[518] <= 8'b00001010;
	img[517] <= 8'b00001111;
	img[516] <= 8'b00010111;
	img[515] <= 8'b00011101;
	img[514] <= 8'b00110011;
	img[513] <= 8'b00011110;
	img[512] <= 8'b00101011;
	img[511] <= 8'b00101001;
	img[510] <= 8'b00101101;
	img[509] <= 8'b00111101;
	img[508] <= 8'b01011110;
	img[507] <= 8'b01111100;
	img[506] <= 8'b10011101;
	img[505] <= 8'b10000101;
	img[504] <= 8'b01110101;
	img[503] <= 8'b01010110;
	img[502] <= 8'b01111101;
	img[501] <= 8'b10010011;
	img[500] <= 8'b01100110;
	img[499] <= 8'b01010010;
	img[498] <= 8'b01001101;
	img[497] <= 8'b01000001;
	img[496] <= 8'b01000100;
	img[495] <= 8'b01100101;
	img[494] <= 8'b01100011;
	img[493] <= 8'b01011000;
	img[492] <= 8'b01100000;
	img[491] <= 8'b01110101;
	img[490] <= 8'b10011011;
	img[489] <= 8'b00100101;
	img[488] <= 8'b00011011;
	img[487] <= 8'b00010011;
	img[486] <= 8'b00010001;
	img[485] <= 8'b00001111;
	img[484] <= 8'b00001011;
	img[483] <= 8'b00010000;
	img[482] <= 8'b00100000;
	img[481] <= 8'b00100110;
	img[480] <= 8'b00111000;
	img[479] <= 8'b00100001;
	img[478] <= 8'b00110000;
	img[477] <= 8'b00110011;
	img[476] <= 8'b00111011;
	img[475] <= 8'b01011100;
	img[474] <= 8'b01011010;
	img[473] <= 8'b10100011;
	img[472] <= 8'b10000101;
	img[471] <= 8'b01100010;
	img[470] <= 8'b10010011;
	img[469] <= 8'b11000001;
	img[468] <= 8'b10000101;
	img[467] <= 8'b00111010;
	img[466] <= 8'b01010000;
	img[465] <= 8'b01000011;
	img[464] <= 8'b00111111;
	img[463] <= 8'b01100110;
	img[462] <= 8'b01100000;
	img[461] <= 8'b00110010;
	img[460] <= 8'b00110101;
	img[459] <= 8'b01011111;
	img[458] <= 8'b01110100;
	img[457] <= 8'b01010101;
	img[456] <= 8'b00011111;
	img[455] <= 8'b00011010;
	img[454] <= 8'b00001011;
	img[453] <= 8'b00001110;
	img[452] <= 8'b00000111;
	img[451] <= 8'b00010010;
	img[450] <= 8'b00010101;
	img[449] <= 8'b00011100;
	img[448] <= 8'b00011001;
	img[447] <= 8'b00101010;
	img[446] <= 8'b00100001;
	img[445] <= 8'b00100000;
	img[444] <= 8'b00100001;
	img[443] <= 8'b00100111;
	img[442] <= 8'b01100001;
	img[441] <= 8'b11001111;
	img[440] <= 8'b10000111;
	img[439] <= 8'b11000001;
	img[438] <= 8'b10001000;
	img[437] <= 8'b11101101;
	img[436] <= 8'b11010011;
	img[435] <= 8'b11000001;
	img[434] <= 8'b00111001;
	img[433] <= 8'b00011011;
	img[432] <= 8'b00111010;
	img[431] <= 8'b01001000;
	img[430] <= 8'b01100000;
	img[429] <= 8'b00110110;
	img[428] <= 8'b00101010;
	img[427] <= 8'b10000110;
	img[426] <= 8'b01111100;
	img[425] <= 8'b01111101;
	img[424] <= 8'b00010110;
	img[423] <= 8'b00010011;
	img[422] <= 8'b00000101;
	img[421] <= 8'b00000111;
	img[420] <= 8'b00000001;
	img[419] <= 8'b00000000;
	img[418] <= 8'b00000011;
	img[417] <= 8'b00010011;
	img[416] <= 8'b00010010;
	img[415] <= 8'b00010001;
	img[414] <= 8'b00011111;
	img[413] <= 8'b00010110;
	img[412] <= 8'b00011111;
	img[411] <= 8'b00010111;
	img[410] <= 8'b01001011;
	img[409] <= 8'b10110101;
	img[408] <= 8'b10110110;
	img[407] <= 8'b10111101;
	img[406] <= 8'b11010000;
	img[405] <= 8'b11110000;
	img[404] <= 8'b11110000;
	img[403] <= 8'b11111000;
	img[402] <= 8'b10110000;
	img[401] <= 8'b00111101;
	img[400] <= 8'b01001101;
	img[399] <= 8'b01101111;
	img[398] <= 8'b10110000;
	img[397] <= 8'b01101101;
	img[396] <= 8'b10101000;
	img[395] <= 8'b11010000;
	img[394] <= 8'b11011101;
	img[393] <= 8'b10100111;
	img[392] <= 8'b11000101;
	img[391] <= 8'b00010100;
	img[390] <= 8'b00010011;
	img[389] <= 8'b00011001;
	img[388] <= 8'b00100000;
	img[387] <= 8'b00001110;
	img[386] <= 8'b00010100;
	img[385] <= 8'b00001110;
	img[384] <= 8'b00001110;
	img[383] <= 8'b00011011;
	img[382] <= 8'b00011111;
	img[381] <= 8'b00010011;
	img[380] <= 8'b00001000;
	img[379] <= 8'b00000101;
	img[378] <= 8'b00011011;
	img[377] <= 8'b10011100;
	img[376] <= 8'b10011011;
	img[375] <= 8'b10100010;
	img[374] <= 8'b10110000;
	img[373] <= 8'b11001011;
	img[372] <= 8'b11100010;
	img[371] <= 8'b11011011;
	img[370] <= 8'b11100101;
	img[369] <= 8'b10111010;
	img[368] <= 8'b10101111;
	img[367] <= 8'b11111110;
	img[366] <= 8'b11101011;
	img[365] <= 8'b11100010;
	img[364] <= 8'b11101110;
	img[363] <= 8'b11100010;
	img[362] <= 8'b11010111;
	img[361] <= 8'b11010100;
	img[360] <= 8'b11100100;
	img[359] <= 8'b01000001;
	img[358] <= 8'b00100101;
	img[357] <= 8'b00011011;
	img[356] <= 8'b00011011;
	img[355] <= 8'b00001111;
	img[354] <= 8'b00010101;
	img[353] <= 8'b00001001;
	img[352] <= 8'b00001011;
	img[351] <= 8'b00110100;
	img[350] <= 8'b01001000;
	img[349] <= 8'b10000010;
	img[348] <= 8'b01100000;
	img[347] <= 8'b00100000;
	img[346] <= 8'b00100111;
	img[345] <= 8'b10010000;
	img[344] <= 8'b01111011;
	img[343] <= 8'b01111100;
	img[342] <= 8'b10001110;
	img[341] <= 8'b10011110;
	img[340] <= 8'b10111100;
	img[339] <= 8'b11000111;
	img[338] <= 8'b11010101;
	img[337] <= 8'b11011100;
	img[336] <= 8'b11101111;
	img[335] <= 8'b11111001;
	img[334] <= 8'b11110111;
	img[333] <= 8'b11111001;
	img[332] <= 8'b11101001;
	img[331] <= 8'b11110010;
	img[330] <= 8'b11110110;
	img[329] <= 8'b11110110;
	img[328] <= 8'b11100000;
	img[327] <= 8'b01110010;
	img[326] <= 8'b00101011;
	img[325] <= 8'b00110011;
	img[324] <= 8'b00101110;
	img[323] <= 8'b00101101;
	img[322] <= 8'b00100001;
	img[321] <= 8'b00011001;
	img[320] <= 8'b00010111;
	img[319] <= 8'b01111010;
	img[318] <= 8'b01100000;
	img[317] <= 8'b01100000;
	img[316] <= 8'b01010001;
	img[315] <= 8'b01010011;
	img[314] <= 8'b01101001;
	img[313] <= 8'b01101110;
	img[312] <= 8'b01101000;
	img[311] <= 8'b01100010;
	img[310] <= 8'b01101100;
	img[309] <= 8'b10000110;
	img[308] <= 8'b10010111;
	img[307] <= 8'b10101100;
	img[306] <= 8'b10101110;
	img[305] <= 8'b11000110;
	img[304] <= 8'b11001100;
	img[303] <= 8'b11101000;
	img[302] <= 8'b11110000;
	img[301] <= 8'b11110111;
	img[300] <= 8'b11111001;
	img[299] <= 8'b11101101;
	img[298] <= 8'b11101101;
	img[297] <= 8'b11101011;
	img[296] <= 8'b11011110;
	img[295] <= 8'b10110100;
	img[294] <= 8'b00100110;
	img[293] <= 8'b00110000;
	img[292] <= 8'b00101110;
	img[291] <= 8'b00101000;
	img[290] <= 8'b00011110;
	img[289] <= 8'b00101011;
	img[288] <= 8'b00101111;
	img[287] <= 8'b01000001;
	img[286] <= 8'b01001001;
	img[285] <= 8'b00111110;
	img[284] <= 8'b00111111;
	img[283] <= 8'b01001010;
	img[282] <= 8'b01010100;
	img[281] <= 8'b01100111;
	img[280] <= 8'b01011011;
	img[279] <= 8'b01001001;
	img[278] <= 8'b01010100;
	img[277] <= 8'b01100011;
	img[276] <= 8'b01110001;
	img[275] <= 8'b10000100;
	img[274] <= 8'b10010110;
	img[273] <= 8'b10101010;
	img[272] <= 8'b10110101;
	img[271] <= 8'b11000111;
	img[270] <= 8'b11011010;
	img[269] <= 8'b11100100;
	img[268] <= 8'b11011100;
	img[267] <= 8'b11100101;
	img[266] <= 8'b11101011;
	img[265] <= 8'b11100001;
	img[264] <= 8'b11011010;
	img[263] <= 8'b11101100;
	img[262] <= 8'b00101001;
	img[261] <= 8'b00101010;
	img[260] <= 8'b00111110;
	img[259] <= 8'b00101011;
	img[258] <= 8'b00101101;
	img[257] <= 8'b00110000;
	img[256] <= 8'b00101100;
	img[255] <= 8'b00101010;
	img[254] <= 8'b00110000;
	img[253] <= 8'b00110010;
	img[252] <= 8'b00110011;
	img[251] <= 8'b00111011;
	img[250] <= 8'b01000111;
	img[249] <= 8'b01010000;
	img[248] <= 8'b01010000;
	img[247] <= 8'b00111101;
	img[246] <= 8'b01000000;
	img[245] <= 8'b01001100;
	img[244] <= 8'b01011110;
	img[243] <= 8'b01100010;
	img[242] <= 8'b01101111;
	img[241] <= 8'b10001010;
	img[240] <= 8'b10010001;
	img[239] <= 8'b10100101;
	img[238] <= 8'b10110101;
	img[237] <= 8'b11000100;
	img[236] <= 8'b11000000;
	img[235] <= 8'b10110110;
	img[234] <= 8'b11000001;
	img[233] <= 8'b11001011;
	img[232] <= 8'b11000111;
	img[231] <= 8'b11010011;
	img[230] <= 8'b01110100;
	img[229] <= 8'b00100000;
	img[228] <= 8'b00110000;
	img[227] <= 8'b00110010;
	img[226] <= 8'b00101011;
	img[225] <= 8'b00101101;
	img[224] <= 8'b00101011;
	img[223] <= 8'b00011011;
	img[222] <= 8'b00100010;
	img[221] <= 8'b00101001;
	img[220] <= 8'b00101011;
	img[219] <= 8'b00110100;
	img[218] <= 8'b01000000;
	img[217] <= 8'b01000111;
	img[216] <= 8'b01000111;
	img[215] <= 8'b00111000;
	img[214] <= 8'b00110110;
	img[213] <= 8'b00111001;
	img[212] <= 8'b01001011;
	img[211] <= 8'b01010011;
	img[210] <= 8'b01011100;
	img[209] <= 8'b01101011;
	img[208] <= 8'b01101100;
	img[207] <= 8'b01111101;
	img[206] <= 8'b10001110;
	img[205] <= 8'b10101000;
	img[204] <= 8'b10101111;
	img[203] <= 8'b10011111;
	img[202] <= 8'b10010111;
	img[201] <= 8'b10100010;
	img[200] <= 8'b10101011;
	img[199] <= 8'b10101101;
	img[198] <= 8'b10001011;
	img[197] <= 8'b00011110;
	img[196] <= 8'b00101101;
	img[195] <= 8'b00101111;
	img[194] <= 8'b00101100;
	img[193] <= 8'b00100000;
	img[192] <= 8'b00101101;
	img[191] <= 8'b00010011;
	img[190] <= 8'b00011100;
	img[189] <= 8'b00100011;
	img[188] <= 8'b00100111;
	img[187] <= 8'b00110001;
	img[186] <= 8'b00111011;
	img[185] <= 8'b01000010;
	img[184] <= 8'b00111111;
	img[183] <= 8'b00110111;
	img[182] <= 8'b00101111;
	img[181] <= 8'b00101110;
	img[180] <= 8'b00111111;
	img[179] <= 8'b01000111;
	img[178] <= 8'b01001000;
	img[177] <= 8'b01010000;
	img[176] <= 8'b01001101;
	img[175] <= 8'b01011111;
	img[174] <= 8'b01101100;
	img[173] <= 8'b10000111;
	img[172] <= 8'b10011001;
	img[171] <= 8'b10010111;
	img[170] <= 8'b10010001;
	img[169] <= 8'b10010011;
	img[168] <= 8'b10010111;
	img[167] <= 8'b10100100;
	img[166] <= 8'b10011000;
	img[165] <= 8'b00011101;
	img[164] <= 8'b00101111;
	img[163] <= 8'b00100110;
	img[162] <= 8'b00101110;
	img[161] <= 8'b00110011;
	img[160] <= 8'b10101111;
	img[159] <= 8'b00010010;
	img[158] <= 8'b00011011;
	img[157] <= 8'b00100010;
	img[156] <= 8'b00100101;
	img[155] <= 8'b00101101;
	img[154] <= 8'b00110101;
	img[153] <= 8'b00111011;
	img[152] <= 8'b00111010;
	img[151] <= 8'b00110111;
	img[150] <= 8'b00110010;
	img[149] <= 8'b00110001;
	img[148] <= 8'b00111100;
	img[147] <= 8'b01000000;
	img[146] <= 8'b00111100;
	img[145] <= 8'b01000001;
	img[144] <= 8'b01000001;
	img[143] <= 8'b01010010;
	img[142] <= 8'b01011101;
	img[141] <= 8'b01101111;
	img[140] <= 8'b10000100;
	img[139] <= 8'b10010011;
	img[138] <= 8'b10011010;
	img[137] <= 8'b10011000;
	img[136] <= 8'b10010010;
	img[135] <= 8'b10010001;
	img[134] <= 8'b10101101;
	img[133] <= 8'b01100110;
	img[132] <= 8'b00101001;
	img[131] <= 8'b00110100;
	img[130] <= 8'b00110010;
	img[129] <= 8'b01010101;
	img[128] <= 8'b11101101;
	img[127] <= 8'b00010111;
	img[126] <= 8'b00011011;
	img[125] <= 8'b00011101;
	img[124] <= 8'b00011111;
	img[123] <= 8'b00100011;
	img[122] <= 8'b00101010;
	img[121] <= 8'b00101110;
	img[120] <= 8'b00110000;
	img[119] <= 8'b00110011;
	img[118] <= 8'b00110010;
	img[117] <= 8'b00101111;
	img[116] <= 8'b00111001;
	img[115] <= 8'b00111110;
	img[114] <= 8'b00110111;
	img[113] <= 8'b00111001;
	img[112] <= 8'b00111100;
	img[111] <= 8'b01001000;
	img[110] <= 8'b01010011;
	img[109] <= 8'b01100100;
	img[108] <= 8'b01110101;
	img[107] <= 8'b10000100;
	img[106] <= 8'b10001010;
	img[105] <= 8'b10001011;
	img[104] <= 8'b10001100;
	img[103] <= 8'b10010111;
	img[102] <= 8'b10101101;
	img[101] <= 8'b11001011;
	img[100] <= 8'b00110111;
	img[99] <= 8'b01000010;
	img[98] <= 8'b01011001;
	img[97] <= 8'b11101101;
	img[96] <= 8'b11110100;
	img[95] <= 8'b00011011;
	img[94] <= 8'b00011101;
	img[93] <= 8'b00011101;
	img[92] <= 8'b00011100;
	img[91] <= 8'b00011011;
	img[90] <= 8'b00100000;
	img[89] <= 8'b00100100;
	img[88] <= 8'b00100111;
	img[87] <= 8'b00110000;
	img[86] <= 8'b00110001;
	img[85] <= 8'b00101100;
	img[84] <= 8'b00110100;
	img[83] <= 8'b00111100;
	img[82] <= 8'b00110111;
	img[81] <= 8'b00110101;
	img[80] <= 8'b00110101;
	img[79] <= 8'b01000001;
	img[78] <= 8'b01000111;
	img[77] <= 8'b01011000;
	img[76] <= 8'b01101111;
	img[75] <= 8'b01111101;
	img[74] <= 8'b01111010;
	img[73] <= 8'b01111010;
	img[72] <= 8'b10000011;
	img[71] <= 8'b10010000;
	img[70] <= 8'b10001000;
	img[69] <= 8'b10111010;
	img[68] <= 8'b10000111;
	img[67] <= 8'b10011101;
	img[66] <= 8'b11111000;
	img[65] <= 8'b11110110;
	img[64] <= 8'b11101000;
	img[63] <= 8'b00100001;
	img[62] <= 8'b00100001;
	img[61] <= 8'b00011110;
	img[60] <= 8'b00011010;
	img[59] <= 8'b00010111;
	img[58] <= 8'b00011001;
	img[57] <= 8'b00011101;
	img[56] <= 8'b00100000;
	img[55] <= 8'b00101000;
	img[54] <= 8'b00110100;
	img[53] <= 8'b00110001;
	img[52] <= 8'b00110101;
	img[51] <= 8'b00111010;
	img[50] <= 8'b00110111;
	img[49] <= 8'b00110101;
	img[48] <= 8'b00110010;
	img[47] <= 8'b00111001;
	img[46] <= 8'b01000000;
	img[45] <= 8'b01001100;
	img[44] <= 8'b01100011;
	img[43] <= 8'b01111001;
	img[42] <= 8'b01111001;
	img[41] <= 8'b01110101;
	img[40] <= 8'b01111011;
	img[39] <= 8'b10001010;
	img[38] <= 8'b10010010;
	img[37] <= 8'b10111000;
	img[36] <= 8'b11100001;
	img[35] <= 8'b11110111;
	img[34] <= 8'b11101110;
	img[33] <= 8'b11111001;
	img[32] <= 8'b11011010;
	img[31] <= 8'b00100100;
	img[30] <= 8'b00100010;
	img[29] <= 8'b00011111;
	img[28] <= 8'b00011001;
	img[27] <= 8'b00010110;
	img[26] <= 8'b00010110;
	img[25] <= 8'b00011000;
	img[24] <= 8'b00011101;
	img[23] <= 8'b00100000;
	img[22] <= 8'b00110110;
	img[21] <= 8'b00111010;
	img[20] <= 8'b00111001;
	img[19] <= 8'b00111001;
	img[18] <= 8'b00110000;
	img[17] <= 8'b00110010;
	img[16] <= 8'b00110100;
	img[15] <= 8'b00101110;
	img[14] <= 8'b00111111;
	img[13] <= 8'b01001010;
	img[12] <= 8'b01010110;
	img[11] <= 8'b01101010;
	img[10] <= 8'b01110100;
	img[9] <= 8'b01110001;
	img[8] <= 8'b01110001;
	img[7] <= 8'b01111001;
	img[6] <= 8'b10001101;
	img[5] <= 8'b10110110;
	img[4] <= 8'b11001111;
	img[3] <= 8'b11100100;
	img[2] <= 8'b11111000;
	img[1] <= 8'b11101011;
	img[0] <= 8'b11001110;
	
end

always @(posedge i_clk) begin
  for(ii=0; ii<88; ii=ii+1) begin
    img[1021-ii][0] <= message[87-ii];
	end
end

reg	[27:0]	counter;
initial	counter = 28'hffffff0;
always @(posedge i_clk)
	counter <= counter + 1'b1;

wire		tx_break, tx_busy;
reg		tx_stb;
reg	[9:0]	tx_index;
reg	[7:0]	tx_data;

assign	tx_break = 1'b0;

initial	tx_index = 10'h0;
always @(posedge i_clk)
	if ((tx_stb)&&(!tx_busy))
		tx_index <= tx_index + 1'b1;
always @(posedge i_clk)
	tx_data <= img[tx_index];

initial	tx_stb = 1'b0;
always @(posedge i_clk)
	if (&counter)
		tx_stb <= 1'b1;
	else if ((tx_stb)&&(!tx_busy)&&(tx_index==4'hf))
		tx_stb <= 1'b0;

// 868 is 115200 Baud, based upon a 100MHz clock
txuartlite #(.TIMING_BITS(10), .CLOCKS_PER_BAUD(868))
	transmitter(i_clk, tx_stb, tx_data, o_uart_tx, tx_busy);

endmodule
////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	txuartlite.v
//
// Project:	wbuart32, a full featured UART with simulator
//
// Purpose:	Transmit outputs over a single UART line.  This particular UART
//		implementation has been extremely simplified: it does not handle
//	generating break conditions, nor does it handle anything other than the
//	8N1 (8 data bits, no parity, 1 stop bit) UART sub-protocol.
//
//	To interface with this module, connect it to your system clock, and
//	pass it the byte of data you wish to transmit.  Strobe the i_wr line
//	high for one cycle, and your data will be off.  Wait until the 'o_busy'
//	line is low before strobing the i_wr line again--this implementation
//	has NO BUFFER, so strobing i_wr while the core is busy will just
//	get ignored.  The output will be placed on the o_txuart output line.
//
//	(I often set both data and strobe on the same clock, and then just leave
//	them set until the busy line is low.  Then I move on to the next piece
//	of data.)
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015-2017, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
//
`define	TXUL_BIT_ZERO	4'h0
`define	TXUL_BIT_ONE	4'h1
`define	TXUL_BIT_TWO	4'h2
`define	TXUL_BIT_THREE	4'h3
`define	TXUL_BIT_FOUR	4'h4
`define	TXUL_BIT_FIVE	4'h5
`define	TXUL_BIT_SIX	4'h6
`define	TXUL_BIT_SEVEN	4'h7
`define	TXUL_STOP	4'h8
`define	TXUL_IDLE	4'hf
//
//
module txuartlite(i_clk, i_wr, i_data, o_uart_tx, o_busy);
parameter	[4:0]	TIMING_BITS = 5'd24;
localparam		TB = TIMING_BITS;
parameter	[(TB-1):0]	CLOCKS_PER_BAUD = 8; // 24'd868;
parameter	[0:0]	F_OPT_CLK2FFLOGIC = 1'b0;
input	wire		i_clk;
input	wire		i_wr;
input	wire	[7:0]	i_data;
// And the UART input line itself
output	reg		o_uart_tx;
// A line to tell others when we are ready to accept data.  If
// (i_wr)&&(!o_busy) is ever true, then the core has accepted a byte
// for transmission.
output	wire		o_busy;

reg	[(TB-1):0]	baud_counter;
reg	[3:0]	state;
reg	[7:0]	lcl_data;
reg		r_busy, zero_baud_counter;

initial	r_busy = 1'b1;
initial	state  = `TXUL_IDLE;
always @(posedge i_clk)
begin
	if (!zero_baud_counter)
		// r_busy needs to be set coming into here
		r_busy <= 1'b1;
	else if (state > `TXUL_STOP)	// STATE_IDLE
	begin
		state <= `TXUL_IDLE;
		r_busy <= 1'b0;
		if ((i_wr)&&(!r_busy))
		begin	// Immediately start us off with a start bit
			r_busy <= 1'b1;
			state <= `TXUL_BIT_ZERO;
		end
	end else begin
		// One clock tick in each of these states ...
		r_busy <= 1'b1;
		if (state <=`TXUL_STOP) // start bit, 8-d bits, stop-b
			state <= state + 1'b1;
		else
			state <= `TXUL_IDLE;
	end
end

// o_busy
//
// This is a wire, designed to be true is we are ever busy above.
// originally, this was going to be true if we were ever not in the
// idle state.  The logic has since become more complex, hence we have
// a register dedicated to this and just copy out that registers value.
assign	o_busy = (r_busy);


// lcl_data
//
// This is our working copy of the i_data register which we use
// when transmitting.  It is only of interest during transmit, and is
// allowed to be whatever at any other time.  Hence, if r_busy isn't
// true, we can always set it.  On the one clock where r_busy isn't
// true and i_wr is, we set it and r_busy is true thereafter.
// Then, on any zero_baud_counter (i.e. change between baud intervals)
// we simple logically shift the register right to grab the next bit.
initial	lcl_data = 8'hff;
always @(posedge i_clk)
	if ((i_wr)&&(!r_busy))
		lcl_data <= i_data;
	else if (zero_baud_counter)
		lcl_data <= { 1'b1, lcl_data[7:1] };

// o_uart_tx
//
// This is the final result/output desired of this core.  It's all
// centered about o_uart_tx.  This is what finally needs to follow
// the UART protocol.
//
initial	o_uart_tx = 1'b1;
always @(posedge i_clk)
	if ((i_wr)&&(!r_busy))
		o_uart_tx <= 1'b0;	// Set the start bit on writes
	else if (zero_baud_counter)	// Set the data bit.
		o_uart_tx <= lcl_data[0];


// All of the above logic is driven by the baud counter.  Bits must last
// CLOCKS_PER_BAUD in length, and this baud counter is what we use to
// make certain of that.
//
// The basic logic is this: at the beginning of a bit interval, start
// the baud counter and set it to count CLOCKS_PER_BAUD.  When it gets
// to zero, restart it.
//
// However, comparing a 28'bit number to zero can be rather complex--
// especially if we wish to do anything else on that same clock.  For
// that reason, we create "zero_baud_counter".  zero_baud_counter is
// nothing more than a flag that is true anytime baud_counter is zero.
// It's true when the logic (above) needs to step to the next bit.
// Simple enough?
//
// I wish we could stop there, but there are some other (ugly)
// conditions to deal with that offer exceptions to this basic logic.
//
// 1. When the user has commanded a BREAK across the line, we need to
// wait several baud intervals following the break before we start
// transmitting, to give any receiver a chance to recognize that we are
// out of the break condition, and to know that the next bit will be
// a stop bit.
//
// 2. A reset is similar to a break condition--on both we wait several
// baud intervals before allowing a start bit.
//
// 3. In the idle state, we stop our counter--so that upon a request
// to transmit when idle we can start transmitting immediately, rather
// than waiting for the end of the next (fictitious and arbitrary) baud
// interval.
//
// When (i_wr)&&(!r_busy)&&(state == `TXUL_IDLE) then we're not only in
// the idle state, but we also just accepted a command to start writing
// the next word.  At this point, the baud counter needs to be reset
// to the number of CLOCKS_PER_BAUD, and zero_baud_counter set to zero.
//
// The logic is a bit twisted here, in that it will only check for the
// above condition when zero_baud_counter is false--so as to make
// certain the STOP bit is complete.
initial	zero_baud_counter = 1'b1;
initial	baud_counter = 0;
always @(posedge i_clk)
begin
	zero_baud_counter <= (baud_counter == 24'h01);
	if (state == `TXUL_IDLE)
	begin
		baud_counter <= 24'h0;
		zero_baud_counter <= 1'b1;
		if ((i_wr)&&(!r_busy))
		begin
			baud_counter <= CLOCKS_PER_BAUD - 24'h01;
			zero_baud_counter <= 1'b0;
		end
	end else if ((zero_baud_counter)&&(state == 4'h9))
	begin
		baud_counter <= 0;
		zero_baud_counter <= 1'b1;
	end else if (!zero_baud_counter)
		baud_counter <= baud_counter - 24'h01;
	else
		baud_counter <= CLOCKS_PER_BAUD - 24'h01;
end

//
//
// FORMAL METHODS
//
//
//
`ifdef	FORMAL

`ifdef	TXUARTLITE
`define	ASSUME	assume
`else
`define	ASSUME	assert
`endif

// Setup

reg	f_past_valid, f_last_clk;

generate if (F_OPT_CLK2FFLOGIC)
begin

	always @($global_clock)
	begin
		restrict(i_clk == !f_last_clk);
		f_last_clk <= i_clk;
		if (!$rose(i_clk))
		begin
			`ASSUME($stable(i_wr));
			`ASSUME($stable(i_data));
		end
	end

end endgenerate

initial	f_past_valid = 1'b0;
always @(posedge i_clk)
	f_past_valid <= 1'b1;

initial	`ASSUME(!i_wr);
always @(posedge i_clk)
	if ((f_past_valid)&&($past(i_wr))&&($past(o_busy)))
	begin
		`ASSUME(i_wr   == $past(i_wr));
		`ASSUME(i_data == $past(i_data));
	end

// Check the baud counter
always @(posedge i_clk)
	assert(zero_baud_counter == (baud_counter == 0));

always @(posedge i_clk)
	if ((f_past_valid)&&($past(baud_counter != 0))&&($past(state != `TXUL_IDLE)))
		assert(baud_counter == $past(baud_counter - 1'b1));

always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(zero_baud_counter))&&($past(state != `TXUL_IDLE)))
		assert($stable(o_uart_tx));

reg	[(TB-1):0]	f_baud_count;
initial	f_baud_count = 1'b0;
always @(posedge i_clk)
	if (zero_baud_counter)
		f_baud_count <= 0;
	else
		f_baud_count <= f_baud_count + 1'b1;

always @(posedge i_clk)
	assert(f_baud_count < CLOCKS_PER_BAUD);

always @(posedge i_clk)
	if (baud_counter != 0)
		assert(o_busy);

reg	[9:0]	f_txbits;
initial	f_txbits = 0;
always @(posedge i_clk)
	if (zero_baud_counter)
		f_txbits <= { o_uart_tx, f_txbits[9:1] };

always @(posedge i_clk)
if ((f_past_valid)&&(!$past(zero_baud_counter))
		&&(!$past(state==`TXUL_IDLE)))
	assert(state == $past(state));

reg	[3:0]	f_bitcount;
initial	f_bitcount = 0;
always @(posedge i_clk)
	if ((!f_past_valid)||(!$past(f_past_valid)))
		f_bitcount <= 0;
	else if ((state == `TXUL_IDLE)&&(zero_baud_counter))
		f_bitcount <= 0;
	else if (zero_baud_counter)
		f_bitcount <= f_bitcount + 1'b1;

always @(posedge i_clk)
	assert(f_bitcount <= 4'ha);

reg	[7:0]	f_request_tx_data;
always @(posedge i_clk)
	if ((i_wr)&&(!o_busy))
		f_request_tx_data <= i_data;

wire	[3:0]	subcount;
assign	subcount = 10-f_bitcount;
always @(posedge i_clk)
	if (f_bitcount > 0)
		assert(!f_txbits[subcount]);

always @(posedge i_clk)
	if (f_bitcount == 4'ha)
	begin
		assert(f_txbits[8:1] == f_request_tx_data);
		assert( f_txbits[9]);
	end

always @(posedge i_clk)
	assert((state <= `TXUL_STOP + 1'b1)||(state == `TXUL_IDLE));

always @(posedge i_clk)
if ((f_past_valid)&&($past(f_past_valid))&&($past(o_busy)))
	cover(!o_busy);

`endif	// FORMAL
`ifdef	VERIFIC_SVA
reg	[7:0]	fsv_data;

//
// Grab a copy of the data any time we are sent a new byte to transmit
// We'll use this in a moment to compare the item transmitted against
// what is supposed to be transmitted
//
always @(posedge i_clk)
	if ((i_wr)&&(!o_busy))
		fsv_data <= i_data;

//
// One baud interval
//
// 1. The UART output is constant at DAT
// 2. The internal state remains constant at ST
// 3. CKS = the number of clocks per bit.
//
// Everything stays constant during the CKS clocks with the exception
// of (zero_baud_counter), which is *only* raised on the last clock
// interval
sequence	BAUD_INTERVAL(CKS, DAT, SR, ST);
	((o_uart_tx == DAT)&&(state == ST)
		&&(lcl_data == SR)
		&&(!zero_baud_counter))[*(CKS-1)]
	##1 (o_uart_tx == DAT)&&(state == ST)
		&&(lcl_data == SR)
		&&(zero_baud_counter);
endsequence

//
// One byte transmitted
//
// DATA = the byte that is sent
// CKS  = the number of clocks per bit
//
sequence	SEND(CKS, DATA);
	BAUD_INTERVAL(CKS, 1'b0, DATA, 4'h0)
	##1 BAUD_INTERVAL(CKS, DATA[0], {{(1){1'b1}},DATA[7:1]}, 4'h1)
	##1 BAUD_INTERVAL(CKS, DATA[1], {{(2){1'b1}},DATA[7:2]}, 4'h2)
	##1 BAUD_INTERVAL(CKS, DATA[2], {{(3){1'b1}},DATA[7:3]}, 4'h3)
	##1 BAUD_INTERVAL(CKS, DATA[3], {{(4){1'b1}},DATA[7:4]}, 4'h4)
	##1 BAUD_INTERVAL(CKS, DATA[4], {{(5){1'b1}},DATA[7:5]}, 4'h5)
	##1 BAUD_INTERVAL(CKS, DATA[5], {{(6){1'b1}},DATA[7:6]}, 4'h6)
	##1 BAUD_INTERVAL(CKS, DATA[6], {{(7){1'b1}},DATA[7:7]}, 4'h7)
	##1 BAUD_INTERVAL(CKS, DATA[7], 8'hff, 4'h8)
	##1 BAUD_INTERVAL(CKS, 1'b1, 8'hff, 4'h9);
endsequence

//
// Transmit one byte
//
// Once the byte is transmitted, make certain we return to
// idle
//
assert property (
	@(posedge i_clk)
	(i_wr)&&(!o_busy)
	|=> ((o_busy) throughout SEND(CLOCKS_PER_BAUD,fsv_data))
	##1 (!o_busy)&&(o_uart_tx)&&(zero_baud_counter));

assume property (
	@(posedge i_clk)
	(i_wr)&&(o_busy) |=>
		(i_wr)&&(o_busy)&&($stable(i_data)));

//
// Make certain that o_busy is true any time zero_baud_counter is
// non-zero
//
always @(*)
	assert((o_busy)||(zero_baud_counter) );

// If and only if zero_baud_counter is true, baud_counter must be zero
// Insist on that relationship here.
always @(*)
	assert(zero_baud_counter == (baud_counter == 0));

// To make certain baud_counter stays below CLOCKS_PER_BAUD
always @(*)
	assert(baud_counter < CLOCKS_PER_BAUD);

//
// Insist that we are only ever in a valid state
always @(*)
	assert((state <= `TXUL_STOP+1'b1)||(state == `TXUL_IDLE));

`endif // Verific SVA
endmodule