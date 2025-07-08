function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_pulex

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_pulex'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH', 'TA'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Louise Stevenson'};    
metaData.date_subm = [2011 03 17];              
metaData.email    = {'louise.m.stevenson@gmail.com'};            
metaData.address  = {'Univ. California, Santa Barbara'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2012 01 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 01 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   


metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2016 10 26];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 01]; 

%% set data
% zero-variate data

data.ab = 3.6;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'GulbJohn1990';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 7.2;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GulbJohn1990';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am =54 ;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Lync1984';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.07; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Lync1984';
data.Lp  = 0.16; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'NisbMcCa2004';
data.Li  = 0.40; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'NisbMcCa2004';

data.Wdb = 2.6e-5; units.Wdb = 'g'; label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'PaloCrab1982';
data.Wdp = 1.9e-4; units.Wdp = 'g'; label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'PaloCrab1982';
data.Wdi = 1.7e-3; units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'PaloCrab1982';

data.Ri  = 7;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'DudyTess1999';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), length (cm)
  0     5    10    15    20    25    30    35    40    45    50;      % d, time since birth
  0.07  0.18  0.23  0.27  0.30  0.32  0.33  0.35  0.36  0.38  0.40]'; % cm, physical length at f and T
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NisbMcCa2004';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Facts
F1 = 'This entry is discussed in NisbMcCa2010';
metaData.bibkey.F1 = 'NisbMcCa2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '345CH'; % Cat of Life
metaData.links.id_ITIS = '83874'; % ITIS
metaData.links.id_EoL = '46498268'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia_pulex'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_pulex'; % ADW
metaData.links.id_Taxo = '33106'; % Taxonomicon
metaData.links.id_WoRMS = '148375'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Daphnia_pulex}}';
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
bibkey = 'GulbJohn1990'; type = 'Article'; bib = [ ... 
'author = {Gulbrandsen, J. and Johnsen, G. H.}, ' ... 
'year = {1990}, ' ...
'title = {Temperature-dependent development of parthenogenetic embryos in \emph{Daphnia pulex} de {G}eer}, ' ...
'journal = {J. Plankton Res.}, ' ...
'doi = {10.1093/plankt/12.3.443}, ' ...
'volume = {12}, ' ...
'pages = {443--453}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaloCrab1982'; type = 'Article'; bib = [ ... 
'author = {Paloheimo, J. E. and Crabtree, S. J. and Taylor, W. D.}, ' ... 
'year = {1982}, ' ...
'title = {Growth model of \emph{Daphnia}}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'doi = {10.1139/f82-084}, ' ...
'volume = {39}, ' ...
'pages = {598-606}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NisbMcCa2004'; type = 'Article'; bib = [ ... 
'author = {Nisbet R. M. and McCauley, E. and Gurney, W. S. C. and Murdoch, W. W. and Wood, S. N.}, ' ... 
'year = {2004}, ' ...
'title = {Formulating and testing a partially specified {D}ynamic {E}nergy {B}udget model}, ' ...
'journal = {Ecology}, ' ...
'doi = {10.1890/03-0429}, ' ...
'volume = {85}, ' ...
'pages = {3132-3139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DudyTess1999'; type = 'Article'; bib = [ ... 
'author = {Dudycha, J. L. and Tessier, A. J.}, ' ... 
'year = {1999}, ' ...
'title = {Natural genetic variation of life span, reproduction and juvenile growth in \emph{Daphnia}}, ' ...
'journal = {Evolution}, ' ...
'volume = {53}, ' ...
'pages = {1744--1756}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NisbMcCa2010'; type = 'Article'; bib = [ ... 
'author = {R. M. Nisbet and E. McCauley and L. R. Johnson}, ' ... 
'year = {2010}, ' ...
'title = {Dynamic {E}nergy {B}udget theory and population ecology: lessons from \emph{Daphnia}}, ' ...
'journal = {Philos Trans R Soc Lond B Biol Sci.}, ' ...
'volume = {365}, ' ...
'pages = {3541-3552}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lync1984'; type = 'Article'; bib = [ ... 
'author = {Lynch , M.}, ' ... 
'year = {1984}, ' ...
'title = {The limits to life history evolution in \emph{Daphnia}}, ' ...
'journal = {Evolution}, ' ...
'volume = {38}, ' ...
'pages = {465--482}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

