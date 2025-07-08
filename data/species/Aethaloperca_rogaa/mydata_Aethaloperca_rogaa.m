  function [data, auxData, metaData, txtData, weights] = mydata_Aethaloperca_rogaa
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Aethaloperca_rogaa'; 
metaData.species_en = 'Redmouth grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
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
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 31*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'MaplCurr2009';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 34;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 60;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.3e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.76 mm: pi/6*0.076^3';
data.Wwp = 625;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lp^3.06, see F1';
data.Wwi = 3557;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.06, see F1';

data.Ri  = 6.9e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.9);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Epinephelus_fuscoguttatus: 3287515*3557/17000';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
5.882	33.971
6.995	32.536
8.029	36.938
9.936	37.321
13.037	42.967
14.944	43.541
16.932	43.541
18.045	42.679
27.027	43.541
30.048	43.636]; 
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaplCurr2009'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
14.062	90.730
16.621	78.895
22.362	335.306
22.579	256.410
23.539	244.576
24.922	299.803
26.728	394.477
26.938	457.594
26.946	303.748
27.475	382.643
28.854	497.041
31.615	678.501
32.462	785.010
32.469	666.667
33.520	930.966
33.843	871.795
34.279	694.280
34.592	828.402
34.905	942.801
35.549	859.961
36.713	1017.751
37.344	1179.487
37.774	1104.537
37.785	899.408
39.048	1195.266
39.901	1187.377
40.754	1187.377
40.959	1337.278
41.713	1187.377
42.123	1495.069
42.458	1203.156
43.081	1502.959
43.175	1739.645
43.611	1562.130
44.131	1798.817
44.880	1747.534
45.309	1696.252
46.581	1830.375]; 
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'MaplCurr2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.ab = weights.ab * 0;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;
weights.Li = weights.Li * 3;

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
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '65BHS'; % Cat of Life
metaData.links.id_ITIS = '551022'; % ITIS
metaData.links.id_EoL = '46579764'; % Ency of Life
metaData.links.id_Wiki = 'Aethaloperca_rogaa'; % Wikipedia
metaData.links.id_ADW = 'Aethaloperca_rogaa'; % ADW
metaData.links.id_Taxo = '105850'; % Taxonomicon
metaData.links.id_WoRMS = '218168'; % WoRMS
metaData.links.id_fishbase = 'Aethaloperca-rogaa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Aethaloperca_rogaa}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aethaloperca-rogaa.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

