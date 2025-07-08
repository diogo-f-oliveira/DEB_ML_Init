function [data, auxData, metaData, txtData, weights] = mydata_Dilatata_dilatata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Dilatata_dilatata'; 
metaData.species_en = 'Trumpet ramshorn'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 29]; 

%% set data
% zero-variate data

data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'FrieGood1963';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '6-9 d';
data.am = 150;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'FrieGood1963';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.038; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'FrieGood1963';
data.Lp  = 0.18; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'FrieGood1963';
  comment.Lp = 'based on tp = 50 d in tL data (but ulitmate length is much smaller than the Wiki-value';
data.Li  = 0.9; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwi  = 0.53; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on size-corrected value for Planorbarius corneus: 1.6*(0.9/1.3)^3';

data.Ri  = 1/4;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'FrieGood1963';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - length
data.tL = [ ... % age (d), total length (mm)
0.000	0.382
6.946	0.550
13.738	0.856
20.858	1.347
28.339	1.533
35.151	1.541
41.957	1.638
49.096	1.848
56.075	1.903
63.392	2.000
70.031	2.055
77.351	2.111
84.499	2.178
91.313	2.161
98.292	2.223
105.445	2.230
112.258	2.226
119.411	2.221
126.218	2.306
133.197	2.361
140.522	2.351];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell diameter'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FrieGood1963';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7R33M'; % Cat of Life
metaData.links.id_ITIS = '997230'; % ITIS
metaData.links.id_EoL = '586542'; % Ency of Life
metaData.links.id_Wiki = 'Menetus_dilatatus'; % Wikipedia
metaData.links.id_ADW = 'Menetus_dilatatus'; % ADW
metaData.links.id_Taxo = '5353185'; % Taxonomicon
metaData.links.id_WoRMS = '1376297'; % WoRMS
metaData.links.id_molluscabase = '1376297'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Menetus_dilatatus}}';
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
bibkey = 'FrieGood1963'; type = 'Article'; bib = [ ... 
'author = {Bernard Fried and Chauncey G. Goodchild}, ' ... 
'title = {STUDIES ON THE REPRODUCTION, GROWTH, AND SURVIVAL OF A PLANORBID SNAIL, \emph{Menetus dilatatus} {B}UCHANENSIS ({L}EA), AN EXPERIMENTAL HOST OF \emph{Spiorchis sp.} ({T}REMATODA)}, ' ...
'journal = {Transactions of the American Microscopical Society}, ' ...
'number = {2}, ' ...
'volume = {82}, ' ...
'year = {1963}, ' ...
'pages = {143-149}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
