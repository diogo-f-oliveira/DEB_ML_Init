function [data, auxData, metaData, txtData, weights] = mydata_Pagrus_pagrus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pagrus_pagrus'; 
metaData.species_en = 'Red porgy'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K

metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L', 'L-W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Samira Boufersaoui'};            
metaData.date_subm   = [2023 08 03];                      
metaData.email       = {'samira.boufersaoui@gmail.com'}; 
metaData.address     = {'ENSSMAL, 16000, Algeria'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2023 08 03]; 

%% set data
% zero-variate data;

data.tp = 365*2.083;      units.tp = 'd';      label.tp = 'time since birth at puberty';  bibkey.tp = 'Bouf2016';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';        
data.am = 2920;       units.am = 'd';    label.am = 'life span';                   bibkey.am = 'CharWill1978';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';        
  
data.Lb  = 0.19;   units.Lb  = 'cm';   label.Lb  = ' total length at birth';   bibkey.Lb  = 'MullMach2003';
data.Lp  = 28.82;    units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Bouf2016';
data.Li  = 69.6;    units.Li  = 'cm';   label.Li  = 'ultimate total lenght';    bibkey.Li  = 'Bouf2016';

data.Wwb = 0.0001; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BoufBoua2023';
data.Wwp = 385.75;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'BoufBoua2023';
data.Wwi = 5203.47;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BoufBoua2023';

data.Ri  = 5725.9; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'CharWill1978';   
temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

data.tL = [0 0 0 0 0 0 0 0 0 0 0 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 2190 2190 2190 2190 2190 2190 2190 2190 2190 2190 2190 2190 2555 2555 2920 2920 3285 3285 3285 3650 3650 4015 ;  % d, time since birth
11.4 11.4 11.3 11.2 11.2 10.9 14 13.5 13.3 13 12.9 22.2 21.4 20.4 20.1 19.7 19 18.6 18.3 17.1 16.7 16.7 16.7 16.4 16.3 15.8 15.2 15.2 15 14.8 14.8 14.6 14.6 14.5 14.4 14.4 14.3 14.3 14.3 14.2 14.2 14.1 14 13.8 13.8 13.6 13.6 13.6 13.5 13.5 13.5 13.5 13.3 13.3 13.3 12.9 12.8 12.8 12.7 12.6 12.5 12.5 12.4 12.4 12.3 12.3 12.3 12.2 12.2 12.1 12 31.3 29.3 28.2 27.5 26.3 26.1 26 25.7 25 24.9 24 23.7 23.6 22.6 22.6 22.5 22.4 22.3 22.3 22.3 22.3 22 21.9 21.7 21.4 21.4 21.3 21.2 21 20.7 20.4 20.4 20.2 20.1 19.7 19.5 19.5 19.3 19.2 19.2 19.1 19 18.9 18.8 18.2 18 17.8 17.8 17.4 17.3 17.3 17.2 17.1 16.9 16.8 16.3 16.1 16 15.7 15.6 14.5 14.5 14.4 14.3 14.3 14.2 13.9 13.5 13.4 13.1 12.9 26.5 24.7 23.5 23.4 22.1 21.7 19.6 28 32.7 32 31.9 31.7 31.5 31.4 31 30.9 30.8 29.3 29.3 29.2 29.1 28.9 28.7 28.4 28 27.8 27.8 27.7 27.5 27.2 27 27 26.7 26.6 26.5 26.4 26.4 26.4 26.3 26.3 26.2 26 26 25.7 25.6 25.6 24.9 24.8 24.7 24.6 24.4 24.2 24 23.7 23.6 23.5 23.5 23.5 23.4 23.3 23.2 22.5 22.4 22.3 22.2 22.2 22 22 22 21.8 21.7 21.5 21.3 21.3 21.3 21.2 21.2 21 21 20.9 20.5 20.5 20.2 20.1 20 20 17.5 13.6 32.9 26.3 25.6 24.5 23.7 21.2 34 33.5 32.7 32.5 30 29.9 29.7 29.1 28.8 28.2 28 27.8 27.3 27.3 26.3 26 25.6 24.5 24.4 24.1 21.5 20.5 18.5 18.1 17.7 31.5 30.5 28 29.9 27 37.86 36.8 36.6 35.3 34.2 33.2 32.4 32.3 31.2 30.5 30.1 29.4 27.7 21.2 30.9 37.8 37.3 36.4 35.3 34.6 34.6 32.19 32 28.9 28.2 28.2 37.5 38 33.4 40 38.2 43.7 42.7 37.4 40.8 36.2 51.2]';   % cm, total length at f and T
data.tL(:,1) = data.tL(:,1) + 0.66*365; % convert year class to time since birth
n=size(data.tL,1);for i=2:n; if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end 
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  bibkey.tL = 'BoufBoua2023';
  temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  
data.LW = [24.5 25.6 25.6 24 19 20.3 21.6 20 30 26 26.3 25.7 22.4 21 22 22.6 20.5 20 20 26.6 25.6 24.9 23.5 22.6 25 15 14.2 11.2 11.4 11.4 30.9 30.5 28.9 28.4 26 25.7 24 21.4 22.3 15.6 31.4 12.7 26.3 12.3 13.6 13 13.4 12.2 12 12 12.6 12.5 12.8 21.2 21 19.5 19.7 19.5 19 18.5 21.8 17.5 16.7 15.4 17.2 17.5 16.8 17.1 16.8 17 16 16.5 14.5 14.2 20.1 16.7 17.7 16.3 14.4 13.5 16 13.6 13.5 13.6 13 13.1 12.4 14 12.2 38.4 27.8 26.4 21.7 18.6 31.3 21.9 21.4 20.1 17.8 14.6 13.6 37.8 36.2 31.7 28.9 20.7 18.1 20.2 16.7 17.9 17.1 16.2 13.3 14.2 14.3 14.2 15.7 13.6 12.9 14.2 15.3 16 16.3 13.9 14.4 14.1 12.9 14 15.4 13.2 14.3 15 24.6 21.3 22 21.5 20.5 22.7 14 13.3 12.9 16.6 28.2 26.2 26 29.9 29.3 29.1 29.9 27.3 20.9 20.1 18.3 17.6 16.1 14.4 14.3 35.3 31.2 36.4 23.6 23.7 22.2 21.5 23.6 22 21.2 31.9 20.4 43.7 40 37.3 37.86 33.7 29.3 28 22.2 21.2 21.4 29.1 28 26.2 26 23.5 26.6 24.2 32.4 36.8 22.3 20.4 19.3 21.3 24.1 22 21 24.2 21.7 21.6 20.6 21.3 20.4 16.4 15.6 16.2 15 15.3 32.7 31 28.2 25.6 24.9 24.8 34.2 29.2 28.7 13.1 12.9 13.3 12.8 10.9 12.3 13.3 46 35.3 30.8 28 27 27.2 27.3 28.6 27.5 26.1 26.5 13.5 12.9 42.7 27.7 26.4 22.5 19.4 22 20.8 21 19.3 20.2 18.3 19.3 18.2 15.6 13.9 32.3 33.2 26.3 23.5 23.1 36.6 33.5 32.19 32.5 27 14.8 14.5 13.9 14.3 14.3 14.5 14.5 69.6 34.6 34 31.5 32 31.5 26.2 24.7 23.7 22.5 40 33.6 37.5 32.7 29.7 30.5 30.1 30.9 29.4 30 27.8 27.3 26.4 26.7 24.4 27.7 11.2 12.1 12.3 11.3 12.2 13 28.8 32.4 28.2 26.3 28 24.5 26.3 26.5 28 29.3 24.7 27.5 23.5 23.4 24.4 21.7 23.7 26 21.7 12.4 12.9 22.1 21.2 18.9 18 16.8 17.3 19.6 20.5 19.1 18.8 19 19.5 19.2 19.2 18.2 33.4 22.3 13.8 12.3 12.4 12.5 13.5 13.3 14.2 13.8 14.8 15.2 28.2 17.3 51.2 51.6 17.2 17.1 16.9 15.7 14.6 16.4 26.3 23.2 23.3 23.5 19.7 22.4 15.8 22.3 21.3 22.2 20.5 20.2 21.3 14.3 25.6 23.4 17.8 17.4 16.3 16.7 34.6 20.8 27 37.4 38 38.2 32.9 32 40.8 39.4 36.2 30.8 24.9 24.3 59 ;    % cm, total length at f
         238.79 263.57 243.12 233.52 109.56 139.38 171.84 124.23 443.84 277.78 293.67 262 174.97 139.23 167.7 181.87 132.01 148.65 130.94 319.97 279.81 240.63 220.15 205.97 242.43 60.05 53.14 24.28 26.24 28.97 486.79 535 389.09 369.98 309.42 261.29 240.24 166.85 187.22 71.28 487.27 30.12 307.02 31.61 37.5 30.69 36.7 39.13 25.57 24.66 28.97 29.15 34.55 158.07 152 122.37 113.1 125.7 112.52 94.52 187.57 99.15 78.74 60.25 83.13 93.53 92.69 83.6 81.93 90.17 73.87 70.91 49.02 51.6 137.9 75.29 86.56 71.2 50.04 40.34 58.38 41.42 42.25 41.53 34.56 37.85 33.06 42.52 29.58 995 309.51 274.6 139.51 109.52 536.97 167.03 163.15 140.41 96.22 54.7 45.52 848.97 829.63 566.42 405.71 170.47 95.49 125.94 75.14 92.28 76.04 66.05 39.45 47.88 49.43 45.51 62.7 43.53 32.65 48.31 57.2 65.64 63.74 47.11 51.81 50.99 39.13 42.85 60.43 36.43 52.31 55.51 221.6 159.82 153.97 143.37 124.84 184.52 47.06 41.8 33.96 88.35 334.92 270.52 256.26 364.47 412.6 381.15 391.72 306.63 149.14 130.93 111.46 99.2 73.52 48.4 49.06 690.73 519.53 798.52 218.16 220.83 199.22 170.07 224.56 188.05 169.77 491.25 140.35 1200 1062.41 802.08 917.97 536.8 382.37 365.27 190 155.6 167.54 461.2 349.41 304.2 283.68 208.48 312.28 224.43 456.3 724.6 179.63 144.59 129.78 147.25 219.68 172.52 166.08 229.42 154.99 157.76 154.74 180.17 142.07 69.88 63.3 67.23 55.43 51.27 496.96 461.53 381.56 263.05 240.5 243.94 591.49 384.46 383.3 38.11 37.32 40.7 35.26 22.81 31.57 39.05 1600 655.06 437.18 317.84 313.5 347.26 301.1 387.3 334.84 392.53 305.04 40.13 33.89 1400 310.1 321.01 194.59 116.19 171.47 141.17 134.99 127.26 133.79 104.33 113.39 98.42 60.47 43.64 600 530 278.92 222.77 196.65 800 578.2 530.03 573.32 274.89 47.73 54.38 39.75 45.55 47.63 48.23 48.88 5725.9 600 576 520 487.08 486.2 311.61 266.59 218.14 192.87 922.74 543.63 753.35 493.4 404.61 391.68 409.47 468.97 406.27 444.73 342.03 323.26 306.2 319.16 231.48 344.07 25 30.06 29.83 23.34 31.48 36.31 384.42 615.18 356.65 314.33 383.01 211.26 273.34 323.98 244.82 427.41 214.64 339.48 201.29 194.52 224.66 160.79 227.52 275.63 161.05 27.66 30.21 155.12 151.45 102.36 94.42 67.48 74.52 114.18 146.34 117.92 107.67 100.26 118.88 112.8 97.87 92.2 504.74 175.15 42.07 29.05 34.78 30.33 35.38 37.05 44.73 48.65 53.21 55.45 358.29 86.79 2085 2443 81.8 77.5 77.82 57.42 54.36 69.28 296.7 193.95 195.9 113.75 125.23 167.29 62.72 181.55 157.51 174.5 142.54 136.64 150.05 52.73 280.35 186.82 90.6 89.29 76.68 83.2 775 157.62 314.12 940.49 842.46 812.46 535.21 529.85 968.45 913.47 675.01 383.73 241.12 224.13 3400]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  bibkey.LW = 'BoufBoua2023';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'Food availability is taken variable in tL data';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4BZNW'; % Cat of Life
metaData.links.id_ITIS = '169207'; % ITIS
metaData.links.id_EoL = '46579972'; % Ency of Life
metaData.links.id_Wiki = 'Pagrus_pagrus'; % Wikipedia
metaData.links.id_ADW = 'Pagrus_pagrus'; % ADW
metaData.links.id_Taxo = '182497'; % Taxonomicon
metaData.links.id_WoRMS = '127063'; % WoRMS
metaData.links.id_fishbase = 'Pagrus-pagrus'; % fishbase

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pagrus_pagrus}}';
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
bibkey = 'MullMach2003'; type = 'Article'; bib = [...
'author = {Muller, M. and Machinandiarena, L. and Lopez, A.}, ' ...
'year   = {2003},.' ...
'title = {Early life stages of development of red porgy \emph{Pagrus pagrus} ({P}isces, {S}paridae) in captivity, {A}rgentina}, ' ...
'journal = {Latin american journal of aquatic research, version On-line}, ' ...
'pages = {5-13}, ' ...
'volume = {31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoufBoua2023'; type = 'techreport'; bib = [ ...  
'author = {Boufersaoui, S. and Bouagal, W.}, ' ...
'year = {2023}, ' ...
'title  = {Effet des parametres du milieu sur la reproduction et la dynamique de population de \emph{Pagrus pagrus} {{L}innaeus, 1758} des eaux centre alg\''{e}rienne selon la th\''"{e}orie {D}{E}{B}}, ' ...
'institution = {ENSSMAL Univ., Algiers}']; ...
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bouf2016'; type = 'Phdthesis'; bib = [ ...  
'author = {Boufersaoui, S.}, ' ...
'year = {2016}, ' ...
'title  = {Biologie et \''{e}valuation des stocks de trois Sparid\''{e}s de la r\''{e}gion centre de l''Alg\''{e}rie: \emph{Lithognathus mormyrus} ({L}innaeus, 1758), \emph{Pagrus pagrus} ({L}innaeus, 1758) et \emph{Pagellus acarne} ({R}isso, 1826)}, ' ...
'publisher = {ENSSMAL Univ., Algiers}']; ...
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CharWill1978'; type = 'Book'; bib = [ ... 
'author = {Charles, M. and William, H.}, ' ...
'year = {1978}, ' ...
'title = {Synopsis of biological data on the red porgy, \emph{Pagrus pagrus} ({L}innaeus)}, ' ...
'publisher = {NOAA}, ' ...
'ISBN = {88-09-01406-8}, ' ...
'pages = {1--18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

