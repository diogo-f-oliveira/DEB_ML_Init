function [data, auxData, metaData, txtData, weights] = mydata_Microchirus_azevia

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Microchirus_azevia'; 
metaData.species_en = 'Bastard sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.8); % K
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L', 'L-W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Samira Boufersaoui'};            
metaData.date_subm   = [2018 06 13];                      
metaData.email       = {'samira.boufersaoui@gmail.com'}; 
metaData.address     = {'ENSSMAL, 16000, Algeria'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 06 30]; 

%% set data
% zero-variate data;

data.tp = 1438.54;      units.tp = 'd';      label.tp = 'time since birth at puberty';  bibkey.tp = {'BoufZero2018','fishbase'};
  temp.tp = C2K(13.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';        
data.am = 2555;       units.am = 'd';    label.am = 'life span';                   bibkey.am = {'BoufZero2018',};   
  temp.am = C2K(13.8);  units.temp.am = 'K'; label.temp.am = 'temperature';        
  
data.Lb  = 0.34;   units.Lb  = 'cm';   label.Lb  = ' total length at birth';   bibkey.Lb  = 'Mari1991';
data.Lp  = 17.51;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'BoufZero2018';
data.Li  = 39.27;   units.Li  = 'cm';   label.Li  = 'ultimate total lenght';    bibkey.Li  = 'BoufZero2018';

data.Wwb = 0.000516; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BoufZero2018';
data.Wwp = 53.68;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'BoufZero2018';
data.Wwi = 572.70;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BoufZero2018';

data.Ri  = 422.79; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BoufZero2018';   
temp.Ri = C2K(13.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

data.tL = [365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 2190 2190 2190 2190 2555 ; % d, time since birth
            7.203 5.169 7.124 6.503 7.724 6.468 7.161 8.310 6.103 5.662 7.335 6.326 6.143 4.967 4.460 5.649 6.578 6.534 7.794 7.543 7.243 6.824 8.244 4.657 5.689 8.593 6.037 8.463 5.538 6.322 7.351 7.530 6.423 6.414 6.290 6.931 5.070 6.492 6.353 8.093 5.531 7.297 8.115 4.886 6.690 4.960 7.962 8.324 6.457 6.967 6.519 6.805 5.293 6.301 6.226 8.403 6.347 6.998 6.859 7.135 6.516 6.813 5.144 7.336 5.932 6.626 5.800 5.789 5.087 5.847 4.528 6.833 6.501 5.297 6.501 7.410 6.717 6.010 7.649 6.558 6.225 5.381 5.072 6.486 6.362 4.977 8.820 5.811 5.959 4.936 6.741 5.016 5.416 5.130 5.761 6.055 8.624 4.556 5.498 10.679 8.502 9.071 10.500 9.502 9.390 10.357 11.591 8.277 8.226 10.583 10.539 10.813 7.760 9.047 9.805 10.211 9.934 10.701 10.577 10.072 10.891 11.301 8.874 10.480 10.885 11.134 12.274 8.968 9.456 11.297 9.281 9.860 9.643 9.246 10.308 9.416 10.695 10.977 11.211 10.085 10.544 11.331 8.225 10.206 10.362 10.993 12.251 8.863 10.167 9.996 10.004 9.104 9.383 9.420 12.233 9.784 9.419 9.776 10.419 10.678 9.745 8.468 10.014 10.392 9.740 7.549 9.316 7.511 9.122 9.304 10.848 11.048 8.885 10.082 9.144 11.335 9.507 10.950 9.268 10.855 9.939 9.558 9.996 11.494 8.890 12.204 8.464 10.268 8.951 12.408 8.237 9.217 8.783 13.444 11.909 13.584 13.779 13.219 12.794 14.589 14.871 11.917 14.464 13.636 13.416 15.380 11.855 11.565 13.957 14.174 13.246 14.145 14.151 13.483 14.137 14.188 12.616 13.668 13.912 15.878 16.094 12.472 12.883 14.426 11.998 12.974 12.360 12.498 13.737 13.456 13.710 13.323 13.992 14.473 14.390 15.207 12.057 13.627 13.535 15.642 15.568 12.103 13.612 12.826 12.579 13.451 14.893 12.714 15.711 13.238 13.243 14.624 13.704 15.868 14.415 11.040 13.903 13.790 13.164 11.743 13.563 12.445 13.130 11.023 15.441 14.446 12.856 13.105 12.890 16.072 13.578 14.374 14.467 13.533 15.762 12.598 13.283 15.330 13.829 16.605 18.033 15.122 17.375 19.416 16.936 16.608 18.393 18.370 17.251 18.742 17.194 16.499 17.995 15.373 16.228 16.090 17.972 17.401 18.236 17.835 17.726 16.697 17.585 16.529 16.197 17.969 19.305 18.447 14.934 16.702 18.155 15.011 17.161 16.786 16.145 16.839 18.117 17.253 17.666 16.401 19.441 17.809 19.871 17.267 19.060 16.574 18.568 20.106 15.797 17.663 17.031 17.969 17.638 18.216 17.905 17.400 16.793 17.337 18.958 18.528 20.288 19.193 14.001 18.309 17.507 21.052 19.038 21.579 22.388 19.845 21.375 20.723 21.432 21.837 21.432 19.213 21.535 20.863 18.080 19.672 18.826 20.861 20.288 21.251 21.737 20.060 20.234 21.152 21.031 20.303 22.355 22.731 22.441 18.363 20.423 21.757 27.228 21.685 25.372 25.983 31.792]';   % cm, total length at f and T
data.tL(:,1) = data.tL(:,1) - 0.33*365; % convert year class to time since birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  bibkey.tL = 'BoufZero2018';
  temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  
data.LW = [16.5 19.7 21.3 19.5 16.7 19.2 20.2 20.1 18.9 18.6 20.6 20.8 17.2 18.2 18 15.8 11.7 22.1 18.8 18.8 24.2 24.1 16.5 20 15.3 17.5 15.5 23.3 22.2 22.2 20.5 21.8 20.8 24.4 22.3 27 21.3 35.6 24.8 24 26.5 11.4 16.4 16.4 15.1 15.2 20.4 24.4 23.4 19.9 21.1 24.8 21.7 21.5 24 21.8 19.1 20.6 23.5 17.3 23.3 23.9 21.3 16.7 18.7 17 20.8 22.4 20 22.6 21.1 23.7 21.5 23.4 21.3 20.2 21.1 20.7 20.6 21.3 19.9 18.1 ;      % cm, total length at f
         68.05 69.59 78.68 69.82 57 81.5 96.5 103 73.5 72.5 90 94.5 56 65 66.5 46.5 16.5 104.68 70.9 65.52 134.87 144.74 42.19 72.34 31.39 53.43 32.42 140.24 99.94 109.94 82.4 104.91 85.82 130.46 103.63 195.78 94.26 407.42 174.01 136.82 199.72 14.24 41.73 46.58 35.57 33.25 84.84 145.95 129 54.98 87.19 166.19 102.1 98.9 134.78 91.24 72.99 92.45 144.62 49.96 133.78 143.6 88.7 44.4 68.79 44.25 80.81 118.4 73.74 104.28 89.1 118.28 94.14 108.11 91.3 82.73 97.49 78.94 84.12 92.52 68.37 55.06]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  bibkey.LW = 'BoufZero2018';

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
metaData.links.id_CoL = '73G22'; % Cat of Life
metaData.links.id_ITIS = '173024'; % ITIS
metaData.links.id_EoL = '46570266'; % Ency of Life
metaData.links.id_Wiki = 'Microchirus_azevia'; % Wikipedia
metaData.links.id_ADW = 'Microchirus_azevia'; % ADW
metaData.links.id_Taxo = '465748'; % Taxonomicon
metaData.links.id_WoRMS = '274299'; % WoRMS
metaData.links.id_fishbase = 'Microchirus-azevia'; % fishbase


%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microchirus_azevia}}';
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
bibkey = 'BoufZero2018'; type = 'techreport'; bib = [ ...  
'author = {Boufersaoui, S. and Zeroual, H.}, ' ...
'year = {2018}, ' ...
'title  = {Estimation des param\`{e}tres  du mod\`{e}le bio\''{e}nerg\''{e}tique {DEB} pour \''{e}tudier la croissance et la reproduction de quelques esp\`{e}ces des c\^{o}tes alg\''{e}riennes}, ' ...
'institution = {ENSSMAL Univ., Algiers}']; ...
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.se/summary/Microchirus-azevia.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mari1991'; type = 'Article'; bib = [ ... 
'author = {Marinaro, J.Y.}, ' ...
'year = {1991}, ' ...
'title = {EGGS OF THE \emph{Microchirus} (\emph{Soleidae}) FROM THE {B}AY OF {A}LGIERS}, ' ...
'journal = {Mar. Biol. Assoc. UK}, ' ...
'volume = {71}, ' ...
'pages = {89--101}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
