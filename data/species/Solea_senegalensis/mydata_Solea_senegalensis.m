function [data, auxData, metaData, txtData, weights] = mydata_Solea_senegalensis 

%% set metaData 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Solea_senegalensis'; 
metaData.species_en = 'Senegalese sole'; 

metaData.ecoCode.climate = {'MC','MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp','jiMcb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz','jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah';'ab';'aj';'ap';'am';'L0';'Lh';'Lb';'Lj';'Lp';'Li';'Wd0';'Wdh';'Wdb';'Wdj';'Wwp';'Wwi';'Ri';'E0'}; 
metaData.data_1     = {'T-ah';'T-aj';'t-L_T';'t-Wd_f';'t-Ww';'L-Ww';'L-Wd'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011 

metaData.author   = {'Adriana Sardi', 'Jose Moreira'};    
metaData.date_subm = [2021 11 25];              
metaData.email    = {'adrianasardi@gmail.com', 'j.miguel.moreira@tecnico.ulisboa.pt'};            
metaData.address  = {'University of Bordeaux', 'University of Lisbon'};   

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nmarn@irb.hr'}; 
metaData.date_acc    = [2021 11 30];

%% set data
% zero-variate data

data.ah = 1.58; units.ah = 'd'; label.ah = 'age at hatching'; bibkey.ah = 'YufeParr1999'; 
 temp.ah = C2K(19.5) ; units.temp.ah = 'K'; label.temp.ah = 'temperature';
 comment.ah = 'approx 38h from fertilization to hatching';
data.ab = 3.6;    units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'YufeParr1999';   
  temp.ab = C2K(19.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'mouth opening happens 2 days after hatching'; 
% data.aj = 16;      units.aj = 'd';    label.aj = 'time since fertilization at START of metamorphosis'; bibkey.aj = 'YufeParr1999'; 
%    temp.aj = C2K(19.5);  units.temp.aj = 'K'; label.temp.aj = 'temperature'; 
data.aj = 19;      units.aj = 'd';    label.aj = 'time since fertilization at end of acceleration'; bibkey.aj = 'YufeParr1999'; 
  temp.aj = C2K(19.5);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = 'metamorphosis starts at day 16 post fertilization and ends at day 19 pf at temp of 19.5C'; 
data.ap = 4 * 365;    units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'Vina2007';
  temp.ap = C2K(17.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'temp is the average between 15 and 20 which is the temperature range for the spawning period i.e. the birthday temperature'; 
%  data.ap= 900;   units.ap_f = 'd';    label.ap_f = 'age at puberty'; bibkey.ap_f = 'Manchado_pers_communication';
  %temp.ap = C2K(17.5);  units.temp.ap_f = 'K'; label.temp.ap_f = 'temperature';
  %comment.ap = 'age at puberty in laboratory reared animals'; 
data.am = 11 * 365;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'TeixCabr2010';   %-->they cite a thesis by Andrade 1990 
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am ='temp bibkey.temp.am=Vina2007 page 21 = average yearly temperature of tagus estuary';

data.L0 = 0.1; units.L0 = 'cm'; label.L0  = 'egg diameter'; bibkey.L0  = 'YufeParr1999';  
data.Lh = 0.1382;   units.Lh  = 'cm';  label.Lh  = 'total length at hatching';          bibkey.Lh  = 'YufeParr1999';  
data.Lb  = 0.2484;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';          bibkey.Lb  = 'YufeParr1999';
    comment.Lb = 'length at day 2 post hatching when mouth opening occurs';
% data.Lj  = 0.6857;   units.Lj  = 'cm';  label.Lj  = 'total length at start of metamorphosis';  bibkey.Lj  = 'YufeParr1999';  
%     comment.Lj = 'length at day 14 post hatching when metamorphosis starts'; 
data.Lj = 0.9176 ; units.Lj = 'cm'; label.Lj = 'total length at end of metamorphosis'; bibkey.Lj  = 'YufeParr1999';  
    comment.Lj = 'length at day 20 post hatching when metamorphosis ends; length is 0.6857cm at day 14 post hatching when metamorphosis starts'; 
comment.aj = 'metamorphosis starts at day 16 post fertilization and ends at day 19 pf at temp of 19.5C';
data.Lp_f  = 38;   units.Lp_f  = 'cm';  label.Lp_f  = 'total length at puberty in females';        bibkey.Lp_f  = 'MancPC'; 
data.Lp_m  = 33;   units.Lp_m  = 'cm';  label.Lp_m  = 'total length at puberty in males';        bibkey.Lp_m  = 'MancPC'; 
data.Li  = 52;   units.Li  = 'cm';  label.Li  = 'ultimate total length';          bibkey.Li  = 'TeixCabr2010';   %-->they cite a thesis by Andrade 1990 
    comment.Li = 'average size between 40 cm, maximal lenght ever recorded is 70 cm (FAO) or 60 (male) cm, (Fishbase)';

data.Wd0 = 46.15e-6; units.Wd0 = 'g'; label.Wd0 = 'egg dry weigth' ; bibkey.Wd0 = 'YufeParr1999';  
data.Wdh = 33.19;   units.Wdh = 'mug';   label.Wdh = 'dry weight at hatching';   bibkey.Wdh = 'YufeParr1999';
data.Wdb = 35.4;   units.Wdb = 'mug';   label.Wdb = 'dry weight at birth';   bibkey.Wdb = 'YufeParr1999';
    comment.Wdb = 'mean dry weigth at day 3 ph, in micrograms'; 
% data.Wdj = 553.4; units.Wdj = 'mug'; label.Wdj = 'dry weight at START of metamorphosis'; bibkey.Wdj = 'YufeParr1999'; 
%     comment.Wdj = 'mean dry weigth at day 14 ph, in micrograms'; 
data.Wdj = 1281 ; units.Wdj = 'mug'; label.Wdj = 'dry weight at END of metamorphosis'; bibkey.Wdj = 'YufeParr1999'; 
    comment.Wdj = 'mean dry weigth at day 17 ph, in micrograms, mean dry weigth at day 14 ph (START of metam) is 553.4 micrograms'; 

data.Wwp_f = 850;   units.Wwp_f = 'g';   label.Wwp_f = 'wet weight at puberty';          bibkey.Wwp_f = 'MancPC';
data.Wwp_m = 650;   units.Wwp_m = 'g';   label.Wwp_m = 'wet weight at puberty';          bibkey.Wwp_m = 'MancPC';
data.Wwi = 1830;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'MancPC';
    comment.Wwi = 'average weight of females and males at reproductive stage';
     
data.Ri  = 4160;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'DiniRibe1999';   
temp.Ri = C2K(18.5);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    comment.Ri = 'Total weight of eggs daily collection during the spawning seasons of 1996 and 1997 divided by Wd of egg and 365';

data.E0 = 1;    units.E0 = 'J';   label.E0 = 'initial reserve energy'; bibkey.E0 = 'YufeParr1999'; 
 
% uni-variate data

% time-age at hatch
% laboratory experiment - reliable data -- they are also NOT on the same curve as zero-var data
data.Tah = [... temperature (C), age at hatching (d) 
    16      2
    18      1.5
    20      1    ]; 
units.Tah = {'C', 'd'}; label.Tah = {'temperature', 'age at hatching'};  
bibkey.Tah = 'CarbFirm2018';
comment.Tah = 'incubation time: from beginning of gastrula to hatching)';


% temperature-end-of-acceleration for 16 and 20 degrees from Manchado, 18 from RibeSara1999 and
% 19.5 from YufeParr1999
% laboratory experiment - reliable data
data.Taj = [... % temperature (C), time since birth until END of metamorphosis (d)
    16      20 % 23 dph; 20 = 23-3 dph mouth opening (but 0-7dph are happening at 20 C)
    18      17
    19      15
    20      14]; % 17 dph metamorphosis is completed - ab that occurs at 3 dph
units.Taj = {'C', 'd'}; label.Taj = {'temperature', 'time since birth at end acelleration'};
treat.Taj = {0}; units.treat.Taj  = ''; label.treat.Taj = '';
bibkey.Taj = {'MancPC', 'RibeSara1999', 'YufeParr1999'};
temp.Taj = [0 5 6 7 21 ; 20 20 18 16 16]'; units.temp.Taj = {'d', 'C'}; label.temp.Taj = {'time since hatching','temperature'};
comment.Taj = 'development time: from first feeding to metamorphosis for first data point, but 0-6dph are happening at 20C, then 18C at 6dph, and 16C 7dph onwards';

% time-length for early juveniles from RibeSara1999
data.tL = [ ... %birth occurs at age 4 from fertilization, and at day 2 after hatching
0	2.8
1	3.1
2	3.3 % time since hatching to birth
3	3.4
4	3.4 
5	3.5 
6	3.6
7	4.2
8	4.5
9	4.5
10	5.1
11	5.0
12	5.7 % time since hatching to start metamorphosis 
13	5.4
14	6.0
16	6.2
18	6.3
20	7.7 % time since hatching to full metamorphosis
22	8.3
24	9.2
27	9.5
30	10.0 ];  % cm, total length at f and T
data.tL(:,2) = data.tL(:,2)/10; %convert from mm to cm
% data.tL(1:3,:) = []; data.tL(:,1) = data.tL(:,1) - data.tL(1,1) ;   % remove everything before birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  %label.tL = {'time since hatching', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RibeSara1999'; %temperature is the average between 16 and 19.5

% time-length for juveniles
data.tL2 = [ ...
36	1.3
45	1.5
59	1.7
66	1.7
75	1.9
82	2.2 ];  % cm, total length at f and T
data.tL2(:,1) = data.tL2(:,1) - data.ab;  % correct to time since birth
units.tL2   = {'d', 'cm'}; label.tL2 = {'time since birth', 'total length'};  % label.tL2 = {'time since hatching', 'total length'};  
temp.tL2    = C2K(20);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'RibeEngr2017';

% time-length for adult females age from otolith back-calculation data from the field
data.tL_f = [ ... % years, lenght mm
    2	2	2	2	2	2	3	3	3	3	3	3	3	3	3	3	3	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	4	5	5	5	5	5	5	5	5	5	5	5	5	6	6	6	6	6	6	6	6	6	6	6	7	7	7	7	7	7	7	7	7	7	7	7	8	8	8	8	8
    215.57	220.996	224.403	255.512	259.594	228.052	223.352	231.236	277.781	303.12	275.47	309.202	234.961	294.027	305.247	298.191	244.469	291.186	307.807	295.963	325.32	302.172	286.569	330.727	318.952	266.529	282.57	243.043	271.146	342.132	247.978	313.061	353.99	252.882	349.385	275.903	332.045	337.139	376.298	365.682	384.099	412.1	389.671	233.299	403.203	283.958	296.529	303.388	339.126	332.21	410.157	400.166	343.38	350.831	300.783	359.963	305.515	405.05	354.735	406.292	471.795	370.432	401.834	445.896	303.286	320.773	348.921	354.595	310.743	433.318	315.201	450.207	454.824	362.205	400.809	418.111
    ]';
data.tL_f(:,1) = data.tL_f(:,1)*365 - data.ab;    %convert to days
data.tL_f(:,2) = data.tL_f(:,2)/10;               %convert to cm 
units.tL_f   = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length'};  % label.tL2 = {'time since hatching', 'total length'};  
temp.tL_f    = C2K(17.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Animals sampled from Portuguese coast, temperature is a yearly guesstimate'; 
bibkey.tL_f = 'TeixCabr2010';

% time-length for adults males
data.tL_m = [ ... % age from otolith back-calculation data years, mm data from the field
    2	2	2	2	2	2	3	3	4	4	5	5	5	5	5	5	5	5	5	5	6	6	6	6	6	6	6	7	7	7	7	7	7	8
    233.962	251.589	245.539	247.991	279.577	263.969	207.986	199.777	233.497	259.505	325.365	350.513	285.742	412.068	298.682	290.193	295.453	301.484	341.795	308.151	239.235	383.742	300.083	370.292	303.687	391.944	308.482	315.825	319.964	349.01	354.582	303.662	312.227	400.656
    ]';
data.tL_m(:,1) = data.tL_m(:,1)*365 - data.ab;    %convert to days and start at birth
data.tL_m(:,2) = data.tL_m(:,2)/10;               %convert to cm 
units.tL_m   = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length'};  % label.tL2 = {'time since hatching', 'total length'};  
temp.tL_m = C2K(17.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Animals sampled from Portuguese coast, temperature is a yearly guesstimate'; 
bibkey.tL_m = 'TeixCabr2010';

% time-dry weight Manchado 
%Dry weight (mug/larvae) data from 7 dph (when the temperature is deceased to 16) until complete metamorphosis; 
% mouth opening (birth) for both datasets on day 2 and 20C
% 	Mean 	
% dph 	16C 	20C
tWd = [ 7 	118.9 	119.5
9 	225.4 	245.3
11 	370.7 	457.0
13 	521.7 	633.0
15 	716.2 	910.3
17 	877.2 	1134.7
19 	929.7 	1508.5
21 	908.2 	2034.8
23 	994.7 	2792.0];
data.tWd_Man16 = [tWd(:,1), tWd(:,2)];    % start at hatching!!
units.tWd_Man16   = {'d', 'mug'}; label.tWd_Man16 = {'time since hatching', 'dry weight'}; 
temp.tWd_Man16 = [0 6 7 23; C2K([20 18 16 16])]';  units.temp.tWd_Man16 = {'d','K'}; label.temp.tWd_Man16 = {'days since hatching', 'temperature'};
comment.tWd_Man16 = 'eggs hatched and larvae kept on 20C, the temp gradually reduced to 16C'; 
bibkey.tWd_Man16 = 'MancPC';
%
data.tWd_Man20 = [tWd(:,1), tWd(:,3)];
units.tWd_Man20   = {'d', 'mug'}; label.tWd_Man20 = {'time since hatching', 'dry weight'}; 
temp.tWd_Man20 = C2K(20);  units.temp.tWd_Man20 = 'K'; label.temp.tWd_Man20 =  'temperature';
comment.tWd_Man20 = 'eggs hatched and larvae kept on 20C, temp kept at 20C'; 
bibkey.tWd_Man20 = 'MancPC';

% time-dry weight
data.tWd = [ ... % time (days from hatching),  dry weigth of larvae in mug
0.	34.8
0.001	30.2
1	33.2
2.	32.9
2.001	31.1
2.002	25.6
3	33.3
3.001	37.6
4	40.1
5	55.0
5.001	52.2
7	92.7
7.001	101.8
7.002	139.3
8	127.2
9	146.1
9.001	182.7
9.002	216.6
12	261.7
12.001	511.9
12.002	620.6
14	718.4
14.001	509.3
14.002	432.6
17	1195.3
17.001	964.4
17.002	1683.8];
units.tWd = {'d','mug'}; label.tWd = {'time since hatching','Dry weigth of larvae along development'};
bibkey.tWd = 'YufeParr1999'; 
comment.tWd = 'mouth openning at day 3, metamorphosis at day 14 ph reared at 19.5C'; %
temp.tWd = C2K(19.5);
units.temp.tWd = 'K'; label.temp.tWd = 'temperature'; 

% time-dry weight
data.tWd2 = [ ... % time (days from hatching),  dry weigth of larvae in mug
15	820.0
15.001	644.0
15.002	613.5
16	627.5
17	986.9
20	772.0
20.001	883.0
20.002	1114.8
23	1265.7
23.001	1980.6
26	3652.0
26.001	3148.2
26.002	2713.1
26.003	2537.0
26.004	2003.2
26.005	1379.2 ];
units.tWd2 = {'d','mug'}; label.tWd2 = {'time since hatching','Dry weigth of larvae along development'};
bibkey.tWd2 = 'ParrYufe2001'; %YufeParr1999?
comment.tWd2 = 'mouth openning at day 3, metamorphosis at day 14 ph reared at 19.5C'; % <-- reared at 19.5 after metam?
temp.tWd2 = C2K(19.5);
units.temp.tWd2 = 'K'; label.temp.tWd2 = 'temperature'; 

%time-dry weight --> different diets. Larvae were fed the different diets from the beginning of feeding! (=birth)
data.tWd_f1 = [... % days, mg/ind, 100% live prey L100
3	0.034
12	0.575
23	1.684
33	6.285
43	8.035
% 57	7.496
% 50	10.116
50	15.096
57	22.279
63	28.501
70	34.058]; 
data.tWd_f1(:,2) = data.tWd_f1(:,2)*1e3; % to mug
units.tWd_f1 = {'d','mug'}; label.tWd_f1 = {'time since hatching','Dry weigth of larvae along development'};
bibkey.tWd_f1 = 'CanaFern1999'; 
comment.tWd_f1 = 'fed algae, rotifers and artemia'; % 
temp.tWd_f1 = C2K(19); units.temp.tWd_f1 = 'K'; label.temp.tWd_f1 = 'temperature'; 
%
data.tWd_f2 =[ ... %days post hatching, mg/ind, 50% live prey L50
3	0.034
12	0.368
23	1.075
33	4.184
43	5.453];
data.tWd_f2(:,2) = data.tWd_f2(:,2)*1e3; % to mug
units.tWd_f2 = {'d','mug'}; label.tWd_f2 = {'time since hatching','Dry weigth of larvae along development'};
bibkey.tWd_f2 = 'CanaFern1999'; 
comment.tWd_f2 = 'individuals fed half the quantity of treatment L100'; % 
temp.tWd_f2 = C2K(19);
units.temp.tWd_f2 = 'K'; label.temp.tWd_f2 = 'temperature'; 
%
data.tWd_f3 = [ ... % days, mg/ind, 100% live prey and 50% inert food L100I50
3	0.036
12	0.408
23	1.748
33	6.748
43	8.691];
data.tWd_f3(:,2) = data.tWd_f3(:,2)*1e3; % to mug
units.tWd_f3 = {'d','mug'}; label.tWd_f3 = {'time since hatching','Dry weigth of larvae along development'};
bibkey.tWd_f3 = 'CanaFern1999'; 
comment.tWd_f3 = 'individuals fed 100% live prey and 50% inert food same time'; % 
temp.tWd_f3 = C2K(19);
units.temp.tWd_f3 = 'K'; label.temp.tWd_f3 = 'temperature'; 
%
data.tWd_f4 = [ ... %days,mg/ind,50% live prey and 50% inert food L50I50
3	0.042
12	0.3
23	1.313
33	4.626
43	6.878];
data.tWd_f4(:,2) = data.tWd_f4(:,2)*1e3; % to mug
units.tWd_f4 = {'d','mug'}; label.tWd_f4 = {'time since hatching','Dry weigth of larvae along development'};
bibkey.tWd_f4 = 'CanaFern1999'; 
comment.tWd_f4 = 'individuals fed 100% live prey and 50% inert food same time'; 
temp.tWd_f4 = C2K(19);
units.temp.tWd_f4 = 'K'; label.temp.tWd_f4 = 'temperature'; 

% time-length from Jose
% individuals kept together at 20C since birth until start of experiment, then put to tanks with different temps (and pH)
data.tLA = [ ... % time since start of experiment (d), total length (cm)
%pH 8.0:
0	13.3
0	12
0	12.5
0	13.4
61	17.5
61	17.8
75	16.9
75	16.8
75	18.4
0	11.5
0	10.7
0	13.3
0	12
61	16.0
61	16.7
75	18.3
75	17.1
75	14.8
0	12
0	12.5
0	10.1
0	10.4
61	14.5
61	15.0
75	17.2
75	16.5
%pH 7.7:
0	14.7
0	16.5
0	13.5
0	14.3
0	16
61	20.1
61	21.1
75	18.4
75	18.9
75	20.3
0	13.8
0	14
0	13.5
0	13.6
61	17.9
61	18.3
75	17.9
75	16.7
75	18.7
0	12.7
0	11.6
0	13
61	16.4
75	16.1
75	18.4];
data.tLA(:,1) = data.tLA(:,1) + 242; %time since start of experiment to time since birth
units.tLA   = {'d', 'cm'};  label.tLA = {'time', 'total length'};  
temp.tLA    = C2K(19);  units.temp.tLA = 'K'; label.temp.tLA = 'temperature during experiment';
temp2.tLA   = C2K(20);  units.temp2.tLA = 'K'; label.temp2.tLA = 'average temperature since birth until start of experiment';
bibkey.tLA = 'MARE2019'; comment.tLA = 'T 19C pH 8.0 and 7.7';
Linit.tLA = 12.9542; units.Linit.tLA = 'cm'; label.Linit.tLA = 'mean length at start of experiment';
%
data.tLB = [ ... % time since start of experiment (d), total length (cm)
%pH 8.0:
0	12
0	13
0	12.5
0	11.5
0	12.7
61	17.3
61	16.7
75	16.2
75	20.2
0	13.8
0	11.5
0	12.4
0	13.3
61	15.7
61	17.0
75	18.3
75	17.9
75	17.8
0	12
0	12.5
0	11.7
0	12
0	10.5
61	18.8
61	18.0
75	17.1
75	18.6
%pH 7.7:
0	12.3
0	13.7
0	13.6
0	12.8
61	18.5
61	17.6
75	19.5
75	19.0
75	17.2
0	13.2
0	11.2
0	13
0	12
0	13.5
61	18.8
61	16.0
75	18.5
75	17.2
75	19.2
0	15.3
0	12.4
0	12.8
0	12.8
61	20.7
61	17.3
75	18.9];
data.tLB(:,1) = data.tLB(:,1) + 242; %time since start of experiment to time since birth
units.tLB   = {'d', 'cm'};  label.tLB = {'time', 'total length'};  
temp.tLB    = C2K(23);  units.temp.tLB = 'K'; label.temp.tLB = 'temperature';
temp2.tLB   = C2K(20);  units.temp2.tLB = 'K'; label.temp2.tLB = 'average temperature since birth until start of experiment';
bibkey.tLB = 'MARE2019'; comment.tLB = 'T 23C pH 8.0';
Linit.tLB = 12.5926; units.Linit.tLB = 'cm'; label.Linit.tLB = 'mean length at start of experiment';

% time-wet weight Jose
data.tWwA = [ ... % time since start of experiment (d), wet weight (g)
%pH 8.0:
0	27.88
0	27.2
0	20.95
0	27.26
0	34.19
38	47.6
38	37.32
38	59
38	48.15
38	70.35
61	95.32
61	71.49
75	57.53
75	87.89
75	74.11
0	27.23
0	19.16
0	19.7
0	26.85
0	22.53
25	37.18
25	37.18
25	31.13
25	36.04
25	26.91
61	59.78
61	60.54
75	69.75
75	71.31
75	52.85
0	15.82
0	20.81
0	18.34
0	13.85
11	23.96
11	20.11
11	27.5
11	18.47
61	65.24
61	47.33
75	53.58
75	46.56
%pH 7.7:
0	33.86
0	35.53
0	30.66
0	28.45
0	43.9
11	36.2
11	49.8
11	42.7
11	37.27
11	44.16
61	94.96
61	103.54
75	59.22
75	93.4
75	88.31
0	30.77
0	29.83
0	32.54
0	26.61
0	31.77
25	51.74
25	50.62
25	50.32
25	47.75
25	41.93
38	56.35
38	54.06
38	56.01
38	56.46
38	46.45
61	78.97
61	82
75	79.04
75	79.83
75	79.64
0	24.98
0	20.38
0	18.44
0	24.05
61	69.88
75	58.33
75	74.44];
data.tWwA(:,1) = data.tWwA(:,1) + 242; %time since start of experiment to time since birth
units.tWwA   = {'d', 'g'};  label.tWwA = {'time', 'wet weight'};   
temp.tWwA    = C2K(19);  units.temp.tWwA = 'K'; label.temp.tWwA = 'temperature';
temp2.tWwA   = C2K(20);  units.temp2.tWwA = 'K'; label.temp2.tWwA = 'average temperature since birth until start of experiment';
bibkey.tWwA = 'MARE2019'; comment.tWwA = 'T 19C pH 8.0 and 7.7';
Wwinit.tWwA = 26.1979; units.Wwinit.tWwA = 'g'; label.Wwinit.tWwA = 'mean wet weight at start of experiment';
%
data.tWwB = [ ... % time since start of experiment (d), wet weight (g)
%pH 8.0:
0	30.69
0	29.37
0	26.78
0	21.02
0	24.1
38	55.08
38	67.8
38	61.3
38	45.04
61	77.27
61	101.44
75	70.28
75	121.53
0	26.52
0	18.09
0	22.54
0	28.97
0	25.42
25	44.83
25	32.14
25	30.78
25	31.54
61	78.72
61	87.9
75	79.62
75	76.43
75	74.94
0	23.56
0	21.13
0	16.94
0	19.77
0	15.81
11	29.3
11	32.55
11	24.25
11	26.7
11	22
61	101.18
61	80.48
75	80.36
75	45.67
75	105.41
%pH 7.7:
0	24.9
0	23.34
0	25.23
0	26.95
0	21.03
61	84.71
61	77.44
75	85.83
75	89.91
75	58.73
75	74.95
0	24.33
0	22.25
0	20.29
0	23.96
0	25.33
25	36.29
25	44.32
25	28.71
25	49.39
25	36.94
38	36.27
38	51.24
38	60.24
38	47.18
38	46.26
61	94.04
61	78.32
75	72.64
75	77.86
75	84.36
0	34.19
0	31.52
0	23.83
0	33.81
11	46.78
11	41.74
11	39.4
11	32.48
61	118.18
61	117.48
75	102.33];
data.tWwB(:,1) = data.tWwB(:,1) + 242; %time since start of experiment to time since birth
units.tWwB   = {'d', 'g'};  label.tWwB = {'time', 'wet weight'};   
temp.tWwB    = C2K(23);  units.temp.tWwB = 'K'; label.temp.tWwB = 'temperature';
temp2.tWwB   = C2K(20);  units.temp2.tWwB = 'K'; label.temp2.tWwB = 'average temperature since birth until start of experiment';
bibkey.tWwB = 'MARE2019'; comment.tWwB = 'T 23C pH 8.0 and 7.7';
Wwinit.tWwB = 24.5403; units.Wwinit.tWwB = 'g'; label.Wwinit.tWwB = 'mean wet weight at start of experiment';

% length - wet weight  (manchado data)
LWw1 = [ %total length (mm) wet weigth (g)
    82	74	69	83	65	68	60	58	54	52	55	69	62	60	60	83	68	67	53	51	51	67	74	81	64	52	63	48	62	57	72	68	70	50	85	67	68	57	59	52	56	55	49	70	81	76	70	62	61	59	53	79	73	75	66	66	60	57	58	56	65	72	53	76	76	61	67	67	70	62	65	56	64	64	58	61	64	62	56	56	56	56	53	66	70	74	60	70	65	67	62	58	49	41	75	84	64	67	72	66	69	63	61	58	53	48	70	67	71	72	45	66	72	67	60	50	54	51	55	45	67	72	51	66	75	45	66	72	63	66	62	57	60	52	45	66	38	65	68	61	58	60	64	55	72	70	71	65	66	52	57	52	45	40	75	76	80	69	62	68	63	62	48	76	60	79	62	60	62	62	55	60	49	49	46	67	72	82	66	72	62	53	59	58	60	57	52	79	77	59	66	60	67	68	56	57	45	69	65	70	61	68	59	67	66	54	55	53	47	45	41	69	60	86	62	63	43	55	54	58	56	52	49	53	73	70	73	59	62	55	60	55	53	52	85	69	69	90	70	73	48	59	64	41	60	70	74	64	67	75	51	55	66	60	55	63	53	58	71	62	59	58	62	49	53	53	50	47	43	75	74	63	62	53	58	62	58	46	49	45	62	55	70	60	53	49	53	66	70	72	65	69	54	61	60	68	62	66	61	42	64	77	55	54	40	45	66	50	75	70	75	57	58	53	52	46	49	63	71	70	79	90	61	53	61	58	55	54	53	55	43	60	66	64	69	67	65	64	62	56	49	56	65	74	70	60	67	52	65	58	48	70	61	59	63	38	70	58	54	61	64	70	62	51	60	73	65	83	78	63	61	65	59	51	49	69	75	86	58	61	80	70	63	64	58	55	50	68	60	64	65	67	65	60	59	35	54	55	60	50	58	38	67	82	45	70	70	80	59	59	56	55	54	61	46	60	56	74	67	73	74	72	77	70	59	67	70	58	76	58	87	65	73	65	83	48	65	62	54	59	50	48	50	50	55	60	64	70	74	83	73	75	60	44	47	53	56	59	60	60	60	82	77	50	53	52	60	68	48	65	65	62	58	83	75	67	56	40	62	65	68	59	74	68	68	59	53	56	64	60	60	59	52	64	69	64	54	59	68	75	61	64	69	70	55	37	50	47	56	55	56	59	63	55	72	61	50	74	65	81	52	78	59	70	63	59	55	56	50	46	75	76	53	54	60	64	67	77	90	65	70	49	76	61	49	66	65	59	41	62	75	50	56	77	60	57	52	64	74	64	61	65	58	72	57	58	45	48	46	50	49	51	53	56	75	74	71	51	48	57	60	71	67	80	40	59	53	75	75	58	53	60	69	72	65	42	48	59	61	85	70	48	40	53	51	64	75	74	87	85	73	74	70	76	66	60	62	57	57	56	53	50	53	30	70	64	66	75	74	61	59	60	59	58	57	53	72	72	72	69	80	64	69	77	63	53	46	72	74	75	52	60	66	63	62	57	58	50	75	69	70	60	67	68	88	57	57	52	48	42	58	53	47	43	70	50	52	67	71	74	59	73	57	60	70	64	61	60	84	60	68	66	55	46	49	64	67	60	50	59	64	63	67	57	53	63	66	81	67	65	53	55	55	55	50	50	55	65	80	64	61	65	82	80	80	78	76	55	60	88	57	70	62	59	58	79	61	71	61	61	61	58	62	60	68	63	65	73	70	62	66	58	56	55	56	59	54	52	49	53	62	63	58	62	64	63	75	67	55	62	71	63	57	56	72	61	57	62	61	102	100	105	112	128	107	87	82	120	107	108	83	122	132	87	157	116	120	100	110	111	83	118	141	86	108	92	111	101	96	92	85	72	125	115	87	96	116	154	107	106	111	132	103	97	153	93	90	118	143	88	117	103	72	103	122	75	160	128	93	155	108	113	80	135	60	70	75	86	107	125	85	105	117	113	120	90	97	128	137	160	117	97	115	122	143	97	115	133	108	128	86	110	116	135	107	113	136	132	96	101	98	97	137	138	127	141	109	97	122	97	108	106	117	115	150	120	142	102	117	124	82	90	97	105	145	127	155	76	112	74	102	124	88	87	112	110	86	92	100	82	112	115	120	87	103	142	115	98	100	112	131	142	99	142	103	136	95	80	90	112	117	115	105	102	108	63	91	102	133	76	122	138	120	152	141	111	96	112	76	77	75	97	108	98	73	113	117	106	100	137	85	130	92	110	101	117	96	105	90	112	87	107	97	105	141	110	151	97	96	150	145	126	172	100	131	101	98	85	113	88	102	126	126	120	129	162	142	152	142	106	148	107	120	145	112	100	114	105	87	70	102	120	145	108	127	116	102	130	102	123	95	96	107	111	96	148	135	150	112	92	90	91	108	103	110	88	112	102	105	122	87	157	86	121	84	72	120	76	155	136	112	131	115	77	85	67	165	140	88	106	120	110	136	105	147	107	76	95	137	116	58	112	107	162	103	142	72	87	106	122	117	102	72	156	77	107	112	92	72	117	97	118	110	105	67	86	93	110	100	88	108	87	91	140	103	86	100	118	110	110	112	126	145	156	150	138	125	117	96	108	92	98	86	109	153	65	120	94	111	120	136	161	116	94	100	95	95	126	110	135	82	125	142	141	165	83	95	115	81	90	115	122	118	103	64	97	115	91	70	84	122	102	116	117	86	92	115	150	97	125	122	132	98	72	122	147	102	62	89	80	92	125	108	126	115	115	97	82	82	101	96	108	107	95	110	98	130	70	137	80	116	152	118	159	103	106	112	84	103	102	103	152	115	85	115	130	107	88	94	88	87	88	100	76	89	110	124	130	119	126	180	132	112	112	110	85	122	128	122	108	131	93	64	101	117	92	107	138	87	123	117	125	158	86	108	105	95	95	118	116	95	98	136	110	137	135	130	153	108	96	142	105	98	96	130	96	123	112	107	85	102	135	130	107	117	137	93	87	104	146	95	160	146	104	122	132	100	150	105	130	147	91	67	93	113	84	108	122	170	112	126	75	108	114	137	103	123	91	65	85	94	90	135	87	79	86	105	84	87	120	152	91	73	118	115	115	127	113	78	128	87	142	85	80	120	86	84	95	87	87	90	102	106	78	84	78	142	112	140	70	62
    7.268	5.868	4.936	9.556	3.872	4.343	3.122	2.563	1.999	2.028	1.974	4.435	3.533	2.878	2.868	8.705	4.262	4.312	2.271	1.831	1.94	4.589	5.807	8.032	3.584	1.95	3.372	1.716	3.514	2.779	5.524	4.435	4.693	1.575	8.556	4.267	5.057	2.409	2.894	2.019	2.479	2.205	1.531	4.734	7.33	5.819	5.054	3.333	2.914	3.178	2.182	7.371	5.48	6.22	4.29	4.175	3.023	2.558	3.079	2.661	3.623	5.102	2.096	5.982	5.933	3.025	3.947	4.436	5.048	3.478	3.732	2.458	3.482	3.437	2.96	3.069	3.526	3.308	2.507	2.562	2.323	2.257	1.985	3.539	4.676	5.514	3.088	4.476	3.642	4.269	3.627	2.488	1.58	1.038	5.917	7.087	4.152	4.51	5.143	4.073	4.749	3.587	3.078	2.857	1.987	1.382	5.3	4.8	5.298	5.894	1.296	4.453	5.572	4.36	2.696	1.869	2.444	2.11	2.157	1.238	4.304	5.192	1.869	4.313	6.151	1.386	4.659	5.102	3.245	3.924	2.859	2.433	2.937	1.849	1.043	3.831	0.929	4.066	4.249	3.13	3.011	3.094	3.182	2.019	4.728	4.479	4.765	4.163	3.709	2.006	2.495	1.856	1.38	1.203	5.551	6.031	7.66	4.259	3.344	4.507	3.474	3.246	1.512	6.426	2.994	7.085	3.393	3.081	3.459	3.444	2.118	2.786	1.727	1.475	1.336	3.97	5.787	8.319	4.488	5.87	3.291	2.067	2.669	3.074	2.866	2.816	1.889	6.95	6.939	3.33	4.339	2.967	4.35	4.479	2.487	2.56	1.42	4.001	3.59	5.046	3.193	4.343	2.517	3.733	3.339	2.008	2.187	2.004	1.508	1.25	1.146	4.557	2.962	8.5	3.2	3.372	1.243	2.196	2.27	2.338	2.451	2.066	1.547	1.941	5.448	4.507	5.787	2.709	3.217	2.296	2.736	2.154	1.867	1.754	7.888	4.337	4.848	11.468	5.104	5.023	1.502	2.966	3.401	1.105	2.56	4.53	5.301	3.617	4.137	6.701	1.988	2.355	3.601	3.091	2.215	3.731	2.005	2.577	4.809	3.254	2.902	2.522	3.4	1.817	1.96	1.987	1.833	1.38	1.114	5.42	5.297	3.7	3.087	2.215	2.968	3.123	2.75	1.282	1.445	1.162	3.02	2.163	4.288	3.146	2.094	1.556	2.055	3.767	4.878	4.814	4.15	4.162	2.02	3.058	2.471	3.898	3.021	4.003	2.801	1.103	3.421	6.256	2.074	2.054	1.334	1.348	3.994	1.617	5.834	4.714	6.311	2.556	2.691	2.136	1.842	1.375	1.528	3.246	4.667	4.148	6.454	9.124	2.852	2.22	2.885	2.608	2.61	2.273	2.059	2.259	1.073	3.338	3.303	3.4	4.211	4.055	3.695	4.137	3.462	2.404	1.476	2.488	3.77	5.384	4.163	2.849	4.327	2.042	3.626	2.549	1.513	4.467	3.076	2.479	3.26	0.771	4.511	2.791	2.198	2.917	3.82	4.762	3.023	1.743	3.05	5.09	3.856	7.551	6.888	3.394	3.26	3.566	2.955	2.082	1.624	4.664	5.718	8.942	2.8	3.059	7.438	4.653	3.306	3.812	2.739	2.53	1.786	4.703	3.195	4.079	3.66	4.546	4.189	3.445	2.848	0.664	2.286	2.551	2.86	1.956	2.775	0.806	4.28	8.541	1.331	5.172	5.088	6.442	3.434	3.254	2.433	2.559	2.245	3.604	1.467	2.879	2.581	5.41	4.734	5.887	5.765	6.738	7.122	5.516	2.722	4.508	5.373	2.991	7.065	2.836	9.512	4.452	5.867	4.244	8.988	1.695	3.887	3.982	2.597	3.247	1.914	1.616	1.749	2.065	2.516	2.985	4.286	4.891	6.107	8.947	5.882	6.641	3.052	1.319	1.778	2.065	2.626	3.188	3.208	2.807	3.089	8.791	6.831	1.623	2.274	2.006	2.9	4.466	1.673	3.84	3.902	3.836	2.811	7.816	6.578	4.422	2.501	0.9	3.241	4.582	4.913	2.948	6.298	4.935	4.601	2.884	1.951	2.397	3.75	2.823	2.908	2.774	1.965	3.499	4.352	3.813	2.564	3.147	4.39	6.092	3.671	3.785	5.137	4.613	2.355	0.921	1.584	1.365	2.472	2.327	2.641	3.539	3.081	2.379	5.502	3.472	1.868	5.565	4.167	8.35	2.139	6.769	2.987	4.792	3.533	2.846	2.931	2.406	1.996	1.445	5.685	5.6	2.168	2.358	2.987	3.992	4.355	7.091	10.829	3.767	5.214	1.778	6.955	3.265	1.672	4.412	4.015	2.674	1.145	3.663	6.572	1.678	2.712	7.032	3.203	2.574	2.156	3.857	5.626	3.915	3.341	4.095	2.91	5.47	2.419	2.614	1.458	1.637	1.489	1.773	1.497	1.76	2.073	2.49	6.596	7.342	4.786	2.453	1.455	2.296	3.216	4.972	4.298	7.974	0.961	2.859	2.379	5.921	5.345	2.861	2.267	2.933	4.838	5.379	3.578	1.107	1.653	3.233	3.111	8.654	4.817	1.659	0.983	2.389	2.103	3.937	6.393	5.824	10.702	8.849	5.511	5.937	4.438	6.256	3.568	2.75	3.542	2.022	2.771	2.427	2.358	2.542	2.026	0.431	5.038	4.045	4.414	6.281	5.648	3.038	3.029	3.035	2.869	2.809	2.915	2.935	5.45	5.546	5.206	4.264	7.81	3.947	5.012	6.578	3.678	2.073	1.428	5.096	6.225	6.367	1.951	3.014	4.118	3.516	3.495	2.57	3.128	1.772	6.287	4.31	3.705	3.26	3.829	4.437	8.769	2.72	2.355	1.791	1.519	0.967	2.744	1.97	1.577	1.216	5.097	1.823	1.946	3.946	5.298	5.119	2.629	5.427	2.524	2.71	4.86	3.313	3.059	3.195	9.832	3.019	4.646	4.238	2.312	1.446	1.622	3.538	4.157	3.069	1.815	2.638	3.877	3.417	4.596	2.581	2.031	3.347	3.823	6.86	4.102	3.797	1.903	2.11	2.375	2.269	1.79	1.789	2.319	3.869	6.932	3.574	2.892	3.57	7.748	7.072	6.304	6.178	6.234	2.233	3.232	10.556	2.56	4.479	3.137	2.605	2.692	6.972	3.027	5.261	2.999	2.802	2.96	2.583	3.046	3.078	4.168	3.4	3.567	5.345	5.205	3.25	3.725	2.362	2.298	2.148	2.061	2.789	3.439	1.944	1.583	1.925	3.203	3.463	2.814	2.876	3.434	3.364	5.68	4.327	2.258	3.064	4.729	3.341	2.573	2.337	5.707	3.036	2.442	3.243	3.114	16.05	13.12	13.99	17.69	28.7	15.44	8.87	6.91	21.28	17.73	17.51	7.51	26.56	30.44	7.67	50.36	19.04	23.53	12.44	17.02	18.75	7.4	22.36	37.67	8.4	17.78	11.24	17.05	12.42	11.43	9.74	8.6	4.29	30.95	20.72	9.09	13.15	21.6	56.13	17.59	14.75	19.08	36.03	15.57	12.15	50.44	12.83	10.54	21.15	46.42	9.43	22.33	16.1	5.04	14.02	25.75	5.3	61.14	28.22	10.32	62.95	20.77	22.14	6.43	36.29	2.77	4.54	4.96	9.78	15.15	26.08	7.61	17.56	25.52	20.6	21.32	8.91	11.22	29.49	36.7	60.45	19.65	12.42	25.14	29.58	45.02	13.13	21.33	29.68	16	33.2	8.04	16.66	20.77	37.22	15.98	18.26	33.17	32.46	10.58	14.03	13.85	14.18	38.39	42.26	34.61	39.19	18.37	12.04	24.76	11.89	15.5	16.28	22.24	21.99	49.18	21.49	40.71	13.85	15.56	24.92	6.36	9.67	11.99	15.18	37.81	32.46	57.01	5.7	18.44	5.35	12.86	29.53	9.01	9.15	20.95	18.45	7.41	10.34	13.33	6.66	19.85	19.22	24.71	8.34	14.34	42.68	21.13	12.1	15.04	20.99	31.98	39.95	12.77	40.71	16.43	39.41	11.66	6.07	9.92	20.08	22.69	21.32	16.02	14.62	16.3	3.02	9.75	14.38	31.65	4.82	25.03	41.49	22.83	51.38	37.34	19.56	11.94	19.58	5.32	5.45	5.55	10.64	19.46	12.69	5.38	21.54	20.85	14.94	12.79	35.14	8.93	27.49	10.19	16.55	13.48	19.78	10.62	15.78	8.86	18.36	8.93	15.03	10.49	18.45	40.33	19.4	46.8	11.18	13.09	47.49	48.28	27.73	75.79	12.52	33.18	14.53	14.23	8.75	17.75	10.46	13.52	24.16	27.25	26.21	33.72	72.37	44.86	56.06	44.63	15.06	44.99	16.09	23.45	46.43	18.64	15.26	21.65	17.43	8.31	4.19	15.01	23.39	46.81	17.79	27.9	19.11	14.95	31.41	15.06	25.97	10.27	10.71	18.2	17.11	12.35	49.37	36.07	48.04	22.33	9.23	10.09	11.13	18.8	15.1	17.65	10.3	17.32	14.46	17.28	25.15	7.89	59.03	7.78	26.14	7.75	5.25	25.43	6.22	54.41	33.21	22.02	31.84	22.5	6.41	7.64	3.54	74.07	40.05	8.86	14.59	24.66	16.26	35.73	16.97	49.18	16.24	5.42	10.08	43.41	20.81	2.63	18.03	15.39	57.66	15.53	40.33	1.48	8.69	18.35	23.82	23.54	12.58	5.14	53.64	6.18	16.72	17.16	8.89	5.36	22.89	10.25	21.93	16.31	14.03	3.32	7.91	9.83	16.4	12.79	9.54	16.44	8.51	9	39.89	13.95	9.41	11.79	24.67	18.66	19.47	21.96	32.6	44.32	52.99	47.53	45.32	30.11	23.15	11.56	17.25	11.8	11.9	8.01	16.66	53.41	3.18	25.25	10.53	17.3	23.02	39.83	56.98	20.14	9.09	13.8	11.2	10.55	27.36	19.63	33.89	6.93	26.64	43.17	46.07	69.06	6.81	11.4	23.21	7.31	9.64	19.36	27.56	27.12	13.21	5.5	11.7	19.17	10.96	4.13	6.89	26	14.9	21.04	18.84	9.17	9.32	20.54	45.52	11.07	26.84	26.33	33.88	10.72	4.77	28.29	47.44	12.66	3.18	9.48	7.1	9.82	27.09	17.31	28.07	22.16	19.6	11.42	7.14	6.37	14.53	10.61	16.4	18.58	12.38	18.28	13.81	32.62	4.52	34.6	6.64	21.69	61.53	21.68	66.28	16.82	15.95	20.25	7.74	16.03	14.37	15.65	53.68	20.91	7.5	20.96	35.82	16.37	8.4	10.65	9.3	8.63	9.64	12.63	4.97	9.41	18.8	24.5	35.84	22.45	28.82	94.74	33.52	21.38	19.96	18.05	7.64	24.1	33.12	24.89	17.44	34.79	10.78	3.21	13.93	21.7	9.11	17.85	40.09	9.15	28.33	23.73	24.81	55.23	8.53	16.48	16	12.26	10.77	24.64	19.61	16.98	13.24	36.97	17.84	42.72	34.26	31.36	56.87	18	11.84	49.9	18.56	12.15	12.79	33.82	13.16	24.86	17.09	19.24	8.36	12.51	34.05	32.04	17.37	22.49	42.01	11.27	9.5	13.69	43.39	12.36	64.27	45.05	15.02	25.83	33.79	13.27	53.56	16.07	31.76	46.54	9.5	3.97	10.18	22.01	7.29	16.53	28.48	78.73	19.69	32.6	5.44	17.07	18.14	37.16	14.53	25.43	7.76	2.91	8.75	12.81	9.49	38.18	9.46	6.25	7.61	15.4	7.47	7.87	22.28	54.8	8.73	5.44	23.13	21.24	18.24	30	18.83	6.47	29.9	9.4	40.27	8.74	7.74	24.7	8.78	8.53	11.29	8.48	10.34	9.64	13.45	15.02	6.28	8.93	6.47	39.6	19.6	37.3	6.27	3.35
    ]';% end data 190 days of age
LWw2 = [ 102	100	105	112	128	107	87	82	120	107	108	83	122	132	87	157	116	120	100	110	111	83	118	141	86	108	92	111	101	96	92	85	72	125	115	87	96	116	154	107	106	111	132	103	97	153	93	90	118	143	88	117	103	72	103	122	75	160	128	93	155	108	113	80	135	60	70	75	86	107	125	85	105	117	113	120	90	97	128	137	160	117	97	115	122	143	97	115	133	108	128	86	110	116	135	107	113	136	132	96	101	98	97	137	138	127	141	109	97	122	97	108	106	117	115	150	120	142	102	117	124	82	90	97	105	145	127	155	76	112	74	102	124	88	87	112	110	86	92	100	82	112	115	120	87	103	142	115	98	100	112	131	142	99	142	103	136	95	80	90	112	117	115	105	102	108	63	91	102	133	76	122	138	120	152	141	111	96	112	76	77	75	97	108	98	73	113	117	106	100	137	85	130	92	110	101	117	96	105	90	112	87	107	97	105	141	110	151	97	96	150	145	126	172	100	131	101	98	85	113	88	102	126	126	120	129	162	142	152	142	106	148	107	120	145	112	100	114	105	87	70	102	120	145	108	127	116	102	130	102	123	95	96	107	111	96	148	135	150	112	92	90	91	108	103	110	88	112	102	105	122	87	157	86	121	84	72	120	76	155	136	112	131	115	77	85	67	165	140	88	106	120	110	136	105	147	107	76	95	137	116	58	112	107	162	103	142	72	87	106	122	117	102	72	156	77	107	112	92	72	117	97	118	110	105	67	86	93	110	100	88	108	87	91	140	103	86	100	118	110	110	112	126	145	156	150	138	125	117	96	108	92	98	86	109	153	65	120	94	111	120	136	161	116	94	100	95	95	126	110	135	82	125	142	141	165	83	95	115	81	90	115	122	118	103	64	97	115	91	70	84	122	102	116	117	86	92	115	150	97	125	122	132	98	72	122	147	102	62	89	80	92	125	108	126	115	115	97	82	82	101	96	108	107	95	110	98	130	70	137	80	116	152	118	159	103	106	112	84	103	102	103	152	115	85	115	130	107	88	94	88	87	88	100	76	89	110	124	130	119	126	180	132	112	112	110	85	122	128	122	108	131	93	64	101	117	92	107	138	87	123	117	125	158	86	108	105	95	95	118	116	95	98	136	110	137	135	130	153	108	96	142	105	98	96	130	96	123	112	107	85	102	135	130	107	117	137	93	87	104	146	95	160	146	104	122	132	100	150	105	130	147	91	67	93	113	84	108	122	170	112	126	75	108	114	137	103	123	91	65	85	94	90	135	87	79	86	105	84	87	120	152	91	73	118	115	115	127	113	78	128	87	142	85	80	120	86	84	95	87	87	90	102	106	78	84	78	142	112	140	70
    16.05	13.12	13.99	17.69	28.7	15.44	8.87	6.91	21.28	17.73	17.51	7.51	26.56	30.44	7.67	50.36	19.04	23.53	12.44	17.02	18.75	7.4	22.36	37.67	8.4	17.78	11.24	17.05	12.42	11.43	9.74	8.6	4.29	30.95	20.72	9.09	13.15	21.6	56.13	17.59	14.75	19.08	36.03	15.57	12.15	50.44	12.83	10.54	21.15	46.42	9.43	22.33	16.1	5.04	14.02	25.75	5.3	61.14	28.22	10.32	62.95	20.77	22.14	6.43	36.29	2.77	4.54	4.96	9.78	15.15	26.08	7.61	17.56	25.52	20.6	21.32	8.91	11.22	29.49	36.7	60.45	19.65	12.42	25.14	29.58	45.02	13.13	21.33	29.68	16	33.2	8.04	16.66	20.77	37.22	15.98	18.26	33.17	32.46	10.58	14.03	13.85	14.18	38.39	42.26	34.61	39.19	18.37	12.04	24.76	11.89	15.5	16.28	22.24	21.99	49.18	21.49	40.71	13.85	15.56	24.92	6.36	9.67	11.99	15.18	37.81	32.46	57.01	5.7	18.44	5.35	12.86	29.53	9.01	9.15	20.95	18.45	7.41	10.34	13.33	6.66	19.85	19.22	24.71	8.34	14.34	42.68	21.13	12.1	15.04	20.99	31.98	39.95	12.77	40.71	16.43	39.41	11.66	6.07	9.92	20.08	22.69	21.32	16.02	14.62	16.3	3.02	9.75	14.38	31.65	4.82	25.03	41.49	22.83	51.38	37.34	19.56	11.94	19.58	5.32	5.45	5.55	10.64	19.46	12.69	5.38	21.54	20.85	14.94	12.79	35.14	8.93	27.49	10.19	16.55	13.48	19.78	10.62	15.78	8.86	18.36	8.93	15.03	10.49	18.45	40.33	19.4	46.8	11.18	13.09	47.49	48.28	27.73	75.79	12.52	33.18	14.53	14.23	8.75	17.75	10.46	13.52	24.16	27.25	26.21	33.72	72.37	44.86	56.06	44.63	15.06	44.99	16.09	23.45	46.43	18.64	15.26	21.65	17.43	8.31	4.19	15.01	23.39	46.81	17.79	27.9	19.11	14.95	31.41	15.06	25.97	10.27	10.71	18.2	17.11	12.35	49.37	36.07	48.04	22.33	9.23	10.09	11.13	18.8	15.1	17.65	10.3	17.32	14.46	17.28	25.15	7.89	59.03	7.78	26.14	7.75	5.25	25.43	6.22	54.41	33.21	22.02	31.84	22.5	6.41	7.64	3.54	74.07	40.05	8.86	14.59	24.66	16.26	35.73	16.97	49.18	16.24	5.42	10.08	43.41	20.81	2.63	18.03	15.39	57.66	15.53	40.33	1.48	8.69	18.35	23.82	23.54	12.58	5.14	53.64	6.18	16.72	17.16	8.89	5.36	22.89	10.25	21.93	16.31	14.03	3.32	7.91	9.83	16.4	12.79	9.54	16.44	8.51	9	39.89	13.95	9.41	11.79	24.67	18.66	19.47	21.96	32.6	44.32	52.99	47.53	45.32	30.11	23.15	11.56	17.25	11.8	11.9	8.01	16.66	53.41	3.18	25.25	10.53	17.3	23.02	39.83	56.98	20.14	9.09	13.8	11.2	10.55	27.36	19.63	33.89	6.93	26.64	43.17	46.07	69.06	6.81	11.4	23.21	7.31	9.64	19.36	27.56	27.12	13.21	5.5	11.7	19.17	10.96	4.13	6.89	26	14.9	21.04	18.84	9.17	9.32	20.54	45.52	11.07	26.84	26.33	33.88	10.72	4.77	28.29	47.44	12.66	3.18	9.48	7.1	9.82	27.09	17.31	28.07	22.16	19.6	11.42	7.14	6.37	14.53	10.61	16.4	18.58	12.38	18.28	13.81	32.62	4.52	34.6	6.64	21.69	61.53	21.68	66.28	16.82	15.95	20.25	7.74	16.03	14.37	15.65	53.68	20.91	7.5	20.96	35.82	16.37	8.4	10.65	9.3	8.63	9.64	12.63	4.97	9.41	18.8	24.5	35.84	22.45	28.82	94.74	33.52	21.38	19.96	18.05	7.64	24.1	33.12	24.89	17.44	34.79	10.78	3.21	13.93	21.7	9.11	17.85	40.09	9.15	28.33	23.73	24.81	55.23	8.53	16.48	16	12.26	10.77	24.64	19.61	16.98	13.24	36.97	17.84	42.72	34.26	31.36	56.87	18	11.84	49.9	18.56	12.15	12.79	33.82	13.16	24.86	17.09	19.24	8.36	12.51	34.05	32.04	17.37	22.49	42.01	11.27	9.5	13.69	43.39	12.36	64.27	45.05	15.02	25.83	33.79	13.27	53.56	16.07	31.76	46.54	9.5	3.97	10.18	22.01	7.29	16.53	28.48	78.73	19.69	32.6	5.44	17.07	18.14	37.16	14.53	25.43	7.76	2.91	8.75	12.81	9.49	38.18	9.46	6.25	7.61	15.4	7.47	7.87	22.28	54.8	8.73	5.44	23.13	21.24	18.24	30	18.83	6.47	29.9	9.4	40.27	8.74	7.74	24.7	8.78	8.53	11.29	8.48	10.34	9.64	13.45	15.02	6.28	8.93	6.47	39.6	19.6	37.3	6.27
    ]'; % 62	3.35 % end data 390 days old
LWw3 = [257.85	241.26	287.99	308.62	297.61	265.53	306.16	304.36	301.37	308.62	321.83	292.63	292.67	290.38	279.88	277.91	265.33	267.9	286.59	256.74	271.04	271.97	270.85	278.53	247.65	249.63	236.92	269.53	250.2	256.21	266.9	246.27	248.71	250.73	256.45	255.54	252.68	237.24	238.86	246.81	259.56	261.77	245.75	255.63	258.26	248.51	239.01	257.54	247.46	249.83	259.6	246.42	227.24	239.86	266.49	252.14	232.11	235.54	241.67	272.47	275.6	205.2	200.24	203.68	219.62	266.93	215.07	151.43	212.85	201.08	221.29	222.6	235.36	184.48	203.68	224.05	204.53	178.59	136.08	134.55	153.89	237.3	232.06	205.68	182.24	202.44	199.75	273.68	262.02	221.1	183.33	189.21	193.06	219.42	215.95	185.31	272.87	234.23	186.63	200.4	248.61	149.49	244.53	260.07	176.16	191.6	199	159.03	182.78	206.1	203.11	202.29	244.21	191.55	278.33	221.56	228.96	238.61	238.59	160.26	224.27	217.17	246.15	276.59	152.86	186.9	230.98	250.19	196.29	265.64	166.47	262.19	227.07	196.51	189.36	221.03	255.15	238.09	178.89	218.01	233.69	235.38	181.73	212.83	203.1	231.59	208.59	220.12	186.73	243.32	223.77	269.07	225.41	161.01	231.46	210.81	229.04	232.24	203.06	202.48	222.33	237.3	226.57	195.97	210.39	248.27	152.96	216.6	216.55	233.14	254.13	214.87	165.01	222.76	167.84	228.62	284.36	198.04	145.66	280.61	275.25	240.41	263.17	229.85	214.1	246.69	254.54	199.6	195.32	252.6	188.43	217.98	216.53	271.45	220.3	202.95	248.34	203.86	224.25	231.9	211.15	207.44	211.77	235.94	262.39	243.83	267.87	235.14	184.3	143.54	237.61	193.82	240.22	237.26	227.48	198.09	216.3	245.13	187.95	245.09	235.31	211.84	225.36	190.72	270.36	237.45	224.89	261.97	231.48	189.22	267.32	208.02	208.83	216.24	232.01	215.19	211.99	233.64	244.02	189.47	248.46	239.35	209.24	158.16	225.93	154.63	270.18	252.97	223.15	209.04	236.12	169.94	253.33	259.41	191.74	181.35	173.82	173.47	180.86	198.6	275.57	225.52	238.7	271.58	226.72	273.54	198.2	251.56	242.94	218.25	278.93	248.16	149.69	177.73	245.7	270.24	140.77	230.36	215.79	229.87	220.53	200.62	156.94	205.57	253.51	219.38	199.15	247.27	265.11	193.85	246.41	286.91	178.02	251.28	172.42	195.82	242.85	264.21	217.9	201.06	251.7	266.41	257.35	186.88	172.93	221.91	242.88	261.54	243.48	229.58	256.62	204.9	198.91	210.72	239.81	224.88	216.13	197.5	227.1	211.65	166.84	174.18	210.16	270.18	217.01	154.82	137.41	205.67	211.76	291.74	226.4	189.62	226.65	237.34	209.35	213.25	212.78	269	226.73	241.4	214.12	152.83	256.98	215.48	213.68	200.39	240.09	199.74	233.41	233.82	234.24	190.49	230.65	200.49	189.77	241.82	210.36	188.9	279.33	235.09	291.51	244.1	171.31	278.87	250.27	176.3	238.75	246.59	249.3	182.45	158.08	156.09	182.89	171.35	144.55	225.29	150.54	203.35	242.75	174	210.12	267.78	211.25	250.26	233.64	287.73	205.42	222.03	252.23	190.95	210.57	244.73	207.01	251.69	199.93	221.7	240.91	241.42	225.33	228.29	238.68	253.42	239.03	252.71	213.94	145.91	168.7	222.08	128.18	144.78	135.05	248.26	267.51	240.61	294.98	259.18	243.36	194.42	182.42	205.11	177.83	189.72	146.71	119.54	235.01	202.27	221.64	204.27	185.62	218.35	218.68	210.45	251.54	250.93	213.1	204.95	270.35	168.43	228.41	238.1	253.14	242.92	201.17	199.8	248.05	235.45	232.85	273.68	168.11	166.7	152.05	179.93	175.82	205.56	113.63	145.1	214.25	235.88	253.51	243.75	247.31	280.52	222.31	259.39	245.77	270.37	233.32	184.38	214.06	231.9	265.4	282.38	190.1	167.01	169.2	173.81	164.72	169.96	188.14	156.3	188.56	210.04	269.98	199.26	166.37	200.35	196.69	243.75	202.18	172.69	143.74	99.64
    278	252	471	553	520	433	589	528	521	584	597	609	446	452	470	378	391	370	441	334	401	404	349	361	300	308	288	390	294	357	319	282	282	322	289	328	306	228	238	305	267	337	264	275	297	301	225	282	287	268	352	274	201	240	318	343	245	283	242	429	391	125	129	160	135	388	180	72	229	134	201	218	274	120	159	215	147	113	52	44	71	238	248	127	129	180	126	375	379	172	100	132	125	171	204	105	408	245	109	158	304	54	255	349	96	120	134	69	132	167	149	135	251	123	439	195	217	253	276	71	196	204	290	399	60	111	241	293	136	355	72	333	222	124	134	210	323	232	99	204	221	245	116	189	145	250	145	250	121	243	201	360	220	59	198	159	220	240	152	140	196	252	186	138	158	286	54	171	177	230	323	147	75	194	87	213	493	127	40	499	401	300	405	224	181	255	374	150	126	333	135	194	175	421	189	146	293	174	220	220	163	164	161	238	343	333	345	258	120	48	221	119	318	261	271	131	177	280	127	318	242	191	197	109	422	287	235	344	259	114	357	214	185	186	245	175	174	244	271	89	319	267	165	84	196	59	397	282	213	186	268	88	272	369	134	94	90	90	101	168	411	247	241	416	211	389	164	262	277	172	367	333	51	91	262	384	59	216	199	242	165	142	60	135	325	197	127	268	345	127	301	467	98	266	102	130	234	295	144	137	243	340	330	103	84	184	258	349	246	193	346	139	136	166	249	194	191	129	200	176	77	81	176	432	181	59	42	159	139	448	193	101	244	233	168	170	158	341	216	280	168	67	374	183	160	127	252	132	227	204	224	121	216	162	108	266	164	129	369	233	435	274	85	429	275	92	264	259	279	123	65	71	108	59	37	185	61	137	253	97	163	346	162	287	257	406	141	196	331	120	182	227	115	279	148	177	254	289	239	196	262	298	262	300	181	59	81	165	44	49	51	325	432	254	547	341	292	137	108	160	99	126	52	27	259	154	199	157	109	193	187	170	303	281	172	153	387	93	240	248	318	304	160	165	310	262	240	438	69	67	58	103	89	169	23	39	189	274	290	266	264	406	172	351	291	370	262	111	182	280	380	425	116	80	71	85	48	74	119	60	124	166	345	135	77	134	138	281	151	80	52	19
    ]'; % end data 790 days old
LWw4 = [500	510	390	420	420	460	450	500	460	410	460	430	450	420	500	470	460	460	440	470	430	400	480	430	490	490	400	520	430	510	430	450	520	480	420	420	470	480	475	465	425	430	515	445	395	430	420	440	430	475	470	440	495	455	395	530	410	420	495	455	430	430	505	420	455	415	410	405	440	495	465	435	475	465	440	470
    2360	2450	1070	1250	1120	1440	1810	3060	2030	1340	2210	1320	2100	1280	2630	2350	1730	1790	1290	2630	1540	1300	2790	1370	2470	2690	1060	3400	1420	2610	1270	1600	2930	2800	1160	1210	1660	2630	1626	2065	1179	1062	2277	1906	1022	1193	1120	1192	1135	2121	1982	1438	2657	1917	874	2800	1115	1271	2228	1681	1093	2140	2685	1189	1733	976	1080	1040	1352	2650	1941	1440	2163	1457	1161	1672
    ]';  %data reproductores
data.LWw = [LWw1; LWw2; LWw3]; %LWw4]; % concatenate all LWw except for adults -- used below
data.LWw(:,1) = data.LWw(:,1)/10; % to cm
units.LWw = { 'cm' , 'g'}; label.LWw = {'total length', 'wet weigth'}; 
bibkey.LWw = 'MancPC'; comment.LWw = 'non-reproducing (juveniles), up to 790 days of age';

% length-wet weight
data.LWw_f =[... length (mm) weight (g) females
    500	510	500	460	460	450	500	470	470	480	490	490	520	510	520	480	480	475	465	515	445	475	470	495	455	530	495	455	505	455	495	465	475	470
    2360	2450	3060	2030	2210	2100	2630	2350	2630	2790	2470	2690	3400	2610	2930	2800	2630	1626	2065	2277	1906	2121	1982	2657	1917	2800	2228	1681	2685	1733	2650	1941	2163	 1672
    ]';% end data reproductors
data.LWw_f(:,1) = data.LWw_f(:,1)/10; % to cm
units.LWw_f = { 'cm' , 'g'}; label.LWw_f = {'total length', 'wet weigth'};
bibkey.LWw_f = 'MancPC'; comment.LWw_f = 'Data for females';
%
data.LWw_m =[... length (mm) weight (g) machos
    390	420	420	460	450	410	430	420	460	460	440	430	400	430	400	430	430	450	420	420	470	425	430	395	430	420	440	430	440	395	410	420	430	430	420	415	410	405	440	435	465	440
    1070	1250	1120	1440	1810	1340	1320	1280	1730	1790	1290	1540	1300	1370	1060	1420	1270	1600	1160	1210	1660	1179	1062	1022	1193	1120	1192	1135	1438	874	1115	1271	1093	2140	1189	976	1080	1040	1352	1440	1457	1161
    ]';% end data reproductors
data.LWw_m(:,1) = data.LWw_m(:,1)/10; % to cm
units.LWw_m = { 'cm' , 'g'}; label.LWw_m = {'total length', 'wet weigth'}; 
bibkey.LWw_m = 'MancPC'; comment.LWw_m = 'Data for males';

% length-dry weight
data.LWd = [... % total length (cm) dry weigth (mug)
0.3	65.6
0.5	359.5 % length at start of meta 0.57 mm
0.7	1672.7
%1.2	5628.8
];
units.LWd = { 'cm' , 'mug'}; label.LWd = {'total length', 'dry weigth'}; 
bibkey.LWd = 'OrtiFune2019';
%
data.LWd2 = [ ... %total length (cm) dry weigth (mug)
0.138	32.5
0.238	33.2
0.248	29.9
0.285	35.4
0.327	40.1
0.353	53.6
0.413	111.3
0.463	127.2
0.497	181.8
0.637	464.7
0.686	553.4
0.918	1281.2]; 
units.LWd2 = {'cm', 'mug'}; label.LWd2 = {'total length', 'dry weigth'}; 
bibkey.LWd2 = 'YufeParr1999';
%
data.LWd3 = [... %total length (cm) dry weigth (mug)
1.3	3400
1.5	4700
1.7	7700
1.7	7400
1.9	9900
2.2	17900];
units.LWd3 = {'cm', 'mug'}; label.LWd3 = {'total length', 'dry weigth'}; 
bibkey.LWd3 = 'RibeEngr2017';

%% set weights for all real data
weights = setweights(data, []);
weights.Tah = 10 * weights.Tah; 
%weights.ab = 5 * weights.ab; 
%weights.Wwj0 = 0 * weights.Wwj0; 
weights.tWd = 10 * weights.tWd;
%weights.LWw = 10 * weights.LWw;
% weights.tL2 = 10 * weights.tL2;
weights.Ri = 20 * weights.Ri;
weights.Lh = 5 * weights.Lh;
weights.Li = 10 * weights.Li;
weights.Lp_f = 5 * weights.Lp_f;
weights.Lp_m = 5 * weights.Lp_m;
weights.tLA = 5 * weights.tLA;
weights.tLB = 5 * weights.tLB;
weights.tWwA = 5 * weights.tWwA;
weights.tWwB = 5 * weights.tWwB;
weights.LWw_f = 5 * weights.LWw_f;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.tL_f = 5* weights.tL_f; 
weights.tL_m = 5* weights.tL_m; 

%% pack auxData and txtData for output
auxData.temp = temp; auxData.temp2 = temp2;
auxData.Linit = Linit; auxData.Wwinit = Wwinit; 
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL2'}; subtitle1 = {'RibeSara1999 and RibeEngr2017'};
set2 ={'LWd','LWd2','LWd3'};subtitle2 = {'OrtiFune2019, YufeParr1999 and RibeEngr2017'};
set3 = {'tWd','tWd2'}; subtitle3 = {'YufeParr1999,ParrYufe2001'};
set4 = {'tWd_f1','tWd_f2','tWd_f3','tWd_f4'} ; subtitle4 = {'CanaFern1999'};
set5 = {'tL_f','tL_m'}; subtitle5 = { 'TeixCabr2010 - females (red), males (blue)'};
set6 = {'tLB','tLA'}; subtitle6 = {'D (red, 23C) and B (blue, 19C)'}; 
set7 = {'tWwB','tWwA'}; subtitle7 = {'C (red, 23C) and A (blue, 19C)'};
set8 = {'LWw','LWw_f', 'LWw_m'}; subtitle8 = {'Manchado -persComm: all (red), females (magenta), males (blue)'}; 
set9 = {'tWd_Man20','tWd_Man16'}; subtitle9 = {'Manchado -persComm: 20C (red), 16C (blue)'}; 
metaData.grp.sets = {set1, set2, set3, set4, set5, set6, set7, set8, set9};
metaData.grp.subtitle = {subtitle1, subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7,subtitle8,subtitle9};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only, due to different size at puberty, but no data on different age at puberty or different ultimate size';
D2 = 'Zero-variate data are from the lab and from the field; uni-variate data sets have their respective f values';     
D3 = ['Metamorphosis lasts few days, and data is available for START and END of metamorphosis. ', ...
    'We use END of (physical) metamorphosis to mark the discrete event of (metabolic) metamorphosis.'];
D4 = 'Growth from hatching (sometimes also from birth) onwards is calculated with ODEs'; 
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Senegalese sole females grow faster and mature later than males';
metaData.bibkey.F1 = 'MoraArag2014'; 
metaData.facts = struct('F1',F1);

%% Acknowledgments
metaData.acknowledgment = [ ...
    'The authors wish to acknowledge Dr. Manuel Manchado, researcher at la Junta de Andalucia in Spain, who provided us with valuable data for the model calibration. ',  ...
    'And also the researchers at MARE, who provided valuable data for the model calibration, and '...
    'whose work was supported by the Portuguese Foundation for Science and Technology (FCT) through the project FISHBUDGET - '...
    'Effects of climate change on marine fish energy budgets (PTDC/BIA-BMA/28630/2017). ' ...
    'The creation of this entry was supported by the IdEx postdoctoral fellowship from University of Bordeaux attributed to A. Sardi'];
    
%% Links
metaData.links.id_CoL = '6Z55C'; % Cat of Life
metaData.links.id_ITIS = '173016'; % ITIS
metaData.links.id_EoL = '46570284'; % Ency of Life
metaData.links.id_Wiki = 'Solea_senegalensis'; % Wikipedia
metaData.links.id_ADW = 'Solea_senegalensis'; % ADW
metaData.links.id_Taxo = '187842'; % Taxonomicon
metaData.links.id_WoRMS = '127159'; % WoRMS
metaData.links.id_fishbase = 'Solea-senegalensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'author = {Wikipedia},'...
'year = {2021},'...
'howpublished = {\url{https://en.wikipedia.org/wiki/Solea_senegalensis}},'...
'note = {Last accessed: 01/12/2021}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CanaFern1999'; type = 'Article'; bib = [ ... 
'author = {Canavate, J. Pedro and Fernandez-Diaz, C.}, ' ... 
'year   = {1999}, ' ...
'title  = {Influence of co-feeding larvae with live and inert diets on weaning the sole \textit{Solea senegalensis} onto commercial dry feeds}, ' ...
'journal= {Aquaculture}, ' ...
'volume = {174}, ' ...
'number = {3-4}, '...
'doi    = {10.1016/S0044-8486(99)00021-6}, '...
'pages  = {255-263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];  
%
bibkey = 'CarbFirm2018'; type = 'Article'; bib = [ ... 
'author = {Carballo, Carlos and Firmino, Joana and Anjos, Liliana and Santos, Soraia and Power, Deborah M. and Manchado, Manuel}, ' ... 
'year   = {2018}, ' ...
'title  = {Short- and long-term effects on growth and expression patterns in response to incubation temperatures in {S}enegalese sole}, ' ...
'journal= {Aquaculture}, ' ...
'volume = {495}, ' ...
'number = {April}, '...
'doi    = {10.1016/j.aquaculture.2018.05.043}, '...
'pages  = {222-231}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];  
% 
bibkey = 'DiniRibe1999'; type = 'Article'; bib = [ ... 
'author = {Dinis, Maria Teresa ans Ribeiro, Laura and Soares, Florbela and Sarasquete, Carmen}, ' ... 
'year   = {1999},' ...
'title  = {A review on the cultivation potential of \textit{Solea senegalensis} in {S}pain and in {P}ortugal}, ' ...
'journal= {Aquaculture},' ...
'volume = {176},' ...
'number = {1-2},'...
'doi    = {10.1016/S0044-8486(99)00047-2},'...
'pages  = {27-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MancPC'; type = 'Misc'; bib = [ ... 
'author = {Manchado, Manuel},' ... 
'year = {N/A},'...
'note = {Personal Communication, unpublished}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MARE2019'; type = 'Misc'; bib = [ ... 
'author = {Maulvault, Ana Luisa and Marques, Antonio and Rosa, Rui and Mendes, Ana and Pousao-Ferreira, Pedro and Anacleto, Patricia},' ... 
'year  = {2019},' ...
'note = {Experimental data from {MARE}, University of Lisbon. SOON TO BE PUBLISHED. For using this data outside of the script before publication please contact Jose Moreira (j.miguel.moreira@tecnico.ulisboa.pt) or Patricia Anacleto (panacleto@ipma.pt)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoraArag2014'; type = 'Article'; bib = [ ...
'author = {Morais, Sofia and Aragao, Claudia and Cabrita, Elsa and Conceicao, Luis E.C. and Constenla, Maria and Costas, Benjamin and Dias, Jorge and Duncan, Neil and Engrola, Sofia and Estevez, Alicia and Gisbert, Enric and Mananos, Evaristo and Valente, Luisa M.P. and Yufera, Manuel and Dinis, Maria Teresa}, '...
'year = {2014}, '...
'title = {New developments and biological insights into the farming of {S}olea senegalensis reinforcing its aquaculture potential},'...
'journal = {Reviews in Aquaculture},'...
'volume = {8},'...
'number = {3},'...
'doi = {10.1111/raq.12091}, '...
'pages = {227-263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OrtiFune2019'; type = 'Article'; bib = [ ...
'author = {Ortiz-Delgado, Juan B and Funes, Victoria and Sarasquete, Carmen}, '...
'year = {2019}, '...
'title = {The organophosphate pesticide -{OP}-malathion inducing thyroidal disruptions and failures in the metamorphosis of the {S}enegalese sole, \textit{Solea senegalensis}},'...
'journal = {BMC Veterinary Research},'...
'volume = {15},'...
'number = {1},'...
'doi = {10.1186/s12917-019-1786-}, '...
'pages = {1-21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParrYufe2001'; type = 'Article'; bib = [ ... 
'author = {Parra, G and Yufera, M}, ' ... 
'year   = {2001}, ' ...
'title  = {Comparative energetics during early development of two marine fish species, \textit{Solea senegalensis} ({K}aup) and \textit{Sparus aurata} ({L}.)}, ' ...
'journal= {The Journal of experimental biology}, ' ...
'volume = {204}, ' ...
'number = {Part 12}, '...
'doi    = {10.1016/S0044-8486(98)00496-7}, '...
'pages  = {2175-2183}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RibeEngr2017'; type = 'Article'; bib = [ ... 
'author = {Ribeiro, L and Engrola, Sofia and Dinis, Maria Teresa}, ' ... 
'year   = {2017}, ' ...
'title  = {Weaning of {S}enegalese sole (\textit{Solea senegalensis}) postlarvae to an inert diet with a co-feeding regime}, ' ...
'journal= {Ciencias Marinas}, ' ...
'volume = {31}, ' ...
'number = {12}, '...
'doi    = {10.7773/cm.v31i2.61}, '...
'pages  = {327-337}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RibeSara1999'; type = 'Article'; bib = [ ... 
'author = {Ribeiro, L. and Sarasquete, C. and Dinis, M. T.}, ' ... 
'year   = {1999}, ' ...
'title  = {Histological and histochemical development of the digestive system of \textit{Solea senegalensis} ({K}aup, 1858) larvae}, ' ...
'journal= {Aquaculture}, ' ...
'volume = {171}, ' ...
'number = {3-4}, '...
'doi    = {10.1016/S0044-8486(98)00496-7}, '...
'pages  = {293-308}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TeixCabr2010'; type = 'Article'; bib = [ ... 
'author = {Teixeira, C. M. and Cabral, H. N.}, ' ... 
'year   = {2010}, ' ...
'title  = {Comparative analysis of the diet, growth and reproduction of the soles, \textit{Solea solea} and \textit{Solea senegalensis}, occurring in sympatry along the {P}ortuguese coast}, ' ...
'journal= {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {90}, ' ...
'number = {5}, '...
'doi    = {10.1017/S0025315410000238}, '...
'pages  = {995-1003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vina2007'; type = 'phdthesis'; bib = [ ... 
'author = {Catarina Vinagre},' ... 
'year   = {2007},' ...
'title  = {Ecology of the juveniles of the soles \textit{Solea solea} ({L}innaeus, 1758) and \textit{Solea senegalensis} ({K}aup, 1858), in the {T}agus estuary},' ...
'school = {University of Lisbon},' ...
'pages  = {200}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YufeParr1999'; type = 'Article'; bib = [ ... 
'author = {Yufera, M. and Parra, G. and Santiago, R. and Carrascosa, M.},' ... 
'year   = {1999},' ...
'title  = {Growth, carbon, nitrogen and caloric content of \textit{Solea senegalensis} ({P}isces: {S}oleidae) from egg fertilization to metamorphosis},' ...
'journal= {Marine Biology},' ...
'volume = {134},' ...
'number = {1},'...
'doi    = {10.1007/s002270050523},'...
'pages  = {43-49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

