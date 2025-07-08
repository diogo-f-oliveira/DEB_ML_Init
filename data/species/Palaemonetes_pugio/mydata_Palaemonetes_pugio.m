function [data, auxData, metaData, txtData, weights] = mydata_Palaemonetes_pugio

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Palaemonetes_pugio'; 
metaData.species_en = 'Daggerblade grass shrimp'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jan Baas';'Bas Kooijman'};    
metaData.date_subm = [2014 05 05];              
metaData.email    = {'janbaa@ceh.ac.uk'};            
metaData.address  = {'CEH, UK'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 02 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 17];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 01]; 

%% set data
% zero-variate data

data.ab = 20;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'Wels1975';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp =40;  units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'Wels1975';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'age at puberty 1.5 - 2 months';
data.am = 400;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'Wels1975';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.26; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wels1975';
data.Lp  = 1.8; units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wels1975';
data.Li  = 5;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'Wels1975';

data.Wwb = 0.0002; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wels1975';
data.Wwp = 0.044;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Wels1975';
data.Wwi = 1;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wels1975';

data.Ri  = 1.33;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Chaz2009';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'max # of eggs: 486/year';
  
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), length (cm)
    16  0.26
    45  2.1
    77  3.2
    106 3.2
    130 3.2
    156 3.2
    185 3.2
    243 3.2
    258 3.2
    275 3.2
    311 3.4
    345 3.9];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wels1975';
comment.tL = 'female growth, the increase in size from 310 coincides with late spring the next year and the warming of the water';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '96390'; % ITIS
metaData.links.id_EoL = '343938'; % Ency of Life
metaData.links.id_Wiki = 'Palaemonetes_pugio'; % Wikipedia
metaData.links.id_ADW = 'Palaemonetes_pugio'; % ADW
metaData.links.id_Taxo = '125153'; % Taxonomicon
metaData.links.id_WoRMS = '932401'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Palaemonetes_pugio}}';
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
bibkey = 'Wels1975'; type = 'Article'; bib = [ ... 
'author = {Welsh, B. L.}, ' ... 
'year = {1975}, ' ...
'title = {The role of grass shrimp, \emph{Palaemonetes pugio}, in a tidal marsh ecosystem}, ' ...
'journal = {Ecology}, ' ...
'volume = {56}, ' ...
'pages = {513--530}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chaz2009'; type = 'Article'; bib = [ ... 
'author = {S. Ch\''{a}zaro-Olvera}, ' ... 
'year = {2009}, ' ...
'title = {Growth, Mortality, and Fecundity of \emph{Palaemonetes pugio} from a Lagoon System Inlet in the {S}outhwestern {G}ulf of {M}exico}, ' ...
'journal = {JOURNAL OF CRUSTACEAN BIOLOGY}, ' ...
'volume = {29}, ' ...
'number = {2}, '...
'pages = {201--207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

