  function [data, auxData, metaData, txtData, weights] = mydata_Gerlachea_australis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Bathydraconidae';
metaData.species    = 'Gerlachea_australis'; 
metaData.species_en = 'Antarctic dragonfish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 15];

%% set data
% zero-variate data
data.ab = 106;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(-0.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'MesaCali2018';   
  temp.am = C2K(-0.9); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 14;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'MesaCali2018'; 
data.Li = 28;    units.Li = 'cm'; label.Li = 'ultimate total length for females';  bibkey.Li = 'MesaCali2018';
data.Lim = 22;    units.Lim = 'cm'; label.Lim = 'ultimate total length for males';  bibkey.Lim = 'MesaCali2018';

data.Wwb = 0.0172;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MesaCali2018';
  comment.Wwb = 'based on egg diameter of 3.2 mm of based: pi/6*0.32^3';
data.Wwi = 88; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'MesaCali2018';
data.Wwim = 36; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';   bibkey.Wwim = 'MesaCali2018';

data.Ri = 1260/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-0.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_f = [ ... % time(yr), total length (cm)
0.469	3.713
0.497	5.355
2.988	11.726
3.999	14.136
6.079	23.450
6.570	23.359
6.984	22.144
7.011	24.391
7.035	21.279
7.476	23.090
7.552	21.187
7.992	20.750
7.994	22.997
7.995	23.948
8.021	24.380
8.488	25.154
8.513	24.029
8.976	21.085
8.977	22.468
9.029	21.949
9.032	26.012
9.444	23.501
9.469	22.463
9.497	24.192
9.549	24.969
10.012	21.333
10.041	25.137
10.973	24.867
14.057	28.033];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time', 'total length', 'females'};  
temp.tL_f = C2K(-0.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MesaCali2018';
%
data.tL_m = [ ... % time(yr), total length (cm)
0.429	3.461
0.478	5.190
2.950	11.774
2.971	14.195
2.972	13.676
4.425	16.969
4.935	18.182
4.962	17.318
5.421	18.617
5.983	19.139
6.904	19.749
6.979	20.614
6.982	18.885
7.440	20.876
7.924	22.003
7.927	20.101
7.951	21.138
8.436	22.265
8.463	21.314
8.898	21.316
8.979	19.069
9.409	22.184
9.410	21.233
10.434	21.325
10.945	22.105
13.429	21.341];
data.tL_m(:,1) = 365 * data.tL_m(:,1);  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time', 'total length', 'males'};  
temp.tL_m = C2K(-0.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MesaCali2018';

% length-weight
data.LW_f = [ ... % time(yr), std length (cm)
13.795	6.800
20.869	28.897
21.157	34.987
21.258	31.510
21.402	34.120
21.551	32.672
21.882	43.980
21.986	37.894
22.368	47.173
22.522	40.507
22.906	47.758
23.010	41.382
23.285	60.515
23.490	50.952
23.494	47.763
23.842	41.969
23.869	63.999
23.973	57.623
23.983	47.188
24.030	49.218
24.309	64.873
24.471	48.642
24.566	52.411
24.857	55.023
24.895	66.327
24.897	63.719
24.957	52.125
25.866	73.583
25.973	64.599
28.005	88.387];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'MesaCali2018';
%
data.LW_m = [ ... % time(yr), std length (cm)
13.433	4.053
13.435	6.352
14.023	6.341
17.114	12.891
17.998	15.747
18.443	23.210
18.786	22.916
18.934	24.925
18.981	20.613
18.984	26.648
19.326	24.630
19.522	23.764
20.010	19.157
20.062	27.202
20.551	23.457
20.553	27.480
20.653	31.788
21.043	28.333
21.045	32.068
21.046	32.930
21.093	29.768
21.634	32.919
21.831	35.789
22.174	34.058];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'MesaCali2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  3 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00151*(TL in cm)^3.27';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life
metaData.links.id_ITIS = '642588'; % ITIS
metaData.links.id_EoL = '46573028'; % Ency of Life
metaData.links.id_Wiki = 'Gerlachea_australis'; % Wikipedia
metaData.links.id_ADW = 'Gerlachea_australis'; % ADW
metaData.links.id_Taxo = '174878'; % Taxonomicon
metaData.links.id_WoRMS = '234808'; % WoRMS
metaData.links.id_fishbase = 'Gerlachea-australis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gerlachea_australis}}';  
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
bibkey = 'MesaCali2018'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-017-2240-y}, ' ...
'author = {Mario La Mesa and Federico Cal\`{i} and Fortunata Donato and Emilio Riginella and Carlotta Mazzoldi}, ' ...
'year = {2018}, ' ...
'title = {Aspects of the biology of the Antarctic dragonfish \emph{Gerlachea australis} ({N}otothenioidei: {B}athydraconidae) in the {W}eddell {S}ea, {A}ntarctica}, ' ... 
'journal = {Polar Biology}, ' ...
'volume = {41}, ' ...
'pages = {793–803}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gerlachea-australis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
