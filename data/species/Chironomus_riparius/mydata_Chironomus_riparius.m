function [data, auxData, metaData, txtData, weights] = mydata_Chironomus_riparius

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Diptera'; 
metaData.family     = 'Chironomidae';
metaData.species    = 'Chironomus_riparius'; 
metaData.species_en = 'Harlequin fly'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0eFl', '0eFp', '0eFm', 'eiTg'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'tp'; 'te'; 'Lb'; 'Lj'; 'Wd0'; 'Wdj'; 'Wde'; 'Ni_f'; 'Ni_T'; 'ae_T'; 'Wwj_f'; 'astar_f';'tj_f'}; 
metaData.data_1     = {'t-Wd_T';'t-Ww_f';'t-L_fT'; 'L-Wd'; 't-S'; 'Wd-JO';'tj_T'}; 

metaData.COMPLETE = 3; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2017 09 27];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso Norway'};   

metaData.author_mod_1   = {'Andre Gergs'};    
metaData.date_mod_1     = [2019 08 22];              
metaData.email_mod_1    = {'andre.gergs@bayer.com'};            
metaData.address_mod_1  = {'Bayer AG, Monheim, Germany'}; 

metaData.author_mod_2   = {'Andre Gergs'};    
metaData.date_mod_2     = [2022 08 22];              
metaData.email_mod_2    = {'andre.gergs@bayer.com'};            
metaData.address_mod_2  = {'Bayer AG, Monheim, Germany'}; 

metaData.author_mod_3   = {'Evridiki Klagkou','Andre Gergs','Christian Baden','Dina Lika'};    
metaData.date_mod_3     = [2024 09 13];              
metaData.email_mod_3    = {'lika@uoc.gr'};            
metaData.address_mod_3  = {'Univ of Crete, Heraklion, Greece'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 09 21];

%% set data
% zero-variate data
data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'PeryMons2002';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'i assume here that the 2-d old individuals used at the start of the experiment were newly hatched 1st instar larvae, SahrRafa2010 also report 2-d at 26 deg C';
data.tp = 7; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'CharFerr2014';   
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'assume that instars 1-3 are juveniles';
data.tj = 15;  units.tj = 'd';    label.tj = 'time since birth at pupation'; bibkey.tj = 'PeryGarr2006';   
  temp.tj = C2K(21);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tj_15 = 25;  units.tj_15 = 'd';    label.tj_15 = 'time since birth at pupation'; bibkey.tj_15 = 'PeryGarr2006';   
  temp.tj_15 = C2K(15);  units.temp.tj_15 = 'K'; label.temp.tj_15 = 'temperature';
 
data.tj_fB1 = 15.28;  units.tj_fB1 = 'd';    label.tj_fB1 = 'time since birth at pupation'; bibkey.tj_fB1 = 'KlagGerg2024b';   
  temp.tj_fB1 = C2K(21);  units.temp.tj_fB1 = 'K'; label.temp.tj_fB1 = 'temperature';
  comment.tj_fB1 = '0.6 mg/larvae/day';
data.tj_fB2 = 17.00;  units.tj_fB2 = 'd';    label.tj_fB2 = 'time since birth at pupation'; bibkey.tj_fB2 = 'KlagGerg2024b';   
  temp.tj_fB2 = C2K(21);  units.temp.tj_fB2 = 'K'; label.temp.tj_fB2 = 'temperature';
  comment.tj_fB2 = '0.3 mg/larvae/day';
data.tj_fB3 = 21.15;  units.tj_fB3 = 'd';    label.tj_fB3 = 'time since birth at pupation'; bibkey.tj_fB3 = 'KlagGerg2024b';   
  temp.tj_fB3 = C2K(21);  units.temp.tj_fB3 = 'K'; label.temp.tj_fB3 = 'temperature';
  comment.tj_fB3 = '0.15 mg/larvae/day';
data.tj_fB4 = 31.40;  units.tj_fB4 = 'd';    label.tj_fB4 = 'time since birth at pupation'; bibkey.tj_fB4 = 'KlagGerg2024b';   
  temp.tj_fB4 = C2K(21);  units.temp.tj_fB4 = 'K'; label.temp.tj_fB4 = 'temperature';
  comment.tj_fB4 = '0.1 mg/larvae/day'; 

data.t1 = 2; units.t1 = 'd'; label.t1 = 'duration of instar 1'; bibkey.t1 = 'CharFerr2014';   
  temp.t1 = C2K(21); units.temp.t1 = 'K'; label.temp.t1 = 'temperature'; 
data.t2 = 2; units.t2 = 'd'; label.t2 = 'duration of instar 2'; bibkey.t2 = 'CharFerr2014';   
  temp.t2 = C2K(21); units.temp.t2 = 'K'; label.temp.t2 = 'temperature'; 
data.t3 = 3; units.t3 = 'd'; label.t3 = 'duration of instar 3'; bibkey.t3 = 'CharFerr2014';   
  temp.t3 = C2K(21); units.temp.t3 = 'K'; label.temp.t3 = 'temperature';  

data.tj_f3 = 12; units.tj_f3 = 'd'; label.tj_f3 = 'time at pupation since birth'; bibkey.tj_f3 = 'CharFerr2014';   
  temp.tj_f3 = C2K(21); units.temp.tj_f3 = 'K'; label.temp.tj_f3 = 'temperature'; 
  comment.tj_f3 = '0.3 mg/larvae/day';
data.tj_f2 = 12.52; units.tj_f2 = 'd'; label.tj_f2 = 'time at pupation since birth'; bibkey.tj_f2 = 'CharFerr2014';   
  temp.tj_f2 = C2K(21); units.temp.tj_f2 = 'K'; label.temp.tj_f2 = 'temperature'; 
  comment.tj_f2 = '0.2 mg/larvae/day';
data.tj_f1 = 21; units.tj_f1 = 'd'; label.tj_f1 = 'time at pupation since birth'; bibkey.tj_f1 = 'CharFerr2014';   
  temp.tj_f1 = C2K(21); units.temp.tj_f1 = 'K'; label.temp.tj_f1 = 'temperature'; 
  comment.tj_f1 = '0.1 mg/larvae/day';

data.te = 19.29;    units.te = 'd';    label.te = 'time at emergence in extra 20 degC controls';  bibkey.te = 'Gaia2022';
    temp.te = C2K(20);  units.temp.te = 'K'; label.temp.te = 'temperature';

data.Lb = 0.09; units.Lb = 'cm'; label.Lb = 'length at birth';      bibkey.Lb = 'KlagGerg2024b';
data.Lj = 1.38; units.Lj = 'cm'; label.Lj = 'female length of 4th instar larvae before pupation';      bibkey.Lj = 'PeryMons2002';

data.Wd0 = 0.99 *1e-6; units.Wd0 = 'g'; label.Wd0 = 'initial egg ash free dry weight';      bibkey.Wd0 = 'PentHolo1995';
  comment.Wd0 = 'the authors work with ash-free dry weight'; 
data.Wwj = 10*1e-3; units.Wwj = 'g'; label.Wwj = 'fem. max observed wet weight of 4th instar larvae';      bibkey.Wwj = 'SildCran2000';
  comment.Wwj = 'max value of fem. control wet wt. from fig. 1';
data.Wde = 1.1*1e-3; units.Wde = 'g'; label.Wde = 'fem. dry weight of imago';     bibkey.Wde = 'RodrGrav2015';
  comment.Wde = 'fig. 3d';
  

%% uni-variate data

% feeding level-eggs/female
data.JXNi = [ ... % feeding level (mg/d.larvae), average number of eggs/female (#)
    0.2 151.6
    0.3 195.588
    0.4 273.852];
units.JXNi = {'mg/d.larvae','#'}; label.JXNi = {'tetramin feeding level','average number of eggs/female'}; 
temp.JXNi = C2K(21); units.temp.JXNi = 'K'; label.temp.JXNi = 'temperature';
bibkey.JXNi = 'PeryMons2002'; treat.JXNi = {0}; title.JXNi = 'Egg production at various larval feeding levels';
comment.JXNi = 'each female produces 1 clutch of eggs';
%
data.JXNi1 = [ ... % feeding level (mg/d.larvae), average number of eggs/female (#)
    0.6  420
    0.3  325
    0.15 275
    0.1  227];
units.JXNi1 = {'mg/d.larvae','#'}; label.JXNi1 = {'feeding level','average number of eggs/female'}; 
temp.JXNi1 = C2K(21); units.temp.JXNi1 = 'K'; label.temp.JXNi1 = 'temperature';
bibkey.JXNi1 = 'KlagGerg2024b'; treat.JXNi1 = {0}; title.JXNi1 = 'Egg production at various larval feeding levels';
comment.JXNi1 = 'each female produces 1 clutch of eggs';

% length - weight data 
data.LW = [ ... % cubic length cm^3 - weight mg
6.189e-001	2.811e-001
8.045e-001	3.940e-001
8.045e-001	3.692e-001
8.341e-001	4.242e-001
9.480e-001	4.711e-001
1.166e+000	5.483e-001
1.193e+000	6.390e-001
1.403e+000	8.069e-001
1.435e+000	8.179e-001
1.421e+000	7.135e-001
1.520e+000	7.851e-001
1.527e+000	8.125e-001
1.644e+000	8.402e-001
1.819e+000	9.228e-001];
data.LW(:,1) = data.LW(:,1).^(1/3); % cm^3 to cm
units.LW   = {'cm', 'mg'};  label.LW = {'length', 'dry weight'};  
temp.LW    = C2K(21);  units.temp.LW = 'K'; label.temp.LW = 'temperature';
bibkey.LW = 'PeryMons2002';
comment.LW = 'data obtained with fourth-instar larvae for two different diets (0.2, 0.3, and 1.4 mg/d.larvae)';

% time - length
data.tL = [ ...
    0   1.81
    1   2.76
    2   3.43
    3   4.922
3.995	6.273
5.000	8.540
6.005	10.747
6.987	12.803
7.999	13.677
8.995	13.823];
data.tL(:,2) = data.tL(:,2)/ 10; % convert cm to  mm
data.tL(:,1) = data.tL(:,1) + 2; % d, organisms where 2d old at the start of the experiment
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length', 'female'};  
temp.tL    = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PeryMons2002';
comment.tL = 'fig 3, fig 4, ad libitum 1.4 mg/ind tetramin, female';
%
data.tL_m = [ ...
    0   1.81
    1   2.76
    2   3.43
    3   4.922
3.995	6.273
5.000	7.965
6.012	9.566
7.001	11.106
7.998	11.404
9.002	11.399];
data.tL_m(:,2) = data.tL_m(:,2)/ 10; % convert cm to  mm
data.tL_m(:,1) = data.tL_m(:,1) + 2; % d, organisms where 2d old at the start of the experiment
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PeryMons2002';
comment.tL_m = 'fig 3, fig 4, ad libitum 1.4 mg/ind tetramin, male';

% Eco-physiological information by PeryMons2002
% Chironomidae had been cultured prior to the experiments
% according to standard methods. The first day of the experiment,
% 2-d-old organisms were put in beakers. The volume of these
% beakers was 0.6 L, and the surface area was 14 cm2. They
% contained 0.11 L artificial sediment and 0.44 L water from an
% uncontaminated spring near our laboratory (pH 8.1 and conductivity
% 400 ms/cm).

% time-length data of 4 instars at different food levels
% 0.4 mg tetramin/larvae/d
data.tL4 = [...
0.013	1.795
2.009	3.354
3.013	4.608
4.008	6.477
5.034	8.064
6.018	10.472
7.993	12.236];
data.tL4(:,2) = data.tL4(:,2)/ 10; % convert cm to  mm
data.tL4(:,1) = data.tL4(:,1) + 2; % convert time to day since birth
units.tL4   = {'d', 'cm'};  label.tL4 = {'time since birth', 'length', '0.4 mg/d'};  
temp.tL4    = C2K(21);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'PeryMons2002';
comment.tL4 = 'fig 5';
% 0.3 mg tetramin/ind/d
data.tL3 = [ ...
0.035	1.769
2.009	3.251
3.013	4.685
4.007	6.015
5.033	7.526
6.027	9.472
8.024	11.544];
data.tL3(:,2) = data.tL3(:,2)/ 10; % convert cm to  mm
data.tL3(:,1) = data.tL3(:,1) + 2; % convert time to day since birth
units.tL3   = {'d', 'cm'};  label.tL3 = {'time since birth', 'length', '0.3 mg/d'};  
temp.tL3    = C2K(21);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'PeryMons2002';
comment.tL3 = 'fig 5';
% 0.2 mg/tetramin/individual
data.tL2 = [ ... % time since start of experiment (d), length(mm)
0.024	1.744
2.020	3.354
3.035	4.505
3.996	5.605
5.021	6.936
6.026	8.472
8.011	10.313
10.018	11.923];
data.tL2(:,2) = data.tL2(:,2)/ 10; % convert cm to  mm
data.tL2(:,1) = data.tL2(:,1) + 2; % convert time to day since birth
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since birth', 'length', '0.2 mg/d'};  
temp.tL2    = C2K(21);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'PeryMons2002';
comment.tL2 = 'fig 5';
% 0.1 mg tetramin/ ind/d
data.tL1 = [ ...
1.999	3.303
3.013	4.146
4.006	5.503
5.031	6.654
6.024	7.318
8.020	8.903
10.015	9.744];
data.tL1(:,2) = data.tL1(:,2)/ 10; % convert cm to  mm
data.tL1(:,1) = data.tL1(:,1) + 2; % convert time to day since birth
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'length', '0.1 mg/d'};  
temp.tL1    = C2K(21);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'PeryMons2002';
comment.tL1 = 'fig 5';

% time-length at various temperatures
% 15 deg C
data.tL15 = [ ...
% 0.034	1.424
2.026	2.221
4.000	3.090
4.996	4.103
6.043	4.828
7.021	5.721
8.034	6.807
9.013	8.521
9.991	9.534
11.021	10.645
12.017	11.345
12.996	12.045
14.043	12.648];
data.tL15(:,2) = data.tL15(:,2)/ 10; % convert cm to  mm
data.tL15(:,1) = data.tL15(:,1) + 2; % convert time to day since birth
units.tL15   = {'d', 'cm'};  label.tL15 = {'time since birth', 'length', '15 deg C'};  
temp.tL15    = C2K(15);  units.temp.tL15 = 'K'; label.temp.tL15 = 'temperature';
bibkey.tL15 = 'PeryGarr2006';
comment.tL15 = 'fig 1, ad libitum';
% 19.6 deg, ad libitum
data.tL196 = [ ...
0.052	1.738
2.026	3.331
4.017	5.117
5.013	6.324
6.043	8.328
7.039	9.824
8.017	11.369
9.013	12.045
10.026	12.503];
data.tL196(:,2) = data.tL196(:,2)/ 10; % convert cm to  mm
data.tL196(:,1) = data.tL196(:,1) + 2; % convert time to day since birth
units.tL196   = {'d', 'cm'};  label.tL196 = {'time since birth', 'length', '19.6 deg C'};  
temp.tL196    = C2K(19.6);  units.temp.tL196 = 'K'; label.temp.tL196 = 'temperature';
bibkey.tL196 = 'PeryGarr2006';
comment.tL196 = 'fig 1, ad libitum';
% 21 deg, ad libitum
data.tL21 = [ ...
0.001	1.714
2.009	3.355
4.000	6.397
5.013	8.303
6.026	10.066
7.021	12.093
8.017	12.648
9.030	12.576];
data.tL21(:,2) = data.tL21(:,2)/ 10; % convert cm to  mm
data.tL21(:,1) = data.tL21(:,1) + 2; % convert time to day since birth
units.tL21   = {'d', 'cm'};  label.tL21 = {'time since birth', 'length', '21 deg C'};  
temp.tL21    = C2K(21);  units.temp.tL21 = 'K'; label.temp.tL21 = 'temperature';
bibkey.tL21 = 'PeryGarr2006';
comment.tL21 = 'fig 1, ad libitum';
% 24.4 ad libitum
data.tL244 = [ ...
0.034	1.738
2.043	3.741
4.017	7.241
5.013	10.259
6.026	11.755
7.021	12.286
8.017	12.648
9.030	12.576];
data.tL244(:,2) = data.tL244(:,2)/ 10; % convert cm to  mm
data.tL244(:,1) = data.tL244(:,1) + 2; % convert time to day since birth
units.tL244   = {'d', 'cm'};  label.tL244 = {'time since birth', 'length', '24.4 deg C'};  
temp.tL244    = C2K(24.4);  units.temp.tL244 = 'K'; label.temp.tL244 = 'temperature';
bibkey.tL244 = 'PeryGarr2006';
comment.tL244 = 'fig 1, ad libitum';
% 26.7 
data.tL267 = [ ...
0.001	1.810
2.043	3.693
4.017	7.917
5.013	10.452
6.043	12.648
7.073	12.648];
data.tL267(:,2) = data.tL267(:,2)/ 10; % convert cm to  mm
data.tL267(:,1) = data.tL267(:,1) + 2; % convert time to day since birth
units.tL267   = {'d', 'cm'};  label.tL267 = {'time since birth', 'length', '26.7 deg C'};  
temp.tL267    = C2K(26.7);  units.temp.tL267 = 'K'; label.temp.tL267 = 'temperature';
bibkey.tL267 = 'PeryGarr2006';
comment.tL267 = 'fig 1, ad libitum';

% time-length at different temperatures at limiting food:
% 15 deg C, 0.2 mg tetramin/d
data.tL15f = [ ...
0.017	1.402
2.012	2.245
3.992	3.066
5.006	4.088
6.019	4.755
7.017	5.599
8.016	7.022
10.028	9.000
12.040	11.023
14.035	12.022];
data.tL15f(:,2) = data.tL15f(:,2)/ 10; % convert cm to  mm
data.tL15f(:,1) = data.tL15f(:,1) + 2; % convert time to day since birth
units.tL15f   = {'d', 'cm'};  label.tL15f = {'time since birth', 'length', '15 deg C'};  
temp.tL15f    = C2K(15);  units.temp.tL15f = 'K'; label.temp.tL15f = 'temperature';
bibkey.tL15f = 'PeryGarr2006';
comment.tL15f = 'fig 1, 0.2 mg tetramin/d';
% 19.6 deg, 0.2 mg/tetramen/d
data.tL196f = [ ...
0.017	1.447
1.998	3.336
4.025	5.002
4.977	6.314
6.007	7.604
8.019	9.804
10.062	11.315];
data.tL196f(:,2) = data.tL196f(:,2)/ 10; % convert cm to  mm
data.tL196f(:,1) = data.tL196f(:,1) + 2; % convert time to day since birth
units.tL196f   = {'d', 'cm'};  label.tL196f = {'time since birth', 'length', '19.6 deg C'};  
temp.tL196f    = C2K(19.6);  units.temp.tL196f = 'K'; label.temp.tL196f = 'temperature';
bibkey.tL196f = 'PeryGarr2006';
comment.tL196f = 'fig 3, limiting food 0.2 mg/d';
% 21 deg, 0.2 mg tetramin/d
data.tL21f = [ ...
0.033	1.447
1.982	3.291
3.995	6.360
4.994	7.961
6.040	8.984
7.007	10.184
7.989	11.095
9.018	11.383];
data.tL21f(:,2) = data.tL21f(:,2)/ 10; % convert cm to  mm
data.tL21f(:,1) = data.tL21f(:,1) + 2; % convert time to day since birth
units.tL21f   = {'d', 'cm'};  label.tL21f = {'time since birth', 'length', '21 deg C'};  
temp.tL21f    = C2K(21);  units.temp.tL21f = 'K'; label.temp.tL21f = 'temperature';
bibkey.tL21f = 'PeryGarr2006';
comment.tL21f = 'fig 3, limiting food level 0.2 mg/d';
% 26.7 deg C, 0.2 mg tetramin/d
data.tL267f = [ ...
0.033	1.224
1.998	3.714
3.996	6.761
5.011	8.429
6.025	9.785
7.023	10.429
8.020	10.917
9.002	11.806];
data.tL267f(:,2) = data.tL267f(:,2)/ 10; % convert cm to  mm
data.tL267f(:,1) = data.tL267f(:,1) + 2; % convert time to day since birth
units.tL267f   = {'d', 'cm'};  label.tL267f = {'time since birth', 'length', '26.7 deg C'};  
temp.tL267f    = C2K(26.7);  units.temp.tL267f = 'K'; label.temp.tL267f = 'temperature';
bibkey.tL267f = 'PeryGarr2006';
comment.tL267f = 'fig 3, 0.2 mg/d';

% survival from starvation experiment
data.tS  =[... % t in days and S in number of surviving individuals, -
0	1
3	0.44
4	0.26
5	0.04
6	0.01
7   0];
units.tS = {'d', '-'}; label.tS = {'starvation period', 'fraction surviving', 'fed'};      
temp.tS  = C2K(20); units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = {'Baye2019'};
comment.tS = 'mortality of starved chironomids';

% survival from starvation experiment
data.tS2  =[... % t in days and S in number of surviving individuals, -
0	1
3	0.96
4	0.96
5	0.92
6   0.86
7   0.84];
units.tS2 = {'d', '-'}; label.tS2 = {'starvation period', 'fraction surviving', 'starved'};      
temp.tS2  = C2K(20); units.temp.tS2 = 'K'; label.temp.tS2 = 'temperature';
bibkey.tS2 = {'Baye2019'};
comment.tS2 = 'background mortality for fed chironomids';

% dry weight-O2 consumption
data.WdJO_20  = [... % dry weight (mg) - spec O2 consumption (mug/h.mg)
0.12562	6.30013
0.10866	6.04895
0.22639	6.17987
0.26837	6.11979
0.19685	5.97663
0.23882	5.89262
0.24716	5.78487
0.29756	5.74868
0.25968	5.64121
0.24275	5.43789
0.30561	5.1623
0.33067	4.92284
0.29261	4.50426
0.51948	4.47897
0.57413	4.52651
0.69168	4.35828
0.81369	4.6208
0.95233	4.60801
0.98183	4.73945
0.77541	3.85522
0.82563	3.51988
0.9854	3.69841
1.02305	3.42297
1.01866	3.09992
1.09841	2.96782
1.11961	3.29077
1.13651	3.44622
1.12406	3.69758
1.12832	3.80524
1.19577	4.16381
1.25838	3.48139
1.51056	3.6115
1.60269	3.10839
1.72885	3.28712
1.83368	2.92752
1.93864	2.79527];
units.WdJO_20 = {'mg', 'mug/h.mg'}; label.WdJO_20 = {'dry weight', 'oxygen consumption', '20 C'};      
temp.WdJO_20  = C2K(20); units.temp.WdJO_20 = 'K'; label.temp.WdJO_20 = 'temperature';
bibkey.WdJO_20 = {'Edwa1956'};

data.WdJO_10  =[... % dry weight (mg) - spec oxygen consumption (mug/h.mg)
0.08386	2.20548
0.10901	2.34853
0.14256	2.39591
0.17191	2.38361
0.24319	2.43054
0.25577	2.34677
0.26834	2.22717
0.27673	2.13151
0.23061	2.06039
0.20126	1.86961
0.13836	2.02565
0.17191	2.16859
0.33543	1.92773
0.2935	1.70127
0.37736	1.6286
0.45702	1.67543
0.47799	1.85436
0.53669	1.77004
0.65409	1.8642
0.62474	1.67342
0.587	1.57831
0.58281	1.47085
0.72956	1.40937
0.87631	1.5868
1.09434	1.59614
1.06498	1.47704
1.06499	1.34564
1.05241	1.23828
0.95597	0.97664
1.19078	1.28441
1.24528	1.23598
1.27883	1.41476
1.38784	1.294
1.47589	1.05404
1.53459	1.31614
1.6478	1.00421
1.7652	1.06253];
units.WdJO_10 = {'mg', 'mug/h.mg'}; label.WdJO_10 = {'dry weight', 'oxygen consumption', '10 C'};      
temp.WdJO_10  = C2K(10); units.temp.WdJO_10 = 'K'; label.temp.WdJO_10 = 'temperature';
bibkey.WdJO_10 = {'Edwa1956'};

% time-body length at different feeding levels
data.tL_fB = [ % time since birth (d), bodylength (mm) for 0.6, 0.3, 0.15, 0.1 mg/larvae/day
     0  NaN    0.92   0.92   0.92
     3  NaN    2.48   2.30   2.35
     4  3.51   NaN    NaN    NaN
     7  6.89   8.37   7.33   8.19
     9 10.87  11.24   9.91   9.13
    11 13.17  12.82  11.51  10.36
    14 14.49  14.38  14.19  10.54
    15  NaN   13.54  11.83  11.23
    16  NaN   14.69  12.58  11.43
    17  NaN    NaN   11.74  13.38
    18  NaN    NaN   14.22  12.05
    21  NaN    NaN    NaN   12.36
    22  NaN    NaN    NaN   11.50
    24  NaN    NaN    NaN   12.55
    25  NaN    NaN    NaN   12.81
    28  NaN    NaN    NaN   13.54];
data.tL_fB(:,1) = data.tL_fB(:,1) + 1; % age of insect at day 0 of the experiment is approx 1 day.
data.tL_fB(:,2:5) = data.tL_fB(:,2:5)/ 10; % convert mm to  cm
units.tL_fB  = {'d', 'g'};  label.tL_fB = {'time since birth', 'wet weight'};  
temp.tL_fB  = C2K(21);  units.temp.tL_fB = 'K'; label.temp.tL_fB = 'temperature';  
treat.tL_fB = {1 {'0.6','0.3','0.15','0.1'}}; label.treat.tL_fB = 'mg/d.larvae';
bibkey.tL_fB = 'KlagGerg2024b'; title.tL_fB = 'Growth at various feeding levels';

% time-wet weight at different feeding levels
data.tWw_fB = [ % time since birth (d), wet weight (mg) for 0.6, 0.3, 0.15, 0.1 mg/larvae/day
     0 NaN    NaN    NaN    NaN
     3 NaN    NaN    NaN    NaN
     4 0.02   NaN    NaN    NaN
     7 1.40   2.24   1.54   1.93
     9 5.19   3.61   2.99   2.48
    11 7.11   7.04   4.75   3.58
    14 9.47   9.73   7.95   3.93
    15 NaN    8.13   5.01   4.50
    16 NaN    9.52   5.60   4.44
    17 NaN    NaN    4.99   7.52
    18 NaN    NaN    8.59   5.27
    21 NaN    NaN    NaN    4.43
    22 NaN    NaN    NaN    4.40
    24 NaN    NaN    NaN    6.08
    25 NaN    NaN    NaN    6.68
    28 NaN    NaN    NaN    6.67];
data.tWw_fB(:,1) = data.tWw_fB(:,1) + 1; % age of insect at day 0 of the experiment is approx 1 day.
data.tWw_fB(:,2:5) = data.tWw_fB(:,2:5)/ 10^3; % convert mg to g
units.tWw_fB  = {'d', 'g'};  label.tWw_fB = {'time since birth', 'wet weight'};  
temp.tWw_fB  = C2K(21);  units.temp.tWw_fB = 'K'; label.temp.tWw_fB = 'temperature';  
treat.tWw_fB = {1 {'0.6','0.3','0.15','0.1'}}; label.treat.tWw_fB = 'mg/d.larvae';
bibkey.tWw_fB = 'KlagGerg2024b'; title.tWw_fB = 'Growth at various feeding levels';

%% set weights for all real data
weights = setweights(data, []);
% weight settings were determined experimentally after much estimations
% with different starting values

weights.tj_f3 = 5*weights.tj_f3;
weights.tj_f2 = 5*weights.tj_f2;
weights.tj_f1 = 5*weights.tj_f1;

weights.tj_fB1 = 5*weights.tj_fB1;
weights.tj_fB2 = 5*weights.tj_fB2;
weights.tj_fB3 = 5*weights.tj_fB3;
weights.tj_fB4 = 5*weights.tj_fB4;
 
weights.JXNi = 3 * weights.JXNi;
weights.JXNi1 = 8 * weights.JXNi1;

weights.tp = 3 * weights.tp;
weights.LW = 3 * weights.LW;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.99; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.k = 0.1;
weights.psd.k_J = 0 * weights.psd.k_J;
weights.psd.kap_G = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.title = title;

%% Group plots
set1 = {'tL', 'tL_m'}; subtitle1 = {'PeryMons2002 data for females, males'};
set2 = {'tL4', 'tL3', 'tL2', 'tL1'}; subtitle2 = {'PeryMons2002 data 0.4, 0.3, 0.2 and 0.1 mg/d'};
set3 = {'tL267', 'tL244', 'tL21', 'tL196','tL15'}; subtitle3 = {'PeryMons2002 ad libitum 26.7, 24.4, 21, 19.6  and 15 C'};
set4 = {'tL267f', 'tL21f', 'tL196f','tL15f'}; subtitle4 = {'PeryMons2002 limited food 26.7, 21, 19.6  and 15 C'};
set5 = {'tS', 'tS2'}; subtitle5 = {'Mortality of fed and starved larvae'};
set6 = {'WdJO_20', 'WdJO_10'}; subtitle6 = {'Edwa1956 at 10 and 20 C'};
metaData.grp.sets = {set1,set2,set3,set4,set5,set6};  
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6};

%% Facts
F1 = 'Its life cycle comprises aquatic stages (egg, four larval instars, and a pupal stage) and an aerial adult stage.';
metaData.bibkey.F1 = 'PeryMons2002'; 
F2 = 'Widely distributed in the northern hemisphere at temperate latitudes. Lentic and lotic environments, usually in organically enriched waters';
metaData.bibkey.F2 = 'PeryMons2002'; 
F3 = 'larvae, collector-gatherers, feed on sediment-deposited detritus';
metaData.bibkey.F3 = 'PeryMons2002'; 
F4 = 'if head capsule width is not taken into account, C. riparius can be considered isomorphic during the larval development.';
metaData.bibkey.F4 = 'PeryMons2002'; 
F5 = 'Adult females produce 1 egg mass';
metaData.bibkey.F5 = 'SahrRafa2010'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3, 'F4', F4, 'F5', F5);

%% Discussion points
D1 = 'we assume that all the data from PeryMons2002 and PeryGarr2006 are in time since birth, and that it the 2-d old individuals at the start of the experiment just hatched';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'I assume time since birth in the time axis of the data';
D4 = ['the maintenance is high, which is a stark contract to the assumption of 0 maintenance costs by the authors of the data used here: PeryMons2002 PeryGarr2006. ...' ...
    'The mydata file contains heat production data (as well as the reference) which is not yet implemented. One might consider implementing this to see if such high maintenance is consistent with that additional information.'];
D5 = 'mod_1: time-Survival and Weight-respiration data added';
D6 = 'mod_3: Additional data include: time-length, time-weight, time at pupation, time at emergence and reproduction data at different feeding levels at constant temperature. The life span data is not used anymore as adult longevity is not related to ageing for this species.';
D7 = 'mod_3: The selection of the mainenance ratio k=0.99 as pseudo-data, is based on the implied property of the model that when k=1, stage transitions occur at fixed structural length';
D8 = 'mod_3: Data from KlagGerg2024b are modeled using a time-variable functional response: f=1 during L1-L3 due to increased food availability at the beginning of the experiments at all feeding levels, followed by a linear decrease to a minimum value';
D9 = 'mod_3: Puberty event was specified using information from various studies as pointed out in KlagGerg2024b. Instars 1-3 are assumed to be juvenile and instar 4 is assumed to be adult';
D10 = ['mod_3: To match the prolonged duration of the L4 stage, we have assumed a biphasic growth: in Phase I larva allocates energy to growth, reproduction,' ...
    'and maintenance according to the κ-rule and in Phase II larva stops  allocating energy to increase structural mass and reproduction buffer, it save energy for essential processes occurring during the subsequent non-feeding stages '];
D11 = 'The transition from Phase I to phase II occurs when  ER/V = [ER]j and the transition to phase II to pupation when e=[E]/[E_m]=1. More information in KlagGerg2024b';
D12 = 'mod_3: Maternal effect is not used for this species and reproductive reserves are asummed to be dry weight';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6, 'D7',D7, 'D8',D8, 'D9',D9, 'D10',D10, 'D11',D11, 'D12',D12);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the European Food Safety Authority (grant number OC/EFSA/SCER/2015/01). mod_3 of this entry was financially supported by Bayer.)';

%% Links
metaData.links.id_CoL = '8BGDM'; % Cat of Life
metaData.links.id_ITIS = '129313'; % ITIS
metaData.links.id_EoL = '745125'; % Ency of Life
metaData.links.id_Wiki = 'Chironomus_riparius'; % Wikipedia
metaData.links.id_ADW = 'Chironomus_riparius'; % ADW
metaData.links.id_Taxo = '315139'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_diptera = 'Chironomus+riparius'; % Diptera

%% References
bibkey = 'Baye2019'; type = 'Misc'; bib = [ ...
'year = {2019}, ' ...
'howpublished = {unpblished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CharFerr2014'; type = 'Article'; bib = [ ... 
'author = {Charles, S. and  Ferreol, M. and Chaumot, A. and Pery, A.R.R.}, ' ... 
'year = {2014}, ' ...
'title = {Food availability effect on population dynamics of the midge \emph{Chironomus riparius}: a {L}eslie modeling approach}, ' ...
'journal = {Ecological Modeling}, ' ...
'volume = {175}, ' ...
'pages = {217-229}, '...
'doi = {-}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Edwa1956'; type = 'Article'; bib = [ ... 
'author = {Edwards, R.W.}, ' ... 
'year = {1958}, ' ...
'title = {The relation of oxygen consumption to body Size and to temperature in the larvae of \emph{Chironomus riparius} {M}eigen}, ' ...
'journal = {Journal of Experimental Biology}, ' ...
'volume = {35}, ' ...
'number = {-}, ' ...
'pages = {383--395}, '...
'doi = {-}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gaia2022'; type = 'Misc'; bib = [ ...
    'year = {2022}, ' ...
    'howpublished = {supplementary material in Koch et al, 2024}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KlagGerg2024b'; type = 'Article'; bib = [ ... 
'author = {Klagkou, E. and Gergs, A. and Baden, C.U. and Lika, K.}, ' ... 
'year = {2024}, ' ...
'title = {Modeling the bioenergetics and life history traits of \emp{Chironomus riparius} — consequences of food limitation}, ' ...
'journal = {Insects}, '...
'note = {to be submitted}, '...
'volume = { }, ' ...
'pages = { }'];
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
bibkey = 'PentHolo1995'; type = 'Article'; bib = [ ... 
'author = {Penttinen, O.-P. and Holopainen, I. J.}, ' ... 
'year = {1995}, ' ...
'title = {Physiological energetics of a midge, \emph{Chironomus riparius} {M}eigen ({I}nsecta, {D}iptera): normoxic heat output over the whole life cycle and response of larva to hypoxia and anoxia}, ' ...
'journal = {Oecologia}, ' ...
'volume = {103}, ' ...
'number = {4}, ' ...
'pages = {419--424}, '...
'doi = {10.1007/BF00328679}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PeryMons2002'; type = 'Article'; bib = [ ... 
'author = {P\''{e}ry, Alexandre R. R. and Mons, Rapha\"{e}l and Flammarion, Patrick and Lagadic, Laurent and Garric, Jeanne}, ' ... 
'year = {2002}, ' ...
'title = {A modeling approach to link food availability, growth, emergence, and reproduction for the midge \emph{Chironomus riparius}}, ' ...
'journal = {Environmental Toxicology and Chemistry}, ' ...
'volume = {21}, ' ...
'number = {11}, ' ...
'pages = {2507--2513}, '...
'doi = {10.1002/etc.5620211133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PeryGarr2006'; type = 'Article'; bib = [ ... 
'author = {P\''{e}ry, Alexandre and R. R. Garric, Jeanne}, ' ... 
'year = {2006}, ' ...
'title = {Modelling Effects of Temperature and Feeding Level on the Life Cycle of the Midge \emph{Chironomus riparius}: {A}n Energy-Based Modelling Approach}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {553}, ' ...
'number = {1}, ' ...
'pages = {59}, '...
'doi = {10.1007/s10750-005-1284-0}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrGrav2015'; type = 'Article'; bib = [ ... 
'author = {A. C. M.. Rodrigues and C. Gravato and C. Quintaneiro and C. Barata and A. M. V. M. Soares and J. L. T. Pestana}, ' ... 
'year = {2015}, ' ...
'title = {Sub-lethal toxicity of environmentally relevant concentrations of esfenvalerate to \emph{Chironomus riparius}}, ' ...
'journal = {Environmental Pollution}, ' ...
'volume = {207}, ' ...
'number = {9}, ' ...
'pages = {273--279}, '...
'doi = {10.1016/j.envpol.2015.09.035}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SahrRafa2010'; type = 'Article'; bib = [ ... 
'author = {A. Sahragard and M. Rafatifard}, ' ... 
'year = {2006}, ' ...
'title = {BIOLOGY AND EFFECT OF TEMPERATURE ON LARVAL DEVELOPMENT TIME OF \emph{Chironomus riparius} {M}EIGEN ({D}IPTERA: {C}HIRONOMIDAE) UNDER LABORATORY CONDITIONS}, ' ...
'journal = {Munis Entomology \& Zoology}, ' ...
'volume = {5}, ' ...
'pages = {1025--1033}, '...
'url = {http://www.munisentzool.org/yayin/vol5/suppl/1025-1033.pdf}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SildCran2000'; type = 'Article'; bib = [ ... 
'author = {Sildanchandra, W. and Crane, M.}, ' ... 
'year = {2000}, ' ...
'title = {Influence of sexual dimorphism in \emph{Chironomus riparius} {M}eigen on toxic effects of cadmium}, ' ...
'journal = {Environmental Toxicology and Chemistry}, ' ...
'volume = {19}, ' ...
'number = {9}, ' ...
'pages = {2309--2313}, '...
'doi = {10.1002/etc.5620190921}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chironomus_riparius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

