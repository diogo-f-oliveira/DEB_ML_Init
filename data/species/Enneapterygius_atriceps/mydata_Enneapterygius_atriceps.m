  function [data, auxData, metaData, txtData, weights] = mydata_Enneapterygius_atriceps
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Blenniformes'; 
metaData.family     = 'Tripterygiidae';
metaData.species    = 'Enneapterygius_atriceps'; 
metaData.species_en = 'Hawaiian blackhead triplefin'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 12]; 

%% set data
% zero-variate data
data.am = 1.5 * 365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'LongLang2005';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on remark that life span is short';
 
data.Lp = 1.7;  units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'LongLang2005'; 
data.Li = 2.6;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'LongLang2005';
 
data.Wwb = 8.7e-5;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LongLang2005';
  comment.Wwb = 'based on egg diameter of 0.55 mm: pi/6*0.055^3';
 

% univariate data

% time-length
data.tL = [ ... % yr class (yr), total length (cm)
41.903	1.104
43.338	1.104
46.295	1.199
46.954	1.300
47.070	1.104
47.783	1.604
51.371	1.153
52.966	1.450
52.998	1.153
56.012	1.603
57.841	1.502
60.048	1.453
64.934	2.296
65.954	1.698
71.882	1.750
73.024	1.805
74.263	1.854
74.535	1.998
75.965	2.053
76.065	2.004
77.039	1.848
85.790	2.347
89.878	2.599
90.909	1.900
93.743	2.249
99.937	2.494
100.952	1.945
104.966	1.994
105.880	2.399
116.970	2.500];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LongLang2005';

% length - weight
data.LWw = [ ... % standard length (cm), wet weight (g)
1.080	0.020
1.099	0.012
1.099	0.020
1.117	0.020
1.202	0.016
1.202	0.023
1.216	0.029
1.230	0.036
1.301	0.027
1.301	0.038
1.407	0.078
1.432	0.046
1.432	0.052
1.498	0.065
1.500	0.052
1.526	0.060
1.594	0.047
1.602	0.064
1.604	0.083
1.629	0.070
1.671	0.082
1.673	0.088
1.700	0.054
1.702	0.064
1.702	0.072
1.703	0.076
1.703	0.112
1.710	0.099
1.712	0.091
1.751	0.096
1.751	0.107
1.755	0.092
1.778	0.088
1.785	0.096
1.799	0.115
1.804	0.108
1.806	0.082
1.815	0.117
1.834	0.113
1.845	0.105
1.873	0.112
1.887	0.132
1.896	0.119
1.901	0.146
1.903	0.135
1.903	0.139
1.905	0.112
1.921	0.117
1.946	0.124
1.958	0.131
1.967	0.144
1.970	0.162
1.983	0.163
1.985	0.130
1.994	0.134
1.997	0.157
1.999	0.093
1.999	0.141
1.999	0.149
2.001	0.128
2.002	0.173
2.013	0.152
2.043	0.165
2.047	0.160
2.057	0.173
2.059	0.190
2.070	0.168
2.072	0.136
2.098	0.127
2.100	0.157
2.100	0.168
2.121	0.168
2.121	0.170
2.126	0.192
2.144	0.176
2.144	0.198
2.165	0.202
2.178	0.188
2.194	0.130
2.194	0.160
2.194	0.172
2.194	0.181
2.202	0.213
2.220	0.198
2.222	0.190
2.236	0.178
2.264	0.245
2.266	0.223
2.268	0.183
2.278	0.233
2.298	0.247
2.299	0.260
2.299	0.276
2.300	0.207
2.300	0.225
2.303	0.215
2.305	0.230
2.321	0.241
2.328	0.233
2.349	0.302
2.397	0.249
2.397	0.257
2.400	0.267
2.402	0.274
2.402	0.285
2.441	0.270
2.450	0.238
2.487	0.271
2.499	0.339
2.501	0.306
2.501	0.311
2.508	0.290
2.508	0.294
2.581	0.322
2.600	0.376
2.632	0.356
2.681	0.379
2.715	0.350];
units.LWw = {'cm', 'g'}; label.LWw = {'standard length', 'wet weight'};  
bibkey.LWw = 'LongLang2005';

% length - fecindity
data.LN = [ ... % standard length (cm), fecundity (#)
1.705	33.140
1.747	16.047
1.943	52.674
1.967	49.884
2.045	56.512
2.121	85.116
2.200	89.651
2.218	81.279
2.232	92.442
2.344	62.093
2.394	95.233
2.630	126.977
2.679	157.326
2.709	159.419];
units.LN = {'cm', '#'}; label.LN = {'standard length', 'fecundity'};  
temp.LN = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LongLang2005';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39VYP'; % Cat of Life
metaData.links.id_ITIS = '638443'; % ITIS
metaData.links.id_EoL = '46574085'; % Ency of Life
metaData.links.id_Wiki = 'Enneapterygius_atriceps'; % Wikipedia
metaData.links.id_ADW = 'Enneapterygius_atriceps'; % ADW
metaData.links.id_Taxo = '173750'; % Taxonomicon
metaData.links.id_WoRMS = '277298'; % WoRMS
metaData.links.id_fishbase = 'Enneapterygius-atriceps'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Enneapterygius_atriceps}}';  
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
bibkey = 'LongLang2005'; type = 'article'; bib = [ ...  
'doi = {10.1007/s10641-004-5332-9}, ' ...
'author = {Ken Longeneckera and Ross Langston}, ' ...
'year = {2005}, ' ...
'title = {Life history of the {H}awaiian blackhead triplefin, \emph{Enneapterygius atriceps} ({B}lennioidei, {T}ripterygiidae)}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {73}, ' ...
'number = {243-251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Enneapterygius-atriceps}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
