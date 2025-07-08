function [data, auxData, metaData, txtData, weights] = mydata_Ferrissia_californica

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Ferrissia_californica'; 
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
metaData.date_subm = [2021 01 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 29]; 

%% set data
% zero-variate data

data.am = 365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Ancylus_fluviatilis';

data.Lb  = 0.06; units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'DillHerm2009';
data.Lp  = 0.215; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'DillHerm2009';
data.Li  = 0.3; units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Jans2015';

data.Wdi  = 2.36e-4; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';  bibkey.Wdi  = 'guess';
 comment.Wdi = 'based on size-corrected value for Ancylus_fluviatilis: 3.4e-3 * (0.3/0.73)^3';

data.Ni  = 3;   units.Ni  = '#'; label.Ni  = 'lifetime reprod output'; bibkey.Ni  = 'guess';   
  temp.Ni = C2K(20);   units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on size-correced value for Ancylus_fluviatilis: 46*(0.3/0.73)^3';
 
% uni-variate data
% time - length
data.tL = [ ... % age (d), shell length (cm)
0.046	0.059
6.759	0.079
6.762	0.073
13.616	0.114
13.706	0.086
20.932	0.137
21.002	0.146
28.227	0.200
28.301	0.203
35.101	0.200
35.311	0.233
42.168	0.268
42.324	0.257];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DillHerm2009';

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

%% Facts
F1 = 'Simultaneous hermaprodite; self fertilisation is obligate';
metaData.bibkey.F1 = 'DillHerm2009'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6HQDF'; % Cat of Life
metaData.links.id_ITIS = '1132739'; % ITIS
metaData.links.id_EoL = '52227280'; % Ency of Life
metaData.links.id_Wiki = 'Ferrissia_californica'; % Wikipedia
metaData.links.id_ADW = ''; % ADW not present
metaData.links.id_Taxo = '5390699'; % Taxonomicon
metaData.links.id_WoRMS = '1001489'; % WoRMS
metaData.links.id_molluscabase = '1001489'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ferrissia_californica}}';
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
bibkey = 'DillHerm2009'; type = 'Article'; bib = [ ... 
'author = {Robert T. Dillon and Jacob J. Herman}, ' ... 
'doi = {10.1080/02705060.2009.9664291}, ' ...
'title = {Genetics, Shell Morphology, and Life History of the Freshwater Pulmonate Limpets \emph{Ferrissia rivularis} and \emph{Ferrissia fragilis}}, ' ...
'journal = {Journal of Freshwater Ecology}, ' ...
'number = {2}, ' ...
'volume = {24}, ' ...
'year = {2009}, ' ...
'pages = {1-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jans2015'; type = 'Book'; bib = [ ... 
'author = {Jansen, B.}, ' ...
'year = {2015}, ' ...
'title  = {Veldgids Slakken en mossels}, ' ...
'publisher = {KNNV, Zeist}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
