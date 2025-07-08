function [data, auxData, metaData, txtData, weights] = mydata_Melanoides_tuberculata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Thiaridae';
metaData.species    = 'Melanoides_tuberculata'; 
metaData.species_en = 'Red-rimmed melania'; 

metaData.ecoCode.climate = {'A','C'};
metaData.ecoCode.ecozone = {'TH','TP'};
metaData.ecoCode.habitat = {'0iFr', '0iFm'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Ap'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 28]; 

%% set data
% zero-variate data

data.am = 2.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'OkumRoch2020';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.22; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'OkumRoch2020';
data.Lp  = 0.97;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'OkumRoch2020';
data.Li  = 3.6;    units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'Wiki';

data.Wwi  = 4.2;    units.Wwi  = 'g';  label.Wwi  = 'ultimate shell weight'; bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on size-corrected value for Heleobia_australis: 0.0311*(3.6/0.7)^3; OkumRoch2020 present numbers that cannot be correct';

data.Ri  = 12*70/365; units.Ri  = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '70 young per litter, 1 litter per month assumed';
  
% uni-variate data
% time-length
data.tL = [ ... % age (yr), shell length (cm)
6.177	0.230
6.183	0.214
12.413	0.276
13.360	0.247
20.851	0.276
21.769	0.338
26.431	0.419
27.088	0.316
34.853	0.468
35.196	0.371
41.422	0.448
41.711	0.523
48.572	0.567
49.210	0.527
55.443	0.580
55.764	0.552
62.934	0.609
62.942	0.585
69.485	0.645
69.492	0.625
76.644	0.739
76.662	0.678
82.612	0.640
83.200	0.759
90.068	0.781
91.029	0.704
97.247	0.806
97.899	0.722
104.122	0.808
104.137	0.759
111.623	0.804
111.914	0.872
119.128	0.790
119.148	0.724
125.636	0.963
125.658	0.892
131.913	0.876
132.206	0.938
139.704	0.945
140.346	0.890
145.650	0.920
146.567	0.984
153.151	0.916
153.454	0.945
160.003	0.989
160.957	0.934
166.888	0.956
167.810	1.005
173.755	0.982
173.760	0.967
181.263	0.958
181.586	0.923
188.448	0.963
188.755	0.984
194.689	0.995
195.009	0.969
201.569	0.976
202.201	0.956
208.755	0.984
209.385	0.965
216.880	0.982
216.887	0.960
223.439	0.995
223.441	0.985
230.001	0.995
231.572	0.969
236.561	1.002
237.503	0.987
244.696	0.971
245.017	0.945
251.878	0.989
251.882	0.976
258.436	1.002
258.440	0.989
265.626	0.995
265.632	0.976
272.187	1.000
273.117	1.024
279.056	1.020
279.380	0.982
286.251	0.996
286.549	1.042];
units.tL   = {'d', 'cm'};  label.tL = {'time birth', 'shell length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OkumRoch2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'ovoviviparous and parthenogenetic';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3Z8P3'; % Cat of Life
metaData.links.id_ITIS = '71533'; % ITIS
metaData.links.id_EoL = '52589704'; % Ency of Life
metaData.links.id_Wiki = 'Melanoides_tuberculata'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '35370'; % Taxonomicon
metaData.links.id_WoRMS = '225694'; % WoRMS
metaData.links.id_molluscabase = '225694'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Melanoides_tuberculata}}';
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
bibkey = 'OkumRoch2020'; type = 'Article'; bib = [ ... 
'doi = {10.1590/S2179-975X0819}, ' ...
'author = {Denise Tieme Okumura and Odete Rocha}, ' ... 
'year = {2020}, ' ...
'title = {Life history traits of the exotic freshwater snail \emph{Melanoides tuberculata} {M}\"{u}ller, 1774 ({G}astropoda, {T}hiaridae), and its sensitivity to common stressors in freshwaters}, ' ...
'journal = {Acta Limnologica Braziliensia}, ' ...
'volume = {32}, ' ...
'pages = {e19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

