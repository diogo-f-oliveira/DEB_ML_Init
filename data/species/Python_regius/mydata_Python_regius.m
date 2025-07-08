function [data, auxData, metaData, txtData, weights] = mydata_Python_regius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Pythonidae';
metaData.species    = 'Python_regius'; 
metaData.species_en = 'Ball python'; 

metaData.ecoCode.climate = {'BSh', 'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTh', '0iTi'};
metaData.ecoCode.embryo  = {'Tntf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'; 't-R_f'}; 

metaData.COMPLETE = 3.8; % using criteria of LikaKear2011

metaData.author   = {'Bart Laarhoven';'Bas Kooijman'};    
metaData.date_subm = [2010 09 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod   = {'Bas Kooijman'};    
metaData.date_mod = [2010 12 28];              
metaData.email_mod    = {'bas.kooijman@vu.nl'};            
metaData.address_mod  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 25];


%% set data
% zero-variate data

data.ab = 57;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Wiki';   
  temp.ab = C2K(31.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '55-50 d';
data.ap = 22*30.5; units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'Wiki';
  temp.ap = C2K(27);   units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'Wiki: 12-36 months for female; ADW';
data.apm = 16*30.5; units.apm = 'd';    label.apm = 'age at puberty for male'; bibkey.apm = 'Wiki';
  temp.apm = C2K(27);   units.temp.apm = 'K'; label.temp.apm = 'temperature';
  comment.apm = 'Wiki: 6-18 months for males';
data.am = 40*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'Wiki';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 35;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'ADW';
  comment.Lb = '25 to 43 cm';
data.Lp  = 76;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = {'ADW','Wiki'}; 
  comment.Lp = 'calculated from Wp^1/3/Lp = .11';
data.Li  = 125;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = {'ADW','Wiki'};
  comment.Li = 'Wiki: 90-120 cm, ADW: 100-150 cm (max 183 cm)';

data.Wwb = 86;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ADW';
  comment.Wwb = '65 - 103 g';
data.Wwp = 800;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'ADW';
data.Wwpm = 500;   units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';  bibkey.Wwpm = 'ADW';
data.Wwi = 2200;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'ADW';
data.Wwim = 2000;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'ADW';

data.Ri  = 5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-6 eggs per year';
 
% uni-variate data: cultures by Bart Laarhoven

% culture conditions:
%   winter Nov - Feb, day 29 C, night 26 C;  mean  27.5 C
%   summer Feb - Nov, day 32 C, night 28 C;  mean  29.5 C
% zero weight means: not measured
% that were offered not not directly accepeted were removed, 
%   so food relates to food that has been eaten
% 
% snake 01.0709 female, born 2009 07 15
% date yyyy mm dd , snake g, rat g
dsr_01 = [...
2010 04 10	321	   38;
2010 04 30	NaN     0; % moult		
2010 05 01	323     0;		
2010 05 16	NaN    27;
2010 05 21  NaN    34;
2010 05 28  NaN    55;
2010 06 11	358	    0;
2010 06 19  NaN	   25;
2010 07 02	387	   24;
2010 08 01	383	   30;	
2010 08 15	NaN	   69;
2010 08 29	414	    0;
2010 09 18  NaN    54;
2010 10 01	463     0;		
2010 10 23	NaN	   75;
2010 11 13	459		0;
2010 12 03	451		0];
tsr_01 = [datenum(dsr_01(:,1:3)), dsr_01(:,[4 5])];
tsr_01(:,1) = tsr_01(:,1) - datenum([2009 07 15]);
data.tW_01 = tsr_01(:,[1 2]); 
units.tW_01 = {'a', 'g'}; label.tW_01 = {'time since birth', 'wet weight'};  
food.tW_01 = tsr_01(:,[1 3]); units.food.tW_01 = {'a', 'g'}; label.food.tW_01 = {'time since birth', 'wet weight'}; 
temp.tW_01 = C2K(28.5);   units.temp.tW_01 = 'K'; label.temp.tW_01 = 'temperature';
bibkey.tW_01 = 'Laar2010';

% snake 02.0709 female, born 2009 07 15
% date, yyyy mm dd, snake g, rat g
dsr_02 = [...
2010 04 10	346	    0;	
2010 05 01	340	    0;	
2010 05 21	NaN	   34;
2010 05 28  NaN	   55;
2010 06 06	NaN     0;   % moult 77 cm		
2010 06 11	368	    0;	
2010 06 19	NaN	   78;
2010 06 27	NaN	   35;
2010 07 02	444     0;		
2010 08 01	411	    0;	
2010 08 04	NaN	   42;
2010 08 29	454	    0;
2010 09 16  NaN     0;  % moult			
2010 09 19	NaN	   54;
2010 10 01	465    57;		
2010 10 06	NaN     0;  % moult		
2010 10 23	NaN	   75;
2010 10 29  NaN	  100;
2010 11 03	NaN	   47;
2010 11 13	631		0;
2010 11 14	NaN     0;  % moult		
2010 12 03	558	   90];
tsr_02 = [datenum(dsr_02(:,1:3)), dsr_02(:,[4 5])];
tsr_02(:,1) = tsr_02(:,1) - datenum([2009 07 15]);
data.tW_02 = tsr_02(:,[1 2]); 
units.tW_02 = {'a', 'g'}; label.tW_02 = {'time since birth', 'wet weight'};  
food.tW_02 = tsr_02(:,[1 3]); units.food.tW_02 = {'a', 'g'}; label.food.tW_02 = {'time since birth', 'wet weight'}; 
temp.tW_02 = C2K(28.5);   units.temp.tW_02 = 'K'; label.temp.tW_02 = 'temperature';
bibkey.tW_02 = 'Laar2010';

% snake 03.0709 female, born 2009 07 15
% date yyyy mm dd, snake g, rat g
dsr_03 = [...
2010 04 10	516	    0;	
2010 04 18	NaN	   39;
2010 04 24	NaN	   39;
2010 05 01	555	    0;
2010 05 08	NaN    56;
2010 05 19	NaN     0;    % moult
2010 05 22  NaN	   56;
2010 05 29  NaN	  113;
2010 06 04	NaN	   88;
2010 06 11	689	    0;	
2010 06 19	NaN	   67;
2010 06 25	NaN	   60;
2010 06 30	NaN     0;    % moult 100 cm		
2010 07 02	700	   62;
2010 08 01	704	    0;	
2010 08 04	NaN	   39;
2010 08 08	NaN	   33;
2010 08 13	NaN	   76;
2010 08 22	NaN	  115;
2010 08 27	NaN	  107;
2010 08 29	815	    0;
2010 09 10	NaN     113;
2010 09 18  NaN	  199;
2010 10 01	985		0;
2010 10 02	NaN		0;  % moult
2010 10 06	NaN     0;  % moult		
2010 10 15	NaN	  150;
2010 11 01	NaN	  178;
2010 11 13	1054	0;	
2010 12 03	1036	0];	
tsr_03 = [datenum(dsr_03(:,1:3)), dsr_03(:,[4 5])];
tsr_03(:,1) = tsr_03(:,1) - datenum([2009 07 15]);
data.tW_03 = tsr_03(:,[1 2]); 
units.tW_03 = {'a', 'g'}; label.tW_03 = {'time since birth', 'wet weight'};  
food.tW_03 = tsr_03(:,[1 3]); units.food.tW_03 = {'a', 'g'}; label.food.tW_03 = {'time since birth', 'wet weight'};  
temp.tW_03 = C2K(28.5);   units.temp.tW_03 = 'K'; label.temp.tW_03 = 'temperature';
bibkey.tW_03 = 'Laar2010';

% snake 04.0609 male, born 2009 06 15
% date yyyy mm dd, snake g, rat g
dsr_04 = [...
2010 04 10	378	    0;
2010 05 01	352	    0;
2010 05 08	NaN    41;
2010 05 28  NaN	   56;
2010 06 04	NaN	   54;
2010 06 11	456	    0;     % moult 82 cm	
2010 06 12	NaN	   54;
2010 06 27	NaN	   35;
2010 07 02	447	    0;
			               % moult
2010 08 01	410	   30+31;
2010 08 08	NaN	   33;
2010 08 15	NaN	   72;
2010 08 22	NaN	   97;
2010 08 29	577	    0;
2010 09 11  NaN     0;
2010 09 19	NaN	   86;
2010 10 01	521	   65;
2010 10 15  NaN	   54;
2010 10 26	NaN		0; % moult
2010 11 13	523	   77;
2010 12 03  526    77];
tsr_04 = [datenum(dsr_04(:,1:3)), dsr_04(:,[4 5])];
tsr_04(:,1) = tsr_04(:,1) - datenum([2009 06 15]);
data.tW_04 = tsr_04(:,[1 2]); 
units.tW_04 = {'a', 'g'}; label.tW_04 = {'time since birth', 'wet weight'};  
food.tW_04 = tsr_04(:,[1 3]); units.food.tW_04 = {'a', 'g'}; label.food.tW_04 = {'time since birth', 'wet weight'};  
temp.tW_04 = C2K(28.5);   units.temp.tW_04 = 'K'; label.temp.tW_04 = 'temperature';
bibkey.tW_04 = 'Laar2010';

% snake 05.0609 male, born 2009 06 15
% date yyyy mm dd, snake g, rat g
dsr_05 = [...
2010 04 10	700	    0;
2010 04 19	NaN    39;	   % moult
2010 04 24	NaN	   56;
2010 05 01	692	   37;
2010 05 08	NaN	  126;
2010 05 25	NaN     0;     % moult
2010 05 29	NaN	  189;
2010 06 04	NaN	   82;
2010 06 11 	827	    0;
2010 06 12	NaN	   90;
2010 06 18	NaN	   56;
2010 06 25	NaN	   56;
2010 07 02	918	   75;
			              % moult
2010 08 01	875	  111;
2010 08 13	NaN	  115;
2010 08 29	1000    0;    % moult
2010 09 02	NaN	  160;
2010 09 10 	NaN	  100;
2010 09 18	NaN	  150;
2010 10 01	1049  142;	
2010 10 20	NaN     0;  % moult		
2010 11 13	1050  169;		
2010 12 03	1109 118];		
tsr_05 = [datenum(dsr_05(:,1:3)), dsr_05(:,[4 5])];
tsr_05(:,1) = tsr_05(:,1) - datenum([2009 06 15]);
data.tW_05 = tsr_05(:,[1 2]); 
units.tW_05 = {'a', 'g'}; label.tW_05 = {'time since birth', 'wet weight'};  
food.tW_05 = tsr_05(:,[1 3]); units.food.tW_05 = {'a', 'g'}; label.food.tW_05 = {'time since birth', 'wet weight'};  
temp.tW_05 = C2K(28.5);   units.temp.tW_05 = 'K'; label.temp.tW_05 = 'temperature';
bibkey.tW_05 = 'Laar2010';

% snake 06.0706 female, born 2006 07 15
% date yyyy mm dd, snake g, rat g
dsr_06 = [...
2010 04 10	1735    0;
2010 04 21	NaN     0;   % prelay shed		
2010 05 01	1674    0;		
2010 05 29	1645    0;		
2010 06 06	1247    0;   % 4 eggs 472 g in total; hatching at 2010 08 10
2010 06 11	1227    0;		
2010 06 12	NaN     120;
2010 06 18	NaN     205;
2010 06 25	NaN     133;   % moult 140 cm		
2010 07 02	1424    0;
2010 08 01	1325  199;	
2010 08 15	NaN	   72;
2010 08 23	NaN     0;   % moult 130 cm		
2010 08 27	NaN   285;
2010 08 29	1425    0;
2010 09 18	NaN   350;
2010 10 01	1529  277;		
2010 10 14	NaN		0;   % moult
2010 10 15	NaN	  332;
2010 11 01  NaN   310;
2010 11 13	1870    0;		
2010 12 03	1864  120];				
tsr_06 = [datenum(dsr_06(:,1:3)), dsr_06(:,[4 5])];
tsr_06(:,1) = tsr_06(:,1) - datenum([2006 07 15]);
data.tW_06 = tsr_06(:,[1 2]);
units.tW_06 = {'a', 'g'}; label.tW_06 = {'time since birth', 'wet weight'};  
food.tW_06 = tsr_06(:,[1 3]); units.food.tW_06 = {'a', 'g'}; label.food.tW_06 = {'time since birth', 'wet weight'};  
temp.tW_06 = C2K(28.5);   units.temp.tW_06 = 'K'; label.temp.tW_06 = 'temperature';
bibkey.tW_06 = 'Laar2010';

% snake 07.0708 female, born 2008 07 15
% date yyyy mm dd, snake g, rat g
dsr_07 = [...
2010 04 10	1007    0;	
2010 04 13  NaN     0;   % moult
2010 04 18	NaN   111;
2010 04 24	NaN   109;
2010 05 01	1107  107;		
2010 05 15	NaN	  142;
2010 05 29	NaN     0;	 % moult
2010 06 06	NaN   124;
2010 06 07	NaN	   95;
2010 06 11	1168    0;		
2010 06 18	NaN	  130;
2010 07 02	1185    0;		
			             % moult
2010 08 01	1163 72+138;	
2010 08 13	NaN   176;
2010 08 22  NaN    76;
2010 08 27	NaN   209;
2010 08 29	1349    0;	
2010 09 11  NaN     0;  % moult
2010 09 18  NaN   235;
2010 10 01	1416	0;	
2010 11 01	NaN	  267;
2010 11 13	1583    0;		
2010 12 03	1530  224];		
tsr_07 = [datenum(dsr_07(:,1:3)), dsr_07(:,[4 5])];
tsr_07(:,1) = tsr_07(:,1) - datenum([2008 07 15]);
data.tW_07 = tsr_07(:,[1 2]); 
units.tW_07 = {'a', 'g'}; label.tW_07 = {'time since birth', 'wet weight'};  
food.tW_07 = tsr_07(:,[1 3]); units.food.tW_07 = {'a', 'g'}; label.food.tW_07 = {'time since birth', 'wet weight'};  
temp.tW_07 = C2K(28.5);   units.temp.tW_07 = 'K'; label.temp.tW_07 = 'temperature';
bibkey.tW_07 = 'Laar2010';

% snake 08.0706 male, born 2006 07 15
% date yyyy mm dd, snake g, rat g
dsr_08 = [...
2010 04 10	1342    0;		
2010 05 01	1365    0;		
2010 05 22	NaN   176;
2010 06 05	NaN     0;	% moult	142 cm
2010 06 11	1321    0;
2010 06 19	NaN	  183;
2010 06 25	NaN	  160;
2010 07 02	1469    0;	
			            % moult
2010 08 01	1405  199;
2010 08 13	NaN	  154;
2010 08 27  NaN	  280;
2010 08 29	1531    0;
2010 09 17	NaN     0; % moult		
2010 10 01	1515  242;		
2010 11 09	NaN		0; % moult
2010 11 13	1554  253;		
2010 12 03	1676  270];		
tsr_08 = [datenum(dsr_08(:,1:3)), dsr_08(:,[4 5])];
tsr_08(:,1) = tsr_08(:,1) - datenum([2006 07 15]);
data.tW_08 = tsr_08(:,[1 2]);
units.tW_08 = {'a', 'g'}; label.tW_08 = {'time since birth', 'wet weight'};  
food.tW_08 = tsr_08(:,[1 3]); units.food.tW_08 = {'a', 'g'}; label.food.tW_08 = {'time since birth', 'wet weight'};  
temp.tW_08 = C2K(28.5);   units.temp.tW_08 = 'K'; label.temp.tW_08 = 'temperature';
bibkey.tW_08 = 'Laar2010';

% snake 10.0810 sex female, born 2010 08 06 from snake 06.0706
% date yyyy mm dd, snake g, mouse g; albino
dsr_10 = [...
2010 08 06  80   0;
2010 10 01  69	 0;	
2010 10 10	NaN	38;
2010 10 29  NaN 20;
2010 11 03  NaN	35;
2010 11 12	NaN	20;
2010 11 13	95	 0;	
2010 11 17	NaN	52]; % verkocht
tsr_10 = [datenum(dsr_10(:,1:3)), dsr_10(:,[4 5])];
tsr_10(:,1) = tsr_10(:,1) - datenum([2010 08 06]);
data.tW_10 = tsr_10(:,[1 2]);
units.tW_10 = {'a', 'g'}; label.tW_10 = {'time since birth', 'wet weight'};  
food.tW_10 = tsr_10(:,[1 3]); units.food.tW_10 = {'a', 'g'}; label.food.tW_10 = {'time since birth', 'wet weight'};  
temp.tW_10 = C2K(28.5);   units.temp.tW_10 = 'K'; label.temp.tW_10 = 'temperature';
bibkey.tW_10 = 'Laar2010';

% snake 11.0810 sex unknown, born 2010 08 06 from snake 06.0706 
% date yyyy mm dd, snake g, mouse g
dsr_11 = [...
2010 08 06 82   0;
2010 09 05 NaN 24;
2010 09 18 NaN 40;
2010 10 01 112  0;	
2010 10 08 NaN 26;
2010 11 03 NaN 47;
2010 11 09 NaN  0; % moult		
2010 11 12 NaN 20;
2010 11 13 181  0;
2010 11 17 NaN 32;
2010 12 03 214 34];
tsr_11 = [datenum(dsr_11(:,1:3)), dsr_11(:,[4 5])];
tsr_11(:,1) = tsr_11(:,1) - datenum([2010 08 06]);
data.tW_11 = tsr_11(:,[1 2]); 
units.tW_11 = {'a', 'g'}; label.tW_11 = {'time since birth', 'wet weight'};  
food.tW_11 = tsr_11(:,[1 3]); units.food.tW_11 = {'a', 'g'}; label.food.tW_11 = {'time since birth', 'wet weight'};  
temp.tW_11 = C2K(28.5);   units.temp.tW_11 = 'K'; label.temp.tW_11 = 'temperature';
bibkey.tW_11 = 'Laar2010';

% snake 12.0810 sex female, born 2010 08 06 from snake 06.0706
% date yyyy mm dd, snake g, mouse g
dsr_12 = [...
2010 08 06  88     0;
2010 09 05  NaN   24;
2010 09 18	NaN	  40;
2010 10 01	111	   0;
2010 10 15	NaN   38;
2010 10 24	209	   0;
2010 11 13	125	   0]; % verkocht
tsr_12 = [datenum(dsr_12(:,1:3)), dsr_12(:,[4 5])];
tsr_12(:,1) = tsr_12(:,1) - datenum([2010 08 06]);
data.tW_12 = tsr_12(:,[1 2]);
units.tW_12 = {'a', 'g'}; label.tW_12 = {'time since birth', 'wet weight'};  
food.tW_12 = tsr_12(:,[1 3]); units.food.tW_12 = {'a', 'g'}; label.food.tW_12 = {'time since birth', 'wet weight'};  
temp.tW_12 = C2K(28.5);   units.temp.tW_12 = 'K'; label.temp.tW_12 = 'temperature';
bibkey.tW_12 = 'Laar2010';

% snake 13.0810 sex female, born 2007 08 15 
% date yyyy mm dd, snake g, mouse g
dsr_13 = [...
2010 09 06	1376    0;		
2010 10 01	1303    0;		
2010 11 01  NaN   172;
2010 11 13	1421    0;		
2010 12 03	1393    0];		
tsr_13 = [datenum(dsr_13(:,1:3)), dsr_13(:,[4 5])];
tsr_13(:,1) = tsr_13(:,1) - datenum([2007 08 15]);
data.tW_13 = tsr_13(:,[1 2]); 
food.tW_13 = tsr_13(:,[1 3]); units.tW_13 = {'a', 'g'}; label.tW_13 = {'time since birth', 'wet weight'};  
units.food.tW_13 = {'a', 'g'}; label.food.tW_13 = {'time since birth', 'wet weight'};  
temp.tW_13 = C2K(28.5);   units.temp.tW_13 = 'K'; label.temp.tW_13 = 'temperature';
bibkey.tW_13 = 'Laar2010';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.food = food;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_01','tW_02','tW_03','tW_04'}; subtitle1 = {'Snake 01, 02, 03, 04'};
set2 = {'tW_05'}; subtitle2 = {'Snake 05'};
set3 = {'tW_07'}; subtitle3 = {'Snake 07'};
set4 = {'tW_06','tW_08','tW_13'}; subtitle4 = {'Snake 06, 08, 13'};
set5 = {'tW_10','tW_11','tW_12'}; subtitle5 = {'Snake 10, 11, 12'};
metaData.grp.sets = {set1,set2,set3,set4,set5};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Although the temperature switched between 2 levels that differ 2 C, the analysis treats temperature as constant';
D3 = 'This unique entry has measured food intake for each individual; it turned out that they differ in digention efficiency';
D4 = 'Some weight data is missing, which is indicated by NaN';
D5 = 'The over-estimation of age-at-birth strongly suggests that eggs already start to develop in the mother before laying; the related Boidae are fully ovo-viviparous';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'Torpor is necessary for reproduction';
metaData.bibkey.F1 = 'Laar2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7925W'; % Cat of Life
metaData.links.id_ITIS = '634784'; % ITIS
metaData.links.id_EoL = '1055460'; % Ency of Life
metaData.links.id_Wiki = 'Python_regius'; % Wikipedia
metaData.links.id_ADW = 'Python_regius'; % ADW
metaData.links.id_Taxo = '49851'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Python&species=regius'; % ReptileDB
metaData.links.id_AnAge = 'Python_regius'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Python_regius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Laar2010'; type = 'Misc'; bib = ...
'note= {uni-variate data by Bart Laarhoven (pers comm)}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/site/accounts/information/Python_regius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

