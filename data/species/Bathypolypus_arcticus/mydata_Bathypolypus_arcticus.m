function [data, auxData, metaData, txtData, weights] = mydata_Bathypolypus_arcticus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Bathypolypodidae';
metaData.species    = 'Bathypolypus_arcticus'; 
metaData.species_en = 'North Atlantic octopus'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MAN','MN'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 25]; 

%% set data
% zero-variate data

data.ab = 400;   units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'Wood2000';   
  temp.ab = C2K(7.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'Wood2000';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'life is is very unsure, but likely to exceed 3 yr';

data.Wwb  = 0.250;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'Wood2000';
data.Wwp  = 30;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';     bibkey.Wwp  = 'Wood2000';
data.Wwi  = 300;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'Wood2000';

data.Ni  = 44; units.Ni  = '#';  label.Ni  = 'fecundity at 45 g';    bibkey.Ni  = 'Wood2000';   
  temp.Ni = C2K(4);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'Wood2000 assumes maturity at 6 yr plur 1 yr for brooding';
  
% uni-variate data

% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
1.094	0.243
1.094	0.185
1.094	0.164
1.094	0.151
1.094	0.123
1.094	0.106
1.368	0.228
1.368	0.220
1.642	0.198
15.321	0.291
15.595	0.276
15.595	0.261
16.689	0.224
16.689	0.160
17.510	0.201
18.057	0.218
22.435	0.220
22.709	0.179
22.982	0.281
22.982	0.261
23.256	0.121
23.529	0.246
27.086	0.270
27.633	0.197
28.454	0.259
28.454	0.235
28.454	0.220
29.001	0.145
29.822	0.175
30.096	0.300
30.917	0.304
31.737	0.287
32.832	0.212
36.115	0.251
36.662	0.274
36.662	0.264
36.936	0.324
40.766	0.266
45.144	0.307
51.710	0.305
52.531	0.335
52.531	0.309
53.352	0.352
55.540	0.318
57.456	0.271
58.824	0.307
59.097	0.342
59.644	0.352
63.475	0.208
65.390	0.279
65.663	0.376
65.663	0.353
65.937	0.305
66.758	0.245
69.220	0.310
72.777	0.432
74.966	0.232
79.617	0.385
79.617	0.428
79.617	0.407
80.438	0.484
80.711	0.338
82.900	0.409
84.268	0.351
85.363	0.418
85.636	0.377
87.004	0.338
87.004	0.403
87.551	0.422
93.297	0.276
93.297	0.263
94.118	0.388
94.118	0.467
94.118	0.454
98.769	0.373
99.590	0.282
100.958	0.493
100.958	0.444
100.958	0.412
101.231	0.321
101.505	0.269
101.778	0.362
101.778	0.231
101.778	0.580
102.052	0.304
104.241	0.414
104.788	0.362
106.430	0.437
107.250	0.418
107.524	0.388
107.798	0.433
108.618	0.481
114.637	0.582
114.911	0.390
117.921	0.500
119.289	0.427
120.383	0.358
124.487	0.459
125.034	0.535
125.581	0.434
126.129	0.250
126.129	0.722
128.044	0.449
128.865	0.330
130.506	0.421
131.053	0.535
131.327	0.328
132.148	0.447
132.421	0.561
138.988	0.757
143.365	0.460
145.007	0.581
148.016	0.499
152.668	0.647
152.668	0.594
152.668	0.585
153.488	0.566
153.762	0.925
154.309	0.253
156.498	0.475
158.413	0.551
159.508	0.607
160.876	0.650
166.895	0.960
168.536	0.555
170.178	0.540
170.451	0.570
175.376	0.743
175.650	0.631
177.018	1.001
177.291	0.704
178.933	0.530
183.311	0.700
184.131	0.665
189.603	1.191
193.981	0.635];
n=size(data.tWw,1); for i=2:n; if data.tWw(i,1)<=data.tWw(i-1,1); data.tWw(i,1)=data.tWw(i-1,1)+1e-8;end; end
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(8.3);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Wood2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Ophiuroids are an important component of the diet if B. a.';
metaData.bibkey.F2 = 'Wood2000'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5WDZK'; % Cat of Life
metaData.links.id_ITIS = '82636'; % ITIS
metaData.links.id_EoL = '492845'; % Ency of Life
metaData.links.id_Wiki = 'Bathypolypus_arcticus'; % Wikipedia
metaData.links.id_ADW = 'Bathypolypus_arcticus'; % ADW
metaData.links.id_Taxo = '40337'; % Taxonomicon
metaData.links.id_WoRMS = '140596'; % WoRMS
metaData.links.id_molluscabase = '140596'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathypolypus_arcticus}}';
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
bibkey = 'Wood2000'; type = 'phdthesis'; bib = [ ... 
'author = {James Wood}, ' ... 
'year = {2000}, ' ...
'title = {The natural history of \emph{Bathypolypus arcticus} ({P}rosch), a deep-sea octopus}, ' ...
'school = {Dalhousie University, Halifax, Nova Scotia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Bathypolypus-arcticus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

