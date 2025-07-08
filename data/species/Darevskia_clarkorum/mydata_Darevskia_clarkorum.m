function [data, auxData, metaData, txtData, weights] = mydata_Darevskia_clarkorum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Darevskia_clarkorum'; 
metaData.species_en = 'Clark''s lizard'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.3); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

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

data.tp = 1.5*365;     units.tp = 'd';    label.tp = 'age at puberty';  bibkey.tp = 'BulbKurn2016';
  temp.tp = C2K(12.3); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'BulbKurn2016';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.9;   units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';     bibkey.Lb  = 'BulbKurn2016';
data.Li  = 6.9;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';        bibkey.Li  = 'guess';  
data.Lim = 6.8;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';       bibkey.Lim = 'guess';  

data.Wwi = 8;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(12.3);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lacerta strigata, temp corrected';

% univariate data
% time-length
data.tL_L = [ ... % time since birth (yr), SVL (cm): females, males
 0	2.819 2.819
 3	5.431 6.125
 3	5.833 NaN
 4	5.028 NaN
 4	5.486 NaN
 4	5.694 NaN
 4	5.958 NaN
 4	6.042 NaN
 4	6.139 NaN
 5	5.542 NaN
 5	6.667 NaN
 5	6.167 5.958
 5	6.403 6.278
 5	6.111 6.500
 6	5.778 NaN
 6	5.931 NaN
 6	6.083 NaN
 6	6.278 NaN
 6	6.389 5.750
 6	6.611 6.417
 6	5.250 6.528
 7	6.000 NaN
 7	6.292 5.917
 7	6.125 6.444
 7	5.292 6.500
 8	6.292 6.611
 8  NaN   6.208
 8  NaN   6.097
 9  NaN   6.181
 9  NaN   6.347
10	7.028 6.375
10  NaN   6.625];
data.tL_L(:,1) = data.tL_L(:,1) * 365; % convert yr to d
units.tL_L  = {'d', 'cm'};  label.tL_L = {'time since birth', 'SVL'};  
temp.tL_L   = C2K(25);  units.temp.tL_L = 'K'; label.temp.tL_L = 'temperature';
bibkey.tL_L = 'BulbKurn2016'; treat.tL_L = {1, {'females','males'}};
comment.tL_L = 'Data for females, males low alt (450 m), Kamilet';
%
data.tL_H = [ ... % time since birth (yr), SVL (cm): females, males
0	2.896 2.896
3	5.314 NaN
4	5.636 NaN
5	6.152 5.906
5   NaN   5.646
5   NaN   5.815
6	5.424 5.450
6	5.087 5.644
6   NaN   5.878
7	5.448 5.746
7	5.979 5.837
7	6.096 NaN
8	5.433 NaN
8	6.522 NaN
8	6.586 NaN
9   NaN   6.143
9   NaN   6.247
9   NaN   6.351
10	5.895 NaN
11	6.295 NaN
11	6.139 NaN
12	6.746 NaN];
data.tL_H(:,1) = data.tL_H(:,1) * 365; % convert yr to d
units.tL_H  = {'d', 'cm'};  label.tL_H = {'time since birth', 'SVL'};  
temp.tL_H = C2K(19);  units.temp.tL_H = 'K'; label.temp.tL_H = 'temperature';
bibkey.tL_H = 'BulbKurn2016'; treat.tL_H = {1, {'females','males'}};
comment.tL_H = 'Data for females, males high alt (2250 m), Basyayla';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_H = 3 * weights.tL_H;
weights.tL_L = 3 * weights.tL_L;

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
metaData.links.id_CoL = '3462L'; % Cat of Life
metaData.links.id_ITIS = '1155319'; % ITIS
metaData.links.id_EoL = '1056206'; % Ency of Life
metaData.links.id_Wiki = 'Darevskia_clarkorum'; % Wikipedia
metaData.links.id_ADW = 'Darevskia_clarkorum'; % ADW
metaData.links.id_Taxo = '642526'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Darevskia&species=clarkorum'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Darevskia_clarkorum}}';
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
'author = {Ufuk B\"{u}lb\"{u}l and Muammer Kurnaz and Ali Ihsan Eroglu and Halime Ko\c{c} and Bilal Kutrup}, ' ... 
'year = {2016}, ' ...
'title = {Body size and age structure of the endangered {C}lark''s lizard (\emph{Darevskia clarkorum}) populations from two different altitudes in {T}urkey}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {37}, ' ...
'pages = {450-456}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1056206}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
