function [data, auxData, metaData, txtData, weights] = mydata_Gadus_morhua

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Gadus_morhua'; 
metaData.species_en = 'Atlantic cod'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lj'; 'Lp'; 'Li'; 'Wwh'; 'Wwj'; 'Wwi'; 'Ri'; 'GSI'; 'E0'}; 
metaData.data_1     = {'t-L_T'; 't-Wd_T'; 't-Ww_f'; 'L-Ww'; 't-p+'; 't-JOe'; 't-JNe'; 't-VY'; 't-E'; 't-Wwe'; 't-Wde'; 'T-ab'; 'L-N'}; 

metaData.COMPLETE = 3.4; % using criteria of LikaKear2011

metaData.author   = {'Tessa van der Hammen'; 'Chris Klok'; 'Starrlight Augustine'; 'Bas Kooijman'};  
metaData.date_subm = [2012 03 16];                      
metaData.email    = {'tessa.vanderhammen@wur.nl'};             
metaData.address  = {'IMARES, IJmuiden'};   

metaData.author_mod_1   = {'Goncalo Marques'; 'Starrlight Augustine'; 'Bas Kooijman'};  
metaData.date_mod_1 = [2016 04 04];                      
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};             
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};  
metaData.date_mod_2 = [2022 02 24];                      
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};             
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 02 24]; 

%% set data
% zero-variate data;

data.ah = 256/24;  units.ah = 'd'; label.ah = 'age at hatch'; bibkey.ah = 'BuslSerg2010';  
  temp.ah = C2K(7);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 346/24;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'FinnHend1995'; 
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = data.ah + 42; units.aj = 'd'; label.aj = 'age at metam'; bibkey.aj = 'OtteNyha1999';
  temp.aj = C2K(6); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = data.ah + 2628; units.ap = 'd'; label.ap = 'age at puberty'; bibkey.ap = 'ThorWitt2010';
  temp.ap = C2K(5); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for Barentz sea'; 
data.am = 25 * 365; units.am = 'd';    label.am = 'life span'; bibkey.am = 'fishbase';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.42;   units.Lh  = 'cm';   label.Lh  = 'total length at hatch';   bibkey.Lh  = 'OtteNyha1999';  
data.Lj  = 1.376;  units.Lj  = 'cm';   label.Lj  = 'total length at metam';   bibkey.Lj  = 'OtteNyha1999'; 
data.Lp  = 78;     units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ThorWitt2010';
  comment.Lp = '50 percent maturation in Barents Sea (smaller in warmer regions, Thor2010)';
data.Li  = 200;    units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'KjesKlun1991';

data.Wwh = 0.0016;   units.Wwh = 'g';    label.Wwh = 'wet weight at hatch';     bibkey.Wwh = 'PaulKses2009';
  comment.Wwh = 'based on egg diameter of 1.45 mm: pi/6*0.145^3';
data.Wwj = 1.26e-3;units.Wwj = 'g';    label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'OtteNyha1999';
data.Wwi = 96e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 43e6/ 365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'KjesKlun1991';   
temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Temp has been increased from 3.2 to 10 C since allocation to reproduction is during a full year';

data.GSI  = 0.199; units.GSI  = '-';  label.GSI  = 'gonado-somatic index ';   bibkey.GSI  = 'FinnFyhn1995';   
temp.GSI = C2K(11); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

data.E0  = 2.1; units.E0  = 'J';  label.E0  = 'initial egg energy';           bibkey.E0  = 'FinnFyhn1995';   

% uni-variate data
% time vs Total length (ref 1, Otterlei) at f = 1 
% T = 273 + 4
data.tL_OtteNyha1999_4 = [2 7 14 21 28 35 42 49 56 ;                % d, time since hatch
        5.02 5.19 5.8 6.5 6.84 7.46 8.16 9.31 9.38]';               % mm, TL at f and T        
data.tL_OtteNyha1999_4(:,2) = data.tL_OtteNyha1999_4(:,2)/ 10;      % convert mm to cm
units.tL_OtteNyha1999_4 = {'d', 'cm'}; label.tL_OtteNyha1999_4 = {'time since hatch', 'total length', '4 C'};
temp.tL_OtteNyha1999_4 = C2K(4); units.temp.tL_OtteNyha1999_4 = 'K'; label.temp.tL_OtteNyha1999_4 = 'temperature';
bibkey.tL_OtteNyha1999_4 = 'OtteNyha1999';
%
% T = 273 + 6        
data.tL_OtteNyha1999_6 = [2 7 14 21 28 35 42 49 56 ;                % d, time since hatch
    5.29 5.72 6.52 7.86 9.01 11.34 13.75 15.27 17.78]';             % mm, TL at f and T
data.tL_OtteNyha1999_6(:,2) = data.tL_OtteNyha1999_6(:,2)/ 10;      % convert mm to cm
units.tL_OtteNyha1999_6 = {'d', 'cm'}; label.tL_OtteNyha1999_6 = {'time since hatch', 'total length', '6 C'};
temp.tL_OtteNyha1999_6 = C2K(6); units.temp.tL_OtteNyha1999_6 = 'K'; label.temp.tL_OtteNyha1999_6 = 'temperature';
bibkey.tL_OtteNyha1999_6 = 'OtteNyha1999';
%
% T = 273 + 8        
data.tL_OtteNyha1999_8 = [2 7 14 21 28 35 42 49 56 ;                % d, time since hatch
      5.2 5.72 6.71 7.68 10.19 13.77 19.36 22.76 30.06]';           % mm, TL at f and T        
data.tL_OtteNyha1999_8(:,2) = data.tL_OtteNyha1999_8(:,2)/ 10;      % convert mm to cm
units.tL_OtteNyha1999_8 = {'d', 'cm'}; label.tL_OtteNyha1999_8 = {'time since hatch', 'total length', '8 C'};
temp.tL_OtteNyha1999_8 = C2K(8); units.temp.tL_OtteNyha1999_8 = 'K'; label.temp.tL_OtteNyha1999_8 = 'temperature';
bibkey.tL_OtteNyha1999_8 = 'OtteNyha1999';
%        
% T = 273 + 10        
data.tL_OtteNyha1999_10 = [2 7 14 21 28 35 42 49 56 ;               % d, time since hatch
       5.29 5.81 7.06 10.66 14.15 17.29 22.51 26.64 31.68]';        % mm, TL at f and T
data.tL_OtteNyha1999_10(:,2) = data.tL_OtteNyha1999_10(:,2)/ 10;    % convert mm to cm
units.tL_OtteNyha1999_10 = {'d', 'cm'}; label.tL_OtteNyha1999_10 = {'time since hatch', 'total length', '10 C'};
temp.tL_OtteNyha1999_10 = C2K(10); units.temp.tL_OtteNyha1999_10 = 'K'; label.temp.tL_OtteNyha1999_10 = 'temperature';
bibkey.tL_OtteNyha1999_10 = 'OtteNyha1999';
%
% T = 273 + 12        
data.tL_OtteNyha1999_12 = [2 7 14 21 28 35 42 49 56 ;               % d, time since hatch
       5.29 5.72 7.42 11.28 15.42 19.82 26.3 33.69 38.18]';         % mm, TL at f and T        
data.tL_OtteNyha1999_12(:,2) = data.tL_OtteNyha1999_12(:,2)/ 10;    % convert mm to cm
units.tL_OtteNyha1999_12 = {'d', 'cm'}; label.tL_OtteNyha1999_12 = {'time since hatch', 'total length', '12 C'};
temp.tL_OtteNyha1999_12 = C2K(12); units.temp.tL_OtteNyha1999_12 = 'K'; label.temp.tL_OtteNyha1999_12 = 'temperature';
bibkey.tL_OtteNyha1999_12 = 'OtteNyha1999';
%
% T = 273 + 14
data.tL_OtteNyha1999_14 = [2 7 14 21 28 35 42 49 56 ;               % d, time since hatch
        5.29 5.72 7.87 12 17.22 23.08 30.55 38.65 44.05]';          % mm, TL at f and T        
data.tL_OtteNyha1999_14(:,2) = data.tL_OtteNyha1999_14(:,2)/ 10;    % convert mm to cm
units.tL_OtteNyha1999_14 = {'d', 'cm'}; label.tL_OtteNyha1999_14 = {'time since hatch', 'total length', '14 C'};
temp.tL_OtteNyha1999_14 = C2K(14); units.temp.tL_OtteNyha1999_14 = 'K'; label.temp.tL_OtteNyha1999_14 = 'temperature';
bibkey.tL_OtteNyha1999_14 = 'OtteNyha1999';
 
%  time vs dry weight (ref 1, Otterlei) at f = 1 
% now using NA (north east arctic cod)
%  T = 273 + 4
data.tWd_OtteNyha1999_4 = [2 7 14 21 28 35 42 49 56 ;                % d, time since hatch
        0.028 0.024 0.034 0.055 0.084 0.095 0.146 0.244 0.277]';    % mg, dry weight at f and T       
data.tWd_OtteNyha1999_4(:,2) = 1e-3 * data.tWd_OtteNyha1999_4(:,2);   % g, convert mg to g
units.tWd_OtteNyha1999_4 = {'d', 'g'}; label.tWd_OtteNyha1999_4 = {'time since hatch', 'dry weight', '4 C'};
temp.tWd_OtteNyha1999_4 = C2K(4); units.temp.tWd_OtteNyha1999_4 = 'K'; label.temp.tWd_OtteNyha1999_4 = 'temperature';
bibkey.tWd_OtteNyha1999_4 = 'OtteNyha1999';
%
%  T = 273 + 6        
data.tWd_OtteNyha1999_6 = [2 7 14 21 28 35 42 49 56 ;                % d, time since hatch
        0.028 0.036 0.06 0.161 0.244 0.604 1.255 1.865 3.299]';     % mg, dry weight at f and T        
data.tWd_OtteNyha1999_6(:,2) = 1e-3 * data.tWd_OtteNyha1999_6(:,2);   % g, convert mg to g
units.tWd_OtteNyha1999_6 = {'d', 'g'}; label.tWd_OtteNyha1999_6 = {'time since hatch', 'dry weight', '6 C'};
temp.tWd_OtteNyha1999_6 = C2K(6); units.temp.tWd_OtteNyha1999_6 = 'K'; label.temp.tWd_OtteNyha1999_6 = 'temperature';
bibkey.tWd_OtteNyha1999_6 = 'OtteNyha1999';
%
%  T = 273 + 8        
data.tWd_OtteNyha1999_8 = [2 7 14 21 28 35 42 49 56 ;                % d, time since hatch
       0.028 0.03 0.069 0.094 0.289 2.472 5.458 8.852 21.28]';      % mg, dry weight at f and T       
data.tWd_OtteNyha1999_8(:,2) = 1e-3 * data.tWd_OtteNyha1999_8(:,2);   % g, convert mg to g
units.tWd_OtteNyha1999_8 = {'d', 'g'}; label.tWd_OtteNyha1999_8 = {'time since hatch', 'dry weight', '8 C'};
temp.tWd_OtteNyha1999_8 = C2K(8); units.temp.tWd_OtteNyha1999_8 = 'K'; label.temp.tWd_OtteNyha1999_8 = 'temperature';
bibkey.tWd_OtteNyha1999_8 = 'OtteNyha1999';
%
%  T = 273 + 10
data.tWd_OtteNyha1999_10 = [2 7 14 21 28 35 42 49 56 ;               % d, time since hatch
       0.033 0.041 0.121 0.515 1.548 3.6 8.615 15.737 31.808]';     % mg, dry weight at f and T        
data.tWd_OtteNyha1999_10(:,2) = 1e-3 * data.tWd_OtteNyha1999_10(:,2); % g, convert mg to g
units.tWd_OtteNyha1999_10 = {'d', 'g'}; label.tWd_OtteNyha1999_10 = {'time since hatch', 'dry weight', '10 C'};
temp.tWd_OtteNyha1999_10 = C2K(10); units.temp.tWd_OtteNyha1999_10 = 'K'; label.temp.tWd_OtteNyha1999_10 = 'temperature';
bibkey.tWd_OtteNyha1999_10 = 'OtteNyha1999';
%
%  T = 273 + 12
data.tWd_OtteNyha1999_12 = [2 7 14 21 28 35 42 49 56 ;              % d, time since hatch
       0.032 0.045 0.105 0.571 2.35 5.822 16.368 39.685 65.011]';   % mg, dry weight at f and T        
data.tWd_OtteNyha1999_12(:,2) = 1e-3 * data.tWd_OtteNyha1999_12(:,2); % g, convert mg to g
units.tWd_OtteNyha1999_12 = {'d', 'g'}; label.tWd_OtteNyha1999_12 = {'time since hatch', 'dry weight', '12 C'};
temp.tWd_OtteNyha1999_12 = C2K(12); units.temp.tWd_OtteNyha1999_12 = 'K'; label.temp.tWd_OtteNyha1999_12 = 'temperature';
bibkey.tWd_OtteNyha1999_12 = 'OtteNyha1999';
%
%  T = 273 + 14        
data.tWd_OtteNyha1999_14 = [2 7 14 21 28 35 42 49 56 ;              % d, time since hatch
       0.031 0.038 0.13 0.824 3.87 10.093 30.322 69.302 103.891]';  % mg, dry weight at f and T        
data.tWd_OtteNyha1999_14(:,2) = 1e-3 * data.tWd_OtteNyha1999_14(:,2); % g, convert mg to g
units.tWd_OtteNyha1999_14 = {'d', 'g'}; label.tWd_OtteNyha1999_14 = {'time since hatch', 'dry weight', '14 C'};
temp.tWd_OtteNyha1999_14 = C2K(14); units.temp.tWd_OtteNyha1999_14 = 'K'; label.temp.tWd_OtteNyha1999_14 = 'temperature';
bibkey.tWd_OtteNyha1999_14 = 'OtteNyha1999';
        
%  time vs wet weight (ref 5, BjorStei2007)
%  f = 1 (lab)   
%  T = 273 + 8        
data.tWw_BjorStei2007 = [90 107 109 137 139 179 202 258 289 358 401 462;   % d, time since hatch
%       1.11	2.28 3.67 8.38 9.19	19.05 37.4 83.6	98.3 204.7 303.3 447;
       1.10 2.20 3.73 8.20 9.01 18.05 37.0 83.9 94.7 196.3 310.9 445.8]'; % g, wet weight at f and T
units.tWw_BjorStei2007 = {'d', 'g'}; label.tWw_BjorStei2007 = {'time since hatch', 'wet weight'};
temp.tWw_BjorStei2007 = C2K(8); units.temp.tWw_BjorStei2007 = 'K'; label.temp.tWw_BjorStei2007 = 'temperature';
bibkey.tWw_BjorStei2007 = 'BjorStei2007';

% uni-variate data and T = 273 + 4 
% length vs wet weight (ref 10, Kjesbu 98 figure2)
data.LWw = [56.9 60.4 64.8 69.9 81 84 88.9 94 96, 100.1 113.1 118.2;    % cm, length
      1854 1926 2821 2553 5475 6677 7127 7544 9395 10598 17836 23183]'; % g, wet weight
units.LWw = {'cm', 'g'}; label.LWw = {'total length', 'wet weight'};
bibkey.LWw = 'KjesWitt1998';

% time vs weight (ref 16, ICES) at f = unknown, Barents sea 
data.tWw_McCoGeub2006 = [ ... % time since hatch (yr), wet weight (kg) 
3	0.231
4	0.624
5	1.118
6	1.932
7	3.046
8	3.955
9	5.811
10	8.289
11	13.44
3	0.256
4	0.602
5	1.201
6	2.009
7	3.114
8	4.427
9	6.03
10	8.037
11	9.928
3	0.262
4	0.699
5	1.341
6	2.121
7	3.167
8	4.64
9	6.495
10	9.123
11	11.78
3	0.286
4	0.734
5	1.37
6	2.367
7	3.29
8	4.82
9	6.548
10	8.483
11	8.902
3	0.26
4	0.641
5	1.343
6	2.36
7	3.763
8	5.111
9	6.554
10	9.098
11	9.432
3	0.257
4	0.589
5	1.183
6	2.052
7	3.181
8	4.8
9	6.759
10	7.859
11	10.008
3	0.224
4	0.589
5	1.088
6	1.915
7	2.776
8	4.319
9	6.495
10	8.489
11	10.016
12	12.731
13	14.311];
data.tWw_McCoGeub2006(:,1) = 365 * data.tWw_McCoGeub2006(:,1);    % convert years to days
data.tWw_McCoGeub2006(:,2) = 1000 * data.tWw_McCoGeub2006(:,2);   % convert kg to gram
units.tWw_McCoGeub2006 = {'d', 'g'}; label.tWw_McCoGeub2006 = {'time since hatch', 'wet weight'};
temp.tWw_McCoGeub2006 = C2K(4); units.temp.tWw_McCoGeub2006 = 'K'; label.temp.tWw_McCoGeub2006 = 'temperature';
bibkey.tWw_McCoGeub2006 = 'McCoGeub2006'; subtitle.tWw_McCoGeub2006 = 'Data from Barents Sea';

% Length versus fecundity (Kjesbu 89, ref 10, from regression equation)
data.LN = [ ... % length (cm) yearly potential fecundity (nr oocytes)
 40	 192031;
 50	 406161;
 60	 749048;
 70	1256754;
 80	1967565;
 90	2921784;
100	4161559;
110	5730748;
120	7674808];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};
temp.LN = C2K(10); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KjesWitt1998'; subtitle.LN = 'Data from regression equation';
comment.LN = 'This data is inconsistent with Lp';

% McCoGeub2006: Atlantic cod, posthatch T = 10 C
% Beginning at 1 day post-hatch (dph), larvae were fed ten rotifers 1/ml (Brachionus plicatilis) enriched daily
%   feedings occurred six times per day at 07:00, 10:00, 13:00, 16:00, 19:00, and 22:00.
% The microcalorimeter determined the heat output of each larva by comparing values between the sample and a reference chamber.
% Length measure is TOTAL length (so in principle, but double check with authors if necessary, tip of snout till base of caudal fin)
tLWdHH = [... age (weeks post hatch), length (mm), dry mass (mg), heat muW (fed), heat muW (unfed)
1  5 0.25 16.56  2.14
2  7 0.24 19    12.22
3  9 0.38 34.44 16.00
4 14 0.75 47.83 23.72];
tLWdHH(:,1) = tLWdHH(:,1)*7; % d, time since hatch
tLWdHH(:,2) = tLWdHH(:,2)/10; % convert mm to cm
tLWdHH(:,[4 5]) = tLWdHH(:,[4 5]) * 1e-6*60*60*24; % J/d, convert muW to J/d
data.tL_McCoGeub2006 = tLWdHH(:,[1 2]);
units.tL_McCoGeub2006 = {'d', 'cm'}; label.tL_McCoGeub2006 = {'time since hatch', 'total length'};
temp.tL_McCoGeub2006 = C2K(10); units.temp.tL_McCoGeub2006 = 'K'; label.temp.tL_McCoGeub2006 = 'temperature';
bibkey.tL_McCoGeub2006 = 'McCoGeub2006';
%
data.tWd_McCoGeub2006 = tLWdHH(:,[1 3]);
units.tWd_McCoGeub2006 = {'d', 'mg'}; label.tWd_McCoGeub2006 = {'time since hatch', 'dry weight'};
temp.tWd_McCoGeub2006 = C2K(10); units.temp.tWd_McCoGeub2006 = 'K'; label.temp.tWd_McCoGeub2006 = 'temperature';
bibkey.tWd_McCoGeub2006 = 'McCoGeub2006';
%
data.tpf_McCoGeub2006 = tLWdHH(:,[1 4]);
data.tpf_McCoGeub2006(:,2) = data.tpf_McCoGeub2006(:,2) * 0.0864; % convert muW to J/d
units.tpf_McCoGeub2006 = {'d', 'J/d'}; label.tpf_McCoGeub2006 = {'time since hatch', 'heat (fed)'};
temp.tpf_McCoGeub2006 = C2K(10); units.temp.tpf_McCoGeub2006 = 'K'; label.temp.tpf_McCoGeub2006 = 'temperature';
bibkey.tpf_McCoGeub2006 = 'McCoGeub2006';
%
data.tp0_McCoGeub2006 = tLWdHH(:,[1 5]); 
data.tp0_McCoGeub2006(:,2) = data.tp0_McCoGeub2006(:,2) * 0.0864; % convert muW to J/d
units.tp0_McCoGeub2006 = {'d', 'J/d'}; label.tp0_McCoGeub2006 = {'time since hatch', 'heat (unfed)'};
temp.tp0_McCoGeub2006 = C2K(10); units.temp.tp0_McCoGeub2006 = 'K'; label.temp.tp0_McCoGeub2006 = 'temperature';
bibkey.tp0_McCoGeub2006 = 'McCoGeub2006';

% Embryo data below here

% FinnFyhn1995
% The eggs and larvae were incubated in static glass aquaria
%   (5 liter) at 6.0 +/- 0.02 C see paper for other parameters of water
% routine rates of O2 consumption in light open respiratory
data.tJO2 = [ ... % age d, nmol O2/h
 1.14	0.45
 3.03	0.61
 5.22	1.24
 7.19	1.58
 9.05	1.96
10.16	2.24
11.27	2.59
12.21	2.89
13.21	3.41
14.21	3.18
15.15	3.56
17.20	4.68
18.15	4.60
19.26	5.42
20.14	5.97
21.36	6.19
22.17	5.34
23.31	5.06
27.31	4.93
29.18	2.51];
units.tJO2 = {'d', 'nmol/h'}; label.tJO2 = {'age', 'O2 flux'};
temp.tJO2 = C2K(6); units.temp.tJO2 = 'K'; label.temp.tJO2 = 'temperature';
bibkey.tJO2 = 'FinnFyhn1995'; subtitle.tJO2 = 'Embryo development, FinnFyhn1995';
%
data.tJNH3 = [ ... % age d, nmol NH3/h
1.00	0.06
2.97	0.02
5.14	0.13
7.20	0.20
9.06	0.25
10.09	0.28
11.20	0.29
12.26	0.35
13.21	0.40
14.15	0.57
15.13	0.52
17.18	0.59
18.18	0.70
19.18	0.67
20.07	0.71
21.33	1.00
22.08	0.78
23.35	0.79
27.28	0.75
29.25	0.54];
units.tJNH3 = {'d', 'nmol/h'}; label.tJNH3 = {'age', 'NH3 flux'};  
temp.tJNH3 = C2K(6); units.temp.tJNH3 = 'K'; label.temp.tJNH3 = 'temperature';
bibkey.tJNH3 = 'FinnFyhn1995'; subtitle.tJNH3 = 'Embryo development, FinnFyhn1995';
%
data.tVY = [ ... % age d, yolk volume muL
0.80	1.36
1.43	1.37
2.39	1.31
4.43	1.31
6.43	1.11
8.60	1.02
10.50	0.99
12.59	0.88
14.51	0.69
15.71	0.63
16.84	0.48
18.78	0.33
20.54	0.10
22.65	0.03];
units.tVY = {'d', 'muL'}; label.tVY = {'age', 'yolk volume'};  
temp.tVY = C2K(6); units.temp.tVY = 'K'; label.temp.tVY = 'temperature';
bibkey.tVY = 'FinnFyhn1995'; subtitle.tVY = 'Embryo development, FinnFyhn1995';
%
% data from table 1 of FinnFyhn1995
tmass = [ ... % age (dpf) wet mass (mug) sd dry mass (mug) sd dry mass (mug) sd water (%) sd ash (mug) sd
%  1      2     3      4    5      6    7     8    9    10   11
   0.8 1651.4  78.11 116.3  1.43 113.7  1.31 92.9  0.38 14.8  0.65
   2.7 1684.5  70.16 116.5  0.71 116.5  1.05 93.1  0.18 15.1  1.63
   4.7 1675.1  64.41 114.6  1.23 115.0  1.67 93.1  0.27 15.0  1.02
   6.7 1672.5  59.38 113.3  0.87 115.3  2.07 93.1  0.19 15.2  1.27
   8.7 1680.8  47.84 115.0  0.76 114.4  2.02 93.2  0.11 15.4  1.02
  10.7 1666.1  45.89 114.2  0.73 113.2  1.60 93.2  0.18 15.2  1.75
  12.7 1732.6  45.52 113.5  1.46 115.1  1.04 93.4  0.16 15.1  1.44
  14.6 1638.4  52.61 110.2  0.91 111.7  1.78 93.1  0.16 14.6  0.94];
data.tWw_FinnFyhn1995 = tmass(:,[1 2]); % day, mug wet mass
units.tWw_FinnFyhn1995 = {'d', 'mug'}; label.tWw_FinnFyhn1995 = {'age', 'wet weight'};  
temp.tWw_FinnFyhn1995 = C2K(6); units.temp.tWw_FinnFyhn1995 = 'K'; label.temp.tWw_FinnFyhn1995 = 'temperature';
bibkey.tWw_FinnFyhn1995 = 'FinnFyhn1995'; subtitle.tWw_FinnFyhn1995 = 'Embryo development, FinnFyhn1995';
%
data.tWd_FinnFyhn1995 = tmass(:,[1 4]); % day, mug dry mass
units.tWd_FinnFyhn1995 = {'d', 'mug'}; label.tWd_FinnFyhn1995 = {'age', 'dry weight'};  
temp.tWd_FinnFyhn1995 = C2K(6); units.temp.tWd_FinnFyhn1995 = 'K'; label.temp.tWd_FinnFyhn1995 = 'temperature';
bibkey.tWd_FinnFyhn1995 = 'FinnFyhn1995'; subtitle.tWd_FinnFyhn1995 = 'Embryo development, FinnFyhn1995';
%
data.tWa_FinnFyhn1995 = tmass(:,[1 6]); % day, mug ash-free dry mass
units.tWa_FinnFyhn1995 = {'d', 'mug'}; label.tWa_FinnFyhn1995 = {'age', 'ash-free dry weight'};  
temp.tWa_FinnFyhn1995 = C2K(6); units.temp.tWa_FinnFyhn1995 = 'K'; label.temp.tWa_FinnFyhn1995 = 'temperature';
bibkey.tWa_FinnFyhn1995 = 'FinnFyhn1995'; subtitle.tWa_FinnFyhn1995 = 'Embryo development, FinnFyhn1995';
% weight coeff set to zero because of contribution of egg shell
%
% this is "standard length" so maybe tip of snout till base of caudal fin
% we should be careful, del_M might be rather experiment specific
data.tL_FinnFyhn1995 = [ ... % age dpf, length mm
15.69	4.03
16.85	4.18
18.78	4.42
20.57	4.71
22.56	5.05
28.53	5.04];
data.tL_FinnFyhn1995(:,2) = data.tL_FinnFyhn1995(:,2) * 1.05/ 10; % convert mm SL to cm TL
units.tL_FinnFyhn1995 = {'d', 'cm'}; label.tL_FinnFyhn1995 = {'age', 'standard length'};  
temp.tL_FinnFyhn1995 = C2K(6); units.temp.tL_FinnFyhn1995 = 'K'; label.temp.tL_FinnFyhn1995 = 'temperature';
bibkey.tL_FinnFyhn1995 = 'FinnFyhn1995'; subtitle.tL_FinnFyhn1995 = 'Embryo development, FinnFyhn1995';

% FinnHend1995
%   The eggs and larvae were incubated in static glass aquaria
%  (5 liter) at 6.0 +/- 0.02 C see paper for other parameters of water
% Caloric contents of the eggs and larvae were determined on lyophilised samples (four replicates of 100 pooled individuals) after
%  the procedures of Phillipson (1964) and Prus (1975) using adiabatic Phillipson Oxygen Microbomb Calorimeter in conjunction with
%  a chart recorder. The bomb was calibrated by combusting pelletised samples (1 to 22 rag) of crystallised benzoic acid. The specific heat of
%  combustion of benzoic acid, calculated from the enthalpy of formation was -26.413 kJg- 1 (Lide 1992). 
% Caloric contents of the eggs and larvae are expressed in J ind^-1
data.tE = [... % age (dpf), caloric content (J/ind)
5.64e-001	2.21e+000
2.72e+000	2.24e+000
4.72e+000	2.19e+000
6.66e+000	2.20e+000
8.68e+000	2.09e+000
1.05e+001	2.08e+000
1.27e+001	2.05e+000
1.45e+001	1.99e+000
2.89e+001	8.28e-001];
units.tE = {'d', 'J'}; label.tE = {'age', 'caloric content'};  
temp.tE = C2K(6); units.temp.tE = 'K'; label.temp.tE = 'temperature';
bibkey.tE = 'FinnHend1995'; subtitle.tE = 'Embryo development';

% BuslSerg2002: Pacific cod
data.Tab = [ ... % temperature (C), duration of embryogenesis (days)
0.00   51.82
0.00   50.02
1.44   37.20
1.24   33.59
1.30   30.20
2.00   29.67
2.00   27.87
2.00   26.49
2.00   25.01
2.00   24.48
1.79   25.01
2.69   28.82
2.98   25.33
2.98   23.53
2.66   23.10
2.65   22.36
2.69   21.83
2.69   19.29
3.19   21.72
3.31   18.86
3.81   22.47
4.01   20.88
4.03   18.55
4.00   17.06
3.99   14.41
4.81   15.68
5.18   17.91
5.40   13.99
4.99   13.35
5.26	9.86
5.98   15.47
6.36   13.56
6.60   10.49
6.02   11.97
5.89   11.02
6.00   10.17
6.10	7.95
6.49	5.93
6.72	5.72
6.97	7.10
6.97	8.80
7.59   11.97
7.46	7.84
7.45	9.01
7.98   11.23
8.00	8.27
8.00	7.63
8.47	8.27
8.36	4.77
8.83	4.56
9.07	6.57
8.87	7.84
9.28	6.15
9.88	5.19
10.00	4.66
10.41	4.66
11.00	4.03
11.27	4.13
11.99	3.92
12.76	2.54];
units.Tab = {'C', 'd'}; label.Tab = {'temperature', 'age at hatch'};  
bibkey.Tab = 'BuslSerg2010'; subtitle.Tab = 'Embryo development';

%% set weights for all real data
weights = setweights(data, []);
weights.ah = 5 * weights.ah; 
weights.Lj = 0; % Wwj/Lj^3 inconsistent with Wwi/Li^3
weights.Wwj = 0; % not clear when end of acceleration occurs
weights.Wwh = 0; % not clear when end of acceleration occurs
weights.LN(1:4) = 0; % zero weights for L < Lp
weights.tL_FinnFyhn1995 = 0 * weights.tL_FinnFyhn1995; % fig 9
weights.tL_McCoGeub2006 = 0 * weights.tL_McCoGeub2006; % fig 10
weights.tWa_FinnFyhn1995 = 0 * weights.tWa_FinnFyhn1995; % fig 12
weights.tWw_FinnFyhn1995 = 0 * weights.tWw_FinnFyhn1995; % fig 16
weights.E0 = 5 * weights.E0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap_G = weights.psd.kap_G/ 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Group plots
set2 = {'tWd_OtteNyha1999_14','tWd_OtteNyha1999_12','tWd_OtteNyha1999_10','tWd_OtteNyha1999_8','tWd_OtteNyha1999_6','tWd_OtteNyha1999_4'}; 
subtitle2 = 'Data at  various temperatures';
set1 = {'tL_OtteNyha1999_14','tL_OtteNyha1999_12','tL_OtteNyha1999_10','tL_OtteNyha1999_8','tL_OtteNyha1999_6','tL_OtteNyha1999_4'}; 
subtitle1 = 'Data at various temperatures';
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Weight for Wwh is set on 0 because of inconsistency with other (embryo) data';
D2 = 'Parameter s_R is introduced to account for the fraction of absorbed eggs, assuming that fecundity (Ri and LN data) is based on counts in gonads';
D3 = 'mod_2: several errors repaired and inconsistent data sets excluded and Lj, Wwj (<Wwb).';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = ['At 7C hatching occurred at 256 hpf = 10.7 d', ...
    'after which individuals remained motionless at the water''s surface ', ...
    'undergoing negative phototaxis only after the first day posthatch.', ...
    'First-feeding stage was reached at the end of the third day posthatch, ', ...
    'subsequent to development of a functional jaw and hindgut'];
metaData.bibkey.F1 = 'HallSmit2004'; 
F2 = 'Conversion from SL to TL is done by: TL=0.0601+1.1418xSL (Gadiculus argenteus)';
metaData.bibkey.F2 = 'GaygGurs2006'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6K72F'; % Cat of Life
metaData.links.id_ITIS = '164712'; % ITIS
metaData.links.id_EoL = '46564415'; % Ency of Life
metaData.links.id_Wiki = 'Gadus_morhua'; % Wikipedia
metaData.links.id_ADW = 'Gadus_morhua'; % ADW
metaData.links.id_Taxo = '92960'; % Taxonomicon
metaData.links.id_WoRMS = '126436'; % WoRMS
metaData.links.id_fishbase = 'Gadus-morhua'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gadus_morhua}}'];
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
bibkey = 'OtteNyha1999'; type = 'Article'; bib = [ ... 
'author = {Otterlei, E. and Nyhammer, G. and Folkvord, A. and Stefansson, S. O.}, ' ... 
'year = {1999}, ' ...
'title = {Temperature and size dependent growth of larval and early juvenile {A}tlantic cod (\emph{Gadus morhua}): a comparative study of norwegian coastal cod and northeast arctic cod}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {56}, ' ...
'pages = {2099-2111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FreiCard2010'; type = 'Article'; bib = [ ... 
'author = {Freitas, V. and Cardosa, J. F. M. F. and Lika, K. and Peck, M. A. and Campos, J. and Kooijman, S. A. L. M. and Veer, H. W. van der}, ' ... 
'year = {2010}, ' ...
'title = {Temperature tolerance and energetics: a {D}ynamic {E}nergy {B}udget-based comparison of {N}orth {A}tlantic marine species}, ' ...
'journal = {Phil. Trans. R. Soc. B}, ' ...
'volume = {365}, ' ...
'doi = {10.1098/rstb.2010.0049}, '...
'pages = {3553-3565}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThorWitt2010'; type = 'Article'; bib = [ ... 
'author = {Thorsen, A. and Witthames, P. R. and Marteinsd{\o}ttir, G. and Nash, R. D. M. and Kjesbu, O. S.}, ' ... 
'year = {2010}, ' ...
'title = {Fecundity and growth of {A}tlantic cod (\emph{Gadus morhua} {L}.) along a latitudinal gradient}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {104}, ' ...
'howpublished = {\url{http://brage.bibsys.no/xmlui/bitstream/handle/11250/108484/Fish_Res_104_1-3_spIss_2010_45-55.pdf?sequence=3}}, '...
'pages = {45-55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Gadus-morhua.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BjorStei2007'; type = 'Article'; bib = [ ... 
'author = {Bj\"{o}rnsson, B. and Steinarsson, A. and Arnason, T.}, ' ... 
'year = {2007}, ' ...
'title = {Growth model for {A}tlantic cod (\emph{Gadus morhua}): {E}ffects of temperature and body weight on growth rate}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {271}, ' ...
'pages = {216-226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MartBegg2002'; type = 'Article'; bib = [ ... 
'author = {Marteinsdottir, G. and Begg, G. A.}, ' ... 
'year = {2002}, ' ...
'title = {Essential relationships incorporating the infuence of age, size and condition on variables requered for estimation of reproductive potential in {A}tlantic cod}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {235}, ' ...
'pages = {235-256}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaulKses2009'; type = 'Article'; bib = [ ... 
'author = {Paulsen, H. and Kjesbu, O. S. and Buehler, V. and Case, R. A. J. and Clemmesen, C. and Carvalho, G. and Hauser, L. and Hutchinson, W.F. and Moksness, E. and Otter\r{a}, H. and Thorsen, A. and Svaasand, T.}, ' ... 
'year = {2009}, ' ...
'title = {Effects of egg size, parental origin and feeding conditions on growth of larval and juvenile cod \emph{Gadus morhua}}, ' ...
'journal = { Journal of Fish Biology}, ' ...
'volume = {75}, ' ...
'pages = {516-537}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KjesKlun1991'; type = 'Article'; bib = [ ... 
'author = {Kjesbu, O. S. and  Klungsoyr, J. and Kryvi, H. and Witthames, P. R. and Greer Walker, M. }, ' ... 
'year = {1991}, ' ...
'title = {Fecundity, Atresia, and Egg Size of Captive {A}tlantic Cod (\emph{Gadus morhua}) in relation to Proximate Body Composition.}, ' ...
'journal = {Can.J.Fish. Aquat. Sci.}, ' ...
'volume = {48}, ' ...
'pages = {2333-2343}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KjesWitt1998'; type = 'Article'; bib = [ ... 
'author = {Kjesbu, O. S. and Witthames, P. R. and Solemdal, P. and Greer Walker, M. }, ' ... 
'year = {1998}, ' ...
'title = {Temporal variations in the fecundity of {A}rcto-{N}orwegian cod (\emph{Gadus morhua}) in response to natural changes in food and temperature}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {40}, ' ...
'pages = {303-321}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FinnFyhn1995'; type = 'Article'; bib = [ ... 
'author = {Finn, R. N. and  Fyhn, H. J. and Evjen, M. S.}, ' ... 
'year = {1995}, ' ...
'title = {Physiological energetics of developing embryos and yolk-sac larvae of {A}tlantic cod (\emph{Gadus morhua}). I. {R}espiration and nitrogen metabolism}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {124}, ' ...
'pages = {355-369}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BuslSerg2010'; type = 'Article'; bib = [ ... 
'author = {Buslov, A. V. and Sergeeva, N. P. and Ilyin, O. I.}, ' ... 
'year = {2010}, ' ...
'title = {Embryonic Development of the {P}acific Cod \emph{Gadus macrocephalus} ({G}adidae)}, ' ...
'journal = {Russian Journal of Marine Biology}, ' ...
'volume = {36}, ' ...
'number = {7}, '...
'pages = {526-538}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FinnHend1995'; type = 'Article'; bib = [ ... 
'author = {Finn, R. N. and Henderson, J.R. and Fyhn, H. J.}, ' ... 
'year = {1995}, ' ...
'title = {Physiological energetics of developing embryos and yolk-sac larvae of {A}tlantic cod (\emph{Gadus morhua}). I1. {L}ipid metabolism and enthalpy balance}, ' ...
'journal = {Marine biology}, ' ...
'volume = {124}, ' ...
'pages = {371-379}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HallSmit2004'; type = 'Article'; bib = [ ... 
'author = {Hall, T. E. and Smith, P. and Johnston, I. A.}, ' ... 
'year = {2004}, ' ...
'title = {Stages of Embryonic Development in the {A}tlantic Cod \emph{Gadus morhua}}, ' ...
'journal = {J. MORPHOLOGY}, ' ...
'volume = {259}, ' ...
'pages = {255-270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McCoGeub2006'; type = 'Article'; bib = [ ... 
'author = {McCollum, A. and Geubtner, J. and Hunt von Herbing, I.}, ' ... 
'year = {2006}, ' ...
'title = {Metabolic costs of feeding in {A}tlantic cod (\emph{Gadus morhua}) larvae using microcalorimetry}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {63}, ' ...
'pages = {335-339}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GaygGurs2006'; type = 'Article'; bib = [ ... 
'author = {Gaygusuz, \"{O} and G\"{u}rsoy, \c{C}. and \"{O}zulu\v{q}, M. and Tarkan, A.S. and Ac{\i}p{\i}nar, H. and Bilge, G. and Filiz, H.}, ' ... 
'year = {2006}, ' ...
'title = {Conversions of total, fork and standard length measurements based on 42 marine and fresh water fish species. }, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {6}, ' ...
'pages = {79-84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

