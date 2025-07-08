function [data, auxData, metaData, txtData, weights] = mydata_Streptocephalus_proboscideus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Streptocephalidae';
metaData.species    = 'Streptocephalus_proboscideus'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 18]; 

%% set data
% zero-variate data

data.tp = 9;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AliDumo1995';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 90;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'males live till 285 d';

data.Lb  = 0.07; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'AliDumo1995';
data.Lp  = 0.8;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AliDumo1995';
data.Li  = 1.8;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'guess';
  
data.Wdi  = 0.0099;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(1.8/1)^3';

data.Ri  = 3*184/29;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AliSarm1999';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '184 eggs per brood; assumed: 3 broods in 29 d';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (cm), different food levels
 0	0.070 0.070 0.070
 1	0.139 0.106 0.088
 2	0.277 0.241 0.229
 4	0.704 0.535 0.511
 5	0.787 0.585 0.524
 7	0.976 0.580 0.553
11	1.267 0.859 0.733
14	1.307 0.904 0.796
18	1.255 0.895 0.793
20	1.286 0.994 0.816
25	1.277 0.986 0.849
30	1.310 1.072 0.860
35	1.366 1.305 1.062];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length','female'};  
temp.tL = C2K(27); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'AliDumo1995'; treat.tL = {1 {'5e3 cells/ml','10e3 cells/ml','50e3 cells/ml'}};
comment.tL = 'food is mix of Scenedesmus acutus and S. obliquus';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 
weights.Li = 5 * weights.Li; 
weights.Lb = 5 * weights.Lb; 

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
 
% %% Discussion points
% D1 = '';   
% metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WXPR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '326784'; % Ency of Life
metaData.links.id_Wiki = 'Streptocephalus'; % Wikipedia
metaData.links.id_ADW = 'Streptocephalus_proboscideus'; % ADW
metaData.links.id_Taxo = '114176'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

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
bibkey = 'AliDumo1995'; type = 'Article'; bib = [ ... 
'author = {A. Jawahar Ali and Henri J. Dumont}, ' ... 
'year = {1995}, ' ...
'title = {Larviculture of the fairy shrimp, \emph{Streptocephalus proboscideus} ({C}rustacea: {A}nostraca): effect of food concentration and physical and chemical properties of the culture medium}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {298}, ' ...
'pages = {159-165}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'AliSarm1999'; type = 'Article'; bib = [ ... 
'author = {A. Jawahar Ali and S. S. S. Sarma and H. J. Dumont}, ' ... 
'year = {1999}, ' ...
'title = {Cyst Production in the Fairy Shrimp, \emph{Streptocephalus proboscideus} ({A}nostraca) in Relation to Algal and Loricated Rotifer Diet}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {72(5)}, ' ...
'pages = {1517-530}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%

