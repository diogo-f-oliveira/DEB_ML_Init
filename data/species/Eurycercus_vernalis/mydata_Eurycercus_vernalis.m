function [data, auxData, metaData, txtData, weights] = mydata_Eurycercus_vernalis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Eurycercidae';
metaData.species    = 'Eurycercus_vernalis'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'; 't-N_T'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 12]; 

%% set data
% zero-variate data

data.ab = 1.9;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'LemkBenk2004';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 8;     units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'LemkBenk2004';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 60;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'LemkBenk2004';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.059; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb = 'LemkBenk2004';
data.Lp  = 0.154; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp = 'LemkBenk2004';
data.Li  = 0.270; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li = 'LemkBenk2004';

data.Wdb  = 2.23; units.Wdb  = 'mug'; label.Wdb  = 'dry weight at birth';   bibkey.Wdb = 'LemkBenk2004';
data.Wdp  = 39.2;    units.Wdp  = 'mug'; label.Wdp  = 'dry weight at puberty'; bibkey.Wdp = 'LemkBenk2004';
data.Wdi  = 211.3;   units.Wdi  = 'mug'; label.Wdi  = 'ultimate dry weight';   bibkey.Wdi = 'LemkBenk2004';
  comment.Wdi = 'based on (Li/Lp)^3*Wdp';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm) at 20,.,10 C
  0	0.590 0.590 0.590 0.590
  5	1.122 1.024 0.945 0.778
 10	1.694 1.556 1.300 0.986
 15	1.921 1.783 1.537 1.203
 20	2.070 1.961 1.765 1.391
 25	2.071 2.021 1.933 1.539
 30	2.190 2.150 1.993 1.727
 35	2.250 2.240 2.082 1.758
 40	2.319 2.319 2.211 1.906
 45	2.340 2.360 2.252 2.025
 50	2.380 2.380 2.371 2.056
 55	2.371 2.372 2.421 2.145
 60	2.373 2.412 2.451 2.196
 65	2.452 2.413 2.482 2.226
 70	2.443 2.473 2.532 2.276
 75  NaN  2.513 2.562 2.336
 80  NaN  2.524 2.593 2.376
 85  NaN  NaN   2.633 2.436
 90  NaN  NaN   2.673 2.496
 95  NaN  NaN   2.606 2.507
100 NaN   NaN   2.607 2.498];
data.tL(:,2:5) = data.tL(:,2:5)/ 10; % convert mm to cm
units.tL  = {'d','cm'};  label.tL = {'time since birth', 'length'};  
bibkey.tL = 'LemkBenk2004'; treat.tL = {1 {'25 C','20 C','15 C','10 C'}};
label.treat.tL = 'temperature';
  
% time- cum # of eggs
data.tN = [ ... % time since birth (d), length (mm) at 20,.,10 C
  0	  1.297   0       0       0
 10	 18.253   6.605   0       0
 15	 37.740  18.965   6.020   0
 20	 59.158  37.153  14.500   2.847
 25	 70.226  48.871  24.273   4.856
 30	 96.830  66.408  35.340  10.095
 35	109.197  82.005  42.526  14.045
 40	132.559  96.958  56.827  23.170
 45	146.862 115.146  75.015  30.357
 50	155.988 122.331  86.734  37.539
 60	171.005 145.758 112.750  55.149
 70	170.486 167.251 136.829  70.164
 80  NaN    172.555 162.845  84.532
 90  NaN    NaN     176.569  94.370
100  NaN    NaN     187.706 106.151];
units.tN  = {'d','#'};  label.tN = {'time since birth', 'cumulative no of eggs'};  
bibkey.tN = 'LemkBenk2004'; treat.tN = {1 {'25 C','20 C','15 C','10 C'}};
label.treat.tN = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL; 
weights.tL(:,4) = 10 * weights.tL(:,4); 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {}; subtitle1 = {};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';
% metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3D3K9'; % Cat of Life
metaData.links.id_ITIS = '84020'; % ITIS
metaData.links.id_EoL = '340960'; % Ency of Life
metaData.links.id_Wiki = 'Eurycercus'; % Wikipedia
metaData.links.id_ADW = 'Eurycercus_vernalis'; % ADW
metaData.links.id_Taxo = '379913'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Eurycercus}}';
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
bibkey = 'LemkBenk2004'; type = 'Article'; bib = [ ... 
'doi = {10.1899/0887-3593(2004)023<0806:GRAPDO}, ' ...
'author = {Lemke, A. Maria and Benke, Arthur C.}, ' ... 
'year = {2004}, ' ...
'title = {Growth, reproduction, and production dynamics of a littoral microcrustacean, \emph{Eurycercus vernalis} ({C}hydoridae), from a southeastern wetland, {USA}}, ' ...
'journal = {Journal of the North American Benthological Society}, ' ...
'volume = {23(4)}, ' ...
'pages = {806–823}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
