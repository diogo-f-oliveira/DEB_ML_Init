function [data, auxData, metaData, txtData, weights] = mydata_Arborimus_longicaudus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Arborimus_longicaudus'; 
metaData.species_en = 'Red tree vole'; 

metaData.ecoCode.climate = {'Csa','Csb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 16];              

%% set data
% zero-variate data

data.tg = 28;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '26-29 d';
data.tx = 32;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '30-35 d';
data.tp = 80;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(38.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(38.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'more than 1-2 yr';
  
data.Wwb = 2.4;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Hami1962';
data.Wwx = 21;   units.Wwx = 'g';     label.Wwx = 'wet weight at waening';     bibkey.Wwx = 'EoL';
  comment.Wwx = '130-180 g';
data.Wwi = 50;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'ADW';
  comment.Wwi = '25-50 g';

data.Ri  = 4.5*2.2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.2 pups per litter; 4-5 litters per yr assumed';
   
% univariate data
% time-weight
data.tWw2 = [ ... % time since birth (d), weight (g)
0.000	2.394
3.882	3.562
7.941	4.982
11.840	6.024
15.981	7.317
20.205	8.483
24.099	10.282
27.986	13.088
31.954	15.957
36.089	18.194
39.983	19.930
43.959	21.665
47.617	22.331
52.010	22.425];
units.tWw2   = {'d', 'g'};  label.tWw2 = {'time since birth', 'wet weight', '2 pups'};  
temp.tWw2    = C2K(38.1);  units.temp.tWw2 = 'K'; label.temp.tWw2 = 'temperature'; 
bibkey.tWw2 = 'Hami1962';
comment.tWw2 = 'Data for litter size 2';
% 
data.tWw3 = [ ... % time since birth (d), weight (g)
0.000	2.205
4.209	3.245
7.866	4.037
11.928	5.016
16.154	5.804
20.133	7.035
24.439	8.074
27.998	11.261
31.967	14.004
36.186	15.926
40.002	17.221
43.741	17.761
47.808	18.109
51.871	19.025];
units.tWw3   = {'d', 'g'};  label.tWw3 = {'time since birth', 'wet weight', '3 pups'};  
temp.tWw3    = C2K(38.1);  units.temp.tWw3 = 'K'; label.temp.tWw3 = 'temperature'; 
bibkey.tWw3 = 'Hami1962';
comment.tWw3 = 'Data for litter size 3';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw2 = 5 * weights.tWw2;
weights.tWw3 = 5 * weights.tWw3;
weights.Wwx = 0 * weights.Wwx;

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

%% Group plots
set1 = {'tWw2','tWw3'}; subtitle1 = {'Data for litter size 2, 3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Eats only needles of conifers, mostly Douglas-fir, Pseudotsuga menziesii, discarding resin ducts';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'G6MG'; % Cat of Life
metaData.links.id_ITIS = '180353'; % ITIS
metaData.links.id_EoL = '328444'; % Ency of Life
metaData.links.id_Wiki = 'Arborimus_longicaudus'; % Wikipedia
metaData.links.id_ADW = 'Arborimus_longicaudus'; % ADW
metaData.links.id_Taxo = '167373'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000173'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arborimus_longicaudus}}';
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
bibkey = 'Hami1962'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1376912}, ' ...
'author = {Hamilton, W. J.}, ' ... 
'year = {1962}, ' ...
'title = {Reproductive Adaptations of the Red Tree Mouse}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {43(4)}, ' ...
'pages = {486–504}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Arborimus_longicaudus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/328444/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

