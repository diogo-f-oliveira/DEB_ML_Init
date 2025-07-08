function [data, auxData, metaData, txtData, weights] = mydata_Hebetancylus_excentricus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Hebetancylus_excentricus'; 
metaData.species_en = 'Freshwater limpet'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 30]; 

%% set data
% zero-variate data

data.am = 365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Ancylus_fluviatilis';

data.Lb  = 0.05; units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'McMa1976';
data.Lp  = 0.25; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'McMa1976';
data.Li  = 0.5; units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'McMa1976';

data.Wdi  = 2.36e-4; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';  bibkey.Wdi  = 'guess';
 comment.Wdi = 'based on size-corrected value for Ancylus_fluviatilis: 3.4e-3 * (0.3/0.73)^3';

data.Ni  = 10;   units.Ni  = '#'; label.Ni  = 'lifetime reprod output'; bibkey.Ni  = 'McMa1976';   
  temp.Ni = C2K(20);   units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '5 eggs per capsule, 2 capsule per yr';
 
% uni-variate data
% time - length
data.tL = [ ... % age (d), shell length (cm)
0.000	0.119
100.140	0.116
113.959	0.150
139.782	0.146
167.990	0.271
184.318	0.314
197.574	0.284
210.708	0.370
222.012	0.400
250.377	0.375
283.731	0.397
311.439	0.397];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'McMa1976';
comment.tL = 'Data from White Rock Lake 1973, Dallas Co., Texas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Temperature in C for tL data varies as T(t) = 18+11*cos(2*pi*(t+150)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Simultaneous hermaprodite; Annual, bi- and trivoltine life cycle';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3JY68'; % Cat of Life
metaData.links.id_ITIS = '1132516'; % ITIS
metaData.links.id_EoL = '4803047'; % Ency of Life
metaData.links.id_Wiki = 'Hebetancylus_excentricus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW not present
metaData.links.id_Taxo = '3549842'; % Taxonomicon
metaData.links.id_WoRMS = '743609'; % WoRMS
metaData.links.id_molluscabase = '743609'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hebetancylus_excentricus}}';
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
bibkey = 'McMa1976'; type = 'Article'; bib = [ ... 
'author = {Robert F. McMahon}, ' ... 
'title = {Growth, Reproduction and Life Cycle in Six {T}exan Populations of Two Species of Freshwater Limpets}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'number = {1}, ' ...
'volume = {95}, ' ...
'year = {1976}, ' ...
'pages = {174-185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
