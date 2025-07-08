function [data, auxData, metaData, txtData, weights] = mydata_Varzea_bistriata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Scincidae';
metaData.species    = 'Varzea_bistriata'; 
metaData.species_en = 'Two-striped mabuya'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvr', 'biCvm', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Eei'}; 
metaData.data_1     = {'t-Le'; 't-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 129;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(28.5);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'data for captive individuals, 300 d in the wild';
data.am = 14.6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.9;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'guess'; 
  comment.Lb = 'based on (Wwb/Wwim)^(1/3)*Lim: (1.33/11.04)^(1/3)*7.95';
data.Lp  = 5.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'RamiSerr2002'; 
data.Lpm  = 7.2;   units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'RamiSerr2002'; 
data.Li  = 8.94;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'RamiSerr2002';
data.Lim  = 7.95;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'RamiSerr2002';

data.Wwb = 1.33;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'VittBlac1991';
data.Wwi = 16.49;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'RamiSerr2002';
data.Wwim = 11.04;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'RamiSerr2002';
 
% uni-variate data
% time-length
data.tLe = [ ... % age (d), embryo diameter (cm)
241.855	0.159
242.890	0.271
271.969	0.182
272.482	0.231
272.498	0.253
272.518	0.280
333.647	0.250
334.625	0.281
334.641	0.303
334.651	0.317
335.017	0.160
335.033	0.183
335.052	0.209
335.148	0.343
365.109	0.152
365.243	0.339
365.647	0.237
366.106	0.210
365+27.462	0.322
365+27.475	0.340
365+27.969	0.362
365+28.078	0.514
365+28.094	0.536
365+28.399	0.295
365+28.456	0.375
365+28.482	0.411
365+28.498	0.433
365+28.591	0.563
365+28.616	0.599
365+28.803	0.192
365+29.300	0.219
365+59.504	0.367
365+59.924	0.286
365+150.975	0.676
365+152.017	0.797
365+152.040	0.828
365+152.190	1.038
365+180.855	1.038
365+180.973	1.203
365+181.053	1.315
365+181.098	1.377
365+181.724	0.917
365+181.759	0.967
365+181.785	1.002
365+211.536	1.851
365+211.604	1.279
365+242.374	2.217
365+242.759	2.088
365+242.791	2.132
365+243.755	0.811
365+273.438	2.231];
data.tLe(:,1) = data.tLe(:,1) - 241.855; % set origin at eggs strat
units.tLe   = {'d', 'cm'};  label.tLe = {'age', 'embryo diameter'};  
temp.tLe    = C2K(28.5);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'VittBlac1991';

data.tL_f = [ ... % time since birth (d), SVL (cm)
0.00	4.041
0.000	3.845
1.543	4.696
1.543	4.478
60.962	5.148
61.734	6.284
62.505	5.934
121.152	6.255
121.152	6.779
182.114	6.663
182.114	6.990
182.114	7.515
242.304	6.874
243.848	7.092
303.266	7.762
364.228	7.689

365+0.000	7.799
365+62.505	7.616
365+123.467	8.592
365+182.886	8.345
365+182.886	8.629
365+243.076	9.430
365+305.581	9.357
365+305.581	9.553

730-0.772	10.267
730+0.000	10.551
730+0.000	10.879
730+0.000	11.206
730+60.190	9.801
730+60.962	10.063
730+61.734	10.718
730+61.734	10.937
730+118.837	10.078
730+118.837	10.384
730+118.837	10.515
730+118.837	10.843
730+118.837	10.930
730+118.837	11.105
730+121.152	11.629
730+179.799	10.355
730+179.799	10.639
730+179.799	10.835
730+180.571	9.874
730+181.342	10.049
730+242.304	10.085
730+303.266	10.209
730+304.038	11.104
730+362.685	10.158];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'age', 'SVL', 'females'};  
temp.tL_f   = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'RamiSerr2002'; comment.tL_f = 'Female data reconstructed from time-in-the-year data';

data.tL_m = [ ... % time since birth (d), SVL (cm)
181.342	7.274
241.533	7.966
242.304	8.272
304.038	8.527
304.039	8.024
364.228	8.716
364.229	9.000
365.000	7.231
365.001	7.930
365.002	8.454

365-3.087	8.564
365-3.088	8.629
365-1.543	9.044
365+58.647	8.425
365+121.152	7.937
365+179.027	9.132
365+181.342	8.804
365+239.989	8.250
365+241.533	8.491
365+241.534	9.037
365+241.535	9.102
365+242.304	8.665
365+242.305	9.408
365+304.038	9.

730+61.734	9.451
730+121.152	9.947
730+121.153	9.663
730+121.154	10.187];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'age', 'SVL', 'males'};  
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
temp.tL_m   = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'RamiSerr2002'; comment.tL_m = 'Male data reconstructed from time-in-the-year data';

% length-fecundity
data.LN = [ ... % SVL (cm), fecundity (#)
5.693	4
5.795	4
5.891	4
5.894	3
5.980	4
6.075	4
6.173	5
6.177	4
6.276	3
6.388	2
6.789	4
6.878	4
7.069	4
7.272	4
7.451	4
7.575	5
7.961	4
8.167	5
8.247	4
8.251	3
8.345	5
8.362	4
8.444	4
8.460	5
8.461	3
8.552	6
8.651	5
8.665	3
8.833	4
8.931	5
8.954	4
8.956	7
9.029	8
9.037	4
9.048	8
9.142	5
9.145	4
9.147	7
9.231	5
9.320	5
9.406	6
9.425	4
9.427	7
9.454	5
9.548	7
9.721	5
9.730	6
9.744	4
9.826	6
9.841	7
9.936	9
9.950	7
10.004	6
10.033	5
10.132	6
10.224	5
10.301	5
10.428	5
10.545	8
10.711	6
10.839	6
10.851	6];
units.LN   = {'cm', '#'};  label.LN = {'SVL', 'fecundity'};  
temp.LN    = C2K(28.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'VittBlac1991';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lp = 10 * weights.Lp;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7FJ9F'; % Cat of Life
metaData.links.id_ITIS = '1182417'; % ITIS
metaData.links.id_EoL = '47048084'; % Ency of Life
metaData.links.id_Wiki = 'Varzea_bistriata'; % Wikipedia
metaData.links.id_ADW = 'Mabuya_bistriata'; % ADW
metaData.links.id_Taxo = '4684820'; % Taxonomicon
metaData.links.id_WoRMS = '4684820'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Varzea&species=bistriata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Varzea_bistriata}}';
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
bibkey = 'VittBlac1991'; type = 'Article'; bib = [ ... 
'author = {Laurie J. Vitt and Daniel G. Blackburn}, ' ... 
'year = {1991}, ' ...
'title = {Ecology and Life History of the Viviparous Lizard \emph{Mabuya bistriata} ({S}cincidae) in the {B}razilian {A}mazon}, ' ...
'journal = {Copeia}, ' ...
'volume = {1991(4)}, ' ...
'pages = {916-927}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RamiSerr2002'; type = 'Article'; bib = [ ... 
'author = {Ram\''{i}rez-Pinilla, Martha Patricia and Serrano, Víctor Hugo and Galeano, Julio Cesar}, ' ... 
'year = {2002}, ' ...
'title = {Annual Reproductive Activity of \emph{Mabuya mabouya} ({S}quamata, {S}cincidae)}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {36(4)}, ' ...
'pages = {667-677}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

