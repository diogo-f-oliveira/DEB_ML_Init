  function [data, auxData, metaData, txtData, weights] = mydata_Paracheirodon_innesi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Paracheirodon_innesi'; 
metaData.species_en = 'Neon tetra'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 12];

%% set data
% zero-variate data
data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 1.1;    units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
data.Li = 2.2;    units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwp = 0.016;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01202*Lp^3.08, see F1';
data.Wwi = 0.136;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.08, see F1';
  
data.Ri = 1000/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since hatch (d), standard length (0.1 mm)
12.931	0.456
12.935	0.486
13.001	0.521
13.053	0.440
13.991	0.549
14.049	0.523
14.108	0.501
14.168	0.486
14.969	0.484
15.038	0.543
15.043	0.579
18.057	0.522
18.115	0.494
18.121	0.543
18.246	0.559
18.918	0.504
19.039	0.492
19.107	0.543
19.170	0.553
20.897	0.559
20.899	0.569
20.901	0.587
20.952	0.500
21.019	0.549
22.938	0.613
22.940	0.627
22.998	0.593
23.060	0.601
24.979	0.659
25.044	0.693
26.898	0.729
26.953	0.673
26.958	0.711
26.959	0.719
26.961	0.739
28.927	0.677
29.059	0.753
29.181	0.739
30.912	0.776
31.103	0.828
31.105	0.846
31.225	0.818
34.001	0.832
34.006	0.872
34.122	0.814
34.182	0.800
36.962	0.844
36.964	0.860
37.022	0.832
37.040	0.976
39.885	1.049
40.012	1.083
40.050	0.884
40.056	0.938
42.895	0.960
42.913	1.107
42.973	1.093
43.028	1.037
45.882	1.187
45.926	1.043
45.930	1.073
45.990	1.059
46.064	1.161
48.878	0.986
48.942	1.004
48.947	1.046
48.999	0.960
49.017	1.113
51.855	1.127
51.892	0.922
51.963	1.004
51.966	1.024
54.858	0.980
54.983	0.996
55.002	1.151
55.048	1.022
55.120	1.107
57.838	1.151
57.896	1.122
57.906	1.199
58.015	1.084
60.875	1.281
60.934	1.259
60.935	1.267
60.982	1.149
61.010	1.374];
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'standard length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mari2017';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females (energetically)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight (g) = 0.01202*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'endemic to the northern area of Venezuela';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4CPDY'; % Cat of Life
metaData.links.id_ITIS = '163041'; % ITIS
metaData.links.id_EoL = '207219'; % Ency of Life
metaData.links.id_Wiki = 'Paracheirodon_innesi'; % Wikipedia
metaData.links.id_ADW = 'Paracheirodon_innesi'; % ADW
metaData.links.id_Taxo = '43236'; % Taxonomicon
metaData.links.id_WoRMS = '1525327'; % WoRMS
metaData.links.id_fishbase = 'Paracheirodon-innesi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Paracheirodon_innesi}}';  
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
bibkey = 'Mari2017'; type = 'Article'; bib = [ ...  
'doi = {10.1111/jfb.13384}, ' ...
'author = {M. M. Ferreira Marinho}, ' ...
'year  = {2017}, ' ...
'title = {Comparative development in \emph{Moenkhausia pittieri} and \emph{Paracheirodon innesi} ({O}stariophysi: {C}haraciformes) with comments on heterochrony and miniaturization in the {C}haracidae}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'pages = {8119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Paracheirodon-innesi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

