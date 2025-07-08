  function [data, auxData, metaData, txtData, weights] = mydata_Oncorhynchus_tshawytscha

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Oncorhynchus_tshawytscha'; 
metaData.species_en = 'Chinook salmon'; 

metaData.ecoCode.climate = {'MC', 'ME','BSk','Dfc'};
metaData.ecoCode.ecozone = {'MPN','THn'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bjCi', 'jiCic', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wd0'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'; 'E0'};  
metaData.data_1     = {'t-Le_T'; 'L-Wde_T'; 'T-ab'; 't-L_fT'; 't-Ww_fT'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 3.6; % using criteria of LikaKear2011

metaData.author   = {'Laure Pecquerie'};        
metaData.date_subm = [2009 11 15];                           
metaData.email    = {'laure.pecquerie@ird.fr'};                 
metaData.address  = {'IRD, Brest'}; 

metaData.author_mod_1  = {'Bas Kooijman'};                  
metaData.date_mod_1    = [2011 10 09];                      
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};      
metaData.address_mod_1 = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 18]; 

%% set data
% zero-variate data
data.ab = 121;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'BeacMurr1990';
  temp.ab = C2K(8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 3*365;  units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'BeacMurr1990';
  temp.ap = C2K(13); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  % = 1 year prior average age at return in California
data.am = 4*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 3.47;   units.Lb = 'cm';   label.Lb = 'fork length at birth';   bibkey.Lb = 'BeacMurr1990'; 
data.Lp = 68;     units.Lp = 'cm';   label.Lp = 'fork length at puberty'; bibkey.Lp = 'guess'; 
data.Lam = 73;    units.Lam = 'cm';  label.Lam = 'postorbital-hypural length at spawning at 4 yr'; bibkey.Lam = 'BeacMurr1990';
data.Li = 150;    units.Li = 'cm';   label.Li = 'ultimate fork length';   bibkey.Li = 'fishbase';

data.E0 = 2775;   units.E0 = 'J';    label.E0 = 'initial egg energy';     bibkey.E0 =  'BergHend2001';   

data.Wd0 = 0.345 * 0.37; units.Wd0 = 'g'; label.Wd0 = 'egg dry weight';      bibkey.Wd0 = 'BeacMurr1990';
data.Wwb = 0.515;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BeacMurr1990'; 
  comment.Wb = 'average chinook data';
data.Wwp = 0.0018 * data.Lam^3.448;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'JaspEven2006';
  comment.Wwp = 'same relationship as mature adult, ie includes gonad weight, should be lower';
data.Wwam = 0.0018 * data.Lam^3.448;  units.Wwam = 'g';   label.Wwam = 'ultimate wet weight'; bibkey.Wwam = 'JaspEven2006'; 
  comment.Wwam = 'probably male';
data.Wwi = 65e3;  units.Wwi = 'g';     label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'probably male';
  
data.NR = 5820;   units.NR = '#';    label.NR = 'fecundity at L = 73 cm'; bibkey.NR = 'BeacMurr1993';   
  temp.NR = C2K(13);  units.temp.NR = 'K'; label.temp.NR = 'temperature';
    
% uni-variate data
% embryo data

%------------------
% Hemi1982 - average data (min and max also available)
% t time since fertilization, days
%t1 = hatching
%t2 = Maximum Alevin wet Weight 
%t3 = Maximum tissue weight - Max alevin length = emergence = birth (?)
%t4 = Complete Yolk Absorption
% no food is provided

% L fork length, cm
% W embryo dry weight, g
% Wy yolk dry weight, g
% Wt total dry weight, g

% T = 273 + 6
data.tL_Hemi1982_6 = [95	  190	  200	250;
            2.58	4.02	4.2	  4.22]';
units.tL_Hemi1982_6 = {'d', 'cm'}; label.tL_Hemi1982_6 = {'age', 'embryo fork length', '6 C'};  
temp.tL_Hemi1982_6 = C2K(6); units.temp.tL_Hemi1982_6 = 'K'; label.temp.tL_Hemi1982_6 = 'temperature';
bibkey.tL_Hemi1982_6 = 'Hemi1982';
%
data.tW_Hemi1982_6 = [95	190	200	250;
        0.02	0.095	0.112	0.075]';
units.tW_Hemi1982_6 = {'d', 'g'}; label.tW_Hemi1982_6 = {'age', 'embryo dry weight', '6 C'};  
temp.tW_Hemi1982_6 = C2K(6); units.temp.tW_Hemi1982_6 = 'K'; label.temp.tW_Hemi1982_6 = 'temperature'; 
bibkey.tW_Hemi1982_6 = 'Hemi1982';
%    
data.tWy_Hemi1982_6 = [95	190	200	250;
        0.14	0.014	0.009	0.001]';
units.tWy_Hemi1982_6 = {'d', 'g'}; label.tWy_Hemi1982_6 = {'age', 'yolk dry weight', '6 C'};  
temp.tWy_Hemi1982_6 = C2K(6); units.temp.tWy_Hemi1982_6 = 'K'; label.temp.tWy_Hemi1982_6 = 'temperature';
bibkey.tWy_Hemi1982_6 = 'Hemi1982';
%        
data.tWt_Hemi1982_6 = [95	190	200	250;
    0.16	0.109	0.121	0.075]';
units.tWt_Hemi1982_6 = {'d', 'g'}; label.tWt_Hemi1982_6 = {'age', 'total dry weight', '6 C'};  
temp.tWt_Hemi1982_6 = C2K(6); units.temp.tWt_Hemi1982_6 = 'K'; label.temp.tWt_Hemi1982_6 = 'temperature';
bibkey.tWt_Hemi1982_6 = 'Hemi1982';
%  
% T = 273 + 8
data.tL_Hemi1982_8 = [71	141	149	183;
        2.56	3.93	4.09	4.08]';
units.tL_Hemi1982_8 = {'d', 'cm'}; label.tL_Hemi1982_8 = {'age', 'embryo fork length', '8 C'};
temp.tL_Hemi1982_8 = C2K(8); units.temp.tL_Hemi1982_8 = 'K'; label.temp.tL_Hemi1982_8 = 'temperature';
bibkey.tL_Hemi1982_8 = 'Hemi1982';
%    
data.tW_Hemi1982_8 = [71	141	149	183;
        0.02	0.09	0.104	0.071]';
units.tW_Hemi1982_8 = {'d', 'g'}; label.tW_Hemi1982_8 = {'age', 'embryo dry weight', '8 C'};  
temp.tW_Hemi1982_8 = C2K(8); units.temp.tW_Hemi1982_8 = 'K'; label.temp.tW_Hemi1982_8 = 'temperature';
bibkey.tW_Hemi1982_8 = 'Hemi1982';
%   
data.tWy_Hemi1982_8 = [71	141	149	183;
        0.139	0.016	0.009	0.001]';
units.tWy_Hemi1982_8 = {'d', 'g'}; label.tWy_Hemi1982_8 = {'age', 'yolk dry weight', '8 C'};
temp.tWy_Hemi1982_8 = C2K(8); units.temp.tWy_Hemi1982_8 = 'K'; label.temp.tWy_Hemi1982_8 = 'temperature';
bibkey.tWy_Hemi1982_8 = 'Hemi1982';
%        
data.tWt_Hemi1982_8 = [71	141	149	183;
    0.159	0.106	0.113	0.071]';
units.tWt_Hemi1982_8 = {'d', 'g'}; label.tWt_Hemi1982_8 = {'age', 'total dry weight', '8 C'};  
temp.tWt_Hemi1982_8 = C2K(8); units.temp.tWt_Hemi1982_8 = 'K'; label.temp.tWt_Hemi1982_8 = 'temperature';
bibkey.tWt_Hemi1982_8 = 'Hemi1982';
%
% T = 273 + 10
data.tL_Hemi1982_10 = [55	107	120	147;
        2.49	3.84	3.99	3.95]';
units.tL_Hemi1982_10 = {'d', 'cm'}; label.tL_Hemi1982_10 = {'age', 'embryo fork length', '10 C'};  
temp.tL_Hemi1982_10 = C2K(10); units.temp.tL_Hemi1982_10 = 'K'; label.temp.tL_Hemi1982_10 = 'temperature'; 
bibkey.tL_Hemi1982_10 = 'Hemi1982';
%    
data.tW_Hemi1982_10 = [55	107	120	147;
        0.019	0.081	0.098	0.068]';
units.tW_Hemi1982_10 = {'d', 'g'}; label.tW_Hemi1982_10 = {'age', 'embryo dry weight', '10 C'};
temp.tW_Hemi1982_10 = C2K(10); units.temp.tW_Hemi1982_10 = 'K'; label.temp.tW_Hemi1982_10 = 'temperature';
bibkey.tW_Hemi1982_10 = 'Hemi1982';
%    
data.tWy_Hemi1982_10 = [55	107	120	147;
        0.133	0.026	0.011	0.001]';
units.tWy_Hemi1982_10 = {'d', 'g'}; label.tWy_Hemi1982_10 = {'age', 'yolk dry weight', '10 C'};  
temp.tWy_Hemi1982_10 = C2K(10); units.temp.tWy_Hemi1982_10 = 'K'; label.temp.tWy_Hemi1982_10 = 'temperature';
bibkey.tWy_Hemi1982_10 = 'Hemi1982';
%        
data.tWt_Hemi1982_10 = [55	107	120	147;
    0.152	0.107	0.109	0.068]';
units.tWt_Hemi1982_10 = {'d', 'g'}; label.tWt_Hemi1982_10 = {'age', 'total dry weight', '10 C'};
temp.tWt_Hemi1982_10 = C2K(10); units.temp.tWt_Hemi1982_10 = 'K'; label.temp.tWt_Hemi1982_10 = 'temperature';
bibkey.tWt_Hemi1982_10 = 'Hemi1982';
%
% T = 273 + 12
data.tL_Hemi1982_12 = [44	85	100	120;
        2.49	3.84	3.99	3.95]';
units.tL_Hemi1982_12 = {'d', 'cm'}; label.tL_Hemi1982_12 = {'age', 'embryo fork length', '12 C'};  
temp.tL_Hemi1982_12 = C2K(12); units.temp.tL_Hemi1982_12 = 'K'; label.temp.tL_Hemi1982_12 = 'temperature';
bibkey.tL_Hemi1982_12 = 'Hemi1982';
%    
data.tW_Hemi1982_12 = [44	85	100	120;
        0.019	0.081	0.098	0.068]';
units.tW_Hemi1982_12 = {'d', 'g'}; label.tW_Hemi1982_12 = {'age', 'embryo dry weight', '12 C'};  
temp.tW_Hemi1982_12 = C2K(12); units.temp.tW_Hemi1982_12 = 'K'; label.temp.tW_Hemi1982_12 = 'temperature';
bibkey.tW_Hemi1982_12 = 'Hemi1982';
%    
data.tWy_Hemi1982_12 = [44	85	100	120;
        0.133	0.026	0.011	0.001]';
units.tWy_Hemi1982_12 = {'d', 'g'}; label.tWy_Hemi1982_12 = {'age', 'yolk dry weight', '12 C'};  
temp.tWy_Hemi1982_12 = C2K(12); units.temp.tWy_Hemi1982_12 = 'K'; label.temp.tWy_Hemi1982_12 = 'temperature'; 
bibkey.tWy_Hemi1982_12 = 'Hemi1982';
%        
data.tWt_Hemi1982_12 = [44	85	100	120;
    0.152	0.107	0.109	0.068]';
units.tWt_Hemi1982_12 = {'d', 'g'}; label.tWt_Hemi1982_12 = {'age', 'total dry weight', '12 C'};  
temp.tWt_Hemi1982_12 = C2K(12); units.temp.tWt_Hemi1982_12 = 'K'; label.temp.tWt_Hemi1982_12 = 'temperature';
bibkey.tWt_Hemi1982_12 = 'Hemi1982';
%
data.Tah = [ ... % temp (C), age at hatch (d)
6  95
8  71
10 55
12 44];
units.Tah = {'T', 'd'}; label.Tah = {'temperature', 'age at hatch'};  bibkey.Tah = 'Hemi1982';

% --------------

% BeacMurr1990 
% temperature (C), developement time (days) till maximum alevin weight (= birth)
data.Tab = [ ... 
2	327;
3	267;
4	222;
5	187;
6	160;
7	138;
8	121;
9	106;
10	94;
11	84;
12	76;
13	68;
14	62;
15	57];
units.Tab = {'T', 'd'}; label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'BeacMurr1990';

% juveniles
% ShelClar1995 
% columns of tLW:
%  1  t days of the experiment
%  2  L cm, fork length 
%  3 W g, wet weight
%  4 T degC, not constant
%  5 Ration, 1 = ad libitum, 0.8 = 80% of ad libitum ration (dry food / g dry weight of fish), 0.6 = 60%
%  6 Tank group, 1 = Irvine, 2 = Diamond (2 replicates by treatment, 30 fish per tank) 
%  7 T group, 1 = ambient T, 2 = T lowered at 10deg C for 30 days, 3 = T lowered at 12.5degC, 4 = T lowered at 15degC
% All data presented, but we only use Ration = 1 and Ration = 0.6 to calibrate parameters
% Ration = 0.8 for validation
% data for the various tank numbers
tLW1 = [...
1	6.0	2.4	16.6	1	1	1	% L(1) = 6.4*(2.2/2.9)^(1/3)
12	6.4	2.9	17.5	1	1	1	
30	7.3	4.6	18.8	1	1	1	
46	7.9	6	18.1	1	1	1	
60	8.4	7.4	15.5	1	1	1	
74	9.1	9.1	13.4	1	1	1	
88	9.6	10.7 13.4	1	1	1];
data.tL_ShelClar1995_1 = tLW1(:,[1 2]); data.tW_ShelClar1995_1 = tLW1(:,[1 3]); auxData.tT.tL_ShelClar1995_1 = tLW1(:,[1 4]);auxData.tT.tW_ShelClar1995_1 = tLW1(:,[1 4]);
units.tL_ShelClar1995_1 = {'d', 'cm'}; label.tL_ShelClar1995_1 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_1 = {'ShelClar1995'};
units.tW_ShelClar1995_1 = {'d', 'g'};  label.tW_ShelClar1995_1 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_1 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_1 = {'Celsius'}; units.tT.tW_ShelClar1995_1 = {'Celsius'};label.tT = {'time', 'temperature'};
tLW2 = [...
1	6.1	2.6	16.8	1	2	1   % L(1) =  6.5*(2.6/3.2)^(1/3)
12	6.5	3.2	17.6	1	2	1	
30	7.3	4.7	18.9	1	2	1	
46	7.8	5.7	18.1	1	2	1	
60	8.3	7.2	15.5	1	2	1	
74	8.8	8.6	13.6	1	2	1	
88	9.2	9.2	13.6	1	2	1];
data.tL_ShelClar1995_2 = tLW2(:,[1 2]); data.tW_ShelClar1995_2 = tLW2(:,[1 3]); auxData.tT.tL_ShelClar1995_2 = tLW2(:,[1 4]);auxData.tT.tW_ShelClar1995_2 = tLW2(:,[1 4]);
units.tL_ShelClar1995_2 = {'d', 'cm'}; label.tL_ShelClar1995_2 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_2 = {'ShelClar1995'};
units.tW_ShelClar1995_2 = {'d', 'g'};  label.tW_ShelClar1995_2 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_2 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_2 = {'Celsius'};units.tT.tW_ShelClar1995_2 = {'Celsius'};
tLW3 = [ ...
1	5.9	2.2	16.5	0.6	1	1   % L(1) = 6.1*(2.2/2.4)^(1/3)
12	6.1	2.4	17.3	0.6	1	1
30	6.4	3	18.8	0.6	1	1
46	6.6	3.2	17.9	0.6	1	1
60	6.8	3.6	15.5	0.6	1	1
74	7.1	4.2	13.2	0.6	1	1
88	7.3	4.4	13.2	0.6	1	1];
data.tL_ShelClar1995_3 = tLW3(:,[1 2]); data.tW_ShelClar1995_3 = tLW3(:,[1 3]); auxData.tT.tL_ShelClar1995_3 = tLW3(:,[1 4]);auxData.tT.tW_ShelClar1995_3 = tLW3(:,[1 4]);
units.tL_ShelClar1995_3 = {'d', 'cm'}; label.tL_ShelClar1995_3 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_3 = {'ShelClar1995'};
units.tW_ShelClar1995_3 = {'d', 'g'};  label.tW_ShelClar1995_3 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_3 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_3 = {'Celsius'};units.tT.tW_ShelClar1995_3 = {'Celsius'};
tLW4 = [ ...
1	6.2	2.7	16.5	0.6	2	1  % L(1) = 6.4*(2.7/2.9)^(1/3)
12	6.4	2.9	17.5	0.6	2	1
30	6.8	3.6	18.9	0.6	2	1
46	7	3.8	18.1	0.6	2	1
60	7.1	4.3	15.5	0.6	2	1
74	7.4	5.1	13.4	0.6	2	1
88	7.7	5.3	13.4	0.6	2	1];
data.tL_ShelClar1995_4 = tLW4(:,[1 2]); data.tW_ShelClar1995_4 = tLW4(:,[1 3]); auxData.tT.tL_ShelClar1995_4 = tLW4(:,[1 4]); auxData.tT.tW_ShelClar1995_4 = tLW4(:,[1 4]);
units.tL_ShelClar1995_4 = {'d', 'cm'}; label.tL_ShelClar1995_4 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_4 = {'ShelClar1995'};
units.tW_ShelClar1995_4 = {'d', 'g'};  label.tW_ShelClar1995_4 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_4 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_4 = {'Celsius'};units.tT.tW_ShelClar1995_4 = {'Celsius'};
tLW7 = [ ...
1	6.0	2.4	16.7	1	1	2  % L(1) = 6.4*(2.4/2.9)^(1/3)
12	6.4	2.9	11.7	1	1	2
30	7	3.9	10.3	1	1	2
46	7.6	4.9	16.6	1	1	2
60	8.2	6.6	15.4	1	1	2
74	8.8	8.7	13.4	1	1	2
88	9.5	10.4 13.4	1	1	2];
data.tL_ShelClar1995_7 = tLW7(:,[1 2]); data.tW_ShelClar1995_7 = tLW7(:,[1 3]); auxData.tT.tL_ShelClar1995_7 = tLW7(:,[1 4]);auxData.tT.tW_ShelClar1995_7 = tLW7(:,[1 4]);
units.tL_ShelClar1995_7 = {'d', 'cm'}; label.tL_ShelClar1995_7 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_7 = {'ShelClar1995'};
units.tW_ShelClar1995_7 = {'d', 'g'};  label.tW_ShelClar1995_7 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_7 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_7 = {'Celsius'}; units.tT.tW_ShelClar1995_7 = {'Celsius'};
tLW8 = [ ...
1	6.1	2.5	16.6	1	2	2  % L(1) = 6.5*(2.5/3.1)^(1/3)
12	6.5	3.1	11.7	1	2	2
30	7.1	4	10.2	1	2	2
46	7.5	4.8	16.5	1	2	2
60	8.1	6.4	15.5	1	2	2
74	8.8	8.3	13.3	1	2	2
88	9.4	10	13.3	1	2	2];
data.tL_ShelClar1995_8 = tLW8(:,[1 2]); data.tW_ShelClar1995_8 = tLW8(:,[1 3]); auxData.tT.tL_ShelClar1995_8 = tLW8(:,[1 4]);auxData.tT.tW_ShelClar1995_8 = tLW8(:,[1 4]);
units.tL_ShelClar1995_8 = {'d', 'cm'}; label.tL_ShelClar1995_8 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_8 = {'ShelClar1995'};
units.tW_ShelClar1995_8 = {'d', 'g'};  label.tW_ShelClar1995_8 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_8 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_8 = {'Celsius'};units.tT.tW_ShelClar1995_8 = {'Celsius'};
tLW9 = [ ...
1	6.0	2.3	16.7	0.6	1	2  % L(1) = 6.2*(2.3/2.6)^(1/3)
12	6.2	2.6	11.7	0.6	1	2
30	6.5	3.1	10.3	0.6	1	2
46	6.8	3.4	16.7	0.6	1	2
60	7	3.8	15.8	0.6	1	2
74	7.3	4.8	13.4	0.6	1	2
88	7.6	5.2	13.4	0.6	1	2];
data.tL_ShelClar1995_9 = tLW9(:,[1 2]); data.tW_ShelClar1995_9 = tLW9(:,[1 3]); auxData.tT.tL_ShelClar1995_9 = tLW9(:,[1 4]);auxData.tT.tW_ShelClar1995_9 = tLW9(:,[1 4]);
units.tL_ShelClar1995_9 = {'d', 'cm'}; label.tL_ShelClar1995_9 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_9 = {'ShelClar1995'};
units.tW_ShelClar1995_9 = {'d', 'g'};  label.tW_ShelClar1995_9 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_9 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_9 = {'Celsius'}; units.tT.tW_ShelClar1995_9 = {'Celsius'};
tLW10 = [ ...
1	6.1	2.4	16.6	0.6	2	2  % L(1) = 6.3*(2.4/2.7)^(1/3)
12	6.3	2.7	11.5	0.6	2	2
30	6.6	3.1	10.3	0.6	2	2
46	6.8	3.5	16.6	0.6	2	2
60	7	3.9	15.5	0.6	2	2
74	7.3	4.8	13.3	0.6	2	2
88	7.6	5	13.3	0.6	2	2];
data.tL_ShelClar1995_10 = tLW10(:,[1 2]); data.tW_ShelClar1995_10 = tLW10(:,[1 3]); auxData.tT.tL_ShelClar1995_10 = tLW10(:,[1 4]);auxData.tT.tW_ShelClar1995_10 = tLW10(:,[1 4]);
units.tL_ShelClar1995_10 = {'d', 'cm'}; label.tL_ShelClar1995_10 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_10 = {'ShelClar1995'};
units.tW_ShelClar1995_10 = {'d', 'g'};  label.tW_ShelClar1995_10 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_10 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_10 = {'Celsius'}; units.tT.tW_ShelClar1995_10 = {'Celsius'};
tLW13 = [ ...
1	6.0	2.6	16.7	1	1	3  % L(1) = 6.4*(2.6/3.2)^(1/3)
12	6.4	3.2	13.7	1	1	3
30	7.3	4.6	12.6	1	1	3
46	7.9	5.7	17.2	1	1	3
60	8.5	7.5	15.4	1	1	3
74	9	9.4	13.4	1	1	3
88	9.6	10.9 13.4	1	1	3];
data.tL_ShelClar1995_13 = tLW13(:,[1 2]); data.tW_ShelClar1995_13 = tLW13(:,[1 3]); auxData.tT.tL_ShelClar1995_13 = tLW13(:,[1 4]); auxData.tT.tW_ShelClar1995_13 = tLW13(:,[1 4]);
units.tL_ShelClar1995_13 = {'d', 'cm'}; label.tL_ShelClar1995_13 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_13 = {'ShelClar1995'};
units.tW_ShelClar1995_13 = {'d', 'g'};  label.tW_ShelClar1995_13 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_13 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_13 = {'Celsius'};units.tT.tW_ShelClar1995_13 = {'Celsius'};
tLW14 = [ ...
1	6.2	2.6	16.8	1	2	3  % L(1) = 6.5*(2.6/3.0)^(1/3)
12	6.5	3	14      1	2	3
30	7.1	4.1	12.6	1	2	3
46	7.5	4.6	17.2	1	2	3
60	8	6.2	15.6	1	2	3
74	8.6	7.8	13.5	1	2	3
88	9	8.7	13.5	1	2	3];
data.tL_ShelClar1995_14 = tLW14(:,[1 2]); data.tW_ShelClar1995_14 = tLW14(:,[1 3]); auxData.tT.tL_ShelClar1995_14 = tLW14(:,[1 4]); auxData.tT.tW_ShelClar1995_14 = tLW14(:,[1 4]);
units.tL_ShelClar1995_14 = {'d', 'cm'}; label.tL_ShelClar1995_14 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_14 = {'ShelClar1995'};
units.tW_ShelClar1995_14 = {'d', 'g'};  label.tW_ShelClar1995_14 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_14 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_14 = {'Celsius'};units.tT.tW_ShelClar1995_14 = {'Celsius'};
tLW15 = [ ...
1	5.9	2.3	16.7	0.6	1	3  % L(1) = 6.1*(2.3/2.6)^(1/3)
12	6.1	2.6	13.6	0.6	1	3
30	6.5	3.2	12.6	0.6	1	3
46	6.8	3.5	17.2	0.6	1	3
60	7	3.9	15.4	0.6	1	3
74	7.2	4.7	13.4	0.6	1	3
88	7.5	4.9	13.4	0.6	1	3];
data.tL_ShelClar1995_15 = tLW15(:,[1 2]); data.tW_ShelClar1995_15 = tLW15(:,[1 3]); auxData.tT.tL_ShelClar1995_15 = tLW15(:,[1 4]); auxData.tT.tW_ShelClar1995_15 = tLW15(:,[1 4]);
units.tL_ShelClar1995_15 = {'d', 'cm'}; label.tL_ShelClar1995_15 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_15 = {'ShelClar1995'};
units.tW_ShelClar1995_15 = {'d', 'g'};  label.tW_ShelClar1995_15 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_15 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_15 = {'Celsius'};units.tT.tW_ShelClar1995_15 = {'Celsius'};
tLW16 = [ ...
1	6.1	2.6	16.6	0.6	2	3  % L(1) = 6.4*(2.6/3)^(1/3)
12	6.4	3	13.6	0.6	2	3
30	6.8	3.6	12.4	0.6	2	3
46	7.1	3.8	17.2	0.6	2	3
60	7.2	4.3	15.4	0.6	2	3
74	7.5	5	13.3	0.6	2	3
88	7.7	5.3	13.3	0.6	2	3];
data.tL_ShelClar1995_16 = tLW16(:,[1 2]); data.tW_ShelClar1995_16 = tLW16(:,[1 3]); auxData.tT.tL_ShelClar1995_16 = tLW16(:,[1 4]); auxData.tT.tW_ShelClar1995_16 = tLW16(:,[1 4]);
units.tL_ShelClar1995_16 = {'d', 'cm'}; label.tL_ShelClar1995_16 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_16 = {'ShelClar1995'};
units.tW_ShelClar1995_16 = {'d', 'g'};  label.tW_ShelClar1995_16 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_16 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_16 = {'Celsius'};units.tT.tW_ShelClar1995_16 = {'Celsius'};
tLW19 = [ ...
1	6.0	2.4	16.4	1	1	4  % L(1) = 6.4*(2.4/2.9)^(1/3)
12	6.4	2.9	15.6	1	1	4
30	7.2	4.4	15      1	1	4
46	7.8	5.6	17.6	1	1	4
60	8.4	7.4	15.3	1	1	4
74	9	9	13.3	1	1	4
88	9.5	10.2 13.3	1	1	4];
data.tL_ShelClar1995_19 = tLW19(:,[1 2]); data.tW_ShelClar1995_19 = tLW19(:,[1 3]); auxData.tT.tL_ShelClar1995_19 = tLW19(:,[1 4]); auxData.tT.tW_ShelClar1995_19 = tLW19(:,[1 4]);
units.tL_ShelClar1995_19 = {'d', 'cm'}; label.tL_ShelClar1995_19 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_19 = {'ShelClar1995'};
units.tW_ShelClar1995_19 = {'d', 'g'};  label.tW_ShelClar1995_19 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_19 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_19 = {'Celsius'};units.tT.tW_ShelClar1995_19 = {'Celsius'};
tLW20 = [ ... 
1	6.2	2.6	16.6	1	2	4  % L(1) = 6.5*(2.6/3)^(1/3)
12	6.5	3	15.6	1	2	4
30	7.3	4.5	15.1	1	2	4
46	7.9	5.7	17.5	1	2	4
60	8.5	7.4	15.4	1	2	4
74	9	9	13.4	1	2	4
88	9.5	10.2 13.4	1	2	4];
data.tL_ShelClar1995_20 = tLW20(:,[1 2]); data.tW_ShelClar1995_20 = tLW20(:,[1 3]); auxData.tT.tL_ShelClar1995_20 = tLW20(:,[1 4]); auxData.tT.tW_ShelClar1995_20 = tLW20(:,[1 4]);
units.tL_ShelClar1995_20 = {'d', 'cm'}; label.tL_ShelClar1995_20 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_20 = {'ShelClar1995'};
units.tW_ShelClar1995_20 = {'d', 'g'};  label.tW_ShelClar1995_20 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_20 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_20 = {'Celsius'};units.tT.tW_ShelClar1995_20 = {'Celsius'};
tLW21 = [ ...
1	6.2	2.6	16.6	0.6	1	4  % L(1) = 6.5*(2.6/3)^(1/3)
12	6.4	2.9	15.6	0.6	1	4
30	6.9	3.8	15.1	0.6	1	4
46	7.1	4.1	17.6	0.6	1	4
60	7.3	4.6	15.4	0.6	1	4
74	7.6	5.5	13.4	0.6	1	4
88	7.9	5.6	13.4	0.6	1	4];
data.tL_ShelClar1995_21 = tLW21(:,[1 2]); data.tW_ShelClar1995_21 = tLW21(:,[1 3]); auxData.tT.tL_ShelClar1995_21 = tLW21(:,[1 4]); auxData.tT.tW_ShelClar1995_21 = tLW21(:,[1 4]);
units.tL_ShelClar1995_21 = {'d', 'cm'}; label.tL_ShelClar1995_21 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_21 = {'ShelClar1995'};
units.tW_ShelClar1995_21 = {'d', 'g'};  label.tW_ShelClar1995_21 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_21 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_21 = {'Celsius'};units.tT.tW_ShelClar1995_21 = {'Celsius'};
tLW22 = [ ...
1	6.1	2.5	16.8	0.6	2	4  % L(1) = 6.3*(2.5/2.8)^(1/3)
12	6.3	2.8	15.7	0.6	2	4
30	6.7	3.5	15.1	0.6	2	4
46	6.9	3.7	17.6	0.6	2	4
60	7	3.9	15.4	0.6	2	4
74	7.2	4.5	13.4	0.6	2	4
88	7.7	5.3	13.4	0.6	2	4];
data.tL_ShelClar1995_22 = tLW22(:,[1 2]); data.tW_ShelClar1995_22 = tLW22(:,[1 3]); auxData.tT.tL_ShelClar1995_22 = tLW22(:,[1 4]); auxData.tT.tW_ShelClar1995_22 = tLW22(:,[1 4]);
units.tL_ShelClar1995_22 = {'d', 'cm'}; label.tL_ShelClar1995_22 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_22 = {'ShelClar1995'};
units.tW_ShelClar1995_22 = {'d', 'g'};  label.tW_ShelClar1995_22 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_22 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_22 = {'Celsius'};units.tT.tW_ShelClar1995_22 = {'Celsius'};
tLW5 = [ ...
1	6.0	2.5	16.5	0.8	1	1  % L(1) = 6.3*(2.5/2.9)^(1/3)
12	6.3	2.9	17.4	0.8	1	1
30	6.9	3.9	18.8	0.8	1	1
46	7.3	4.7	18.2	0.8	1	1
60	7.7	5.5	15.5	0.8	1	1
74	8.1	6.7	13.5	0.8	1	1
88	8.6	7.5	13.5	0.8	1	1];
data.tL_ShelClar1995_5 = tLW5(:,[1 2]); data.tW_ShelClar1995_5 = tLW5(:,[1 3]); auxData.tT.tL_ShelClar1995_5 = tLW5(:,[1 4]); auxData.tT.tW_ShelClar1995_5 = tLW5(:,[1 4]);
units.tL_ShelClar1995_5 = {'d', 'cm'}; label.tL_ShelClar1995_5 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_5 = {'ShelClar1995'};
units.tW_ShelClar1995_5 = {'d', 'g'};  label.tW_ShelClar1995_5 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_5 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_5 = {'Celsius'};units.tT.tW_ShelClar1995_5 = {'Celsius'};
tLW6 = [ ...
1	6.1	2.5	16.6	0.8	2	1  % L(1) = 6.3*(2.5/2.8)^(1/3)
12	6.3	2.8	17.2	0.8	2	1
30	6.9	3.8	18.2	0.8	2	1
46	7.1	4.2	17.4	0.8	2	1
60	7.4	4.8	15.4	0.8	2	1
74	7.7	5.5	13.4	0.8	2	1
88	8	6	13.4	0.8	2	1];
data.tL_ShelClar1995_6 = tLW6(:,[1 2]); data.tW_ShelClar1995_6 = tLW6(:,[1 3]); auxData.tT.tL_ShelClar1995_6 = tLW6(:,[1 4]); auxData.tT.tW_ShelClar1995_6 = tLW6(:,[1 4]);
units.tL_ShelClar1995_6 = {'d', 'cm'}; label.tL_ShelClar1995_6 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_6 = {'ShelClar1995'};
units.tW_ShelClar1995_6 = {'d', 'g'};  label.tW_ShelClar1995_6 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_6 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_6 = {'Celsius'};units.tT.tW_ShelClar1995_6 = {'Celsius'};
tLW11 = [ ...
1	6.0	2.4	16.7	0.8	1	2  % L(1) = 6.3*(2.4/2.8)^(1/3)
12	6.3	2.8	11.8	0.8	1	2
30	6.8	3.6	10.2	0.8	1	2
46	7.3	4.3	16.6	0.8	1	2
60	7.6	5.3	15.7	0.8	1	2
74	8.2	6.7	13.4	0.8	1	2
88	8.7	7.8	13.4	0.8	1	2];
data.tL_ShelClar1995_11 = tLW11(:,[1 2]); data.tW_ShelClar1995_11 = tLW11(:,[1 3]); auxData.tT.tL_ShelClar1995_11 = tLW11(:,[1 4]);auxData.tT.tW_ShelClar1995_11 = tLW11(:,[1 4]);
units.tL_ShelClar1995_11 = {'d', 'cm'}; label.tL_ShelClar1995_11 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_11 = {'ShelClar1995'};
units.tW_ShelClar1995_11 = {'d', 'g'};  label.tW_ShelClar1995_11 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_11 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_11 = {'Celsius'};units.tT.tW_ShelClar1995_11 = {'Celsius'};
tLW12 = [ ...
1	6.2	2.7	16.6	0.8	2	2  % L(1) = 6.5*(2.7/3.1)^(1/3)
12	6.5	3.1	11.6	0.8	2	2
30	6.9	3.7	10.1	0.8	2	2
46	7.3	4.2	16.5	0.8	2	2
60	7.7	5.2	15.4	0.8	2	2
74	8.1	6.5	13.3	0.8	2	2
88	8.5	7.2	13.3	0.8	2	2];
data.tL_ShelClar1995_12 = tLW12(:,[1 2]); data.tW_ShelClar1995_12 = tLW12(:,[1 3]); auxData.tT.tL_ShelClar1995_12 = tLW12(:,[1 4]); auxData.tT.tW_ShelClar1995_12 = tLW12(:,[1 4]);
units.tL_ShelClar1995_12 = {'d', 'cm'}; label.tL_ShelClar1995_12 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_12 = {'ShelClar1995'};
units.tW_ShelClar1995_12 = {'d', 'g'};  label.tW_ShelClar1995_12 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_12 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_12 = {'Celsius'};units.tT.tW_ShelClar1995_12 = {'Celsius'};
tLW17 = [ ...
1	6.2	2.7	16.6	0.8	1	3  % L(1) = 6.5*(2.7/3.1)^(1/3) 
12	6.5	3.1	13.5	0.8	1	3
30	7	4	12.5	0.8	1	3
46	7.5	4.8	17.1	0.8	1	3
60	7.9	5.9	15.4	0.8	1	3
74	8.4	7.3	13.4	0.8	1	3
88	8.9	8.5	13.4	0.8	1	3];
data.tL_ShelClar1995_17 = tLW17(:,[1 2]); data.tW_ShelClar1995_17 = tLW17(:,[1 3]); auxData.tT.tL_ShelClar1995_17 = tLW17(:,[1 4]);auxData.tT.tW_ShelClar1995_17 = tLW17(:,[1 4]);
units.tL_ShelClar1995_17 = {'d', 'cm'}; label.tL_ShelClar1995_17 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_17 = {'ShelClar1995'};
units.tW_ShelClar1995_17 = {'d', 'g'};  label.tW_ShelClar1995_17 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_17 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_17 = {'Celsius'};units.tT.tW_ShelClar1995_17 = {'Celsius'};
tLW18 = [ ...
1	6.2	2.4	16.7	0.8	2	3  % L(1) = 6.5*(2.4/2.8)^(1/3)
12	6.3	2.8	13.6	0.8	2	3
30	6.8	3.6	12.4	0.8	2	3
46	7.2	4.1	17.1	0.8	2	3
60	7.5	5	15.5	0.8	2	3
74	7.9	6.1	13.3	0.8	2	3
88	8.3	6.9	13.3	0.8	2	3];
data.tL_ShelClar1995_18 = tLW18(:,[1 2]); data.tW_ShelClar1995_18 = tLW18(:,[1 3]); auxData.tT.tL_ShelClar1995_18 = tLW18(:,[1 4]);auxData.tT.tW_ShelClar1995_18 = tLW18(:,[1 4]);
units.tL_ShelClar1995_18 = {'d', 'cm'}; label.tL_ShelClar1995_18 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_18 = {'ShelClar1995'};
units.tW_ShelClar1995_18 = {'d', 'g'};  label.tW_ShelClar1995_18 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_18 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_18 = {'Celsius'};units.tT.tW_ShelClar1995_18 = {'Celsius'};
tLW23 = [ ...
1	6.0	2.3	16.7	0.8	1	4  % L(1) = 6.2*(2.3/2.6)^(1/3)
12	6.2	2.6	15.7	0.8	1	4
30	6.7	3.4	15.2	0.8	1	4
46	7	3.9	17.6	0.8	1	4
60	7.3	4.7	15.4	0.8	1	4
74	7.6	5.5	13.4	0.8	1	4
88	8	5.9	13.4	0.8	1	4];
data.tL_ShelClar1995_23 = tLW23(:,[1 2]); data.tW_ShelClar1995_23 = tLW23(:,[1 3]); auxData.tT.tL_ShelClar1995_23 = tLW23(:,[1 4]);auxData.tT.tW_ShelClar1995_23 = tLW23(:,[1 4]);
units.tL_ShelClar1995_23 = {'d', 'cm'}; label.tL_ShelClar1995_23 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_23 = {'ShelClar1995'};
units.tW_ShelClar1995_23 = {'d', 'g'};  label.tW_ShelClar1995_23 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_23 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_23 = {'Celsius'};units.tT.tW_ShelClar1995_23 = {'Celsius'};
tLW24 = [ ...
1	6.1	2.5	16.7	0.8	2	4  % L(1) = 6.3*(2.5/2.8)^(1/3)
12	6.3	2.8	15.5	0.8	2	4
30	6.9	3.9	15      0.8	2	4
46	7.4	4.7	17.5	0.8	2	4
60	7.8	5.7	15.4	0.8	2	4
74	8.2	6.8	13.3	0.8	2	4
88	8.6	7.6	13.3	0.8	2	4];
data.tL_ShelClar1995_24 = tLW24(:,[1 2]); data.tW_ShelClar1995_24 = tLW24(:,[1 3]); auxData.tT.tL_ShelClar1995_24 = tLW24(:,[1 4]); auxData.tT.tW_ShelClar1995_24 = tLW24(:,[1 4]);
units.tL_ShelClar1995_24 = {'d', 'cm'}; label.tL_ShelClar1995_24 = {'time', 'fork length'};  bibkey.tL_ShelClar1995_24 = {'ShelClar1995'};
units.tW_ShelClar1995_24 = {'d', 'g'};  label.tW_ShelClar1995_24 = {'time', 'wet weight'};   bibkey.tW_ShelClar1995_24 = {'ShelClar1995'};
units.tT.tL_ShelClar1995_24 = {'Celsius'};units.tT.tW_ShelClar1995_24 = {'Celsius'};

% Length-Weight data, juveniles, Snake River, ZabeAcho2004, 
Lw_juv = [3.5:0.5:10]'; % cm, Physical length
data.LW_juv = [Lw_juv , 0.01853 * Lw_juv.^2.81];% cm, g ; Length, wet weight
units.LW_juv = {'cm', 'g'}; label.LW_juv = {'fork length', 'wet weight'};  
bibkey.LW_juv = {'ZabeAcho2004'};

% ocean data

% Age - Length adults, commercial fishing, AlleHass1985 
data.tL_AlleHass1985 = [...% years, cm fork length
    2	33;
    3	46;
    4	69;
    5	83;
    6	98.5];
data.tL_AlleHass1985(:,1) = data.tL_AlleHass1985(:,1) .* 365;%  convert years in days
units.tL_AlleHass1985 = {'d', 'g'}; label.tL_AlleHass1985 = {'time', 'fork length'};  
temp.tL_AlleHass1985 = C2K(13); units.temp.tL_AlleHass1985 = 'K'; label.temp.tL_AlleHass1985 = 'temperature';
bibkey.tL_AlleHass1985 = {'AlleHass1985'};
comment.tL_AlleHass1985 = 'temp is guessed';

% Age - length Ocean type, OrsiJaen1996 
% Age days
% L cm, fork length
tLLL = [...% Age, avg L, max L, min L 
    320.00	18	24	16;
    473.00	27	30	26;
    562.00	29	32	27;
    685.00	42	58	22;
    838.00	45	59	30;
    927.00	49	67	33;
    1050.00	57	70	35];
data.tL_OrsiJaen1996 = tLLL(:,[1 2]);
units.tL_OrsiJaen1996 = {'d', 'g'};  label.tL_OrsiJaen1996 = {'time', 'fork length'};
temp.tL_OrsiJaen1996 = C2K(13); units.temp.tL_OrsiJaen1996 = 'K'; label.temp.tL_OrsiJaen1996 = 'temperature';
bibkey.tL_OrsiJaen1996 = {'OrsiJaen1996'};
comment.tL_OrsiJaen1996 = 'temp is guessed';

% spawning adult data

% BeacMurr1993 
% L cm postorbital-hypural length (hypural: bone that supports tail fin)
% N # Fecundity
% Ww0 g, egg wet weight
% R g, N * Ww0, total reproductive wet weight
LNW0R = [...
73.3	6008	0.212	1273.7	;
73.8	5033	0.375	1887.4	;
79.6	6188	0.408	2524.7	;
74.4	5714	0.348	1988.5	;
71.1	4481	0.334	1496.7	;
77.4	4666	0.413	1927.1	;
75.9	4991	0.425	2121.2	;
70.4	3885	0.341	1324.8	;
76      6098	0.271	1652.6	;
75.3	5981	0.261	1561.0	;
74.2	6242	0.272	1697.8	;
73.6	6810	0.3     2043.0	;
70.6	6223	0.21	1306.8	;
68      5487	0.261	1432.1	;
76.4	6624	0.317	2099.8	;
74.6	5737	0.284	1629.3	;
73.2	5118	0.256	1310.2	;
70.8	5078	0.255	1294.9	;
69.1	4728	0.248	1172.5	;
64.6	5064	0.251	1271.1	;
60.2	4231	0.181	765.8	;
58.7	3715	0.161	598.1	;
56      3169	0.17	538.7	];
LWR = LNW0R(:,[1 4]);
[L iL] = sort(LWR(:,1)); 
data.LWR_BeacMurr1993 = LWR(iL,:);
units.LWR_BeacMurr1993 = {'cm', 'g'}; label.LWR_BeacMurr1993 = {'postorbital-hypural length', 'total reproductive wet weight'};  
temp.LWR_BeacMurr1993 = C2K(13); units.temp.LWR_BeacMurr1993 = 'K'; label.temp.LWR_BeacMurr1993 = 'temperature';
bibkey.LWR_BeacMurr1993 = {'BeacMurr1993'};  
comment.LWR_BeacMurr1993 = 'temp is guessed';


% Length - Fecundity data, North American West Coast from California to British Columbia, EinuFlem2003 
data.LN_EinuFlem2003 = [...% L Postorbital-hypural Length cm, N # Fecundity
    68.3	5449; %
    67.5	3754;
    63.3	3498;
    73.3	4920;
    67.1	3826;
    65.8	4529;
    65.4	5245;
    63.9	3923;
    74.1	4483;
    71.1	4481;
    70.4	3885;
    79.6	6188;
    74.4	5714;
    73.2	5118;
    69.1	4728;
    58.7	3715;
    56      3169;
    80.3	6624;
    68      5487;
    74.2	6242;
    75.3	6098];
units.LN_EinuFlem2003 = {'cm', '#'}; label.LN_EinuFlem2003 = {'postorbital-hypural length', 'fecundity'};  
temp.LN_EinuFlem2003 = C2K(13); units.temp.LN_EinuFlem2003 = 'K'; label.temp.LN_EinuFlem2003 = 'temperature';
bibkey.LN_EinuFlem2003 = {'EinuFlem2003'};  
comment.LN_EinuFlem2003 = 'temp is guessed';

% JaspEven2006  Colums of LGWN
%   1  L Postorbital-hypural length (cm)
%   2  G Girth (cm)
%   3  Ww Wet weight (g)
%   4  Fecundity #
%   5  district
LGWN = [...
72	40	4944	5122	5	;
72	35	4354	3149	5	;
73	38	4808	4009	5	;
75	40	5443	3240	5	;
76	44	6260	3616	5	;
76	38	5171	3527	5	;
77	43	6169	2553	5	;
77	44	5715	5712	5	;
77	44	6759	4039	5	;
77	43	6214	5846	5	;
77	45	7121	4983	5	;
77	41	5942	4219	5	;
77	37	4808	2443	5	;
77	42	6078	4507	5	;
78	44	6305	5768	5	;
79	43	5942	2727	5	;
79	42	6396	4471	5	;
79	37	4581	3690	5	;
79	44	6532	2938	5	;
79	41	5987	5390	5	;
80	44	5851	4551	5	;
80	40	5806	2519	5	;
81	46	6804	4814	5	;
81	41	6441	3393	5	;
81	47	7530	5658	5	;
81	45	6441	4485	5	;
81	45	6985	4559	5	;
82	44	6396	4843	5	;
82	41	6486	3450	5	;
83	42	6396	5790	5	;
83	42	6396	3078	5	;
83	44	6895	5018	5	;
83	46	7893	5292	5	;
84	46	7938	5573	5	;
84	46	7802	4442	5	;
84	51	8165	5681	5	;
84	45	6804	4083	5	;
85	49	8437	3144	5	;
86	50	8482	5510	5	;
86	53	9389	8212	5	;
86	47	7711	5602	5	;
86	47	8119	7855	5	;
86	49	8981	6200	5	;
87	49	8845	7121	5	;
87	47	7711	5021	5	;
87	50	8800	8957	5	;
87	49	8800	4783	5	;
87	43	6713	4690	5	;
87	49	8210	4832	5	;
88	53	9525	5672	5	;
88	49	9525	7553	5	;
88	48	6895	4180	5	;
88	48	7711	5828	5	;
88	52	9752	4795	5	;
88	52	9888	7670	5	;
88	52	9117	6640	5	;
88	46	8528	3810	5	;
89	50	9344	5143	5	;
89	52	9843	8468	5	;
89	48	9117	2517	5	;
90	48	8981	5478	5	;
90	53	10795	6385	5	;
90	54	9299	6688	5	;
90	53	10659	7310	5	;
91	50	9480	8704	5	;
91	54	11068	9020	5	;
91	54	10795	2591	5	;
91	52	9117	9733	5	;
91	51	9571	9238	5	;
92	55	11521	8041	5	;
92	52	9344	7571	5	;
92	50	9571	7122	5	;
92	53	10569	6874	5	;
93	54	11204	6338	5	;
93	52	11158	5733	5	;
84	47	7756	5745	5	;
85	48	8210	5546	5	;
85	46	8029	6104	5	;
85	46	7303	4198	5	;
85	48	8890	6183	5	;
85	47	8301	4089	5	;
85	52	8301	3464	5	;
93	55	10115	6262	5	;
94	52	9253	11708	5	;
95	57	12066	6415	5	;
95	60	13608	7089	5	;
96	54	11748	6980	5	;
97	60	13517	7377	5	;
100	59	14334	7251	5	;
65	37	3629	4437	6	;
70	37	3674	3804	6	;
73	37	3946	5334	6	;
74	40	4899	4709	6	;
74	43	5715	5734	6	;
75	40	4808	5981	6	;
76	40	4944	4012	6	;
76	42	6668	6405	6	;
76	45	6123	6548	6	;
77	40	4717	5406	6	;
77	46	6033	6797	6	;
77	40	4944	6425	6	;
77	44	6033	5766	6	;
77	46	6668	8482	6	;
77	41	5171	7384	6	;
77	40	4763	5299	6	;
78	45	6260	7084	6	;
78	43	5942	6800	6	;
78	40	4944	5306	6	;
78	45	6350	8027	6	;
78	44	5987	6750	6	;
79	42	6033	6621	6	;
79	43	5488	5011	6	;
79	42	5035	5945	6	;
79	39	4536	6502	6	;
79	45	5851	5938	6	;
79	43	5625	7981	6	;
79	44	6396	6047	6	;
79	44	6713	5599	6	;
79	43	6441	7058	6	;
80	45	5987	6685	6	;
80	44	6169	4607	6	;
80	43	6486	5196	6	;
80	43	5897	3832	6	;
80	45	5806	4831	6	;
80	46	6940	6629	6	;
80	43	6078	6382	6	;
80	47	7212	7515	6	;
81	47	6622	6808	6	;
81	46	6940	7647	6	;
81	42	6123	4909	6	;
81	47	6759	6562	6	;
81	47	7121	9743	6	;
82	44	5851	6166	6	;
82	47	7121	6314	6	;
82	44	6759	4758	6	;
82	47	6260	6268	6	;
82	48	7530	6280	6	;
82	46	7121	5889	6	;
82	45	6895	5901	6	;
82	47	6985	10348	6	;
83	46	6804	6029	6	;
83	50	7756	7045	6	;
83	47	7394	6885	6	;
83	47	7303	4884	6	;
83	49	7620	6215	6	;
83	46	7257	8399	6	;
83	48	7439	8117	6	;
83	44	7439	6486	6	;
84	45	7484	3592	6	;
84	51	8119	5655	6	;
84	50	8391	6211	6	;
84	45	6985	5281	6	;
84	45	6622	4794	6	;
84	47	8210	6780	6	;
84	50	8709	7897	6	;
85	53	8419	6303	6	;
85	47	7847	4758	6	;
85	46	7575	5460	6	;
85	51	8709	5387	6	;
86	49	8618	7320	6	;
86	51	8346	8172	6	;
86	49	8029	5753	6	;
86	48	8119	6415	6	;
86	51	9208	8667	6	;
87	48	8301	6113	6	;
87	51	8029	6352	6	;
87	48	7121	6130	6	;
87	50	8528	5985	6	;
87	50	8210	7170	6	;
87	50	8845	7719	6	;
88	54	10070	7750	6	;
88	49	8664	7079	6	;
89	50	8346	7511	6	;
89	49	8890	7254	6	;
89	51	9117	5620	6	;
90	53	9798	11597	6	;
90	56	11249	8919	6	;
90	52	9525	8366	6	;
91	52	9798	5870	6	;
91	51	9253	9034	6	;
91	54	10433	8011	6	;
92	53	10297	8021	6	;
92	53	10932	8881	6	;
92	52	10795	7200	6	;
94	54	11204	8320	6	;
94	56	11567	8751	6	;
97	55	12247	7978	6	;
86	49	8255	6799	6	];
data.LW_JaspEven2006 = LGWN(:,[1 3]);% Length weight
units.LW_JaspEven2006 = {'cm', 'g'}; label.LW_JaspEven2006 = {'postorbital-hypural length', 'wet weight'}; 
bibkey.LW_JaspEven2006 = {'JaspEven2006'}; 
%
data.LN_JaspEven2006 = LGWN(:,[1 4]);     % Length fecundity
[L iL] = sort(data.LN_JaspEven2006(:,1)); data.LN_JaspEven2006 = data.LN_JaspEven2006(iL,:);
units.LN_JaspEven2006 = {'cm', '#'}; label.LN_JaspEven2006 = {'postorbital-hypural length', 'fecundity'};  
temp.LN_JaspEven2006 = C2K(13); units.temp.LN_JaspEven2006 = 'K'; label.temp.LN_JaspEven2006 = 'temperature';
bibkey.LN_JaspEven2006 = {'JaspEven2006'};
comment.LN_JaspEven2006 = 'temp is guessed';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LN_JaspEven2006'}; subtitle1 = {'Data of JaspEven2006'};      
set2 = {'LW_JaspEven2006'}; subtitle2 = {'Data of JaspEven2006'};   
set3 = {'LN_EinuFlem2003'}; subtitle3 = {'Data of EinuFlem2003'};   
set4 = {'LWR_BeacMurr1993'}; subtitle4 = {'Data of BeacMurr1993'}; 
set5 = {'tL_OrsiJaen1996'}; subtitle5 = {'Adults in ocean (average), OrsiJaen1996'}; 
set6 = {'tL_AlleHass1985'}; subtitle6 = {'Adults in ocean, AlleHass1985'}; 
set7 = {'LW_juv'}; subtitle7 = {'Juveniles from Snake River, ZabeAcho2004'};
set8 = {'tW_ShelClar1995_1','tW_ShelClar1995_2','tW_ShelClar1995_7','tW_ShelClar1995_8','tW_ShelClar1995_13','tW_ShelClar1995_14','tW_ShelClar1995_19','tW_ShelClar1995_20'}; 
subtitle8 = {'ShelClar1995 data, full ration, tank 1, 2, 7, 8, 13, 14, 19, 20'};
set9 = {'tW_ShelClar1995_5','tW_ShelClar1995_6','tW_ShelClar1995_11','tW_ShelClar1995_12','tW_ShelClar1995_17','tW_ShelClar1995_18','tW_ShelClar1995_23','tW_ShelClar1995_24'}; 
subtitle9 = {'ShelClar1995 data, 0.8 of full ration, tank 5, 6, 11, 12, 17, 18, 23, 24'};
set10 = {'tW_ShelClar1995_3','tW_ShelClar1995_4','tW_ShelClar1995_9','tW_ShelClar1995_10','tW_ShelClar1995_15','tW_ShelClar1995_16','tW_ShelClar1995_21','tW_ShelClar1995_22'}; 
subtitle10 = {'ShelClar1995 data, 0.6 of full ration, tank 3, 4, 9, 10, 15, 16, 21, 22'};
set11 = {'tL_ShelClar1995_1','tL_ShelClar1995_2','tL_ShelClar1995_7','tL_ShelClar1995_8','tL_ShelClar1995_13','tL_ShelClar1995_14','tL_ShelClar1995_19','tL_ShelClar1995_20'}; 
subtitle11 = {'ShelClar1995 data, full ration, tank 1, 2, 7, 8, 13, 14, 19, 20'};
set12 = {'tL_ShelClar1995_5','tL_ShelClar1995_6','tL_ShelClar1995_11','tL_ShelClar1995_12','tL_ShelClar1995_17','tL_ShelClar1995_18','tL_ShelClar1995_23','tL_ShelClar1995_24'}; 
subtitle12 = {'ShelClar1995 data, 0.8 of full ration, tank 5, 6, 11, 12, 17, 18, 23, 24'};
set13 = {'tL_ShelClar1995_3','tL_ShelClar1995_4','tL_ShelClar1995_9','tL_ShelClar1995_10','tL_ShelClar1995_15','tL_ShelClar1995_16','tL_ShelClar1995_21','tL_ShelClar1995_22'}; 
subtitle13 = {'ShelClar1995 data, 0.6 of full ration, tank 3, 4, 9, 10, 15, 16, 21, 22'};
set14 = {'Tab'}; subtitle14 = {'Data from BeacMurr1990'};
set15 = {'Tah'}; subtitle15 = {'Data from Hemi1982'};
set16 = {'tWt_Hemi1982_12', 'tWt_Hemi1982_10', 'tWt_Hemi1982_8', 'tWt_Hemi1982_6'}; subtitle16 = {'Hemi1982 data for 12, 10, 8, 6 C'};
set17 = {'tWy_Hemi1982_12', 'tWy_Hemi1982_10', 'tWy_Hemi1982_8', 'tWy_Hemi1982_6'}; subtitle17 = {'Hemi1982 data for 12, 10, 8, 6 C'};
set18 = {'tW_Hemi1982_12', 'tW_Hemi1982_10', 'tW_Hemi1982_8', 'tW_Hemi1982_6'}; subtitle18 = {'Hemi1982 data for 12, 10, 8, 6 C'};
set19 = {'tL_Hemi1982_12', 'tL_Hemi1982_10', 'tL_Hemi1982_8', 'tL_Hemi1982_6'}; subtitle19 = {'Hemi1982 data for 12, 10, 8, 6 C'};

metaData.grp.sets = {set1,set2,set3,set4,set5,set6,set7,set8,set9,set10, ...
  set11,set12,set13,set14,set15,set16,set17,set18,set19};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7,subtitle8,subtitle9,subtitle10, ...
  subtitle11,subtitle12,subtitle13,subtitle14,subtitle15,subtitle16,subtitle17,subtitle18,subtitle19};

%% Discussion points
D1 = 'shape changes before spawning';
metaData.discussion = struct('D1', D1);
metaData.bibkey.D1 = 'Wiki';

%% Facts
F1 = 'Ww(L) = 0.0053 * L^3.27 for high food';
metaData.bibkey.F1 = 'PetrJone2000';
F2 = 'Ww(L) =  0.01853 * L^2.81 for juveniles';
metaData.bibkey.F2 = 'ZabeAcho2004';
F3 = 'age at pubert = 1 year prior average age at return in California';
metaData.bibkey.F3 = 'BeacMurr1990';
F4 = 'semelparous species, i.e. dies after first spawning';
metaData.bibkey.F4 = 'Wiki';
F5 = 'Ww_0 = 0.345 g, average chinook data; Water content = 63%';
metaData.bibkey.F5 = 'BeacMurr1990';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);
                                 
%% Links
metaData.links.id_CoL = '49JFR'; % Cat of Life
metaData.links.id_ITIS = '161980'; % ITIS
metaData.links.id_EoL = '46563139'; % Ency of Life
metaData.links.id_Wiki = 'Oncorhynchus_tshawytscha'; % Wikipedia
metaData.links.id_ADW = 'Oncorhynchus_tshawytscha'; % ADW
metaData.links.id_Taxo = '125253'; % Taxonomicon
metaData.links.id_WoRMS = '158075'; % WoRMS
metaData.links.id_fishbase = 'Oncorhynchus-tshawytscha'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Oncorhynchus_tshawytscha}}';  
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
bibkey = 'BeacMurr1990'; type = 'Article'; bib = [ ...  
'author = {Beacham, T. D. and C. B. Murray}, ' ...
'year = {1990}, ' ...
'title = {Temperature, Egg Size, And Development of Embryos and Alevins of 5 Species of {P}acific Salmon - A Comparative Analysis.}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = 119, '...
'pages = {927--945}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BeacMurr1993'; type = 'Article'; bib = [ ...  
'author = {Beacham, T. D. and C. B. Murray.}, ' ...
'year = {1993}, ' ...
'title = {Fecundity and egg size variation in {N}orth-{A}merican {P}acific salmon (\emph{Oncorhynchus})}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = 42, '...
'pages = {485--508}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JaspEven2006'; type = 'Techreport'; bib = [ ...    
'author = {Jasper, J. R. and D. F. Evenson}, ' ...
'year  = {2006}, ' ...
'title = {Length-Girth, Length-Weight, and Fecundity of {Y}ukon {R}iver Chinook Salmon \emph{Oncorhynchus tshawytscha}}, ' ...  
'institution = {Alaska Department of Fish and Game. Divisions of Sport Fish and Commercial Fisheries.}, ' ...
'volume = {06-70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BergHend2001'; type = 'Article'; bib = [ ...    
'author = {Berg, O. K. and A. P. Hendry and B. Svendsen, C. Bech and J. V. Arnekleiv and A. Lohrmann}, ' ...
'year  = {2001}, ' ...
'title = {Maternal provisioning of offspring and the use of those resources during ontogeny: variation within and between {A}tlantic Salmon families}, ' ...  
'journal = {Functional Ecology}, ' ...
'volume = {15}, ' ...
'pages = {13--23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hemi1982'; type = 'Article'; bib = [ ...    
'author = {Heming, T. A.}, ' ...
'year  = {1982}, ' ...
'title = {Effects of Temperature on Utilization of Yolk by Chinook Salmon (\emph{Oncorhynchus tshawytscha}) Eggs and Alevins}, ' ...  
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {39}, ' ...
'pages = {184--190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShelClar1995'; type = 'Techreport'; bib = [ ...    
'author = {Shelbourn, J. E. and W. C. Clarke and C. D. Levings}, ' ...
'year  = {1995}, ' ...
'title = {Effects of lowered temperature on growth of juvenile {N}echako {R}iver Chinook salmon (\emph{Oncorhynchus tshawytscha}) at three ration levels.}, ' ...  
'institution = {Canadian Data Report of Fisheries and Aquatic Sciences}, ' ...
'volume = {958}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlleHass1985'; type = 'Techreport'; bib = [ ...    
'author = {Allen, M. A. and T.J. Hassler.}, ' ...
'year  = {1985}, ' ...
'title = {Chinook Salmon. Species Profiles: Life Histories and Environmental Requirements of Coastal Fishes and Invertebrates ({P}acific {S}outhwest)}, ' ...  
'institution = {U.S. Fish and Wildlife Service}, ' ...
'volume = {TR EL-82-4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EinuFlem2003'; type = 'Article'; bib = [ ...    
'author = {Einum, S. and I. A. Fleming and I. M. Cote and J. D. Reynolds}, ' ...
'year  = {2003}, ' ...
'title = {Population stability in salmon species: effects of population size and female reproductive allocation.}, ' ...  
'journal = {Journal of Animal Ecology}, ' ...
'volume = {72}, ' ...
'pages = {811--821}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OrsiJaen1996'; type = 'Article'; bib = [ ...    
'author = {Orsi, J. A. and H. W. Jaenicke}, ' ...
'year  = {1996}, ' ...
'title = {Marine distribution and origin of prerecruit chinook salmon, \emph{Oncorhynchus tshawytscha}, in southeastern {A}laska}, ' ...  
'journal = {Fishery Bulletin}, ' ...
'volume = {94}, ' ...
'pages = {482--497}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PetrJone2000'; type = 'Article'; bib = [ ...    
'author = {Petrell, R. J. and R. E. Jones}, ' ...
'year  = {2000}, ' ...
'title = {Power requirement of swimming in chinook salmon and {A}tlantic salmon and implications for food conversion and growth performance.}, ' ...  
'journal = {Aquacultural Engineering}, ' ...
'volume = {22.3}, ' ...
'pages = {225--239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZabeAcho2004'; type = 'Article'; bib = [ ...    
'author = {Zabel, R. W. and Achord, S.}, ' ...
'year  = {2004}, ' ...
'title = {Relating size of juveniles to survival within and among populations of chinook salmon.}, ' ...  
'journal = {Ecology}, ' ...
'volume = {85}, ' ...
'pages = {795--806}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Oncorhynchus-tshawytscha.html.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
