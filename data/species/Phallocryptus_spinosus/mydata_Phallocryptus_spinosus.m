function [data, auxData, metaData, txtData, weights] = mydata_Phallocryptus_spinosus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Thamnocephalidae';
metaData.species    = 'Phallocryptus_spinosus'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'B','C'};
metaData.ecoCode.ecozone = {'THp','TPa'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ap_T';'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri_T'}; 
metaData.data_1     = {'t-L_T'; 'T-am'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 19]; 

%% set data
% zero-variate data

data.tp_20 = 13.6;   units.tp_20 = 'd';    label.tp_20 = 'time since birth at puberty';  bibkey.tp_20 = 'GharNema2016';   
  temp.tp_20 = C2K(20);  units.temp.tp_20 = 'K'; label.temp.tp_20 = 'temperature'; 
data.tp_25 = 8;   units.tp_25 = 'd';    label.tp_25 = 'time since birth at puberty';   bibkey.tp_25 = 'GharNema2016';   
  temp.tp_25 = C2K(25);  units.temp.tp_25 = 'K'; label.temp.tp_25 = 'temperature'; 

data.Lb  = 0.041; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'GharNema2016';
data.Lp  = 0.99;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'GharNema2016';
data.Li  = 1.32;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'GharNema2016';
  
data.Wdi  = 0.001759;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'GharNema2016';
  comment.Wdi = 'based on F1 for Eubranchipus bundyi and Li';

data.Ri_20  = 173.8/12.5;  units.Ri_20  = '#/d'; label.Ri_20  = 'maximum reprod rate'; bibkey.Ri_20  = 'GharNema2016';   
  temp.Ri_20 = C2K(20);  units.temp.Ri_20 = 'K'; label.temp.Ri_20 = 'temperature';
  comment.Ri_20 = 'based on 173.8 eggs in 12.5 d';
data.Ri_25  = 113.7/10.6;  units.Ri_25  = '#/d'; label.Ri_25  = 'maximum reprod rate'; bibkey.Ri_25  = 'GharNema2016';   
  temp.Ri_25 = C2K(25);  units.temp.Ri_25 = 'K'; label.temp.Ri_25 = 'temperature';
  comment.Ri_25 = 'based on 173.8 eggs in 12.5 d';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm), different temperatures
    1  0.43 0.40 0.41 0.38
    3  3.1  3.3  2.1  1.4
    6  7.3  6.5  4.5  2.2
    9 11.3  8.2  6.7  4.0
   12 13.2  9.5  9.9  5.3
   15 NaN  11.4 10.4  6.5
   18 NaN  12.9 11.0  7.4];
data.tL(:,2:5) = data.tL(:,2:5)/10; % convert mm to cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length'};  
temp.tL = C2K([30 25 20 15]); units.temp.tL = 'C'; label.temp.tL = 'temperature'; 
bibkey.tL = 'GharNema2016'; treat.tL = {1 {'30 C','25 C','20 C','15 C'}};
label.treat.tL = 'temperatures'; 

% temperature-life span
data.Tam = [ ... temperature (C), life span (d)
    15 52.6
    20 48.6
    25 38.0
    30  8.2];
units.Tam = {'C', 'd'}; label.Tam = {'temperature', 'life span'};  
bibkey.Tam = 'GharNema2016'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL; 
weights.Li = 5 * weights.Li; 

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
% set1 = {}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};
 
%% Discussion points
D1 = 'males are assumed not to differ from females';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight dry weight Wd in mug = 3.08*(length im mm)^2.46';
metaData.bibkey.F1 = 'Dabo1976'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76VJZ'; % Cat of Life
metaData.links.id_ITIS = '1123766'; % ITIS
metaData.links.id_EoL = '64862149'; % Ency of Life
metaData.links.id_Wiki = 'Phallocryptus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5582382'; % Taxonomicon
metaData.links.id_WoRMS = '1300956'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GharNema2016'; type = 'Article'; bib = [ ... 
'author = {M. R. Gharibi and M. A. Nematollahi and N. Agh and B. Atashbar}, ' ... 
'year = {2016}, ' ...
'title = {Life Cycle of the Fairy Shrimp, \emph{Phallocryptus spinosa} {M}ilne {E}dwards, 1840 ({C}rustacea: {A}nostraca) at Different Temperatures}, ' ...
'journal = {J. Agr. Sci. Tech.}, ' ...
'volume = {18}, ' ...
'pages = {171-177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'Dabo1976'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z76-021}, ' ...
'author = {Daborn, Graham R.}, ' ... 
'year = {1976}, ' ...
'title = {The life cycle of \emph{Eubranchipus bundyi} ({F}orbes) ({C}rustacea: {A}nostraca) in a temporary vernal pond of Alberta}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {54(2))}, ' ...
'pages = {193–201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%

