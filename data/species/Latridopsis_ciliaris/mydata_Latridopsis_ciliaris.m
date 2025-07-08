  function [data, auxData, metaData, txtData, weights] = mydata_Latridopsis_ciliaris
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Latridae';
metaData.species    = 'Latridopsis_ciliaris'; 
metaData.species_en = 'Blue moki'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 26];

%% set data

% zero-variate data

data.ab = 8;   units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(17.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 33*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(17.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 40;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 80;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  1.3 mm of Latris lineata: pi/6*0.13^3';
data.Wwi = 8754;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01950*Li^2.97, see F1';
    
data.Ri  = 83e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(17.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Latris lineata: 2.35e6*8.75e3/25e3';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (d), fork length (cm)
1.526	22.901
1.577	20.223
2.403	29.360
2.475	30.456
2.623	28.753
2.624	27.535
2.793	30.093
2.844	28.145
4.545	44.107
6.501	44.606
6.570	51.669
6.596	48.625
7.595	54.232
8.644	58.744
10.306	59.850
10.501	60.947
10.697	59.730
11.526	64.241
11.573	65.946
11.604	55.961
12.527	65.464
13.354	72.775
13.509	59.139
13.574	73.020
13.577	67.906
13.578	66.810
13.582	59.991
14.553	70.834
14.559	61.702
14.562	57.197
14.580	66.938
14.585	58.902
15.507	71.449
15.562	60.125
15.585	63.535
15.589	55.864
15.610	62.195
16.515	61.105
17.540	64.277
17.611	68.661
18.534	78.652
18.542	65.623
18.563	71.833
18.564	68.789
18.618	61.361
19.346	69.524
19.516	71.839
19.517	69.647
19.541	70.865
19.547	60.758
19.569	65.385
19.594	64.412
20.548	64.296];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-1;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f = C2K(17.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Fran1981';
%
data.tL_m = [ ... % time since birth (d), fork length (cm)
1.578	18.640
2.329	30.456
2.403	28.386
4.575	34.975
5.643	48.984
5.647	41.069
7.375	54.961
7.592	59.224
7.620	53.136
10.572	64.478
10.573	62.165
10.596	65.818
11.601	60.223
12.530	60.959
12.550	68.265
12.602	63.395
13.551	69.976
13.557	61.574
13.584	56.095
15.555	72.667
16.537	65.124
16.542	56.843
17.644	54.171
18.539	69.885
20.668	66.975];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-1;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m = C2K(17.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Fran1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Wwi = 5 * weights.Wwi;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.01950*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6P4JH'; % Cat of Life
metaData.links.id_ITIS = '170268'; % ITIS
metaData.links.id_EoL = '46580143'; % Ency of Life
metaData.links.id_Wiki = 'Latridopsis_ciliaris'; % Wikipedia
metaData.links.id_ADW = 'Latridopsis_ciliaris'; % ADW
metaData.links.id_Taxo = '178247'; % Taxonomicon
metaData.links.id_WoRMS = '281277'; % WoRMS
metaData.links.id_fishbase = 'Latridopsis-ciliaris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Latridopsis_ciliaris}}';  
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
bibkey = 'Fran1981'; type = 'article'; bib = [ ...  
'doi = {10.1080/00288330.1981.9515896}, ' ...
'author = {Malcolm P. Francis}, ' ...
'year = {1981}, ' ...
'title = {Age and growth of moki, \emph{Latridopsis ciliaris} ({T}eleostei: {L}atridae)}, ' ... 
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {15(1)}, '...
'pages = {47-49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Latridopsis-ciliaris.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
