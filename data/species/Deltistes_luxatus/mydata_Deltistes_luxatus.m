  function [data, auxData, metaData, txtData, weights] = mydata_Deltistes_luxatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Deltistes_luxatus'; 
metaData.species_en = 'Lost River sucker'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 57*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'TerwReec2010';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'TerwReec2010'; 
  comment.Lp = 'based on tp 8 yr and tL data';
data.Li = 86;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 3.1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.8 mm of Erimyzon oblongus: pi/6*0.18^3';
data.Wwp = 309;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = {'TerwReec2010','fishbase'}; 
  comment.Wwi = 'based on 0.01000*Lp^3.04, see F1';
data.Wwi = 7.6e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1; fishbase gives 4.5 kg';

data.Ri  = 236e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
9.337	42.145
11.031	63.461
13.293	63.129
16.142	71.255
16.849	55.697
17.133	65.000
18.933	70.248
20.062	71.097
20.815	71.438
20.900	66.364
21.053	65.180
21.183	75.836
22.101	68.904
22.171	71.949
25.778	77.540
26.016	71.114
27.221	71.963
30.086	71.633
54.882	72.887
55.938	72.890];
data.tL_f(:,1) = 365 * (-0.3 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TerwReec2010';
comment.tL_f = 'Data for females from Lost River';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
7.979	42.987
8.063	38.421
9.153	60.073
11.111	60.755
11.122	55.004
12.091	60.758
12.097	57.882
12.847	59.914
13.076	58.054
13.966	66.006
14.048	62.285
14.794	66.347
16.081	63.644
16.089	59.078
19.079	72.278
19.248	62.976
20.068	67.715
20.980	63.489
20.983	62.136
20.984	61.628
21.653	66.366
21.726	67.719
21.959	63.999
21.989	48.270
22.341	61.632
23.088	65.017
23.091	63.495
23.092	62.818
25.951	66.040
26.777	67.395
27.612	64.522
28.875	73.997
29.719	66.050
30.922	67.914
34.925	63.697
39.971	65.910
50.070	66.446
57.003	67.311];
data.tL_m(:,1) = 365 * (-0.3 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TerwReec2010';
comment.tL_m = 'Data for males  from Lost River';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
mmetaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: W in g = 0.01000*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34K68'; % Cat of Life
metaData.links.id_ITIS = '163970'; % ITIS
metaData.links.id_EoL = '208226'; % Ency of Life
metaData.links.id_Wiki = 'Deltistes_luxatus'; % Wikipedia
metaData.links.id_ADW = 'Deltistes_luxatus'; % ADW
metaData.links.id_Taxo = '172969'; % Taxonomicon
metaData.links.id_WoRMS = '1020084'; % WoRMS
metaData.links.id_fishbase = 'Deltistes-luxatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Deltistes_luxatus}}';  
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
bibkey = 'TerwReec2010'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-010-9679-9}, ' ...
'author = {Mark R. Terwilliger and Tamal Reece and Douglas F. Markle}, ' ...
'year = {2010}, ' ...
'title = {Historic and recent age structure and growth of endangered {L}ost {R}iver and shortnose suckers in {U}pper {K}lamath {L}ake, {O}regon}, ' ... 
'journal = {Environ Biol Fish}, ' ...
'volume = {89}, '...
'pages = {239-252}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Deltistes-luxatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

