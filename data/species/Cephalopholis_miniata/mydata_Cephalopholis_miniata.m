  function [data, auxData, metaData, txtData, weights] = mydata_Cephalopholis_miniata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Cephalopholis_miniata'; 
metaData.species_en = 'Coral hind'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 28];

%% set data
% zero-variate data
data.ab = 9.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'MaplCurr2009';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 26;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 50;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.49e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 229;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01072*Lp^3.06, see F1';
data.Wwi = 1695;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.06, see F1';

data.Ri  = 279785/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'FadlZhel2022';   
  temp.Ri = C2K(28.4);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
6.038	31.558
7.830	25.776
8.962	27.242
9.717	29.050
10.943	31.196
10.943	34.932
11.038	32.441
11.132	33.233
11.698	32.664
11.792	34.701
11.887	31.871
11.887	27.795
11.981	28.814
13.113	25.865
13.302	33.336
13.962	33.786
14.151	35.483
15.000	35.932
15.094	31.290
16.887	36.263
17.170	33.998
18.019	39.088
21.038	38.169
22.830	39.746
23.019	31.594
23.019	38.500
23.868	43.930
24.057	43.136
26.981	35.085
28.019	42.552
28.019	37.911
28.962	32.586
30.000	47.298];
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaplCurr2009'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
32.590	114.820
34.024	139.184
34.422	153.976
34.821	133.907
36.016	148.400
36.096	238.012
36.494	262.764
36.972	267.565
37.131	227.665
38.167	237.238
38.327	202.318
38.964	321.602
39.283	431.045
39.442	366.244
39.761	341.225
40.876	495.191
41.195	490.091
41.275	435.281
41.912	549.585
41.912	499.784
42.390	579.286
43.028	633.829
43.506	529.069
44.701	752.726
44.861	872.189
44.861	832.348
44.861	588.324
45.020	936.870
45.657	842.010
45.976	797.071
46.215	926.463
46.295	1185.398
46.773	886.415
50.359	1701.808
51.793	1980.157]; 
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'MaplCurr2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SDNN'; % Cat of Life
metaData.links.id_ITIS = '167959'; % ITIS
metaData.links.id_EoL = '46579777'; % Ency of Life
metaData.links.id_Wiki = 'Cephalopholis_miniata'; % Wikipedia
metaData.links.id_ADW = 'Cephalopholis_miniata'; % ADW
metaData.links.id_Taxo = '105861'; % Taxonomicon
metaData.links.id_WoRMS = '218184'; % WoRMS
metaData.links.id_fishbase = 'Cephalopholis-miniata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cephalopholis_miniata}}';  
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
bibkey = 'MaplCurr2009'; type = 'techreport'; bib = [ ... 
'howpublished = {https://rrrc.org.au/wp-content/uploads/2014/06/483-JCU-Mapleston-A-et-al-2009-Comparative-biology-of-GBR-serranid-species.pdf}, ' ...
'author = {Mapleston, A. and Currey, L.M.and Williams, A.J. and Pears, R. and Simpfendorfer, C.A. and Penny, A.L. and Tobin, A. and Welch, D}, ' ... 
'year = {2009}, ' ...
'title = {Comparative biology of key inter-reefal serranid species on the Great Barrier Reef.}, ' ...
'institution = {Reef and Rainforest Research Centre Limited, Cairns}, ' ...
'volume = {Project Milestone Report to the Marine and Tropical Sciences Research Facility}, ' ...
'pages = {55pp.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FadlZhel2022'; type = 'article'; bib = [ ... 
'howpublished = {https://rrrc.org.au/wp-content/uploads/2014/06/483-JCU-Mapleston-A-et-al-2009-Comparative-biology-of-GBR-serranid-species.pdf}, ' ...
'author = {Nur Fadli and Zulrahma Zhelfi and Adrian Damora and Zainal Abidin Muchlisin and Irma Dewiyanti and Mutia Ramadhaniaty and Firman M. Nur and Agung S. Batubara and Nanda Muhammad Razi and Edison D. Macusi and Mohd N. Siti-Azizah}, ' ... 
'year = {2022}, ' ...
'title = {Morphometric variation and reproductive aspects of the coral hind grouper (\emph{Cephalopholis miniata}) harvested in the northern coast of {A}ceh, {I}ndonesia}, ' ...
'journal = {Egyptian Journal of Aquatic Biology \& Fisheries}, ' ...
'volume = {26(2)}, ' ...
'pages = {351–366}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cephalopholis-miniata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

