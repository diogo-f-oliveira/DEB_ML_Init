function [data, auxData, metaData, txtData, weights] = mydata_Thamnophis_gigas

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Thamnophis_gigas'; 
metaData.species_en = 'Giant garter snake'; 

metaData.ecoCode.climate = {'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'biFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCva'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 10 30];

%% set data
% zero-variate data

data.ap = 4.5*365;     units.ap = 'd';      label.ap = 'age at puberty';       bibkey.ap = 'guess';
  temp.ap = C2K(18); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 12*365;    units.am = 'd';      label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .8*45;   units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';           bibkey.Lb  = 'guess';
  comment.Lb = 'based on same relative length, compared to Coronella austriaca';
data.Li  = .8*165;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Wiki';
data.Lim = .8*130;   units.Lim  = 'cm'; label.Lim = 'ultimate SVL for males';    bibkey.Lim  = 'guess';
  comment.Lim = 'based on Li';

data.Wwi = 1678;   units.Wwi = 'g';   label.Wwi = 'ulitmate wet weight';     bibkey.Wwi = 'EoL';
  
data.Ri  = 17/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '17 eggs per litter, 1 litter per yr';
  
% univariate data
% t-L data  for females
data.LdL = [ ... % SVL (cm), change in SVL (cm/d)
40.874	0.073
41.377	0.155
44.142	0.102
48.716	0.016
50.489	0.066
52.008	0.198
52.118	0.074
52.173	0.138
52.499	0.140
52.608	0.016
53.027	0.125
53.283	0.047
53.956	0.199
55.377	0.093
55.913	0.088
56.398	0.023
56.789	0.100
58.004	0.005
58.045	0.052
58.120	0.140
58.278	0.072
58.461	0.033
58.873	0.010
59.024	0.060
59.224	0.040
59.687	0.202
59.891	0.062
60.075	0.025
60.258	0.111
60.897	0.100
61.511	0.060
61.782	0.124
62.243	0.031
62.759	0.004
63.419	0.016
63.654	0.038
63.736	0.008
64.387	0.136
64.493	0.008
64.502	0.019
64.823	0.015
64.944	0.030
64.948	0.034
65.014	0.110
65.373	0.025
65.449	0.114
65.578	0.012
65.812	0.033
66.039	0.045
66.113	0.006
66.904	0.045
67.096	0.018
67.964	0.021
68.113	0.194
68.527	0.047
68.554	0.078
69.030	0.129
69.207	0.083
69.212	0.089
69.383	0.037
69.740	0.075
70.003	0.004
70.129	0.025
70.424	0.115
70.440	0.010
70.447	0.017
70.551	0.012
70.586	0.053
70.774	0.020
70.822	0.076
71.430	0.029
71.526	0.139
72.067	0.016
72.345	0.087
72.410	0.037
72.720	0.020
73.075	0.056
73.927	0.041
74.342	0.021
75.270	0.094
76.597	0.003
76.729	0.030
77.246	0.128
77.801	0.021
77.884	0.116
78.143	0.041
78.242	0.030
78.764	0.009
79.248	0.069
81.259	0.018
81.798	0.017
82.203	0.110
82.399	0.087
82.670	0.025
82.974	0.002
83.107	0.031
83.517	0.004
83.560	0.054
83.563	0.058
84.428	0.058
84.706	0.004
86.005	0.006
86.010	0.013
86.934	0.080
87.851	0.016
88.029	0.096
89.476	0.144
89.491	0.037
89.702	0.031
89.900	0.010
90.773	0.019
90.940	0.088
90.953	0.103
91.407	0.003
92.602	0.009
93.681	0.006
94.469	0.043
95.204	0.018
95.855	0.021
96.277	0.008
97.697	0.025
98.558	0.021
99.415	0.012
104.279	0.010];
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'SVL', 'change in SVL'};  
temp.LdL   = C2K(18);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'CoatWyli2009';
comment.LdL = 'Temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'SVL assumed to be 0.8 times total length';
D3 = 'temperatures are guessed';
metaData.discussion = struct('D1', D1,'D2', D2,'D3', D3);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '563KQ'; % Cat of Life
metaData.links.id_ITIS = '209148'; % ITIS
metaData.links.id_EoL = '1055211'; % Ency of Life
metaData.links.id_Wiki = 'Thamnophis_gigas'; % Wikipedia
metaData.links.id_ADW = 'Thamnophis_gigas'; % ADW
metaData.links.id_Taxo = '50075'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Thamnophis&species=gigas'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thamnophis_gigas}}';
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
bibkey = 'CoatWyli2009'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.2009.00617.x}, ' ...
'title = {Using time-dependent models to investigate body condition and growth rate of the giant gartersnake}, ' ...
'journal = {Journal of Zoology}, ' ...
'year = {2009}, ' ...
'author = {P. S. Coates and G. D. Wylie and B. J. Halstead and M. L. Casazza}, ' ....
'volume = {279}, ' ...
'pages = {285-293}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1055211/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

