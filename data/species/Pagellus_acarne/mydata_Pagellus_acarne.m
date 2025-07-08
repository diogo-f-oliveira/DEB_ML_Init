function [data, auxData, metaData, txtData, weights] = mydata_Pagellus_acarne 

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pagellus_acarne'; 
metaData.species_en = 'Axillary seabream'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(18.4); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L', 'L-W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Samira Boufersaoui'};            
metaData.date_subm   = [2018 06 13];                      
metaData.email       = {'samira.boufersaoui@gmail.com'}; 
metaData.address     = {'ENSSMAL, 16000, Algeria'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 07 03]; 

%% set data
% zero-variate data;

data.ab = 2;      units.ab = 'd';      label.ab = 'age at birth';                bibkey.ab = {'Gaet1935','fishbase'};    
  temp.ab = C2K(18.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';      
data.tp = 716.964;      units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = {'Bouf2016','fishbase'};
  temp.tp = C2K(18.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';      
data.am = 3650;       units.am = 'd';    label.am = 'life span';                 bibkey.am = {'Bouf2016','fishbase'};   
  temp.am = C2K(18.4);  units.temp.am = 'K'; label.temp.am = 'temperature';      
  
data.Lb  = 0.25;   units.Lb  = 'cm';   label.Lb  = ' total length at birth';     bibkey.Lb  = 'Gaet1935';
data.Lp  = 16.55;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';   bibkey.Lp  = 'Bouf2016';
data.Li  = 33.31;   units.Li  = 'cm';   label.Li  = 'ultimate total lenght';     bibkey.Li  = 'Bouf2016';

data.Wwb = 0.0000832; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Bouf2016';
data.Wwp = 55.156;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Bouf2016';
data.Wwi = 391.53;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Bouf2016';

data.Ri  = 499.452; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'Bouf2016';   
temp.Ri = C2K(18.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

data.tL = [730 1095 1460 730 730 730 365 730 730 365 730 730 730 730 730 365 730 365 730 365 365 730 1095 730 365 365 365 730 1095 730 365 0 730 365 730 730 365 0 730 1095 730 1095 1460 1095 1095 730 1095 1095 730 1095 730 730 730 730 1095 730 730 730 730 730 365 365 0 730 0 1095 1460 730 730 1095 730 730 730 730 1095 1095 730 730 730 730 365 365 365 365 730 365 365 365 365 365 365 365 1095 730 730 730 730 730 730 730 730 1095 1095 2920 730 1095 1825 1460 1095 1095 1460 1095 1825 1095 1460 1460 1095 1460 730 730 1095 730 730 730 730 1460 365 365 365 365 365 365 365 365 365 365 365 365 365 365 1460 1825 1825 1095 730 1095 1095 730 730 730 730 1095 730 1825 1460 730 730 1095 730 1460 730 365 1095 2555 730 730 365 365 365 365 730 730 365 730 730 1095 730 365 730 1095 730 730 730 730 365 730 365 365 365 365 730 365 365 365 365 730 365 2920 1460 1460 1095 365 730 1095 730 730 730 365 730 1095 1095 730 1095 730 1095 1095 365 365 365 365 365 365 365 365 365 365 2190 1825 1460 2190 2555 1825 1460 3650 3285 730 1460 730 730 730 730 1095 2555 1825 1460 1460 1095 1460 1095 1095 1095 1095 1825 1095 2555 1095 1460 2190 730 1460 1825 1460 1460 1095 1825 1825 1095 1095 1825 1460 1095 1095 1095 1095 730 730 730 365 730 730 1095 730 365 730 730 1095 730 1095 730 1460 730 1095 730 1095 1095 1095 1095 730 730 365 730 730 730 1460 1095 730 730 1825 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ; % d, time since birth
           19.3 17.6 21.3 17.8 16.5 16.5 14 14.2 16.3 16.4 16.2 17.5 17 18.1 17.9 17 18.7 16 17.9 16.9 16.4 18.5 19.2 16.8 15.5 15.9 16.3 18 13.5 14.3 14 12.2 19.3 19.4 16.1 17.7 17.2 13.6 19.1 20.5 20.5 20.3 21.3 19.5 22.1 18.5 21 21.2 19.7 20.8 17.3 19.8 20 19.1 20.2 18.9 16 16.3 17.2 17.4 16.3 14.4 13.7 14.3 12.2 21.9 21.2 19.7 18.7 20.2 19.6 19.4 18.6 18.2 17.9 16.5 16.7 16.2 16.7 16.9 14.2 9.9 9.2 11.6 11.9 12.5 8.9 8.7 11.5 9.7 11.1 11.1 16.2 15.2 16 17.1 16 15.9 15.6 15.3 16.5 16.7 16.3 26 21 21.2 20.4 21.5 18.5 19 18.5 18.2 21 20.9 20.2 19.3 19.5 19.9 21 15.5 16.7 18.7 16.7 16.4 16.5 18.8 13.9 12.2 11.5 11.9 11.3 11.2 11.6 12.2 10 10.2 11.2 10.4 12.9 10.9 23.4 22.1 21.3 18.9 18.4 18.6 19.1 16.7 16.3 16 16.9 15.3 16.8 21.9 21.9 17.3 17.3 17.3 17.7 18.9 17.5 13 18.1 28.1 14 13 11.3 11.2 11 10.7 16.2 17 16.4 14.7 15.1 16.4 16.4 17 16.7 16.7 16.8 16.6 16 15.7 15.3 15.8 16.1 16.3 16.8 13.9 17.2 16.8 15.1 16 16.7 15.4 15.6 31.5 22 21.5 20 18 18.8 18.9 16.9 16.1 17.6 16.6 16.7 21.6 17 16.5 18.3 18.8 17 17.6 10.00 10.7 9.6 10.9 9.7 9.9 10 9.7 9.7 9.2 26.8 25.6 24.6 26.5 25.1 24 23.5 30 27 20.2 20.8 15.6 17.2 19.1 17.4 22.5 22.9 25.5 22.7 20.4 21.3 22.3 20.4 24 20.9 20.7 22.4 21.1 24.8 23.9 24.3 23 19.2 20.9 24.3 21.4 22.5 24.7 25.7 23 23.5 23.9 28 23.6 21.1 20.7 20.2 20.6 19.3 18.6 18.6 19.1 18.2 17.8 19.4 17.9 17.3 16.7 18.4 19.4 18.7 18.7 18.9 25.7 22.6 21.4 18.6 20.7 20.1 21.6 20.3 19.5 19.2 19.5 18.3 18.7 18.7 22.8 23.7 21.6 18.6 26.2 9.00 8.1 9.3 9.00 10.4 9.4 10.00 7.9 8.4 8.3 7.9 9.00 9.00 6.3]';   % cm, total length at f and T
data.tL(:,1) = data.tL(:,1) + 0.66*365; % convert year class to time since birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};     bibkey.tL = 'Bouf2016';
  temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  
data.LW = [19.3 17.6 21.3 17.8 16.5 16.5 14 14.2 16.3 16.4 16.2 17.5 17 18.1 17.9 17 18.7 16 17.9 16.9 16.4 18.5 19.2 16.8 15.5 15.9 16.3 18 13.5 14.3 14 12.2 19.3 19.4 16.1 17.7 17.2 13.6 19.1 20.5 20.5 20.3 21.3 19.5 22.1 18.5 21 21.2 19.7 20.8 17.3 19.8 20 19.1 20.2 18.9 16 16.3 17.2 17.4 16.3 14.4 13.7 14.3 12.2 21.9 21.2 19.7 18.7 20.2 19.6 19.4 18.6 18.2 17.9 16.5 16.7 16.2 16.7 16.9 14.2 9.9 9.2 11.6 11.9 12.5 8.9 8.7 11.5 9.7 11.1 11.1 16.2 15.2 16 17.1 16 15.9 15.6 15.3 16.5 16.7 16.3 26 21 21.2 20.4 21.5 18.5 19 18.5 18.2 21 20.9 20.2 19.3 19.5 19.9 21 15.5 16.7 18.7 16.7 16.4 16.5 18.8 13.9 12.2 11.5 11.9 11.3 11.2 11.6 12.2 10 10.2 11.2 12.9 10.9 23.4 22.1 21.3 18.9 18.4 18.6 19.1 16.7 16.3 16 16.9 15.3 16.8 21.9 21.9 17.3 17.3 17.3 17.7 18.9 17.5 13 18.1 28.1 14 13 11.3 11.2 11 10.7 16.2 17 16.4 14.7 15.1 16.4 16.4 17 16.7 16.7 16.8 16.6 16 15.7 15.3 15.8 16.1 16.3 16.8 13.9 17.2 16.8 15.1 16 16.7 15.4 15.6 31.5 22 21.5 20 18 18.8 18.9 16.9 16.1 17.6 16.6 16.7 21.6 17 16.5 18.3 18.8 17 17.6 10.00 10.7 9.6 10.9 9.7 9.9 10 9.7 9.7 9.2 26.8 25.6 24.6 26.5 25.1 24 23.5 30 27 20.2 20.8 15.6 17.2 19.1 17.4 22.5 22.9 25.5 22.7 20.4 21.3 22.3 20.4 24 20.9 20.7 22.4 21.1 24.8 23.9 24.3 23 19.2 20.9 24.3 21.4 22.5 24.7 25.7 23 23.5 23.9 28 23.6 21.1 20.7 20.2 20.6 19.3 18.6 18.6 19.1 18.2 17.8 19.4 17.9 17.3 16.7 18.4 19.4 18.7 18.7 18.9 25.7 22.6 21.4 20.7 20.1 21.6 19.2 19.5 18.3 18.7 18.7 22.8 23.7 21.6 18.6 26.2 9.00 8.1 9.3 9.00 10.4 9.4 10.00 7.9 8.4 8.3 7.9 9.00 9.00 6.3 ;      % cm, total length at f
         91.88 81.22 112.29 67.33 60.4 60.28 35.46 34.36 58.63 58.73 52.54 68.72 57.08 72.73 73.35 65.11 76.72 52.51 52.45 56.66 54.31 75.12 86.2 61.75 38.56 52.13 57.14 64.38 29.7 33.47 30.26 20.2 77.43 63.49 49.17 66.5 59.22 29.65 95.62 120.17 112.77 107.48 133.08 92.35 130.56 85.36 121.00 115.76 90.34 120.82 63.95 104.42 104.23 87.86 106.2 84.35 57.19 54.39 67.2 69.66 53.22 40.02 31.86 40.92 22.37 113.99 126.49 109.78 83.69 102.48 98.42 102.62 86.19 81.74 76.79 56.25 57.65 54.87 53.94 59.13 37.85 12.00 8.22 16.84 18.35 22.65 8.07 7.28 18.84 9.9 15.28 16.69 48.17 54.53 56.04 62.44 51.97 50.41 50.07 43.67 58.04 55.1 53.99 207.98 135.57 137.47 114.32 131.27 92.34 89.88 88.9 81.36 133.34 132.71 108.8 97.73 109.34 116.55 118.32 52.29 59.43 87.38 59.22 60.93 55.51 80.36 31.03 20.5 17.21 18.09 15.77 14.75 16.15 20.93 10.77 12.04 18.59 25.92 14.21 179.9 145.26 140.28 98.14 85.86 85.59 99.21 63.55 58.38 55.91 65.53 46.45 63.2 142.12 121.58 67.53 62.72 57.67 63.49 79.23 51.39 24.66 72.58 267.63 32.89 24.1 15.35 14.33 13.31 12.69 52.76 56.03 53.01 37.95 44.36 52.67 55.26 56.49 49.53 59.99 58.22 53.04 44.31 48.9 44.5 49.3 53.9 58.3 59.00 34.1 64.3 62.6 47.8 48.4 46.2 47.1 51.6 391.53 140.3 123.88 102.24 77.86 87.78 94.95 67.31 58.3 71.7 69.63 60.2 129.76 64.65 61.21 85.64 91.31 67.35 78.61 12.38 14.92 9.98 16.45 9.64 10.56 12.23 10.19 10.53 8.19 281.64 219.26 201.43 231.97 218.53 190.64 166.19 335 293.3 113.53 122.77 50.07 67.7 97.34 69.37 162.31 176.67 221.59 153.12 113.57 111.74 144.28 102.22 178.87 119.69 97.8 135.51 118.5 207.18 160.03 184.64 156.33 100.46 117.72 187.81 115.26 150.52 214.01 211.62 191.72 218.77 184.2 284.85 171.37 137.19 123.5 108.6 114.49 95.31 73.98 84.59 105.75 77.18 68.92 94.77 72.19 62.15 65.55 78.89 96.12 77.42 79.46 86.95 192.2 144.97 117.06 112.03 104.12 123.18 82.94 68.97 80.03 88.35 85.88 158.13 170.5 116.09 128.34 299.81 8.95 6.77 8.4 7.42 12.16 8.71 10.62 5.1 5.95 6.08 5.07 8.62 8.95 3.45]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  bibkey.LW = 'Bouf2016';


%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Links
metaData.links.id_CoL = '4BZB6'; % Cat of Life
metaData.links.id_ITIS = '169213'; % ITIS
metaData.links.id_EoL = '46579963'; % Ency of Life
metaData.links.id_Wiki = 'Pagellus_acarne'; % Wikipedia
metaData.links.id_ADW = 'Pagellus_acarne'; % ADW
metaData.links.id_Taxo = '182483'; % Taxonomicon
metaData.links.id_WoRMS = '127057'; % WoRMS
metaData.links.id_fishbase = 'Pagellus-acarne'; % fishbase


%% References 
bibkey = 'Bouf2016'; type = 'Phdthesis'; bib = [ ...  
'author = {Boufersaoui, S.}, ' ...
'year = {2016}, ' ...
'title  = {Biologie et \''{e}valuation des stocks de trois Sparid\''{e}s de la r\''{e}gion centre de l''Alg\''{e}rie: \emph{Lithognathus mormyrus} ({L}innaeus, 1758), \emph{Pagrus pagrus} ({L}innaeus, 1758) et \emph{Pagellus acarne} ({R}isso, 1826)}, ' ...
'school = {ENSSMAL Univ., Algiers}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gaet1935'; type = 'Article'; bib = [ ... 
'author = {Gaetani, D. de}, ' ...
'year = {1935}, ' ...
'title = {Sviluppo embrionale e stadi post-embrionali negli Sparidi, 3, \emph{Pagellus acarne}}, ' ...
'journal = {Archivio di Oceanografia e Limnologia}, ' ...
'volume = {2}, ' ...
'pages = {47--66}'];
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.se/summary/Pagellus-acarne.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pagellus_acarne}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

