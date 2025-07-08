function [data, auxData, metaData, txtData, weights] = mydata_Urocitellus_richardsonii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Urocitellus_richardsonii'; 
metaData.species_en = 'Richardson''s ground squirrel'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2017 12 29];              

%% set data
% zero-variate data

data.tg = 24;    units.tg = 'd';     label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '95 till 111 d';
data.tx = 36;    units.tx = 'd';     label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 335;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;    units.am = 'd'; label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(35.4); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data is uncertain';
  
data.Wwb = 6.35;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 92.8;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 342.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';

data.Ri  = 6.06/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6.06 pups per litter; 1 litter per yr';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
1.961	7.671
7.843	16.021
11.485	29.546
15.966	38.549
19.328	43.043
22.689	59.151
27.451	67.507
34.174	113.915
38.095	144.858
41.457	188.062
45.658	224.809
53.782	257.660
61.905	275.027
73.389	322.049
87.955	316.149];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(35.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ZullRick1984';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwi = 10 * weights.Wwi;
weights.Wwb = 10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7DTRW'; % Cat of Life
metaData.links.id_ITIS = '930322'; % ITIS
metaData.links.id_EoL = '327848'; % Ency of Life
metaData.links.id_Wiki = 'Urocitellus_richardsonii'; % Wikipedia
metaData.links.id_ADW = 'Spermophilus_richardsonii'; % ADW
metaData.links.id_Taxo = '5726074'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12401074'; % MSW3
metaData.links.id_AnAge = 'Urocitellus_richardsonii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urocitellus_richardsonii}}';
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
bibkey = 'ZullRick1984'; type = 'Article'; bib = [ ... 
'author = {E. M. Zullinger and R. E. Ricklefs and K. H. Redford and G. M. Mace}, ' ... 
'year = {1984}, ' ...
'title = {Fitting Sigmoidal Equations to Mammalian Growth Curves}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {65}, ' ...
'number = {4}, ' ...
'pages = {607--636}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Urocitellus_richardsonii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

