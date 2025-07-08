function [data, auxData, metaData, txtData, weights] = mydata_Cyprideis_torosa

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Ostracoda'; 
metaData.order      = 'Podocopida'; 
metaData.family     = 'Cytherideidae';
metaData.species    = 'Cyprideis_torosa'; 
metaData.species_en = 'Ostracod'; 
metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TA', 'TN', 'TP'};
metaData.ecoCode.habitat = {'0iFm', '0iFp', '0iSm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};
metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi';'Ri'}; 
metaData.data_1     = {'t-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jan Baas'};    
metaData.date_subm = [2013 09 19];              
metaData.email    = {'janbaa@ceh.ac.uk'};            
metaData.address  = {'CEH, UK'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab = 10;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Heip1976';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 100;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Heip1976';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Heip1976';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.13;  units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = {'Heip1976','HermHeip1982'};
data.Lp  = 0.75;  units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Heip1976';
data.Li  = 1.1;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'HermHeip1982';

data.Wdb = 4.5E-08;  units.Wdb = 'g'; label.Wdb = 'dry weight at birth';    bibkey.Wdb = 'HermHeip1982';
data.Wdp = 1.03E-05; units.Wdp = 'g'; label.Wdp = 'dry weight at puberty';  bibkey.Wdp = 'HermHeip1982';
data.Wdi = 2.00E-05; units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'HermHeip1982';
  comment.Wdi = 'Weight exclude shell';
 
data.Ri  = 0.1;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Heip1976';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'conflicting data are presented, values between 0.03 and 0.15 can be derived or found';
  
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), dry weight (excluding the shell) (g)
    9    7.7E-07
    34   1.4E-06
    91   2.9E-06
    176  5.3E-06
    252  10.3E-06
    365  20.0E-06];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'dry weight'};  
temp.tW    = C2K(15);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'HermHeip1982';
comment.tW = 'Temp is guessed';
  
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

%% Discussion points
D1 = '(ap,Wdp) is not on the data-curve for t-Wd';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = ['Cyprideis torosa is a very important meiofauna species in the shallow brackish water habitat we studied. '...
    'The animals develop through eight larval instars before becoming adult. ' ... 
    'The eggs are produced during the summer months and are contained between the shells of the mother, as are the instar I animals. ' ...
    'In autumn the development of the juveniles slows down and it stops altogether in winter. ' ...
    'Due to this prolonged reproduction the population passes the winter in different stages (instar V to adult). ' ...
    'Only in the next spring do overwintering juveniles become adult and reproduce. The species thus has one generation annually.'];
metaData.bibkey.F1 = 'Heip1976'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '33HD8'; % Cat of Life
metaData.links.id_ITIS = '84714'; % ITIS
metaData.links.id_EoL = '46499360'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Cyprideis_torosa'; % ADW
metaData.links.id_Taxo = '33329'; % Taxonomicon
metaData.links.id_WoRMS = '127986'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyprideis_torosa}}';
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
bibkey = 'Heip1976'; type = 'Article'; bib = [ ... 
'author = {C. Heip}, ' ... 
'year = {1976}, ' ...
'title = {the life cycle of \emph{Cyprideis torosa} ({C}rustacea, {O}stracoda)}, ' ...
'journal = {Oecologia}, ' ...
'volume = {24}, ' ...
'pages = {229--245}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HermHeip1982'; type = 'Article'; bib = [ ... 
'author = {P. M. J. Herman and C. Heip}, ' ... 
'year = {1982}, ' ...
'title = {Growth and respiration of \emph{Cyprideis torosa} {J}ones 1850 ({C}rustacea, {O}stracoda)}, ' ...
'journal = {Oecologia}, ' ...
'volume = {54}, ' ...
'pages = {300--303}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

