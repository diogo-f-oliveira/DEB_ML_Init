function [data, auxData, metaData, txtData, weights] = mydata_Darevskia_parvula

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Darevskia_parvula'; 
metaData.species_en = 'Red-bellied lizard'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 13];

%% set data
% zero-variate data

data.ap = 2*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'guess';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'BulbKurn2016';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.55;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'BulbKurn2016';  
data.Li  = 6.2;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'BulbKurn2016';  
data.Lim  = 6.4;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';         bibkey.Lim  = 'BulbKurn2016';  

data.Wwi = 4.35;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lacerta strigata';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
0	2.562 2.562
3	5.284 NaN
3	4.857 NaN
4	5.333 NaN
4	5.448 NaN
4	5.656 5.990
5   NaN   5.029
5	5.112 5.383
5	5.195 5.414
5	5.268 5.466
6	5.162 NaN
6	5.245 NaN
6	5.568 NaN
6	5.609 5.318
6	5.693 5.401
6	5.828 5.255
6	5.922 5.953
7	5.315 5.836
7	5.617 5.607
7	5.669 NaN
7	5.742 NaN
7	5.200 NaN
8   NaN   5.635
8   NaN   5.740
8   NaN   5.771
8   NaN   5.865];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(16.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BulbKurn2016'; treat.tL = {1, {'females','males'}};
comment.tL = 'Data from the Pirinalli, elevation 1484 m';
% 
data.tL1 = [ ... % time since birth (yr), SVL (cm)
0	2.609 2.609
3   NaN   5.042
3	4.632 5.013
4   NaN   5.648
4   NaN   5.453
4   NaN   5.316
4	5.013 4.954
4	5.072 4.847
4	4.896 5.150
5   NaN   5.287
5	4.407 4.954
5	4.866 5.003
5	5.072 5.228
5	5.169 5.443
5	5.394 5.814
5	5.521 5.893
6   NaN   6.010
6   NaN   5.736
6	5.033 5.668
6	5.238 5.423
6	4.436 4.730
7	5.267 NaN
7	5.033 5.423
8	5.316 5.140];
data.tL1(:,1) = data.tL1(:,1) * 365; % convert yr to d
units.tL1  = {'d', 'cm'};  label.tL1 = {'time since birth', 'SVL'};  
temp.tL1   = C2K(19.8);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'BulbKurn2016'; treat.tL1 = {1, {'females','males'}};
comment.tL1 = 'Data from Kemalpasa, elevation 17 m';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL1 = 3 * weights.tL1;
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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3462Z'; % Cat of Life
metaData.links.id_ITIS = '1155334'; % ITIS
metaData.links.id_EoL = '792897'; % Ency of Life
metaData.links.id_Wiki = 'Darevskia_parvula'; % Wikipedia
metaData.links.id_ADW = 'Darevskia_parvula'; % ADW
metaData.links.id_Taxo = '642532'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Darevskia&species=parvula'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Darevskia_parvula}}';
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
bibkey = 'BulbKurn2016'; type = 'Article'; bib = [ ... 
'doi = {10.1163/15707563-00002489}, ' ...
'author = {Ufuk B\"{u}lb\"{u}l and Muammer Kurnaz and Ali \.{I}hsan Ero\u{g}lu and Halime Ko\c{c} and Bilal Kutrup}, ' ... 
'year = {2016}, ' ...
'title = {Age and growth of the red-belied lizard, \emph{Darevskia parvula}}, ' ...
'journal = {Animal Biology}, ' ...
'volume = {66}, ' ...
'pages = {81–95}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/792897}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
