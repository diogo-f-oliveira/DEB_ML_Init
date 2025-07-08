function [data, auxData, metaData, txtData, weights] = mydata_Darevskia_valentini

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Darevskia_valentini'; 
metaData.species_en = 'Caucasian rock lizard'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ap = 2*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'guess';
  temp.ap = C2K(27); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 9*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'KurnErog2017';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.53;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'KurnErog2017';  
data.Li  = 7.37;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'KurnErog2017';  
data.Lim  = 6.39;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';         bibkey.Lim  = 'KurnErog2017';  

data.Wwi = 11.83;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lacerta strigata';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.000   2.5300
2.998	4.8568
4.001	5.5005
5.004	6.0380
5.005	6.3776
5.006	6.5473
5.040	5.8682
6.019	6.5968
6.959	5.9887
7.009	6.8161
8.010	6.6852
9.001	7.1380];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KurnErog2017';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.000	2.530
3.974	5.203
3.986	5.352
3.997	5.702
4.985	5.974
4.987	5.295
5.010	5.773
5.974	6.385
5.975	6.247
5.977	5.356
5.997	6.459
5.998	6.077
6.974	6.615
7.022	6.540];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KurnErog2017';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3463M'; % Cat of Life
metaData.links.id_ITIS = '1155340'; % ITIS
metaData.links.id_EoL = '47045622'; % Ency of Life
metaData.links.id_Wiki = 'Darevskia_valentini'; % Wikipedia
metaData.links.id_ADW = 'Darevskia_valentini'; % ADW
metaData.links.id_Taxo = '642542'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Darevskia&species=valentini'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Darevskia_valentini}}';
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
bibkey = 'KurnErog2017'; type = 'Article'; bib = [ ... 
'doi = {10.13128/Acta_Herpetol-17658}, ' ...
'author = {Muammer Kurnaz and Al{\i} Ihsan Ero\v{g}lu and Ufuk B\"{u}lb\"{u}l and Hal{\i}me Ko\c{c} and B{\i}lal Kutrup}, ' ... 
'year = {2017}, ' ...
'title = {The life-history traits in a breeding population of Darevskia valentini from Turkey}, ' ...
'journal = {Acta Herpetologica}, ' ...
'volume = {12(2)}, ' ...
'pages = {167-173}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/47045622}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
