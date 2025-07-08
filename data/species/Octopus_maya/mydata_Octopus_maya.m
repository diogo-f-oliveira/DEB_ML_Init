function [data, auxData, metaData, txtData, weights] = mydata_Octopus_maya

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Octopus_maya'; 
metaData.species_en = 'Yucatan octopus'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMc', 'jiMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2013 08 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 01 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab = 45;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Heuk1976';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 6*30.5; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Heuk1976';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 255;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Heuk1976';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.7;   units.Lb  = 'cm';  label.Lb  = 'mantle length at birth';  bibkey.Lb  = 'Heuk1976';

data.Wwb = 0.1;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Heuk1976';
data.Wwi = 3250;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Heuk1976';

data.Ni  = 4500;  units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'Heuk1976';   
  temp.Ni = C2K(24);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
  1      .1
 15      .25
 30      .62
 45     1.5
 60     3.8
 75     9.7
 90    24.7
105    58.0
120   124
135   249
150   462
165   766
180  1159
195  1648
211  2173
225  2638
240  2992
255  3262];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Heuk1976';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Ni = 100 * weights.Ni;
weights.Lb = 0; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'z is not well-fixed by data, size ultimate size is much larger than size at death';
D2 = 'in view of fitting results, puberty does not coincide with mating and part of structure converts to eggs just before death';
D3 = 'Data point Lb is hard to believe, given Wwb';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'semelparous: death at first spawning, 10 d after last hatch';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Digestion efficiency independent of feeding rate';
metaData.bibkey.F2 = 'Heuk1976'; 
F3 = 'small eggs with a planktontic larval stage, difficult to culture';
metaData.bibkey.F3 = 'Heuk1976'; 
F4 = 'hatches using a hatching gland (Hoyles organ)';
metaData.bibkey.F4 = 'Heuk1976'; 
F5 = 'males and females grow at the same rate';
metaData.bibkey.F5 = 'Heuk1976'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '48KN7'; % Cat of Life
metaData.links.id_ITIS = '82632'; % ITIS
metaData.links.id_EoL = '492848'; % Ency of Life
metaData.links.id_Wiki = 'Octopus_maya'; % Wikipedia
metaData.links.id_ADW = 'Octopus_maya'; % ADW
metaData.links.id_Taxo = '158249'; % Taxonomicon
metaData.links.id_WoRMS = '341996'; % WoRMS
metaData.links.id_molluscabase = '341996'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Octopus}}';
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
bibkey = 'Heuk1976'; type = 'Phdthesis'; bib = [ ... 
'author = {Heukelem, W. F. van.}, ' ... 
'year = {1976}, ' ...
'title = {Growth, bioenergetics and life span of \emph{Octopus cyanea} and \emph{Octopus maya}}, ' ...
'howpublished = {\url{http://scholarspace.manoa.hawaii.edu/handle/10125/18157}}, ' ...
'school = {Univ Hawaii}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

