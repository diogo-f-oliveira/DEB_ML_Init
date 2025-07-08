function [data, auxData, metaData, txtData, weights] = mydata_Orconectes_neglectus

%% set metaData 
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Cambaridae';
metaData.species    = 'Orconectes_neglectus'; 
metaData.species_en = 'Ringed crayfish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp', '0iFm', '0iFc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'}; % Marbled crayfish eat almost everything, but seem to prefer plant material and snails
metaData.ecoCode.gender  = {'D'}; 
metaData.ecoCode.reprod  = {'O'}; 

metaData.T_typical  = C2K(20); 
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'};

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 10 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2020 10 08];      

%% set data
% zero-variate data
data.am = 4*365;    units.am = 'd';    label.am = 'life span';        bibkey.am = 'SousHold2006';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; % room temperature
  comment.am = 'value for Orconectes Limosus'; 

data.Lp  = 1.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'LarsMago2008'; 
data.Li  = 2.1;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length'; bibkey.Li  = 'LarsMago2008';

data.Wwb = 5.6e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.2 mm: pi/6*0.22^3';
data.Wwp = 0.913;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'LarsMago2008';
    comment.Wwp = 'based on exp(-8.53)*(10*Lp)^3.29, see F1'; 
data.Wwi = 4.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'LarsMago2008';
    comment.Wwi = 'based on exp(-8.53)*(10*Li)^3.29, see F1'; 

% uni-variate data
% time - length
data.tL = [ ... % time since 1 May (d), carapace length (cm)
29.328	0.660
42.385	0.860
65.486	1.182
95.216	1.417
137.401	1.635
163.917	1.729];
data.tL(:,1) = data.tL(:,1) - 5; % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time', 'carapace length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LarsMago2008';

% length - fecundity
data.LN = [ ... % carapace length (cm), fecundity (#)
1.379	39.141
1.442	41.357
1.497	25.757
1.511	51.388
1.622	42.062
1.726	82.421
1.859	107.481
1.931	82.200
1.958	29.088
2.025	110.992
2.097	86.962
2.391	150.531
2.515	143.399];
units.LN = {'cm', '#'}; label.LN = {'carapace length','fecundity'};  
temp.LN = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LarsMago2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;  % more weight to age at birth

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Model  std is applied, instead of abj, since freshwater crayfish, unlike marine decapods, have no larval stage';
metaData.discussion = struct('D1',D1);  

%% Facts 
F1 = 'length-weight: Ww in g = exp(-8.53)*(carapace length in mm)^3.29';
metaData.bibkey.F1 = 'LarsMago2008'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7TVSF'; % Cat of Life
metaData.links.id_ITIS = '97465'; % ITIS
metaData.links.id_EoL = '343414'; % Ency of Life
metaData.links.id_Wiki = 'Orconectes'; % Wikipedia
metaData.links.id_ADW = 'Orconectes_neglectus'; % ADW
metaData.links.id_Taxo = '499655'; % Taxonomicon
metaData.links.id_WoRMS = '885727'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orconectes}}';
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
bibkey = 'LarsMago2008'; type = 'Article'; bib = [ ...
'author = {Eric R. Larson and Daniel D. Magoulick}, ' ...
'year = {2008}, ' ...
'title = {Comparative Life History of Native (\emph{Orconectes eupunctus}) and Introduced (\emph{Orconectes neglectus}) Crayfishes in the {S}pring {R}iver {D}rainage of {A}rkansas and {M}issouri}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {160(2)}, ' ...
'pages = {323-341}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SousHold2006'; type = 'Book'; bib = [ ...  
'author = {Souty-Grosset, C. and Holdich, D. M. and No\"{e}l, P. Y. and Reynolds, J. D. and Haffner, P.}, ' ...
'year = {2006}, ' ...
'title  = {Atlas of crafish in Europe}, ' ...
'publisher = {Publications Scientifiques du MNHN, Paris}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
