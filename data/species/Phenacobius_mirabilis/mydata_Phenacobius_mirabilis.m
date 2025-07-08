function [data, auxData, metaData, txtData, weights] = mydata_Phenacobius_mirabilis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Phenacobius_mirabilis'; 
metaData.species_en = 'Suckermouth minnow'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 19]; 

%% set data
% zero-variate data

data.am = 3*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'guess'; 
  comment.Lp = 'based on tp and tL data';
data.Li = 12;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase'; 
  
data.Wwb = 5.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.10^3';
data.Wwp = 1;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwi = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 15;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

data.Ri = 1640/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL17 = [ ... % time since hatch (d),total length (cm)
1.030	0.456
1.888	0.456
3.432	0.503
4.462	0.582
5.663	0.629
6.864	0.645
8.237	0.660
9.095	0.708
10.983	0.676
11.841	0.676
12.527	0.676
13.729	0.708
14.587	0.739
15.273	0.770
15.959	0.770
16.989	0.770
17.847	0.881
18.705	0.896
20.250	0.849
21.279	0.928
23.853	1.069
26.256	1.258
29.860	1.368
33.807	1.572
37.067	1.730
39.813	1.808
43.073	1.871
45.991	1.965
49.080	2.107
52.340	2.264
54.743	2.264
58.003	2.484
61.092	2.642
63.838	2.783
67.270	2.594
70.359	2.830
73.105	3.003
76.365	3.003
79.111	3.129
82.371	3.176
89.064	3.239
97.129	3.569
103.822	3.648];
units.tL17 = {'d', 'cm'}; label.tL17 = {'time since hatch', 'total length', '17 C'};  
temp.tL17 = C2K(17);  units.temp.tL17 = 'K'; label.temp.tL17 = 'temperature';
bibkey.tL17 = 'BestComp2007'; 
%
data.tL23 = [ ... % time since hatch (d),total length (cm)
0.858	0.503
2.917	0.597
4.805	0.613
6.349	0.676
7.722	0.692
9.782	0.629
15.616	0.991
22.137	1.415
29.002	1.824
36.209	2.107
42.902	2.547
49.938	2.783
57.145	3.270
64.009	3.601
70.702	4.151
78.081	4.057
84.945	4.874];
units.tL23 = {'d', 'cm'}; label.tL23 = {'time since hatch', 'total length', '23 C'};  
temp.tL23 = C2K(23);  units.temp.tL23 = 'K'; label.temp.tL23 = 'temperature';
bibkey.tL23 = 'BestComp2007'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL23','tL17'}; subtitle1 = {'Data for 23, 17 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4G25F'; % Cat of Life
metaData.links.id_ITIS = '163502'; % ITIS
metaData.links.id_EoL = '205450'; % Ency of Life
metaData.links.id_Wiki = 'Phenacobius_mirabilis'; % Wikipedia
metaData.links.id_ADW = 'Phenacobius_mirabilis'; % ADW
metaData.links.id_Taxo = '183636'; % Taxonomicon
metaData.links.id_WoRMS = '1021441'; % WoRMS
metaData.links.id_fishbase = 'Phenacobius-mirabilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Phenacobius_mirabilis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Phenacobius-mirabilis.html}}';  
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
bibkey = 'BestComp2007'; type = 'Article'; bib = [ ... 
'author = {Kevin R. Bestgen and Robert I. Compton}, ' ... 
'year = {2007}, ' ...
'title = {Reproduction and Culture of Suckermouth Minnow}, ' ...
'journal = {North American Journal of Aquaculture}, ' ...
'volume = {69}, ' ...
'pages = {345-350}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

