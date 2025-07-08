function [data, auxData, metaData, txtData, weights] = mydata_Citharus_linguatula

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Citharidae';
metaData.species    = 'Citharus_linguatula'; 
metaData.species_en = 'Spotted flounder'; 

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
metaData.date_subm   = [2023 05 22];                      
metaData.email       = {'samira.boufersaoui@gmail.com'}; 
metaData.address     = {'ENSSMAL, 16000, Algeria'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2023 05 30]; 

%% set data
% zero-variate data;

data.tp = 730;      units.tp = 'd';      label.tp = 'time since birth at puberty';  bibkey.tp = 'CengIsmeOzek2014';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';        
data.am = 2555;       units.am = 'd';    label.am = 'life span';                   bibkey.am = 'VassilPapa1994';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';        
  
data.Lb  = 0.3;   units.Lb  = 'cm';   label.Lb  = ' total length at birth';   bibkey.Lb  = 'Mari1978';
data.Lp  = 14;    units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'CengIsme2014';
data.Li  = 30;    units.Li  = 'cm';   label.Li  = 'ultimate total lenght';    bibkey.Li  = 'fishebase';

data.Wwb = 0.0001; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BoufBell2023';
data.Wwp = 8.06;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'BoufBell2023';
data.Wwi = 211.39;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BoufBell2023';

data.Ri  = 887.59; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'CengIsme2014';   
temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

data.tL = [730 730 365 730 730 730 730 730 730 730 365 1095 1095 1095 365 1095 730 730 1095 730 1095 730 1095 730 1460 1460 1095 1095 1095 1095 730 1095 1095 1095 1095 1095 1460 1095 1460 730 1460 1095 1095 1095 1095 1460 1460 1095 1095 1095 1460 1460 1460 1460 1460 730 1095 1095 1095 1095 1095 1095 1095 1095 1095 1460 730 1095 1460 1460 730 1095 1095 1460 1095 1095 1095 1095 1095 1460 1460 1095 1095 1095 1095 1095 1095 1460 1460 1460 1460 1460 1460 1460 1460 1825 1825 1825 1825 2190 1460 1460 1095 1825 1095 1460 1460 1460 1825 1095 1095 1095 1095 1460 1460 1825 1095 1460 1095 1095 1095 1460 2190 1095 1460 1460 1460 1460 1460 1095 1095 1460 2190 2555 1095 1095 1460 1460 1460 1460 2190 1095 1460 1460 1460 1460 1460 2190 1095 1095 1460 1460 1095 1095 1095 1460 1460 1825 1460 1460 1460 1825 1460 1825 2190 2190 1460 1825 1825 1825 2555 1825 2555 1825 1825 1825 2190 2190 1460 1825 1825 2555 2190 365 1095 365 730 730 365 730 730 730 1095 730 730 730 730 1095 730 730 730 730 730 730 730 730 730 730 730 730 1095 730 730 730 730 730 730 1095 1095 730 730 1095 1095 730 1095 1095 1460 1460 730 730 1460 730 1095 1460 1095 1095 1095 1460 1460 1095 1460 1095 1095 1095 1095 1460 1095 1095 1095 1460 1460 730 1095 1095 1460 1460 1095 1095 1460 1095 1460 1460 1095 1460 1460 1460 1095 1095 1460 1095 1095 1095 1460 1460 1095 1460 1460 1095 1460 1095 1460 1095 ;  % d, time since birth
            13.5 14 14.1 14.4 14.4 14.6 14.7 15 15.1 15.3 15.5 15.5 15.5 15.5 15.6 15.7 15.8 15.8 15.8 15.9 15.9 16 16 16.1 16.1 16.1 16.2 16.3 16.4 16.4 16.5 16.5 16.5 16.5 16.6 16.6 16.6 16.7 16.7 16.8 16.8 17 17.1 17.1 17.1 17.1 17.1 17.2 17.2 17.2 17.2 17.2 17.2 17.2 17.2 17.3 17.3 17.3 17.3 17.4 17.4 17.4 17.5 17.5 17.5 17.5 17.6 17.6 17.6 17.7 17.8 17.8 17.8 17.8 17.9 18 18 18 18 18 18 18.1 18.1 18.1 18.1 18.1 18.1 18.1 18.2 18.2 18.2 18.2 18.2 18.2 18.2 18.2 18.2 18.2 18.2 18.2 18.3 18.3 18.4 18.4 18.5 18.5 18.5 18.5 18.5 18.6 18.6 18.6 18.6 18.6 18.6 18.6 18.7 18.7 18.8 18.8 18.8 18.8 18.8 18.9 19 19 19 19 19 19.1 19.1 19.1 19.1 19.1 19.2 19.2 19.2 19.2 19.3 19.3 19.3 19.4 19.4 19.4 19.4 19.5 19.5 19.5 19.6 19.6 19.6 19.6 19.7 19.7 19.7 19.7 19.7 19.7 19.8 19.9 20 20 20.1 20.3 20.3 20.4 20.7 20.7 20.7 20.9 21 21.1 21.1 21.3 21.8 22.2 22.2 22.5 22.7 22.7 23 25.3 26 12 16.8 12.7 13.2 13.6 13.9 14.1 14.1 14.4 14.4 14.5 14.5 14.5 14.5 14.5 14.6 14.6 14.7 14.9 14.9 14.9 14.9 14.9 15 15 15.1 15.1 15.1 15.2 15.2 15.3 15.3 15.3 15.3 15.4 15.5 15.7 15.7 15.7 15.7 16 16 16 16 16 16.1 16.2 16.2 16.3 16.3 16.3 16.4 16.4 16.5 16.5 16.5 16.6 16.6 16.7 16.7 16.7 16.7 16.7 16.8 16.8 16.8 16.8 16.8 16.9 16.9 16.9 16.9 16.9 17 17 17 17.1 17.2 17.3 17.4 17.4 17.4 17.5 17.6 17.6 17.6 17.7 17.7 17.7 17.7 17.8 18 18 18.1 18.5 18.5 18.6 19.1 19.2]';   % cm, total length at f and T
data.tL(:,1) = data.tL(:,1) - 0.33*365; % convert year class to time since birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  bibkey.tL = 'BoufBell2023';
  temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  
data.LW = [21.2 15.9 18.2 20.7 17.1 19.1 16 15.7 17.6 18.5 18.6 18 19 22.2 17.1 16.1 17.9 19.2 19.1 17.3 21.8 20.8 19.4 21.9 19.9 18 19.7 19.6 22.6 19.2 17.2 20.3 18.1 19.9 20 19.8 21.4 20.4 26 18 20.3 22.9 19.7 21 17.6 18.2 18.2 22 20.3 20.7 23 21.1 19.5 20.5 16.8 20.7 18.3 17.2 21.2 16.7 16.5 15.5 17.3 15.3 13.6 12.7 15 15.3 12 16.2 19.4 16.3 18.1 16.1 17.2 16.5 21.3 22.2 15.5 15.3 14.1 18.2 16.8 15.1 17.3 18.2 17.2 19.2 16.8 16.9 16.9 18.6 17.2 16.5 16.9 15.3 19.3 17.7 16.2 19.1 16 16.7 20.5 18.5 18.6 16.6 18.1 19.1 14.5 18.1 14 19.7 18 19.5 19.4 18.6 18.1 19 17.1 15.2 18.6 17.6 14.9 20.7 18.9 15.7 19.7 19.9 18.6 15.5 19.7 19.4 17.4 15.6 20 17.2 20.9 19.6 17.5 20.1 18.6 18.6 17.3 18 16.8 16 19.5 17.6 16.4 14.4 18.1 19 15.3 16.7 18.1 14.5 17.7 15.1 18.7 17.4 17.2 19.4 18.5 14.6 15.5 16.4 22.7 15.7 18.2 17.4 18.8 15.1 14.7 17.7 18.2 16.6 13.9 17.5 19.7 18.4 19 16.1 16.4 16.6 17.4 19.3 16.9 17.7 17.2 17.4 16.4 16.8 18.2 20.6 19.1 18.2 14.6 22.2 18.2 17.1 18 19.2 20.2 16.6 20.7 16.1 16.6 18.1 16.7 18.5 17.6 16.6 17.5 18.2 16.5 18.8 17.6 17.4 15.9 15.6 18.3 18.1 15 13.5 17 18 18 15.5 17.1 17.2 15.3 16.5 18.5 17.8 19.2 17 18 17.1 15.2 18.4 15.5 17.3 14.1 16.9 17.6 17.2 18.8 21.1 14.4 18 14.4 19 18.5 18.2 16.3 18 18.2 16.8 16 17 17.2 14.9 17.8 16.9 17.8 17 20 18.8 16 17.4 17.5 17.2 16.7 16 16.4 17 19.1 15.8 17.7 17.8 15.8 14.7 16.8 23.5 18.8 15.7 17.8 18.5 16.7 18.8 17.6 19.6 18.9 16.3 22.7 22.5 25.3 20.1 21.3 14.9 19.6 16 16.7 17.5 15.8 18.5 14.5 15.5 21.1 16.7 18.1 19 19.2 16.2 17 17 16.5 19.3 15.4 16.2 15 16.8 14.4 15.3 15.8 16.8 15.5 16.8 17.1 15.4 15.2 15 14.5 15.1 16.5 15.6 18.7 16.3 16 14.9 16.2 14.6 13.2 16.5 14.5 14.1 15.3 15.7 15.8 15.1 14.9 14.6 14.5 15.3 20.2 16.1 14.5 18.9 17 15.8 22.1 17.5 16.1 15 16.5 13.5 15 17.4 14 13.4 16.9 14.5 16.3 15.2 16.5 14.4 13.4 ;    % cm, total length at f
         65.78 25.47 44.53 59.92 33.65 47.89 26.93 26.7 35.87 44 41.87 45.13 55.01 66.98 34.2 28.26 38.59 44.75 55.86 35.41 70.3 66.85 53.64 70.27 64.17 41.83 57.2 55.64 92.77 61.93 36.88 56.39 44.08 66.06 65.92 69.29 84.86 75.95 138.14 48.34 79.34 96.56 59.75 73.06 40.99 48.76 48.09 90.91 68.61 77.05 101.47 72.03 57.98 76.62 36.02 66.1 46.93 34.46 76.15 37.74 34.19 28.12 32.97 28.35 19.77 15.26 28.03 28.01 14.33 26.41 54.56 34.9 42.87 31.93 38.85 34.12 84.31 101.93 24.76 27.54 21.43 40.13 36.2 23.43 41.93 48.32 38.1 61.82 37.11 35.07 37.18 45.76 42.87 32.12 42.15 29.59 52.75 42.4 33.69 54.64 31.09 28.8 66.19 47.58 55.51 32.29 47.89 52.46 24.01 43.63 21.93 60.49 46.93 60.74 50.1 54.35 48.68 55.5 40.42 29.64 42 33.74 21.56 57.85 46.43 30.57 47.73 54.72 46.91 23.93 60.46 51.96 36.14 25.77 57.88 34.3 59.95 49.6 40.31 56.9 39.7 44.81 32.49 40.76 31.29 29.48 52.26 39.45 32.61 19.43 44.83 49.82 23.65 32.62 42.41 20.18 39.1 25.1 46.75 41.94 40.94 52.49 52.53 22 28.73 31.66 92.25 29.01 44.27 38.87 54.14 27.17 22.64 39.72 40.94 39.21 19.87 40.76 43.65 42.8 48.82 27.12 29.54 31.57 39.91 55.43 35.26 34.09 36.95 38.71 26.49 33.3 43.33 59.21 45.04 38.73 20.3 74.39 42.79 29.1 41.23 54.17 62.89 36.09 69.07 28.68 29.25 39.83 30.51 40.64 41.49 30.53 44.87 46.88 31.62 51.56 38.9 32.34 29.93 27.03 45.39 47.48 22.29 18.71 35.49 39.49 49.29 27.99 38.23 34.72 26.1 33.87 41.86 41.18 49.07 33.93 36.7 35.91 25.16 52.72 25.38 34.35 21.84 35.52 40.41 39.21 47.7 55.14 21.8 38.63 20.69 45.5 44.91 50.02 36.85 33.9 52.18 35.54 28.06 31.45 39.34 22.25 40.78 37.31 43.13 33.62 64.79 44.23 31.82 38.77 47.09 40.1 30.59 29.29 33.09 40.31 48.03 29.81 42.12 46.1 24.86 21.66 31.05 108.73 42.24 26.51 44.87 44.19 33.41 49.31 38.26 55.25 47.2 31.77 90.63 121.71 122.64 65.18 70.47 20.86 55.42 28.94 31.29 39.48 26.03 47.44 20.31 25.82 65.43 34.65 48.3 53.54 56.69 35.72 31.95 38.67 35.88 57.28 28.24 30.74 28.01 38.86 23.45 30.51 32.9 36.03 27.49 38.9 39.48 27.44 26.26 26.26 24.09 25.95 36.25 26.68 58.16 32.73 33.92 26.89 35.26 25.12 16.6 34.59 26.47 18.44 26.59 32.12 34.67 25.23 22.44 25.77 21.28 29.62 67.56 35.22 21.85 58.24 33.26 26.88 72.8 41.63 30.83 23.34 29.71 16.68 22.7 38.31 17.92 15.74 35.87 24.45 29.31 23.66 29.63 19.33 15.3]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  bibkey.LW = 'BoufBell2023';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Links
metaData.links.id_CoL = '999999'; % Cat of Life
metaData.links.id_ITIS = '616555'; % ITIS
metaData.links.id_EoL = '46569931'; % Ency of Life
metaData.links.id_Wiki = 'Citharus_linguatula'; % Wikipedia
metaData.links.id_ADW = 'Citharus_linguatula'; % ADW
metaData.links.id_Taxo = '171358'; % Taxonomicon
metaData.links.id_WoRMS = '127130'; % WoRMS
metaData.links.id_fishbase = 'Citharus-linguatula'; % fishbase

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Citharus_linguatula}}';
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
bibkey = 'BoufBell2023'; type = 'techreport'; bib = [ ...  
'author = {Boufersaoui, S. and Bellili, N. and Seghaier, A.}, ' ...
'year = {2023}, ' ...
'title  = {Effet des parametres du milieu sur la reproduction et la dynamique de population de \emph{Citharus linguatula} {{L}innaeus, 1758} des eaux centre alg\''{e}rienne selon la th\''"{e}orie DEB}, ' ...
'institution = {ENSSMAL Univ., Algiers}']; ...
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.se/summary/Citharus-linguatula.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mari1978'; type = 'Book'; bib = [ ... 
'author = {Mari, J.Y. and Aumagter, N. and Lencioni, R. and Bar-Rois, J.M.}, ' ...
'year = {1978}, ' ...
'title = {Contribution to the study of Pelagic eggs and larvae of {M}editerranean Fishes}, ' ...
'publisher = {Consiglio Nazionale delle Ricerche}, ' ...
'ISBN = {88-09-01406-8}, ' ...
'pages = {90--100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
%
bibkey = 'CengIsme2014'; type = 'Article'; bib = [ ... 
'author = {Cengiz, Ã. and Ismen, A. and Ozekinci, U.}, ' ...
'year = {2014}, ' ...
'title = {Reproductive biology of the spotted flounder, \emph{Citharus linguatula} ({A}ctinopterygii: {P}leuronectiformes: {C}itharidae), from {S}aros {B}ay (northern {A}egean {S}ea, {T}urkey)}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {44}, ' ...
'pages = {123-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

