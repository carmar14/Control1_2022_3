  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtP)
    ;%
      section.nData     = 146;
      section.data(146)  = dumData; %prealloc
      
	  ;% rtP.TransferFcn_A
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtP.TransferFcn_C
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 2;
	
	  ;% rtP.QueryInstrument_P1_Size
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 4;
	
	  ;% rtP.QueryInstrument_P1
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 6;
	
	  ;% rtP.QueryInstrument_P2_Size
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 7;
	
	  ;% rtP.QueryInstrument_P2
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 9;
	
	  ;% rtP.QueryInstrument_P3_Size
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 10;
	
	  ;% rtP.QueryInstrument_P3
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 12;
	
	  ;% rtP.QueryInstrument_P4_Size
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 13;
	
	  ;% rtP.QueryInstrument_P4
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 15;
	
	  ;% rtP.QueryInstrument_P5_Size
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 16;
	
	  ;% rtP.QueryInstrument_P5
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 18;
	
	  ;% rtP.QueryInstrument_P6_Size
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 19;
	
	  ;% rtP.QueryInstrument_P6
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 21;
	
	  ;% rtP.QueryInstrument_P7_Size
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 22;
	
	  ;% rtP.QueryInstrument_P7
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 24;
	
	  ;% rtP.QueryInstrument_P8_Size
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 25;
	
	  ;% rtP.QueryInstrument_P8
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 27;
	
	  ;% rtP.QueryInstrument_P9_Size
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 28;
	
	  ;% rtP.QueryInstrument_P9
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 30;
	
	  ;% rtP.QueryInstrument_P10_Size
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 31;
	
	  ;% rtP.QueryInstrument_P10
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 33;
	
	  ;% rtP.QueryInstrument_P11_Size
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 34;
	
	  ;% rtP.QueryInstrument_P11
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 36;
	
	  ;% rtP.QueryInstrument_P12_Size
	  section.data(25).logicalSrcIdx = 24;
	  section.data(25).dtTransOffset = 37;
	
	  ;% rtP.QueryInstrument_P12
	  section.data(26).logicalSrcIdx = 25;
	  section.data(26).dtTransOffset = 39;
	
	  ;% rtP.QueryInstrument_P13_Size
	  section.data(27).logicalSrcIdx = 26;
	  section.data(27).dtTransOffset = 40;
	
	  ;% rtP.QueryInstrument_P13
	  section.data(28).logicalSrcIdx = 27;
	  section.data(28).dtTransOffset = 42;
	
	  ;% rtP.QueryInstrument_P14_Size
	  section.data(29).logicalSrcIdx = 28;
	  section.data(29).dtTransOffset = 43;
	
	  ;% rtP.QueryInstrument_P14
	  section.data(30).logicalSrcIdx = 29;
	  section.data(30).dtTransOffset = 45;
	
	  ;% rtP.QueryInstrument_P15_Size
	  section.data(31).logicalSrcIdx = 30;
	  section.data(31).dtTransOffset = 46;
	
	  ;% rtP.QueryInstrument_P15
	  section.data(32).logicalSrcIdx = 31;
	  section.data(32).dtTransOffset = 48;
	
	  ;% rtP.QueryInstrument_P16_Size
	  section.data(33).logicalSrcIdx = 32;
	  section.data(33).dtTransOffset = 49;
	
	  ;% rtP.QueryInstrument_P16
	  section.data(34).logicalSrcIdx = 33;
	  section.data(34).dtTransOffset = 51;
	
	  ;% rtP.QueryInstrument_P17_Size
	  section.data(35).logicalSrcIdx = 34;
	  section.data(35).dtTransOffset = 60;
	
	  ;% rtP.QueryInstrument_P17
	  section.data(36).logicalSrcIdx = 35;
	  section.data(36).dtTransOffset = 62;
	
	  ;% rtP.QueryInstrument_P18_Size
	  section.data(37).logicalSrcIdx = 36;
	  section.data(37).dtTransOffset = 63;
	
	  ;% rtP.QueryInstrument_P18
	  section.data(38).logicalSrcIdx = 37;
	  section.data(38).dtTransOffset = 65;
	
	  ;% rtP.QueryInstrument_P19_Size
	  section.data(39).logicalSrcIdx = 38;
	  section.data(39).dtTransOffset = 74;
	
	  ;% rtP.QueryInstrument_P19
	  section.data(40).logicalSrcIdx = 39;
	  section.data(40).dtTransOffset = 76;
	
	  ;% rtP.QueryInstrument_P20_Size
	  section.data(41).logicalSrcIdx = 40;
	  section.data(41).dtTransOffset = 77;
	
	  ;% rtP.QueryInstrument_P21_Size
	  section.data(42).logicalSrcIdx = 42;
	  section.data(42).dtTransOffset = 79;
	
	  ;% rtP.QueryInstrument_P21
	  section.data(43).logicalSrcIdx = 43;
	  section.data(43).dtTransOffset = 81;
	
	  ;% rtP.QueryInstrument_P22_Size
	  section.data(44).logicalSrcIdx = 44;
	  section.data(44).dtTransOffset = 82;
	
	  ;% rtP.QueryInstrument_P22
	  section.data(45).logicalSrcIdx = 45;
	  section.data(45).dtTransOffset = 84;
	
	  ;% rtP.QueryInstrument_P23_Size
	  section.data(46).logicalSrcIdx = 46;
	  section.data(46).dtTransOffset = 99;
	
	  ;% rtP.QueryInstrument_P23
	  section.data(47).logicalSrcIdx = 47;
	  section.data(47).dtTransOffset = 101;
	
	  ;% rtP.QueryInstrument_P24_Size
	  section.data(48).logicalSrcIdx = 48;
	  section.data(48).dtTransOffset = 104;
	
	  ;% rtP.QueryInstrument_P25_Size
	  section.data(49).logicalSrcIdx = 50;
	  section.data(49).dtTransOffset = 106;
	
	  ;% rtP.QueryInstrument_P25
	  section.data(50).logicalSrcIdx = 51;
	  section.data(50).dtTransOffset = 108;
	
	  ;% rtP.QueryInstrument_P26_Size
	  section.data(51).logicalSrcIdx = 52;
	  section.data(51).dtTransOffset = 109;
	
	  ;% rtP.QueryInstrument_P26
	  section.data(52).logicalSrcIdx = 53;
	  section.data(52).dtTransOffset = 111;
	
	  ;% rtP.QueryInstrument_P27_Size
	  section.data(53).logicalSrcIdx = 54;
	  section.data(53).dtTransOffset = 118;
	
	  ;% rtP.QueryInstrument_P27
	  section.data(54).logicalSrcIdx = 55;
	  section.data(54).dtTransOffset = 120;
	
	  ;% rtP.QueryInstrument_P28_Size
	  section.data(55).logicalSrcIdx = 56;
	  section.data(55).dtTransOffset = 121;
	
	  ;% rtP.QueryInstrument_P28
	  section.data(56).logicalSrcIdx = 57;
	  section.data(56).dtTransOffset = 123;
	
	  ;% rtP.QueryInstrument_P29_Size
	  section.data(57).logicalSrcIdx = 58;
	  section.data(57).dtTransOffset = 124;
	
	  ;% rtP.QueryInstrument_P29
	  section.data(58).logicalSrcIdx = 59;
	  section.data(58).dtTransOffset = 126;
	
	  ;% rtP.QueryInstrument_P30_Size
	  section.data(59).logicalSrcIdx = 60;
	  section.data(59).dtTransOffset = 127;
	
	  ;% rtP.QueryInstrument_P30
	  section.data(60).logicalSrcIdx = 61;
	  section.data(60).dtTransOffset = 129;
	
	  ;% rtP.QueryInstrument_P31_Size
	  section.data(61).logicalSrcIdx = 62;
	  section.data(61).dtTransOffset = 130;
	
	  ;% rtP.QueryInstrument_P31
	  section.data(62).logicalSrcIdx = 63;
	  section.data(62).dtTransOffset = 132;
	
	  ;% rtP.QueryInstrument_P32_Size
	  section.data(63).logicalSrcIdx = 64;
	  section.data(63).dtTransOffset = 133;
	
	  ;% rtP.QueryInstrument_P32
	  section.data(64).logicalSrcIdx = 65;
	  section.data(64).dtTransOffset = 135;
	
	  ;% rtP.QueryInstrument_P33_Size
	  section.data(65).logicalSrcIdx = 66;
	  section.data(65).dtTransOffset = 136;
	
	  ;% rtP.QueryInstrument_P33
	  section.data(66).logicalSrcIdx = 67;
	  section.data(66).dtTransOffset = 138;
	
	  ;% rtP.QueryInstrument_P34_Size
	  section.data(67).logicalSrcIdx = 68;
	  section.data(67).dtTransOffset = 139;
	
	  ;% rtP.QueryInstrument_P34
	  section.data(68).logicalSrcIdx = 69;
	  section.data(68).dtTransOffset = 141;
	
	  ;% rtP.QueryInstrument_P35_Size
	  section.data(69).logicalSrcIdx = 70;
	  section.data(69).dtTransOffset = 142;
	
	  ;% rtP.QueryInstrument_P35
	  section.data(70).logicalSrcIdx = 71;
	  section.data(70).dtTransOffset = 144;
	
	  ;% rtP.QueryInstrument_P36_Size
	  section.data(71).logicalSrcIdx = 72;
	  section.data(71).dtTransOffset = 153;
	
	  ;% rtP.QueryInstrument_P36
	  section.data(72).logicalSrcIdx = 73;
	  section.data(72).dtTransOffset = 155;
	
	  ;% rtP.QueryInstrument_P37_Size
	  section.data(73).logicalSrcIdx = 74;
	  section.data(73).dtTransOffset = 156;
	
	  ;% rtP.QueryInstrument_P37
	  section.data(74).logicalSrcIdx = 75;
	  section.data(74).dtTransOffset = 158;
	
	  ;% rtP.QueryInstrument_P38_Size
	  section.data(75).logicalSrcIdx = 76;
	  section.data(75).dtTransOffset = 159;
	
	  ;% rtP.QueryInstrument_P38
	  section.data(76).logicalSrcIdx = 77;
	  section.data(76).dtTransOffset = 161;
	
	  ;% rtP.QueryInstrument_P39_Size
	  section.data(77).logicalSrcIdx = 78;
	  section.data(77).dtTransOffset = 162;
	
	  ;% rtP.QueryInstrument_P39
	  section.data(78).logicalSrcIdx = 79;
	  section.data(78).dtTransOffset = 164;
	
	  ;% rtP.Unbuffer2_ic
	  section.data(79).logicalSrcIdx = 80;
	  section.data(79).dtTransOffset = 165;
	
	  ;% rtP.Unbuffer1_ic
	  section.data(80).logicalSrcIdx = 81;
	  section.data(80).dtTransOffset = 166;
	
	  ;% rtP.ToInstrument_P1_Size
	  section.data(81).logicalSrcIdx = 82;
	  section.data(81).dtTransOffset = 167;
	
	  ;% rtP.ToInstrument_P1
	  section.data(82).logicalSrcIdx = 83;
	  section.data(82).dtTransOffset = 169;
	
	  ;% rtP.ToInstrument_P2_Size
	  section.data(83).logicalSrcIdx = 84;
	  section.data(83).dtTransOffset = 170;
	
	  ;% rtP.ToInstrument_P2
	  section.data(84).logicalSrcIdx = 85;
	  section.data(84).dtTransOffset = 172;
	
	  ;% rtP.ToInstrument_P3_Size
	  section.data(85).logicalSrcIdx = 86;
	  section.data(85).dtTransOffset = 173;
	
	  ;% rtP.ToInstrument_P3
	  section.data(86).logicalSrcIdx = 87;
	  section.data(86).dtTransOffset = 175;
	
	  ;% rtP.ToInstrument_P4_Size
	  section.data(87).logicalSrcIdx = 88;
	  section.data(87).dtTransOffset = 176;
	
	  ;% rtP.ToInstrument_P4
	  section.data(88).logicalSrcIdx = 89;
	  section.data(88).dtTransOffset = 178;
	
	  ;% rtP.ToInstrument_P5_Size
	  section.data(89).logicalSrcIdx = 90;
	  section.data(89).dtTransOffset = 179;
	
	  ;% rtP.ToInstrument_P5
	  section.data(90).logicalSrcIdx = 91;
	  section.data(90).dtTransOffset = 181;
	
	  ;% rtP.ToInstrument_P6_Size
	  section.data(91).logicalSrcIdx = 92;
	  section.data(91).dtTransOffset = 182;
	
	  ;% rtP.ToInstrument_P6
	  section.data(92).logicalSrcIdx = 93;
	  section.data(92).dtTransOffset = 184;
	
	  ;% rtP.ToInstrument_P7_Size
	  section.data(93).logicalSrcIdx = 94;
	  section.data(93).dtTransOffset = 185;
	
	  ;% rtP.ToInstrument_P7
	  section.data(94).logicalSrcIdx = 95;
	  section.data(94).dtTransOffset = 187;
	
	  ;% rtP.ToInstrument_P8_Size
	  section.data(95).logicalSrcIdx = 96;
	  section.data(95).dtTransOffset = 188;
	
	  ;% rtP.ToInstrument_P8
	  section.data(96).logicalSrcIdx = 97;
	  section.data(96).dtTransOffset = 190;
	
	  ;% rtP.ToInstrument_P9_Size
	  section.data(97).logicalSrcIdx = 98;
	  section.data(97).dtTransOffset = 191;
	
	  ;% rtP.ToInstrument_P9
	  section.data(98).logicalSrcIdx = 99;
	  section.data(98).dtTransOffset = 193;
	
	  ;% rtP.ToInstrument_P10_Size
	  section.data(99).logicalSrcIdx = 100;
	  section.data(99).dtTransOffset = 194;
	
	  ;% rtP.ToInstrument_P10
	  section.data(100).logicalSrcIdx = 101;
	  section.data(100).dtTransOffset = 196;
	
	  ;% rtP.ToInstrument_P11_Size
	  section.data(101).logicalSrcIdx = 102;
	  section.data(101).dtTransOffset = 197;
	
	  ;% rtP.ToInstrument_P11
	  section.data(102).logicalSrcIdx = 103;
	  section.data(102).dtTransOffset = 199;
	
	  ;% rtP.ToInstrument_P12_Size
	  section.data(103).logicalSrcIdx = 104;
	  section.data(103).dtTransOffset = 200;
	
	  ;% rtP.ToInstrument_P12
	  section.data(104).logicalSrcIdx = 105;
	  section.data(104).dtTransOffset = 202;
	
	  ;% rtP.ToInstrument_P13_Size
	  section.data(105).logicalSrcIdx = 106;
	  section.data(105).dtTransOffset = 203;
	
	  ;% rtP.ToInstrument_P13
	  section.data(106).logicalSrcIdx = 107;
	  section.data(106).dtTransOffset = 205;
	
	  ;% rtP.ToInstrument_P14_Size
	  section.data(107).logicalSrcIdx = 108;
	  section.data(107).dtTransOffset = 206;
	
	  ;% rtP.ToInstrument_P14
	  section.data(108).logicalSrcIdx = 109;
	  section.data(108).dtTransOffset = 208;
	
	  ;% rtP.ToInstrument_P15_Size
	  section.data(109).logicalSrcIdx = 110;
	  section.data(109).dtTransOffset = 209;
	
	  ;% rtP.ToInstrument_P15
	  section.data(110).logicalSrcIdx = 111;
	  section.data(110).dtTransOffset = 211;
	
	  ;% rtP.ToInstrument_P16_Size
	  section.data(111).logicalSrcIdx = 112;
	  section.data(111).dtTransOffset = 212;
	
	  ;% rtP.ToInstrument_P16
	  section.data(112).logicalSrcIdx = 113;
	  section.data(112).dtTransOffset = 214;
	
	  ;% rtP.ToInstrument_P17_Size
	  section.data(113).logicalSrcIdx = 114;
	  section.data(113).dtTransOffset = 223;
	
	  ;% rtP.ToInstrument_P17
	  section.data(114).logicalSrcIdx = 115;
	  section.data(114).dtTransOffset = 225;
	
	  ;% rtP.ToInstrument_P18_Size
	  section.data(115).logicalSrcIdx = 116;
	  section.data(115).dtTransOffset = 226;
	
	  ;% rtP.ToInstrument_P18
	  section.data(116).logicalSrcIdx = 117;
	  section.data(116).dtTransOffset = 228;
	
	  ;% rtP.ToInstrument_P19_Size
	  section.data(117).logicalSrcIdx = 118;
	  section.data(117).dtTransOffset = 237;
	
	  ;% rtP.ToInstrument_P19
	  section.data(118).logicalSrcIdx = 119;
	  section.data(118).dtTransOffset = 239;
	
	  ;% rtP.ToInstrument_P20_Size
	  section.data(119).logicalSrcIdx = 120;
	  section.data(119).dtTransOffset = 240;
	
	  ;% rtP.ToInstrument_P21_Size
	  section.data(120).logicalSrcIdx = 122;
	  section.data(120).dtTransOffset = 242;
	
	  ;% rtP.ToInstrument_P21
	  section.data(121).logicalSrcIdx = 123;
	  section.data(121).dtTransOffset = 244;
	
	  ;% rtP.ToInstrument_P22_Size
	  section.data(122).logicalSrcIdx = 124;
	  section.data(122).dtTransOffset = 245;
	
	  ;% rtP.ToInstrument_P22
	  section.data(123).logicalSrcIdx = 125;
	  section.data(123).dtTransOffset = 247;
	
	  ;% rtP.ToInstrument_P23_Size
	  section.data(124).logicalSrcIdx = 126;
	  section.data(124).dtTransOffset = 262;
	
	  ;% rtP.ToInstrument_P23
	  section.data(125).logicalSrcIdx = 127;
	  section.data(125).dtTransOffset = 264;
	
	  ;% rtP.ToInstrument_P24_Size
	  section.data(126).logicalSrcIdx = 128;
	  section.data(126).dtTransOffset = 267;
	
	  ;% rtP.ToInstrument_P25_Size
	  section.data(127).logicalSrcIdx = 130;
	  section.data(127).dtTransOffset = 269;
	
	  ;% rtP.ToInstrument_P25
	  section.data(128).logicalSrcIdx = 131;
	  section.data(128).dtTransOffset = 271;
	
	  ;% rtP.ToInstrument_P26_Size
	  section.data(129).logicalSrcIdx = 132;
	  section.data(129).dtTransOffset = 272;
	
	  ;% rtP.ToInstrument_P26
	  section.data(130).logicalSrcIdx = 133;
	  section.data(130).dtTransOffset = 274;
	
	  ;% rtP.ToInstrument_P27_Size
	  section.data(131).logicalSrcIdx = 134;
	  section.data(131).dtTransOffset = 281;
	
	  ;% rtP.ToInstrument_P27
	  section.data(132).logicalSrcIdx = 135;
	  section.data(132).dtTransOffset = 283;
	
	  ;% rtP.ToInstrument_P28_Size
	  section.data(133).logicalSrcIdx = 136;
	  section.data(133).dtTransOffset = 284;
	
	  ;% rtP.ToInstrument_P28
	  section.data(134).logicalSrcIdx = 137;
	  section.data(134).dtTransOffset = 286;
	
	  ;% rtP.ToInstrument_P29_Size
	  section.data(135).logicalSrcIdx = 138;
	  section.data(135).dtTransOffset = 287;
	
	  ;% rtP.ToInstrument_P29
	  section.data(136).logicalSrcIdx = 139;
	  section.data(136).dtTransOffset = 289;
	
	  ;% rtP.ToInstrument_P30_Size
	  section.data(137).logicalSrcIdx = 140;
	  section.data(137).dtTransOffset = 290;
	
	  ;% rtP.ToInstrument_P30
	  section.data(138).logicalSrcIdx = 141;
	  section.data(138).dtTransOffset = 292;
	
	  ;% rtP.ToInstrument_P31_Size
	  section.data(139).logicalSrcIdx = 142;
	  section.data(139).dtTransOffset = 301;
	
	  ;% rtP.ToInstrument_P31
	  section.data(140).logicalSrcIdx = 143;
	  section.data(140).dtTransOffset = 303;
	
	  ;% rtP.ToInstrument_P32_Size
	  section.data(141).logicalSrcIdx = 144;
	  section.data(141).dtTransOffset = 304;
	
	  ;% rtP.ToInstrument_P32
	  section.data(142).logicalSrcIdx = 145;
	  section.data(142).dtTransOffset = 306;
	
	  ;% rtP.ToInstrument_P33_Size
	  section.data(143).logicalSrcIdx = 146;
	  section.data(143).dtTransOffset = 307;
	
	  ;% rtP.ToInstrument_P33
	  section.data(144).logicalSrcIdx = 147;
	  section.data(144).dtTransOffset = 309;
	
	  ;% rtP.ToInstrument_P34_Size
	  section.data(145).logicalSrcIdx = 148;
	  section.data(145).dtTransOffset = 310;
	
	  ;% rtP.ToInstrument_P34
	  section.data(146).logicalSrcIdx = 149;
	  section.data(146).dtTransOffset = 312;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtB)
    ;%
      section.nData     = 6;
      section.data(6)  = dumData; %prealloc
      
	  ;% rtB.khu4zuqr24
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtB.d5zqtfyyrm
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtB.cgjotdlpgl
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 3;
	
	  ;% rtB.ofhnzvls0r
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 4;
	
	  ;% rtB.bb25dg3ui1
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 5;
	
	  ;% rtB.an0aw1ghhl
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 7;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 1;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtDW)
    ;%
      section.nData     = 6;
      section.data(6)  = dumData; %prealloc
      
	  ;% rtDW.dbtfgizldg
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.fp45fz1qmi.LoggedData
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtDW.fwyevwsda1.LoggedData
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 3;
	
	  ;% rtDW.knh530wxrf.LoggedData
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 4;
	
	  ;% rtDW.kepkxqm1uv
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 5;
	
	  ;% rtDW.eqdtbg2zr2.LoggedData
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 4105250154;
  targMap.checksum1 = 987030450;
  targMap.checksum2 = 1680989255;
  targMap.checksum3 = 1742817734;

