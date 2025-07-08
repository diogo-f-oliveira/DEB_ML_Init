function [data, auxData, metaData, txtData, weights] = mydata_Benthosema_pterotum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Benthosema_pterotum'; 
metaData.species_en = 'Skinnycheek lanternfish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 25]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 25]; 

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'GjosTils1988';  
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 0.5 d, yolk resorption at 3 d';
data.am = 315; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'GjosTils1988';  
  temp.am = C2K(24.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.6;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on same relative length, compared to Benthosema_suborbitale';
data.Li = 5;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'GjosTils1988';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'GjosTils1988';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
  
data.Ri = 1e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(24.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';

% uni-variate data
% tL data
data.tL = [ ... % time since birth (d), standard length (cm) 
99.631	2.095
101.933	1.646
106.746	1.976
112.562	1.942
115.122	2.197
119.003	2.129
158.987	2.766
165.772	2.732
167.701	2.825
178.657	3.080
179.970	2.851
182.856	3.072
186.102	2.894
190.250	3.428
196.420	3.055
198.023	3.182
200.299	3.013
206.731	3.301
208.029	3.233
209.979	3.106
210.294	3.191
210.604	3.327
213.198	3.216
213.226	2.911
222.242	3.191
223.188	3.437
226.472	2.844
231.604	3.225
244.133	3.929
244.175	3.472
266.786	3.404
268.722	3.430
277.750	3.574
288.403	3.617
298.121	3.295
314.528	3.965];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HossVali2015';

% length-weight
data.LW = [ ... % standard length (cm), wet weight (g)
1.646	0.056
1.952	0.111
1.966	0.075
1.983	0.101
2.003	0.077
2.037	0.109
2.048	0.119
2.085	0.116
2.119	0.109
2.126	0.168
2.156	0.114
2.160	0.150
2.190	0.140
2.194	0.171
2.231	0.161
2.269	0.171
2.310	0.171
2.354	0.184
2.442	0.189
2.469	0.210
2.473	0.272
2.514	0.244
2.585	0.249
2.588	0.161
2.605	0.257
2.619	0.200
2.707	0.286
2.711	0.223
2.748	0.278
2.752	0.265
2.786	0.205
2.796	0.309
2.810	0.410
2.840	0.410
2.847	0.351
2.854	0.296
2.881	0.327
2.898	0.280
2.901	0.421
2.922	0.338
2.922	0.226
2.925	0.384
2.925	0.306
2.939	0.410
2.963	0.361
2.966	0.322
2.966	0.293
2.997	0.473
3.000	0.418
3.014	0.384
3.024	0.361
3.044	0.452
3.051	0.397
3.065	0.377
3.071	0.340
3.075	0.309
3.082	0.293
3.085	0.463
3.085	0.483
3.095	0.413
3.102	0.343
3.105	0.377
3.112	0.405
3.122	0.283
3.129	0.309
3.129	0.468
3.139	0.436
3.139	0.377
3.146	0.340
3.153	0.528
3.156	0.473
3.167	0.390
3.173	0.418
3.187	0.530
3.190	0.476
3.194	0.400
3.194	0.439
3.201	0.361
3.218	0.515
3.221	0.426
3.221	0.483
3.235	0.457
3.248	0.418
3.248	0.525
3.262	0.476
3.269	0.436
3.279	0.408
3.289	0.546
3.289	0.379
3.296	0.494
3.296	0.455
3.316	0.517
3.316	0.470
3.316	0.405
3.344	0.364
3.347	0.463
3.357	0.525
3.371	0.379
3.378	0.483
3.384	0.442
3.384	0.590
3.391	0.554
3.401	0.600
3.412	0.572
3.422	0.442
3.422	0.634
3.425	0.476
3.425	0.512
3.432	0.611
3.442	0.483
3.452	0.405
3.456	0.593
3.459	0.429
3.466	0.564
3.480	0.637
3.480	0.660
3.507	0.585
3.534	0.629
3.544	0.538
3.561	0.653
3.578	0.590
3.599	0.619
3.602	0.585
3.602	0.754
3.622	0.777
3.656	0.653
3.680	0.671
3.684	0.733
3.711	0.707
3.735	0.754
3.738	0.603
3.745	0.671
3.806	0.817
3.837	0.806
3.895	0.817
3.915	0.772
3.952	0.785
4.092	0.817
4.218	0.850];
units.LW = {'cm', 'g'}; label.LW = {'standard length', 'wet weight'};  
bibkey.LW = 'HossVali2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;
weights.Ri = 0*weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 24.5 C, according to fishbase';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'LHZT'; % Cat of Life
metaData.links.id_ITIS = '623749'; % ITIS
metaData.links.id_EoL = '46564030'; % Ency of Life
metaData.links.id_Wiki = 'Benthosema_pterotum'; % Wikipedia
metaData.links.id_ADW = 'Benthosema_pterotum'; % ADW
metaData.links.id_Taxo = '164101'; % Taxonomicon
metaData.links.id_WoRMS = '217680'; % WoRMS
metaData.links.id_fishbase = 'Benthosema-pterotum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Benthosema}}';
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
bibkey = 'HossVali2015'; type = 'article'; bib = [ ...
'author = {S. P. Hosseini-Shekarabi and T. Valinassab and Z. Bystydzie\''{n}ska and T. Linkowski}, ' ... 
'year   = {2015}, ' ...
'title  = {Age and growth of \emph{Benthosema pterotum} ({A}lcock, 1890) ({M}yctophidae) in the {O}man {S}ea}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'page = {51-56}, ' ...
'volume = {31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GjosTils1988'; type = 'article'; bib = [ ...
'author = {J. Gj{\o}s{\ae}ter and S. Tilseth}, ' ... 
'year   = {1988}, ' ...
'title  = {Spawning behaviour, egg and larval development of the myctophid fish \emph{Benthosema pterotum}}, ' ...
'journal = {Mar. Biol.}, ' ...
'page = {1-6}, ' ...
'volume = {98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Benthosema-pterotum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

