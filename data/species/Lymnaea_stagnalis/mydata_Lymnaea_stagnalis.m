function [data, auxData, metaData, txtData, weights] = mydata_Lymnaea_stagnalis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Lymnaeidae';
metaData.species    = 'Lymnaea_stagnalis'; 
metaData.species_en = 'Pond snail'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wd0'; 'Wdb'; 'Wdi'; 'JOb'; 'JOi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 't-Wwe'; 't-Wd_f'; 't-N_f'; 't-JOe'; 't-S'}; 

metaData.COMPLETE = 5; % using criteria of LikaKear2011

metaData.author   = {'Elke Zimmer'};    
metaData.date_subm = [2013 06 25];              
metaData.email    = {'elke.zimmer@ibacon.com'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab_20 = 13.5; units.ab_20 = 'd'; label.ab_20 = 'age at birth';          bibkey.ab_20 = 'Zimm2013';   
  temp.ab_20 = C2K(20);  units.temp.ab_20 = 'K'; label.temp.ab_20 = 'temperature';
data.ab_18 = 20;   units.ab_18 = 'd'; label.ab_18 = 'age at birth';          bibkey.ab_18 = 'Zimm2013';   
  temp.ab_18 = C2K(18);  units.temp.ab_18 = 'K'; label.temp.ab_18 = 'temperature';

data.Lb  = 0.147;  units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'Zimm2013';
data.Lj  = 1.2;    units.Lj  = 'cm';  label.Lj  = 'shell length at metam';   bibkey.Lj  = 'Zimm2013';
data.Lp  = 2.3;    units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Zimm2013';
data.Li  = 4.024;  units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Zimm2013';

data.Wd0 = 0.15e-3; units.Wd0 = 'g';  label.Wd0 = 'egg dry weight';          bibkey.Wd0 = 'Zimm2013';
data.Wdb = 1.14e-4; units.Wdb = 'g';  label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'Zimm2013';
data.Wdi = 0.699;   units.Wdi = 'g';  label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Zimm2013';
  comment.Wdi = 'excluding shell; 1.923 g including shell';

data.Ri_FLE  = 25; units.Ri_FLE  = '#/d'; label.Ri_FLE  = 'maximum reprod rate'; bibkey.Ri_FLE  = 'Zimm2013';   
  temp.Ri_FLE = C2K(20);    units.temp.Ri_FLE = 'K'; label.temp.Ri_FLE = 'temperature';
  comment.Ri_FLE = 'L = 3.2 cm';
  
data.JO_27  = 512e-6;  units.JO_27  = 'L/h'; label.JO_27  = 'O2 consumption'; bibkey.JO_27  = 'Zimm2013';   
  temp.JO_27 = C2K(21);  units.temp.JO_27 = 'K'; label.temp.JO_27 = 'temperature';
  comment.JO_27 = 'L = 2.75 cm; Ww = 1.76 g';
data.JO_1  = 3.5e-8;  units.JO_1  = 'L/h'; label.JO_1  = 'O2 consumption'; bibkey.JO_1  = 'Zimm2013';   
  temp.JO_1 = C2K(18);  units.temp.JO_1 = 'K'; label.temp.JO_1 = 'temperature';
  comment.JO_1 = 'at birth, L = 0.147 cm';
  
% uni-variate data
% time - length data
% mean values for length data regimes A, B, C, D
t_L = [0 7 14 21 28]; % d, time since start of experiment
t_L = t_L + 108 + 14; % the snails were 108 days old at the begin of acclimatisation
%
mean_L = [ 27.5243   28.7438   29.2084   29.6627   30.0138   30.3081   % cm, physical length at f_A and T
           27.5062   28.8090   28.8110   28.7877   28.7336   28.7146   % cm, physical length at f_B and T
           27.6892   29.0875   29.1573   29.2978   29.4435   29.4390   % cm, physical length at f_C and T
           27.6863   28.9016   28.8455   28.7534   28.6958   28.6661] * 0.1; % cm, physical length at f_D and T
% remove first value: before acclimation
data.tL_A = [t_L; mean_L(1,2:end)]';
units.tL_A = {'d', 'cm'};  label.tL_A = {'time since birth', 'shell length'};  
temp.tL_A  = C2K(20);  units.temp.tL_A = 'K'; label.temp.tL_A = 'temperature';
bibkey.tL_A = 'Zimm2013';
%
data.tL_B = [t_L; mean_L(2,2:end)]';
units.tL_B = {'d', 'cm'};  label.tL_B = {'time since birth', 'shell length'};  
temp.tL_B  = C2K(20);  units.temp.tL_B = 'K'; label.temp.tL_B = 'temperature';
bibkey.tL_B = 'Zimm2013';
%
data.tL_C = [t_L; mean_L(3,2:end)]';
units.tL_C = {'d', 'cm'};  label.tL_C = {'time since birth', 'shell length'};  
temp.tL_C  = C2K(20);  units.temp.tL_C = 'K'; label.temp.tL_C = 'temperature';
bibkey.tL_C = 'Zimm2013';
%
data.tL_D = [t_L; mean_L(4,2:end)]';
units.tL_D = {'d', 'cm'};  label.tL_D = {'time since birth', 'shell length'};  
temp.tL_D  = C2K(20);  units.temp.tL_D = 'K'; label.temp.tL_D = 'temperature';
bibkey.tL_D = 'Zimm2013';

% time - dry weight data
tWd = [1 29 29.1] + 108 + 14; % the snails were 108 days old at the begin of acclimatisation
Wd_A = [356.6416666667	545.84075 545.84075] * 1e-3; % g, total dry weight (including shell)
Wd_B = [356.6416666667	326.851   326.851]   * 1e-3;
Wd_C = [356.6416666667	381.363   381.363]   * 1e-3;
Wd_D = [356.6416666667	275.34575 275.34575] * 1e-3;
%		
data.tWd_A = [tWd; Wd_A]'; 
units.tWd_A = {'d', 'g'};  label.tWd_A = {'time since birth', 'total dry weight'};  
temp.tWd_A  = C2K(20);  units.temp.tWd_A = 'K'; label.temp.tWd_A = 'temperature';
bibkey.tWd_A = 'Zimm2013';
%
data.tWd_B = [tWd; Wd_B]';
units.tWd_B = {'d', 'g'};  label.tWd_B = {'time since birth', 'total dry weight'};  
temp.tWd_B  = C2K(20);  units.temp.tWd_B = 'K'; label.temp.tWd_B = 'temperature';
bibkey.tWd_B = 'Zimm2013';
%
data.tWd_C = [tWd; Wd_C]';
units.tWd_C = {'d', 'g'};  label.tWd_C = {'time since birth', 'total dry weight'};  
temp.tWd_C  = C2K(20);  units.temp.tWd_C = 'K'; label.temp.tWd_C = 'temperature';
bibkey.tWd_C = 'Zimm2013';
%
data.tWd_D = [tWd; Wd_D]';
units.tWd_D = {'d', 'g'};  label.tWd_D = {'time since birth', 'total dry weight'};  
temp.tWd_D  = C2K(20);  units.temp.tWd_D = 'K'; label.temp.tWd_D = 'temperature';
bibkey.tWd_D = 'Zimm2013';

% time - wet weight data
Ww_A = [1.5423	1.6239	1.7474	1.8560	1.9856];
Ww_B = [1.4626	1.4841	1.5181	1.4797	1.5034];
Ww_C = [1.4714	1.5100	1.5969	1.6189	1.6366];
Ww_D = [1.4565	1.4513	1.4550	1.4385	1.4207];
%		
data.tWw_A = [t_L; Ww_A]'; 
units.tWw_A = {'d', 'g'};  label.tWw_A = {'time since birth', 'total wet weight'};  
temp.tWw_A  = C2K(20);  units.temp.tWw_A = 'K'; label.temp.tWw_A = 'temperature';
bibkey.tWw_A = 'Zimm2013';
%
data.tWw_B = [t_L; Ww_B]';
units.tWw_B = {'d', 'g'};  label.tWw_B = {'time since birth', 'total wet weight'};  
temp.tWw_B  = C2K(20);  units.temp.tWw_B = 'K'; label.temp.tWw_B = 'temperature';
bibkey.tWw_B = 'Zimm2013';
%
data.tWw_C = [t_L; Ww_C]';
units.tWw_C = {'d', 'g'};  label.tWw_C = {'time since birth', 'total wet weight'};  
temp.tWw_C  = C2K(20);  units.temp.tWw_C = 'K'; label.temp.tWw_C = 'temperature';
bibkey.tWw_C = 'Zimm2013';
%
data.tWw_D = [t_L; Ww_D]';
units.tWw_D = {'d', 'g'};  label.tWw_D = {'time since birth', 'total wet weight'};  
temp.tWw_D  = C2K(20);  units.temp.tWw_D = 'K'; label.temp.tWw_D = 'temperature';
bibkey.tWw_D = 'Zimm2013';
  
% time - egg data: 
t_N = [1:29]' + 108 + 14; % the snails were 108 days old at the begin of accl.
%
mean_N =[  44.8200   54.8600   52.1300   46.5500
           21.9450   14.8750    8.6650   12.4350
           54.7300   25.5550   26.0000   15.4950
           42.1700   30.7500   35.5850   18.1850
           19.6250    4.7350    1.3550         0
           30.1100    8.2900   17.0850    2.0000
           23.3200    7.1350   12.2500    0.7000
           76.0000   11.3600   36.3200    2.2850
            5.4150    9.0000    5.6450    0.3000
           19.2800    4.6950   17.0000    1.2000
           75.9600   10.8600   38.1050    0.2500
           16.7350    7.7500    6.0000    0.5850
           35.1800    2.5000    5.4150         0
           20.1500         0   15.0850    0.5350
           80.1800   28.2500   42.0850    0.1800
           10.6050    2.7500    4.1450    0.1050
           13.1650    7.6500   19.5700         0
           83.1800   20.3050   37.4800    0.1450
           14.3900    2.3350   20.0350         0
           33.2400   15.0000   33.7350    0.1050
           24.4600    5.8450    6.4300         0
           77.1800   12.6250   40.0200         0
           25.9750    7.9600   13.8350    0.2850
           24.5700    5.8050    2.7850         0
           69.5700   16.6400   49.9150    0.1450
           23.5550   14.8200   14.6650         0
           55.4300    7.4150   15.6450         0
           22.2800    1.4900   16.2700    0.3000
           46.6800    5.5550   27.0000         0]; 
data.tN_A = [t_N, cumsum(mean_N(:,1))];
units.tN_A = {'d', '#'};  label.tN_A = {'time since birth', 'cumulative # eggs'};  
temp.tN_A  = C2K(20);  units.temp.tN_A = 'K'; label.temp.tN_A = 'temperature';
bibkey.tN_A = 'Zimm2013';
%
data.tN_B = [t_N, cumsum(mean_N(:,2))];
units.tN_B = {'d', '#'};  label.tN_B = {'time since birth', 'cumulative # eggs'};  
temp.tN_B  = C2K(20);  units.temp.tN_B = 'K'; label.temp.tN_B = 'temperature';
bibkey.tN_B = 'Zimm2013';
%
data.tN_C = [t_N, cumsum(mean_N(:,3))];
units.tN_C = {'d', '#'};  label.tN_C = {'time since birth', 'cumulative # eggs'};  
temp.tN_C  = C2K(20);  units.temp.tN_C = 'K'; label.temp.tN_C = 'temperature';
bibkey.tN_C = 'Zimm2013';
%
data.tN_D = [t_N, cumsum(mean_N(:,4))];  
units.tN_D = {'d', '#'};  label.tN_D = {'time since birth', 'cumulative # eggs'};  
temp.tN_D  = C2K(20);  units.temp.tN_D = 'K'; label.temp.tN_D = 'temperature';
bibkey.tN_D = 'Zimm2013';

% data for embryo
data.tWw_e = [ ... % age (d), wet weight (mug)
         1.9795 0.4176;
        2.6763	0.84894;
        3.2172	1.3299;
        3.6104 	2.394;
        3.7825 	2.6837;
        3.934	3.0705;
        3.9664	4.0888;
        4.0364	3.2153;
        4.1958	4.6205;
        4.2696 	4.62;
        4.4414	5.6857;
        4.4533	6.6555;
        4.8992	9.4166;
        4.9689	9.3676;
        5.2306	11.257;
        5.9505	15.471;
        6.0893	17.264;
        6.285	20.076;
        6.5422	23.081;
        6.9694	32.001;
        7.2883	34.327;
        7.9502	51.49;
        7.9578	53.284;
        8.6342	64.579;
        8.9831	85.77;
        9.7763	102.79];
data.tWw_e(:,2) = data.tWw_e(:,2) * 1e-6; % convert to mug to g
units.tWw_e = {'d', 'g'};  label.tWw_e = {'age', 'embryo wet weight'};  
temp.tWw_e  = C2K(23);  units.temp.tWw_e = 'K'; label.temp.tWw_e = 'temperature';
bibkey.tWw_e = 'Hors1958';
%
data.tJO_e = [ ... % age (d), O2 consumption (nL/h)
        9.7918e-002	3.1025e-001;
        3.2332e-001	4.9045e-001;
        4.5139e-001	6.1075e-001;
        7.0239e-001	8.5138e-001;
        9.4825e-001	1.1527e+000;
        1.1583e+000	1.2724e+000;
        1.3735e+000	1.4527e+000;
        1.5988e+000	1.7541e+000;
        2.0444e+000	2.4783e+000;
        2.2134e+000	2.6589e+000;
        2.4950e+000	3.3237e+000;
        2.6894e+000	4.2922e+000;
        2.8122e+000	4.7762e+000;
        2.9809e+000	5.8662e+000;
        3.1239e+000	7.0776e+000;
        3.2109e+000	7.5013e+000;
        3.6443e+000	1.3318e+001;
        3.7618e+000	1.4469e+001;
        3.9800e+000	2.0287e+001;
        3.9899e+000	2.1196e+001;
        4.2299e+000	2.3498e+001;
        4.3622e+000	2.6164e+001;
        4.4737e+000	2.9437e+001;
        4.9603e+000	3.0161e+001;
        4.9686e+000	3.5556e+001;
        4.9733e+000	3.6587e+001;
        5.1728e+000	3.7495e+001;
        5.4733e+000	4.2767e+001;
        5.8098e+000	4.7250e+001;
        5.9752e+000	4.3490e+001;
        6.0971e+000	4.6460e+001;
        6.3058e+000	5.0278e+001;
        6.5599e+000	5.6156e+001;
        6.9597e+000	5.5668e+001;
        7.3166e+000	7.4883e+001;
        7.9660e+000	7.8636e+001;
        7.9806e+000	8.0698e+001;
        8.6303e+000	9.7909e+001;
        9.0275e+000	1.0457e+002;
        9.7741e+000	1.2306e+002];
units.tJO_e = {'d', 'nL/h'};  label.tJO_e = {'age', 'embryo O2 consumption'};  
temp.tJO_e  = C2K(23);  units.temp.tJO_e = 'K'; label.temp.tJO_e = 'temperature';
bibkey.tJO_e = 'Hors1958';

% several food level data
% time - length
data.tL_100 = [  ...  % time (d), shell length (cm)
             0 1.292;
        	14 1.865;
        	28 2.155;
        	42 2.376;
        	56 2.567;
        	70 2.715;
        	84 2.795;
        	98 2.819;
        	112 2.827;
        	128 2.924;
        	140 2.953];
data.tL_100(:,1) = data.tL_100(:,1) + 113; % convert time to time since birth
units.tL_100 = {'d', 'cm'};  label.tL_100 = {'time since birth', 'shell length'};  
temp.tL_100  = C2K(20);  units.temp.tL_100 = 'K'; label.temp.tL_100 = 'temperature';
bibkey.tL_100 = 'Zimm2013';
comment.tL_100 = 'ad libitum';
%
data.tN_100= [ ... % time since birth (d), cumulative number of eggs (#)
113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152	153	154	155	156	157	158	159	160	161	162	163	164	165	166	167	168	169	170	171	172	173	174	175	176	177	178	179	180	181	182	183 184	185	186	187	188	189	190	191	192	193	194	195	196	197	198	199	200	201	202	203	204	205	206	207	208	209	210	211	212	213	214	215	216	217	218 219	220	221	222	223	224	225	226	227	228	229	230	231	232	233	234	235	236	237	238	239	240	241	242	243	244	245	246	247	248	249	250	251	252	253;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9.6 11.5 17.2 18.6 19.3 19.3 25.1 32.6 43.9 49.9 55.2 57.7 70.5 76.0 94.9 104.3 105.9 118.6 130.0 135.4 142.0 157.3 163.4 174.6 185.4 197.6 205.9 219.8 252.5 252.5 256.3 256.3 259.0 276.1 296.0 321.9 321.9 327.7 340.0 366.2 375.6 389.7 396.5 402.0 407.7 423.4 426.5 441.0 455.3 466.8 468.2 468.2 505.9 517.4 525.4 534.6 562.7 579.9 579.9 587.8 593.0 608.3 615.2 634.5 643.0 646.6 655.4 662.3 666.4 676.8 701.5 709.3 709.3 726.5 737.9 740.4 766.3 781.2 789.4 804.1 813.1 826.5 840.2 858.9 865.3 875.9 875.9 898.1 910.3 926.8 929.0 934.0 980.0 980.6 991.7 1013.8 1020.3 1023.1 1030.1 1051.8 1053.1 1053.1 1068.8 1073.3 1088.3]';
units.tN_100 = {'d', 'cm'};  label.tN_100 = {'time since birth', 'cumulative # eggs'};  
temp.tN_100  = C2K(20);  units.temp.tN_100 = 'K'; label.temp.tN_100 = 'temperature';
bibkey.tN_100 = 'Zimm2013';
comment.tN_100 = 'ad libitum';
%
data.tL_50 = [  ...  % time (d), shell length (cm)
             0 1.280;
        	14 1.672;
        	28 1.939;
        	42 2.136;
        	56 2.337;
        	70 2.455;
        	84 2.551;
        	98 2.593;
        	112 2.632;
        	128 2.661;
        	140 2.682];
data.tL_50(:,1) = data.tL_50(:,1) + 113; % convert time to time since birth
units.tL_50 = {'d', 'cm'};  label.tL_50 = {'time since birth', 'shell length'};  
temp.tL_50  = C2K(20);  units.temp.tL_50 = 'K'; label.temp.tL_50 = 'temperature';
bibkey.tL_50 = 'Zimm2013';
%
data.tN_50= [ ... % time since birth (d), cumulative number of eggs (#)
113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152	153	154	155	156	157	158	159	160	161	162	163	164	165	166	167	168	169	170	171	172	173	174	175	176	177	178	179	180	181	182	183 184	185	186	187	188	189	190	191	192	193	194	195	196	197	198	199	200	201	202	203	204	205	206	207	208	209	210	211	212	213	214	215	216	217	218 219	220	221	222	223	224	225	226	227	228	229	230	231	232	233	234	235	236	237	238	239	240	241	242	243	244	245	246	247	248	249	250	251	252	253;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.1 1.1 1.1 1.1 2.4 4.2 4.2 4.2 5.0 5.0 8.6 12.0 13.6 17.3 21.4 25.5 25.5 36.1 38.5 43.7 44.7 46.7 48.0 53.8 60.3 66.1 72.0 79.3 79.3 87.3 94.6 94.6 94.6 98.2 106.8 109.1 111.2 114.8 120.1 138.6 141.9 153.4 158.3 164.3 171.9 174.1 180.0 191.3 196.1 196.1 202.5 214.7 225.5 228.8 235.0 238.6 238.6 242.2 249.8 266.8 272.5 275.0 279.9 279.9 284.1 294.9 298.5 300.2 302.6 308.6 320.7 334.8 334.8 355.0 358.0 364.3 368.0 368.0 368.0 380.2 388.0 392.5 397.4 413.9 413.9 419.2 419.2 434.9 438.6 449.0 457.7 462.2 473.4 475.9 481.3 496.6 503.5 514.1 515.8 526.3 528.5 548.2 556.6 560.8 583.0]';
units.tN_50 = {'d', 'cm'};  label.tN_50 = {'time since birth', 'cumulative # eggs'};  
temp.tN_50  = C2K(20);  units.temp.tN_50 = 'K'; label.temp.tN_50 = 'temperature';
bibkey.tN_50 = 'Zimm2013';
%
%
data.tL_25 = [  ...  % time (d), shell length (cm)
0 1.262;
        14 1.448;
        28 1.702;
        42 1.925;
        56 2.110;
        70 2.223;
        84 2.295;
        98 2.324;
        112 2.371;
        128 2.406;
        140 2.415];
data.tL_25(:,1) = data.tL_25(:,1) + 113; % convert time to time since birth
units.tL_25 = {'d', 'cm'};  label.tL_25 = {'time since birth', 'shell length'};  
temp.tL_25  = C2K(20);  units.temp.tL_25 = 'K'; label.temp.tL_25 = 'temperature';
bibkey.tL_25 = 'Zimm2013';
%
data.tN_25= [ ... % time since birth (d), cumulative number of eggs (#)
113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152	153	154	155	156	157	158	159	160	161	162	163	164	165	166	167	168	169	170	171	172	173	174	175	176	177	178	179	180	181	182	183 184	185	186	187	188	189	190	191	192	193	194	195	196	197	198	199	200	201	202	203	204	205	206	207	208	209	210	211	212	213	214	215	216	217	218 219	220	221	222	223	224	225	226	227	228	229	230	231	232	233	234	235	236	237	238	239	240	241	242	243	244	245	246	247	248	249	250	251	252	253;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0 0.0 0.0 0.0 0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.8 0.8 1.6 1.6 2.4 2.4 2.4 2.5 2.5 5.8 5.8 6.8 6.8 6.8 7.9 10.2 11.3 16.3 16.3 16.3 23.8 23.8 23.8 23.8 24.4 25.3 26.4 33.4 42.6 42.6 43.7 46.9 46.9 52.6 56.1 60.8 60.8 64.3 64.3 72.1 72.1 77.3 82.0 82.0 83.7 86.4 91.4 92.5 96.9 107.5 108.7 108.7 112.1 121.4 127.4 128.4 135.4 135.4 135.4 135.4 143.6 145.8 146.9 156.1 156.1 156.1 166.3 174.0 182.0 183.7 187.7 187.7 187.7 187.7 207.1 210.9 213.5 216.9 220.9 228.6 228.6 229.9 241.6 247.3 249.6 253.0 257.6 264.7 269.4 276.1 279.2 281.9]';
units.tN_25 = {'d', 'cm'};  label.tN_25 = {'time since birth', 'cumulative # eggs'};  
temp.tN_25  = C2K(20);  units.temp.tN_25 = 'K'; label.temp.tN_25 = 'temperature';
bibkey.tN_25 = 'Zimm2013';

% time - length data
t_FLE = [27 44 58 71 85 99 113 127 141 155 169 183 197 211 225 239 253 267 281 295 309 323 337]';
L_FLE = [1.65 2.42 2.84 3.29 3.69 4.66 6.1 8.94 11.64 15.53 20.5 24.64 27.74 29.78 30.98 31.92 33.17 34.27 34.59 35.23 35.31 35.49 35.63]'*.1;
data.tL_FLE = [t_FLE L_FLE];
units.tL_FLE = {'d', 'cm'};  label.tL_FLE = {'time since birth', 'shell length'};  
temp.tL_FLE  = C2K(20);  units.temp.tL_FLE = 'K'; label.temp.tL_FLE = 'temperature';
bibkey.tL_FLE = 'Zimm2013';

data.tL_BohlJoos1982 = [ ...  % time (d), shell length (mm)
       55.90145234 17.8523408;
       63.25671895 21.36572276;
       70.00024651 22.52342908;
       77.05463452 22.94399613;
       84.15644207 24.76855237;
       91.00033738 26.03443734;
       98.26518495 26.79690698;
      105.728116   27.7414943;
      112.5580256  28.43092997;
      119.2821051  29.33754571;
      126.4196227  29.64373385;
      133.3472481  30.40710854;
      140.4796201  30.25097947;
      147.1348723  31.06074749;
      154.4813983  30.89833587;
      161.3573093  30.99403788;
      168.9291646  31.76139136];
data.tL_BohlJoos1982(:,2) = data.tL_BohlJoos1982(:,2)/ 10; % convert mm to cm
units.tL_BohlJoos1982 = {'d', 'cm'};  label.tL_BohlJoos1982= {'time', 'shell length'};  
temp.tL_BohlJoos1982  = C2K(20);  units.temp.tL_BohlJoos1982 = 'K'; label.temp.tL_BohlJoos1982 = 'temperature';
bibkey.tL_BohlJoos1982 = 'BohlJoos1982';

% age - survival data
data.tS = [ ... % time since birth (d), surviving fraction
      89.92594801 0.9959453046;
      96.56351905 0.9926548978;
      104.011651  0.9869984529;
      107.5969786 0.9841922392;
      113.1410448 0.9827533916;
      118.3912325 0.9796830726;
      122.3763732 0.9751353436;
      125.2734764 0.9729976702;
      130.7956735 0.9693248373;
      133.7037113 0.9683041565;
      137.2781043 0.9643809502;
      141.7013293 0.9620011802;
      145.8197411 0.9568729461;
      160.2375936 0.9534670401;
      161.2764255 0.9460305175;
      163.3575006 0.9457003858;
      170.4461465 0.9317105136;
      185.1086719 0.924909612;
      191.9690468 0.9159902243;
      192.0476449 0.9098247559;
      194.9283462 0.9060115935;
      204.0030672 0.8961815689;
      205.8852637 0.8897299863;
      211.8018066 0.8837571417;
      215.0003117 0.869825019;
      216.1286764 0.8573400207;
      218.7100319 0.8513368906;
      220.7419013 0.8459802919;
      223.3396587 0.8416526507;
      226.8867153 0.8349369628;
      228.2030239 0.8274564226;
      230.4631644 0.8170293394;
      232.9276507 0.8132822034;
      235.73181   0.8016500923;
      235.8302212 0.8117030263;
      236.6373709 0.7947940749;
      237.3823242 0.7857260809;
      238.1546141 0.7794505686;
      240.3197546 0.7735134648;
      241.5868575 0.7610064577;
      243.8798018 0.7539303525;
      245.207045  0.747566805;
      246.9122321 0.7372277569;
      251.4632608 0.7337089854;
      253.4055975 0.7334008625;
      256.0033549 0.7290732213;
      257.5021402 0.7260386431;
      259.1451311 0.7235405524;
      260.3445705 0.7183160064;
      261.2282622 0.7092260036;
      263.2710662 0.7049863976;
      265.1990572 0.6890183686;
      265.2865338 0.6979543099;
      267.2309266 0.6836617699;
      268.9907867 0.6789076851;
      270.018684  0.6703541699;
      271.3349926 0.6628736298;
      273.9546192 0.6607799739;
      275.0317221 0.6572529257;
      276.5195728 0.6531013548;
      278.2575637 0.6461132846;
      279.606676  0.6419837225;
      281.2059286 0.6350176612;
      282.5550409 0.630888099;
      284.597845  0.626648493;
      285.5307423 0.6225849572;
      287.246864  0.6133629018;
      289.8282195 0.6073597716;
      291.7541544 0.6053761597;
      293.391678  0.6023195726;
      296.0789681 0.5929434557;
      297.2838748 0.588277406;
      298.6275199 0.5835893476;
      299.5330807 0.5767333301;
      300.5773799 0.5698553039;
      302.8429877 0.559986717;
      303.1607915 0.5498677567;
      305.8808854 0.5438426178;
      315.1107465 0.5356660734;
      316.065513  0.533836523;
      319.5688313 0.5226528644;
      320.2351865 0.5197503388;
      321.2794857 0.5128723126;
      324.6385983 0.5011521665;
      326.5590659 0.4986100582;
      326.7490659 0.4896300993;
      327.6327576 0.4805400966;
      328.5547204 0.4753595681;
      331.5796273 0.4720828933;
      334.9988802 0.4665062068;
      336.9084132 0.4628471058;
      339.628507  0.4568219669;
      341.671311  0.4525823609;
      344.6688816 0.4465132043;
      347.6883212 0.4426780332;
      348.4496765 0.4352855282;
      351.3194432 0.4303553731;
      358.1634162 0.4197604964;
      360.0565473 0.4144259065;
      361.3345849 0.4030358921;
      362.5340243 0.3978113461;
      364.949305  0.389037743;
      365.0572957 0.3716803392;
      365.1557069 0.3817332732;
      367.9215951 0.3661916878;
      372.1951472 0.362716934;
      375.6253346 0.3582572401;
      376.958045  0.352452189;
      378.2852882 0.3460886415;
      380.1674847 0.339637058;
      383.2709898 0.3301949157;
      385.0089807 0.3232068456;
      386.6137006 0.3167992805;
      389.1731869 0.3085621651;
      391.4551966 0.3003690671;
      392.9211781 0.2939835109;
      394.5149634 0.2864589532;
      395.7089355 0.2806759109;
      398.8507117 0.2751432419;
      403.9293573 0.2687439537;
      407.5768812 0.2580967827;
      409.8643581 0.2504621811;
      412.4457136 0.2444590509;
      415.9873029 0.2371848666;
      418.6964622 0.230042735;
      421.4274906 0.2251345887;
      423.8591732 0.2180364747;
      427.1506223 0.2135987896;
      429.9766507 0.2042006639;
      431.5923051 0.1989100916;
      434.4784738 0.1956554255;
      437.0707639 0.190769288;
      439.1135679 0.1865296819;
      442.821232  0.1820259705;
      445.7347371 0.1815637861;
      448.6099711 0.1771921274;
      453.2505325 0.1686248802;
      455.7314207 0.1665532331;
      457.7578229 0.1606381381;
      459.0686642 0.1525991016;
      462.0607674 0.1459714488;
      464.9031978 0.1382488121;
      466.8072634 0.1340312148;
      470.316049  0.1234060525;
      472.7914699 0.1207759091;
      476.2216573 0.1163162153;
      478.958153  0.1119665653;
      493.2775943 0.0985077254;
      493.9002112 0.0911372292;
      496.8813799 0.0833925837;
      500.8883898 0.08107884003;
      501.8595582 0.08092477856;
      507.6537646 0.07664943173;
      510.1291855 0.07401928834;
      513.1540925 0.07074261348;
      516.5952145 0.06739991228;
      523.3387201 0.06073651866;
      524.84844   0.05881893307;
      527.6122721 0.05726176476;
      544.5274148 0.05345970069;
      546.4533496 0.05147608875;
      547.6801255 0.04904402439;
      548.9123687 0.04717045637;
      559.5788188 0.04380029116;
      561.7548939 0.03898018;
      563.9473708 0.03583555784;
      563.9473709 0.03583555784;
      570.4298017 0.03089167078;
      576.8958306 0.02427229472;
      578.8108309 0.02117169012;
      590.6657859 0.01145998624;
      609.7658821 0.01793922071;
      672.5302836 0.01357621451];
units.tS = {'d', '-'};  label.tS = {'time since birth', 'surviving fraction'};  
temp.tS  = C2K(20);  units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = 'SlobJans1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tN_100(data.tN_100(:,2) < 5) = 0;
weights.tN_50(data.tN_50(:,2) < 5) = 0;
weights.tN_25(data.tN_25(:,2) < 5) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_A','tL_B','tL_C','tL_D'}; subtitle1 = {'Regime A, B, C, D'};
set2 = {'tWd_A','tWd_B','tWd_C','tWd_D'}; subtitle2 = {'Regime A, B, C, D'};
set3 = {'tWw_A','tWw_B','tWw_C','tWw_D'}; subtitle3 = {'Regime A, B, C, D'};
set4 = {'tN_A','tN_B','tN_C','tN_D'}; subtitle4 = {'Regime A, B, C, D'};
set5 = {'tL_100','tL_50','tL_25'}; subtitle5 = {'At 100, 50, 25 % of max ration'};
set6 = {'tN_100','tN_50','tN_25'}; subtitle6 = {'At 100, 50, 25 % of max ration'};
metaData.grp.sets = {set1,set2,set3,set4,set5,set6};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6};

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'This entry is discussed in Zimm2013, ZimmDucr2014, Zonn1992';
metaData.bibkey.F2 = {'Zimm2013', 'ZimmDucr2014', 'Zonn1992'}; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3WS6G'; % Cat of Life
metaData.links.id_ITIS = '76487'; % ITIS
metaData.links.id_EoL = '453306'; % Ency of Life
metaData.links.id_Wiki = 'Lymnaea_stagnalis'; % Wikipedia
metaData.links.id_ADW = 'Lymnaea_stagnalis'; % ADW
metaData.links.id_Taxo = '38499'; % Taxonomicon
metaData.links.id_WoRMS = '181582'; % WoRMS
metaData.links.id_molluscabase = '181582'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lymnaea_stagnalis}}';
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
bibkey = 'Zimm2013'; type = 'Phdthesis'; bib = [ ... 
'author = {Zimmer, E.}, ' ... 
'year = {2013}, ' ...
'title = {The pond snail under stress: interactive effects of food limitation, toxicants and copulation explained by {D}ynamic {E}nergy {B}udget theory}, ' ...
'school = {VU University Amsterdam}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zonn1992'; type = 'Phdthesis'; bib = [ ... 
'author = {Zonneveld, C.}, ' ... 
'year = {2013}, ' ...
'title = {Animal energy budgets: a dynamic approach}, ' ...
'school = {VU University Amsterdam}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hors1958'; type = 'Article'; bib = [ ... 
'author = {Horstmann, H. J.}, ' ... 
'year = {1958}, ' ...
'title = {Sauerstoffverbrauch und {T}rockengewicht der {E}mbryonen von \emph{Lymnaea stagnalis} {L}}, ' ...
'journal = {Z. Vgl. Physiol.}, ' ...
'volume = {41}, ' ...
'pages = {390--404}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZimmDucr2014'; type = 'Article'; bib = [ ... 
'author = {Zimmer, E. and Ducrot, V. and Jager, T. and Koene, J. and Lagadic, L. and Kooijman, S. A. L. M.}, ' ... 
'year = {2014}, ' ...
'title = {Metabolic acceleration in the pond snail \emph{Lymnaea stagnalis}?}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {84--91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SlobJans1988'; type = 'Article'; bib = [ ... 
'author = {Slob, W. and Janse, C.}, ' ... 
'year = {1988}, ' ...
'title = {A quantitative method to evaluate the quality of interrupted animal cultures in aging studies}, ' ...
'journal = {Mech. Ageing Dev.}, ' ...
'volume = {42}, ' ...
'pages = {275--290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BohlJoos1982'; type = 'Article'; bib = [ ... 
'author = {Bohlken, S. and Joosse, J.}, ' ... 
'year = {1982}, ' ...
'title = {The effect of photoperiod on female reproductive activity and growth of the fresh water pulmonate snail \emph{Lymnaea stagnalis} kept laboratory conditions}, ' ...
'journal = {J. Invertebr. Reprod.}, ' ...
'volume = {4}, ' ...
'pages = {213--222}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

