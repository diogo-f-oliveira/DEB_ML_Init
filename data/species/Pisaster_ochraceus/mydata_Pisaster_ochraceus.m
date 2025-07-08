function [data, auxData, metaData, txtData, weights] = mydata_Pisaster_ochraceus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Forcipulatida'; 
metaData.family     = 'Asteriidae';
metaData.species    = 'Pisaster_ochraceus'; 
metaData.species_en = 'Ochre sea star'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 'Ww-JO'; 't-L'; 't-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Cristian Monaco'};    
metaData.date_subm = [2011 12 27];              
metaData.email    = {'cristianmonaco@gmail.com'};            
metaData.address  = {'University of South Carolina'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2012 02 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 01]; 

%% set data
% zero-variate data

data.ab = 4.5;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Stra1978';   
  temp.ab = C2K(13);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 150;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'Stra1978';   
  temp.tj = C2K(13);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'Stra1978: Brachiolaria larvae settles between 76 and 228 d. Gamets are usually released on late spring, when water temperature is  12-13 degC';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Stra1978';
  temp.tp = C2K(13);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = ['Meng1975 estimated 70-90 g for reproduction onset (1974 and 1975). ' ...
      'From Fede1956 and my lab measurements, juveniles would grow to that weight on 730 days, considering 150 days of larval period. ' ...
      'Menge (1974) estimated 5 years to reach reproductive maturity, but based on field (suboptimal conditions) observations.'];
data.am = 34*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'MacGMacG1949';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.02;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'Geor1999';
  comment.Lb = 'Bippinaria larvae starts foraging when hatched (0.160-0.250 mm). From Geor1999 (Fig. 2b), fed larvae. I use the larvae width as proxy for arm length. Note that is not the same length used for adults.';
data.Lj  = 0.22;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';      bibkey.Lj  = 'Geor1999';
data.Lp  = 5.9;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';    bibkey.Lp  = 'Mona2011';
  comment.Lp = ['Information available is from field estimates only. '...
  'Meng1975, PearEern1986: individuals without gonads until 70g wet-weight. '];
data.Li  = 20;    units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'Fede1956';

data.Wwb = 0.0142; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Fede1956';
data.Wwp = 70;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'Meng1975','PearEern1986'};
data.Wwi = 1200;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Fede1956';

data.R400  = 4e7/365; units.R400  = '#/d'; label.R400  = 'reprod rate at 400 g wet weight'; bibkey.R400  = 'Meng1975';   
  temp.R400 = C2K(13);  units.temp.R400 = 'K'; label.temp.R400 = 'temperature';
 
% uni-variate data

% L-W data
% Wet weight at Arm length (data from animals collected at Bodega Marine Reserve, California, by C.Monaco. Summer 2011).
% This weight does not exclude calcareous structures.
data.LW = [ ... length (cm), weight (g)
0.5	1
1	1
1	1
2	1
2	5
2.2	5
2.5	5
2.5	5
2.5	5
2.5	5
3	20
3	5
3	10
3	5
3	5
3	20
3	5
3	5
3	5
3	10
3	30
3.5	30
3.5	30
3.5	5
3.5	10
3.5	20
3.5	20
4	20
4	30
4	40
4	20
4	20
4	50
4.5	10
4.5	80
4.5	30
5	80
5.5	30
5.5	40
5.5	100
5.5	40
5.5	80
5.5	90
6	80
6	110
6	110
6	70
6	80
6	100
6	90
6	90
6	110
6	70
6.5	130
6.5	100
6.5	110
6.5	120
6.5	130
6.5	130
6.5	150
6.5	150
6.5	90
6.5	90
6.5	100
6.5	70
6.7	120
7	160
7	130
7	140
7	120
7	200
7	100
7	180
7	180
7	170
7	160
7	170
7	90
7	90
7	150
7	130
7	110
7.5	170
7.5	190
7.5	170
7.5	150
7.5	200
7.5	220
7.5	160
7.5	140
7.5	180
7.5	140
7.5	160
7.5	220
7.5	170
7.5	140
7.5	130
7.5	130
7.5	160
7.5	110
7.5	160
7.5	120
7.5	170
7.5	180
7.5	180
7.5	160
7.5	170
7.5	160
7.5	180
7.5	180
7.5	190
7.5	180
7.5	210
7.5	160
7.5	190
7.5	150
7.5	120
7.5	150
7.5	150
7.5	140
8	220
8	180
8	160
8	200
8	220
8	300
8	220
8	200
8	200
8	310
8	160
8	150
8	200
8	150
8	170
8	150
8	190
8	200
8	170
8	210
8	160
8	180
8	190
8	200
8	210
8	150
8	150
8	170
8	140
8	140
8	200
8	180
8	170
8	190
8	240
8	200
8	260
8	140
8	130
8	190
8	150
8	210
8	230
8	190
8	170
8	140
8	180
8	170
8	170
8	190
8.5	160
8.5	160
8.5	180
8.5	240
8.5	230
8.5	250
8.5	300
8.5	280
8.5	120
8.5	180
8.5	220
8.5	310
8.5	180
8.5	180
8.5	280
8.5	170
8.5	190
8.5	170
8.5	150
8.5	150
8.5	150
8.5	160
8.5	220
8.5	180
8.5	230
8.5	210
8.5	220
8.5	140
8.5	210
8.5	200
8.5	250
8.5	200
8.5	250
8.5	310
8.5	250
8.5	120
8.5	230
8.5	220
8.5	260
8.5	210
8.5	290
8.5	310
8.5	210
8.5	170
8.5	210
8.5	240
8.5	240
8.5	160
8.5	220
9	220
9	160
9	250
9	210
9	190
9	210
9	220
9	200
9	250
9	360
9	200
9	270
9	190
9	360
9	310
9	230
9	270
9	270
9	260
9	230
9	190
9	190
9	270
9	330
9	190
9	310
9	340
9	260
9	200
9	240
9	170
9	300
9	200
9	260
9	190
9	370
9	220
9	250
9	200
9	190
9	280
9	190
9	260
9	250
9	280
9	210
9	310
9	200
9	280
9	290
9	270
9	250
9	180
9	260
9	320
9	300
9	330
9	230
9	180
9	190
9	280
9	260
9	310
9	240
9	160
9	250
9	270
9	240
9	250
9	440
9	230
9	290
9	240
9	180
9	200
9	210
9	260
9	210
9.5	320
9.5	280
9.5	230
9.5	230
9.5	230
9.5	250
9.5	210
9.5	220
9.5	270
9.5	240
9.5	280
9.5	310
9.5	280
9.5	240
9.5	310
9.5	280
9.5	280
9.5	280
9.5	350
9.5	210
9.5	280
9.5	190
9.5	250
9.5	200
9.5	230
9.5	180
9.5	290
9.5	240
9.5	220
9.5	320
9.5	270
9.5	340
9.5	290
9.5	260
9.5	270
9.5	200
9.5	310
9.5	260
9.5	290
9.5	290
9.5	300
9.5	260
9.5	340
9.5	250
9.5	230
9.5	240
9.5	270
9.5	270
9.5	190
9.5	250
9.5	320
9.5	390
9.5	320
9.5	300
9.5	300
9.5	270
9.5	360
9.5	210
9.5	300
9.5	290
9.5	220
9.5	280
9.5	300
9.5	300
9.5	200
9.5	240
9.5	280
9.5	250
9.5	240
9.5	270
9.5	360
9.5	300
10	290
10	240
10	260
10	290
10	320
10	310
10	240
10	250
10	250
10	240
10	270
10	240
10	450
10	260
10	320
10	360
10	280
10	290
10	310
10	310
10	330
10	280
10	350
10	280
10	230
10	180
10	290
10	290
10	280
10	300
10	220
10	240
10	240
10	310
10	270
10	390
10	390
10	280
10	290
10	340
10	380
10	300
10	300
10	300
10	240
10	400
10	410
10	280
10	280
10	240
10	320
10	440
10	310
10	360
10	290
10	330
10	270
10	330
10	310
10	320
10	290
10	350
10	460
10	240
10	310
10	330
10	250
10	470
10	320
10	280
10	250
10	340
10	310
10	330
10	320
10	290
10	300
10	250
10	320
10	300
10	280
10	310
10	260
10.5	270
10.5	300
10.5	290
10.5	270
10.5	300
10.5	260
10.5	280
10.5	250
10.5	280
10.5	250
10.5	300
10.5	350
10.5	260
10.5	410
10.5	310
10.5	450
10.5	310
10.5	230
10.5	220
10.5	340
10.5	250
10.5	260
10.5	270
10.5	300
10.5	340
10.5	350
10.5	340
10.5	210
10.5	310
10.5	290
10.5	340
10.5	300
10.5	380
10.5	350
10.5	370
10.5	360
10.5	310
10.5	340
10.5	300
10.5	280
10.5	340
10.5	410
10.5	420
10.5	350
10.5	410
10.5	390
10.5	400
10.5	400
10.5	280
10.5	270
10.5	330
10.5	330
10.5	400
10.5	450
10.5	400
10.5	440
10.5	330
10.5	290
10.5	400
10.5	290
10.5	300
10.5	590
10.5	300
10.5	420
10.5	380
10.5	210
10.5	250
10.5	290
10.5	390
10.5	270
10.5	250
10.5	340
10.5	310
11	310
11	300
11	310
11	410
11	300
11	290
11	400
11	410
11	320
11	350
11	300
11	300
11	390
11	480
11	560
11	310
11	380
11	350
11	310
11	190
11	340
11	330
11	360
11	320
11	300
11	390
11	380
11	290
11	460
11	360
11	400
11	360
11	310
11	350
11	300
11	330
11	350
11	410
11	320
11	500
11	350
11	470
11	560
11	380
11	440
11	380
11	420
11	350
11	430
11	440
11	380
11	410
11	340
11	410
11	460
11	360
11	290
11	390
11	330
11	430
11	340
11	430
11	310
11	360
11	370
11	380
11	550
11	540
11	420
11	410
11	330
11	330
11	260
11	390
11.5	250
11.5	470
11.5	350
11.5	400
11.5	460
11.5	350
11.5	220
11.5	320
11.5	280
11.5	280
11.5	350
11.5	500
11.5	400
11.5	300
11.5	370
11.5	260
11.5	350
11.5	300
11.5	450
11.5	320
11.5	540
11.5	400
11.5	410
11.5	460
11.5	460
11.5	390
11.5	490
11.5	390
11.5	380
11.5	350
11.5	410
11.5	390
11.5	530
11.5	350
11.5	420
11.5	420
11.5	430
11.5	280
11.5	510
11.5	430
11.5	550
11.5	470
11.5	460
11.5	360
11.5	440
11.5	270
11.5	550
11.5	540
11.5	490
11.5	450
11.5	390
11.5	300
11.5	330
11.5	390
11.5	390
11.5	380
11.5	350
11.5	410
11.5	420
11.5	320
11.5	400
11.5	400
12	400
12	480
12	430
12	470
12	440
12	410
12	410
12	470
12	530
12	390
12	480
12	400
12	440
12	560
12	390
12	550
12	540
12	540
12	540
12	540
12	330
12	360
12	430
12	470
12	520
12	440
12	390
12	380
12	490
12	430
12	350
12	380
12	550
12	550
12	510
12	540
12	380
12	400
12	780
12	540
12	490
12	390
12	380
12	520
12	490
12	470
12.5	420
12.5	360
12.5	320
12.5	460
12.5	220
12.5	350
12.5	510
12.5	430
12.5	410
12.5	390
12.5	400
12.5	480
12.5	370
12.5	470
12.5	480
12.5	460
12.5	560
12.5	390
12.5	440
12.5	540
12.5	530
12.5	500
12.5	480
12.5	460
12.5	350
12.5	360
12.5	510
12.5	580
12.5	430
12.5	430
12.5	550
12.5	350
12.5	550
12.5	540
12.5	430
12.5	440
12.5	440
12.5	360
12.5	420
12.5	470
13	360
13	460
13	470
13	510
13	650
13	610
13	490
13	450
13	500
13	600
13	590
13	550
13	530
13	380
13	560
13	550
13	530
13	430
13	500
13	630
13	460
13	560
13	540
13	610
13	590
13	510
13	410
13	650
13.3	420
13.5	430
13.5	590
13.5	540
13.5	620
13.5	540
13.5	610
13.5	460
13.5	620
13.5	620
13.5	580
13.5	610
13.5	460
13.5	500
13.5	630
13.5	520
13.5	420
13.5	650
13.5	460
13.5	430
13.5	590
14	480
14	640
14	620
14	330
14	450
14	690
14	510
14	500
14	660
14	690
14	750
14.5	540
14.5	600
14.5	370
14.5	510
14.5	590
14.5	480
14.7	580
15	480
15	620
15	750
17	740];
units.LW   = {'cm', 'g'};  label.LW = {'arm length', 'wet weight'};  
bibkey.LW = 'Mona2011';
comment.LW = 'weight does not exclude calcareous structures; animals collected at Bodega Marine Reserve, California';

% specific dioxygen consumption as a function of wet weight. 
% Data collected by C. Monaco with similar sized animals at 12oC (November 2011).
data.WJO = [...   % wet weight (g), O2 consumption (umol/h/g)
80.94	1.10229846
73.65	0.60728042
82.51	0.87940731
84.26	0.78802308
97.76	1.19039012
78.79	1.04436532
104.76	1.10932775
107.11	0.78473745
94.3	1.05868902
94.6	0.89178350
114.2	0.66467163
92.2	0.79228308
112.5	0.97359611
108.4	1.28245820
104.1	1.03274968
86.3	0.96564080
120.6	0.65786484
105.8	0.98945091
76.7	1.15118766
75.8	0.90049225
101.3	1.33780972
95      1.57453553
76.7	0.68455834
121.3	0.83812345
81.5	0.62330061
88.6	0.66035835
103.6	0.47693141
81.8	1.04491901];
units.WJO   = {'d', 'umol/h.g'};  label.WJO = {'wet weight', 'O_2 consumption'};  
temp.WJO    = C2K(12);  units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
bibkey.WJO = 'Mona2011';

% Growth data. 
% Time (since birth) vs arm length and wet weight for 21 individuals (Feder 1956).
% f = 1
% Avg. Temp = 12.8 + 273.15 K  
data.tL_1=[...%d  cm 
150     0.03
620     10.1
646     10.1
670     10.9
704     11.6
744     12.2
794     13.2
831     14.5
898     13.7
972     15.8
1047	16.2
1144	18.9
1200	18.6];
data.tL_1(:,1) = data.tL_1(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_1  = {'d', 'cm'};  label.tL_1 = {'time since birth', 'arm length'};  
temp.tL_1   = C2K(12.8);  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
bibkey.tL_1 = 'Mona2011';

data.tW_1=[...%d  g
150     0.01775
620     246
646     293.8
670     333.4
704     367.1
744     509.9
794     607
831     676.2
898     633
972     866
1047	992.5
1144	1218
1200	1052.4];
data.tW_1(:,1) = data.tW_1(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_1  = {'d', 'g'};  label.tW_1 = {'time since birth', 'wet weight'};  
temp.tW_1   = C2K(12.8);  units.temp.tW_1 = 'K'; label.temp.tW_1 = 'temperature';
bibkey.tW_1 = 'Mona2011';

data.tL_2=[...%d  cm
150     0.03
600     7.8
626     8.9
649     8.4
683     9.3
723     10.6
773     11.5
810     13.1
877     13.3
951     15.2
1026	14.8
1123	16.7
1179	16.4];    
data.tL_2(:,1) = data.tL_2(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_2  = {'d', 'cm'};  label.tL_2 = {'time since birth', 'arm length'};  
temp.tL_2   = C2K(12.8);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
bibkey.tL_2 = 'Mona2011';

data.tW_2=[...%d  g
150     0.01775
600     158
626     210.4
649     214.5
683     257.8
723     338
773     464.9
810     570
877     552
951     717
1026	922.5
1123	1229.8
1179	1098.5];
data.tW_2(:,1) = data.tW_2(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_2  = {'d', 'g'};  label.tW_2 = {'time since birth', 'wet weight'};  
temp.tW_2   = C2K(12.8);  units.temp.tW_2 = 'K'; label.temp.tW_2 = 'temperature';
bibkey.tW_2 = 'Mona2011';

data.tL_3=[...%d  cm   g
150     0.03
607     8.5
632     8.7
656     8.7
690     9.5
730     9.6
780     10.7
817     11.2
884     11.9
958     12.9
1033	14.8
1130	14.5
1186	15.5];    
data.tL_3(:,1) = data.tL_3(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_3  = {'d', 'cm'};  label.tL_3 = {'time since birth', 'arm length'};  
temp.tL_3   = C2K(12.8);  units.temp.tL_3 = 'K'; label.temp.tL_3 = 'temperature';
bibkey.tL_3 = 'Mona2011';

data.tW_3=[...%d  g
150 	0.01775
607 	125.5
632 	162.1
656 	189.2
690 	231.3
730 	322.1
780 	366.2
817 	415
884 	490
958 	722
1033	843
1130	912
1186	856.8];
data.tW_3(:,1) = data.tW_3(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_3  = {'d', 'g'};  label.tW_3 = {'time since birth', 'wet weight'};  
temp.tW_3   = C2K(12.8);  units.temp.tW_3 = 'K'; label.temp.tW_3 = 'temperature';
bibkey.tW_3 = 'Mona2011';

data.tL_4=[...%d  cm   g
150     0.03
610     8.9
636     9.3
660     9.5
694     10.8
734     11.4
784 	12.1
821     11.8
888     12.4
962     14.6
1037	16.7
1134	16.6
1190	14.3];  
data.tL_4(:,1) = data.tL_4(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_4  = {'d', 'cm'};  label.tL_4 = {'time since birth', 'arm length'};  
temp.tL_4   = C2K(12.8);  units.temp.tL_4 = 'K'; label.temp.tL_4 = 'temperature';
bibkey.tL_4 = 'Mona2011';

data.tW_4=[...%d  g
150 	0.01775
610 	208.1
636 	248.3
660 	265.8
694 	306.2
734 	378.5
784 	525
821 	572
888 	481.6
962 	693
1037	909
1134	1048
1190	916];
data.tW_4(:,1) = data.tW_4(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_4  = {'d', 'g'};  label.tW_4 = {'time since birth', 'wet weight'};  
temp.tW_4   = C2K(12.8);  units.temp.tW_4 = 'K'; label.temp.tW_4 = 'temperature';
bibkey.tW_4 = 'Mona2011';

data.tL_5=[...%d  cm
150     0.03
573     5.50
616     5.60
640     6.30
674     7.00
716     7.10
765     8.80
801     9.30
868     10.00
942     12.19
1017	14.40
1119	15.60
1170	12.60];
data.tL_5(:,1) = data.tL_5(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_5  = {'d', 'cm'};  label.tL_5 = {'time since birth', 'arm length'};  
temp.tL_5   = C2K(12.8);  units.temp.tL_5 = 'K'; label.temp.tL_5 = 'temperature';
bibkey.tL_5 = 'Mona2011';

data.tW_5=[...%d  g
150 	0.01775
573 	26.8
616 	35
640 	47.1
674 	70.4
716 	91.8
765 	156.6
801 	217.2
868 	240.6
942 	380
1017	578.5
1119	660.5
1170	580];
data.tW_5(:,1) = data.tW_5(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_5  = {'d', 'g'};  label.tW_5 = {'time since birth', 'wet weight'};  
temp.tW_5   = C2K(12.8);  units.temp.tW_5 = 'K'; label.temp.tW_5 = 'temperature';
bibkey.tW_5 = 'Mona2011';

data.tL_6=[...%d  cm
150     0.03
578     5.90
621     5.60
645     5.80
679     6.60
721     7.43
770     8.40
806     9.90
873     10.20
947     10.90
1022	12.80
1124	15.60
1175	13.60];
data.tL_6(:,1) = data.tL_6(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_6  = {'d', 'cm'};  label.tL_6 = {'time since birth', 'arm length'};  
temp.tL_6   = C2K(12.8);  units.temp.tL_6 = 'K'; label.temp.tL_6 = 'temperature';
bibkey.tL_6 = 'Mona2011';

data.tW_6=[...%d  g
150     0.01775
578 	50.2
621 	56.5
645 	72.6
679 	85.7
721 	116.8
770 	188.5
806 	259.3
873 	270.5
947 	459
1022	728
1124	863
1175	763];
data.tW_6(:,1) = data.tW_6(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_6  = {'d', 'g'};  label.tW_6 = {'time since birth', 'wet weight'};  
temp.tW_6   = C2K(12.8);  units.temp.tW_6 = 'K'; label.temp.tW_6 = 'temperature';
bibkey.tW_6 = 'Mona2011';

data.tL_7=[...%d  cm
150     0.03
609     8.7
633     8.4
667     8.4
709     8.9
758     11.2
794     10.7
861     11.7
935     13.4
1010	14.7
1107	15.7];
data.tL_7(:,1) = data.tL_7(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_7  = {'d', 'cm'};  label.tL_7 = {'time since birth', 'arm length'};  
temp.tL_7   = C2K(12.8);  units.temp.tL_7 = 'K'; label.temp.tL_7 = 'temperature';
bibkey.tL_7 = 'Mona2011';

data.tW_7=[...%d  g
150 	0.01775
609 	143.5
633 	143.7
667 	181.4
709 	220.3
758 	291
794 	388.6
861 	430.5
935 	615.5
1010	819
1107	1140];
data.tW_7(:,1) = data.tW_7(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_7  = {'d', 'g'};  label.tW_7 = {'time since birth', 'wet weight'};  
temp.tW_7   = C2K(12.8);  units.temp.tW_7 = 'K'; label.temp.tW_7 = 'temperature';
bibkey.tW_7 = 'Mona2011';

data.tL_8=[...%d  cm
150     0.03
571     5.80
614     5.90
638     6.10
672     7.08
714     8.30
763     8.50
799     9.70
866     11.70
940     12.30
1015	13.60
1117	13.70
1168	13.40];
data.tL_8(:,1) = data.tL_8(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_8  = {'d', 'cm'};  label.tL_8 = {'time since birth', 'arm length'};  
temp.tL_8   = C2K(12.8);  units.temp.tL_8 = 'K'; label.temp.tL_8 = 'temperature';
bibkey.tL_8 = 'Mona2011';

data.tW_8=[...%d  g
150 	0.01775
571 	35.8
614 	52.3
638 	56.9
672 	73.8
714 	104
763 	150.6
799 	246
866 	262
940 	470.8
1015	675
1117	790
1168	636.4];
data.tW_8(:,1) = data.tW_8(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_8  = {'d', 'g'};  label.tW_8 = {'time since birth', 'wet weight'};  
temp.tW_8   = C2K(12.8);  units.temp.tW_8 = 'K'; label.temp.tW_8 = 'temperature';
bibkey.tW_8 = 'Mona2011';

data.tL_9=[...%d  cm
150     0.03
565     5.00
608     4.90
632     6.40
666     5.50
708     6.60
757     7.50
793     8.20
860     9.10
934     12.20
1009	12.10
1111	12.20
1162	13.40];
data.tL_9(:,1) = data.tL_9(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_9  = {'d', 'cm'};  label.tL_9 = {'time since birth', 'arm length'};  
temp.tL_9   = C2K(12.8);  units.temp.tL_9 = 'K'; label.temp.tL_9 = 'temperature';
bibkey.tL_9 = 'Mona2011';

data.tW_9=[...%d  g
150 	0.01775
565 	25.2
608 	40.3
632 	46.9
666 	60.1
708 	80.4
757 	128.7
793 	197.9
860 	213.5
934 	393.6
1009	506.2
1111	633.6
1162	541.9];
data.tW_9(:,1) = data.tW_9(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_9  = {'d', 'g'};  label.tW_9 = {'time since birth', 'wet weight'};  
temp.tW_9   = C2K(12.8);  units.temp.tW_9 = 'K'; label.temp.tW_9 = 'temperature';
bibkey.tW_9 = 'Mona2011';

data.tL_10=[...%d  cm
150     0.03
574     5.60
617     5.60
641     5.80
675     6.10
717     6.60
766     7.20
802     8.30
869     8.30
943     10.60
1018	12.10
1120	12.80
1171	12.60];
data.tL_10(:,1) = data.tL_10(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_10  = {'d', 'cm'};  label.tL_10 = {'time since birth', 'arm length'};  
temp.tL_10   = C2K(12.8);  units.temp.tL_10 = 'K'; label.temp.tL_10 = 'temperature';
bibkey.tL_10 = 'Mona2011';

data.tW_10=[...%d  g
150 	0.01775
574 	30.1
617 	50.1
641 	59.7
675 	67.8
717 	89.6
766 	113.9
802 	176.1
869 	204.2
943 	308.8
1018	576.5
1120	673
1171	588.5];
data.tW_10(:,1) = data.tW_10(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_10  = {'d', 'g'};  label.tW_10 = {'time since birth', 'wet weight'};  
temp.tW_10   = C2K(12.8);  units.temp.tW_10 = 'K'; label.temp.tW_10 = 'temperature';
bibkey.tW_10 = 'Mona2011';

data.tL_11=[...%d  cm
150     0.03
554     4.30
578     5.60
612     6.10
654     6.70
703     7.20
739     9.10
806     9.40
880     12.10
955     12.20
1052	12.70
1109	14.20];
data.tL_11(:,1) = data.tL_11(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_11  = {'d', 'cm'};  label.tL_11 = {'time since birth', 'arm length'};  
temp.tL_11   = C2K(12.8);  units.temp.tL_11 = 'K'; label.temp.tL_11 = 'temperature';
bibkey.tL_11 = 'Mona2011';

data.tW_11=[...%d  g
150 	0.01775
554 	29.3
578 	41.4
612 	47.1
654 	72.6
703 	108.1
739 	195.5
806 	200.5
880 	409.5
955 	511
1052	713
1109	679.2];
data.tW_11(:,1) = data.tW_11(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_11  = {'d', 'g'};  label.tW_11 = {'time since birth', 'wet weight'};  
temp.tW_11   = C2K(12.8);  units.temp.tW_11 = 'K'; label.temp.tW_11 = 'temperature';
bibkey.tW_11 = 'Mona2011';

data.tL_12=[...%d  cm
150     0.03
526     3.00
570     3.40
619     4.00
655     5.20
722     5.40
796     7.80
871     8.90
968     10.10
1025	9.80];
data.tL_12(:,1) = data.tL_12(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_12  = {'d', 'cm'};  label.tL_12 = {'time since birth', 'arm length'};  
temp.tL_12   = C2K(12.8);  units.temp.tL_12 = 'K'; label.temp.tL_12 = 'temperature';
bibkey.tL_12 = 'Mona2011';

data.tW_12=[...%d  g
150 	0.01775
526 	7.9
570 	12.8
619 	19.6
655 	33
722 	54.3
796 	106.5
871 	167
968 	235.3
1025	234];
data.tW_12(:,1) = data.tW_12(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_12  = {'d', 'g'};  label.tW_12 = {'time since birth', 'wet weight'};  
temp.tW_12   = C2K(12.8);  units.temp.tW_12 = 'K'; label.temp.tW_12 = 'temperature';
bibkey.tW_12 = 'Mona2011';

data.tL_13=[...%d  cm
150     0.03
616     9.21
642     9.6
666     9.3
700     11
740     11.4
793     12.5
827     14.1
894     12.5
968     14.2
1044	17.7
1140	18.3
1197	16.2];
data.tL_13(:,1) = data.tL_13(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_13  = {'d', 'cm'};  label.tL_13 = {'time since birth', 'arm length'};  
temp.tL_13   = C2K(12.8);  units.temp.tL_13 = 'K'; label.temp.tL_13 = 'temperature';
bibkey.tL_13 = 'Mona2011';

data.tW_13=[...%d  g
150 	0.01775
616 	161.8
642 	209.3
666 	260.6
700 	274.6
740 	434
793 	513.3
827 	585.5
894 	553
968 	853
1044	968
1140	1138
1197	945.8];
data.tW_13(:,1) = data.tW_13(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_13  = {'d', 'g'};  label.tW_13 = {'time since birth', 'wet weight'};  
temp.tW_13   = C2K(12.8);  units.temp.tW_13 = 'K'; label.temp.tW_13 = 'temperature';
bibkey.tW_13 = 'Mona2011';

data.tL_14=[...%d  cm
150     0.03
596     7.4
622     8.2
646     7.5
680     9
720     9.5
773     11.2
807     11.5
874     12
948     13.4
1024	14.9
1120	14.2
1177	14.7];
data.tL_14(:,1) = data.tL_14(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_14  = {'d', 'cm'};  label.tL_14 = {'time since birth', 'arm length'};  
temp.tL_14   = C2K(12.8);  units.temp.tL_14 = 'K'; label.temp.tL_14 = 'temperature';
bibkey.tL_14 = 'Mona2011';

data.tW_14=[...%d  g
150 	0.01775
596 	100.1
622 	143.5
646 	162.2
680 	188
720 	266.1
773 	422.4
807 	471.3
874 	457
948 	739.9
1024	976
1120	1117
1177	1023.8];
data.tW_14(:,1) = data.tW_14(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_14  = {'d', 'g'};  label.tW_14 = {'time since birth', 'wet weight'};  
temp.tW_14   = C2K(12.8);  units.temp.tW_14 = 'K'; label.temp.tW_14 = 'temperature';
bibkey.tW_14 = 'Mona2011';

data.tL_15=[...%d  cm
150     0.03
606     8.4
632     8.7
656     9.7
690     10
730 	10
783     11
817 	12.1
884 	13.29
958 	14.6
1034	15.8
1130	17.9
1187	15.3];
data.tL_15(:,1) = data.tL_15(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_15  = {'d', 'cm'};  label.tL_15 = {'time since birth', 'arm length'};  
temp.tL_15   = C2K(12.8);  units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'Mona2011';

data.tW_15=[...%d  g
150 	0.01775
606 	136.2
632 	166.3
656 	190
690 	211.6
730 	273.2
783 	410.5
817 	503.5
884 	521.6
958 	752.3
1034	984
1130	1098
1187	991.1];
data.tW_15(:,1) = data.tW_15(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_15  = {'d', 'g'};  label.tW_15 = {'time since birth', 'wet weight'};  
temp.tW_15   = C2K(12.8);  units.temp.tW_15 = 'K'; label.temp.tW_15 = 'temperature';
bibkey.tW_15 = 'Mona2011';

data.tL_16=[...%d  cm
150 	0.03
606 	7.4
630 	7.9
664 	7.9
704 	9.4
757 	10.9
791 	12.3
858 	13.11
932 	14
1008	16.9
1104	18.5
1161	16.6];
data.tL_16(:,1) = data.tL_16(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_16  = {'d', 'cm'};  label.tL_16 = {'time since birth', 'arm length'};  
temp.tL_16   = C2K(12.8);  units.temp.tL_16 = 'K'; label.temp.tL_16 = 'temperature';
bibkey.tL_16 = 'Mona2011';

data.tW_16=[...%d  g
150 	0.01775
606 	80.4
630 	129.3
664 	168.4
704 	238.5
757 	367.7
791 	448.7
858 	518.5
932 	791
1008	999.3
1104	1283
1161	1192.8];
data.tW_16(:,1) = data.tW_16(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_16  = {'d', 'g'};  label.tW_16 = {'time since birth', 'wet weight'};  
temp.tW_16   = C2K(12.8);  units.temp.tW_16 = 'K'; label.temp.tW_16 = 'temperature';
bibkey.tW_16 = 'Mona2011';

data.tL_17=[...%d  cm
150 	0.03
577 	5.80
601 	6.30
635 	6.80
675 	7.70
734 	8.30
762 	9.70
829 	9.20
903 	10.70
979 	12.40
1075	12.90
1132	11.50];
data.tL_17(:,1) = data.tL_17(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_17  = {'d', 'cm'};  label.tL_17 = {'time since birth', 'arm length'};  
temp.tL_17   = C2K(12.8);  units.temp.tL_17 = 'K'; label.temp.tL_17 = 'temperature';
bibkey.tL_17 = 'Mona2011';

data.tW_17=[...%d  g
150 	0.01775
577 	29
601 	41.3
635 	62.6
675 	98.3
734 	152.5
762 	204.1
829 	217.4
903 	282
979 	410.5
1075	500
1132	462];
data.tW_17(:,1) = data.tW_17(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_17  = {'d', 'g'};  label.tW_17 = {'time since birth', 'wet weight'};  
temp.tW_17   = C2K(12.8);  units.temp.tW_17 = 'K'; label.temp.tW_17 = 'temperature';
bibkey.tW_17 = 'Mona2011';

data.tL_18=[...%d  cm
150     0.03
605 	8.3
631 	8.7
655 	8.9
689 	8.5
729 	9
782 	10.3
816 	10.4
883 	11.7
957 	11.7
1033	13.9
1129	14.4
1186	15.8];
data.tL_18(:,1) = data.tL_18(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_18  = {'d', 'cm'};  label.tL_18 = {'time since birth', 'arm length'};  
temp.tL_18   = C2K(12.8);  units.temp.tL_18 = 'K'; label.temp.tL_18 = 'temperature';
bibkey.tL_18 = 'Mona2011';

data.tW_18=[...%d  g
150 	0.01775
605 	131.4
631 	171
655 	165.5
689 	186.9
729 	220.8
782 	304.7
816 	380
883 	402.6
957 	550.7
1033	649
1129	866.5
1186	726.5];
data.tW_18(:,1) = data.tW_18(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_18  = {'d', 'g'};  label.tW_18 = {'time since birth', 'wet weight'};  
temp.tW_18   = C2K(12.8);  units.temp.tW_18 = 'K'; label.temp.tW_18 = 'temperature';
bibkey.tW_18 = 'Mona2011';

data.tL_19=[...%d  cm
150 	0.03
589 	6.80
621 	7.90
655 	8.10
722 	9.30
796 	9.50
872 	11.50
958 	15.00
1025	13.00];
data.tL_19(:,1) = data.tL_19(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_19  = {'d', 'cm'};  label.tL_19 = {'time since birth', 'arm length'};  
temp.tL_19   = C2K(12.8);  units.temp.tL_19 = 'K'; label.temp.tL_19 = 'temperature';
bibkey.tL_19 = 'Mona2011';

data.tW_19=[...%d  g
150 	0.01775
589 	61
621 	93.9
655 	127.1
722 	187.2
796 	330.6
872 	475.5
958 	706
1025	638.8];
data.tW_19(:,1) = data.tW_19(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_19  = {'d', 'g'};  label.tW_19 = {'time since birth', 'wet weight'};  
temp.tW_19   = C2K(12.8);  units.temp.tW_19 = 'K'; label.temp.tW_19 = 'temperature';
bibkey.tW_19 = 'Mona2011';

data.tL_20=[...%d  cm
150 	0.03
597 	7.5
623 	8.6
647 	8.5
681 	8.4
721 	9.2
774 	11.3
808 	11.4
875 	11.6
949 	13.4
1025	15
1121	15.6
1178	16];
data.tL_20(:,1) = data.tL_20(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_20  = {'d', 'cm'};  label.tL_20 = {'time since birth', 'arm length'};  
temp.tL_20   = C2K(12.8);  units.temp.tL_20 = 'K'; label.temp.tL_20 = 'temperature';
bibkey.tL_20 = 'Mona2011';

data.tW_20=[...%d  g
150 	0.01775
597 	103.5
623 	158.1
647 	163
681 	168.9
721 	258.7
774 	371.3
808 	404.8
875 	420
949 	783
1025	908
1121	1178
1178	1008];
data.tW_20(:,1) = data.tW_20(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_20  = {'d', 'g'};  label.tW_20 = {'time since birth', 'wet weight'};  
temp.tW_20   = C2K(12.8);  units.temp.tW_20 = 'K'; label.temp.tW_20 = 'temperature';
bibkey.tW_20 = 'Mona2011';

data.tL_21=[...%d  cm
150 	0.03
582 	6.20
607 	7.20
640 	8.60
680 	8.00
739 	10.10
767 	11.60
834 	10.80
908 	13.10
984 	14.40
1080	14.80
1137	15.20];
data.tL_21(:,1) = data.tL_21(:,1) - 150; % d, time since settlement (birth is not observed)
units.tL_21  = {'d', 'cm'};  label.tL_21 = {'time since birth', 'arm length'};  
temp.tL_21   = C2K(12.8);  units.temp.tL_21 = 'K'; label.temp.tL_21 = 'temperature';
bibkey.tL_21 = 'Mona2011';

data.tW_21=[...%d  g
150 	0.01775
582 	49.4
607 	75
640 	131.2
680 	171.8
739 	261.8
767 	320.1
834 	328.3
908 	552
984 	708.5
1080	987.4
1137	874.9];
data.tW_21(:,1) = data.tW_21(:,1) - 150; % d, time since settlement (birth is not observed)
units.tW_21  = {'d', 'g'};  label.tW_21 = {'time since birth', 'wet weight'};  
temp.tW_21   = C2K(12.8);  units.temp.tW_21 = 'K'; label.temp.tW_21 = 'temperature';
bibkey.tW_21 = 'Mona2011';
  
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
set1 = {'tL_1','tL_2','tL_3','tL_4','tL_5','tL_6','tL_7',}; subtitle1 = {'Individuals 1-7'};
set2 = {'tL_8','tL_9','tL_10','tL_11','tL_12','tL_13','tL_14',}; subtitle2 = {'Individuals 8-17'};
set3 = {'tL_15','tL_16','tL_17','tL_18','tL_19','tL_20','tL_21',}; subtitle3 = {'Individuals 15-21'};
set4 = {'tW_1','tW_2','tW_3','tW_4','tW_5','tW_6','tW_7',}; subtitle4 = {'Individuals 1-7'};
set5 = {'tW_8','tW_9','tW_10','tW_11','tW_12','tW_13','tW_14',}; subtitle5 = {'Individuals 8-17'};
set6 = {'tW_15','tW_16','tW_17','tW_18','tW_19','tW_20','tW_21',}; subtitle6 = {'Individuals 15-21'};
metaData.grp.sets = {set1,set2,set3,set4,set5,set6};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6};

%% Discussion points
D1 = 'I assume they grow from Lb to 0.25mm arm length in 150 days';
D2 = 'This file assumes birth at bippinaria larva hatching (4.5 d). P. ochraceus larval stages eat, but caution because their ecology is still very uncertain. This is also true for the initial period after setlement.';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'the larva shrinks when it settles, from 2.2 mm length to 0.5 mm length';
metaData.bibkey.F1 = 'Stra1978'; 
F2 = 'Pisaster are dioecious but there is no sexual dimorphism';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4J8HY'; % Cat of Life
metaData.links.id_ITIS = '157253'; % ITIS
metaData.links.id_EoL = '598469'; % Ency of Life
metaData.links.id_Wiki = 'Pisaster_ochraceus'; % Wikipedia
metaData.links.id_ADW = 'Pisaster_ochraceus'; % ADW
metaData.links.id_Taxo = '40954'; % Taxonomicon
metaData.links.id_WoRMS = '240755'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pisaster_ochraceus}}';
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
bibkey = 'Fede1956'; type = 'Phdthesis'; bib = [ ... 
'author = {Feder, H. M.}, ' ... 
'year = {1956}, ' ...
'title = {Natural history studies on the starfish \emph{Pisaster ochraceus} ({B}randt, 1835) in {M}onterey {B}ay area}, ' ...
'school = {Stanford University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Geor1999'; type = 'Article'; bib = [ ... 
'author = {George, S.}, ' ... 
'year = {1999}, ' ...
'title = {Egg quality, larval growth and phenotypic plasticity in a forcipulate seastar}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {237}, ' ...
'pages = {203--224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Meng1975'; type = 'Article'; bib = [ ... 
'author = {Menge, B. A.}, ' ... 
'year = {1975}, ' ...
'title = {Brood or broadcast? {T}he adaptive significance of different reproductive strategies in the two intertidal sea stars \emph{Leptasterias hexactis} and \emph{Pisaster ochraceus}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {31}, ' ...
'pages = {87--100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PearEern1986'; type = 'Article'; bib = [ ... 
'author = {Pearse, J. S. and Eernisse, D. J. and Pearse V. B. and Beauchamp K. A.}, ' ... 
'year = {1986}, ' ...
'title = {Photoperiodic Regulation of Gametogenesis in Sea Stars, with evidence for an Annual Calendar Independent of Fixed Daylength}, ' ...
'journal = {American Zoologist}, ' ...
'volume = {26}, ' ...
'pages = {417--431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RenSchi2008'; type = 'Article'; bib = [ ... 
'author = {Ren, J. S. and Schiel, D. R.}, ' ... 
'year = {2008}, ' ...
'title = {A dynamic energy budget model: parameterisation and application to the {P}acific oyster \emph{Crassostrea gigas} in New Zealand waters}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {361}, ' ...
'pages = {28--42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Stra1978'; type = 'Article'; bib = [ ... 
'author = {Strathmann, R.}, ' ... 
'year = {1978}, ' ...
'title = {Length of pelagic period in echinoderms with feeding larvae from the {N}ortheast {P}acific}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {34}, ' ...
'pages = {23--27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacGMacG1949'; type = 'Book'; bib = [ ...  
'author = {MacGinitie, G. E. and MacGinitie, N. }, ' ...
'year = {1949}, ' ...
'title  = {Natural history of marine animals}, ' ...
'publisher = {McGraw-Hill}, ' ...
'address = {New York}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mona2011'; type = 'Misc'; bib = ...
'note = {personal observation}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

