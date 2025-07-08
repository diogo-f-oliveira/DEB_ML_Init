function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_atkinsoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_atkinsoni'; 
metaData.species_en = 'Pacific yellowtail emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data

data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EbisOzaw2009';   
  temp.am = C2K(28.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 28; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GomaSiju2021';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 348;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01585*Lp^3.00, see F1';
data.Wwi = 1981;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01585*Li^3.00, see F1';

data.Ri  = 227e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'DegoAli2013';   
  temp.Ri = C2K(28.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for L. mahsena; size is not specified';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.641	21.698
1.784	21.164
1.784	20.843
1.786	18.705
1.787	17.957
1.832	20.309
1.881	19.347
1.973	22.126
2.019	23.622
2.303	24.157
2.307	20.736
2.444	25.760
2.590	22.340
2.686	21.698
2.731	23.943
2.828	22.233
2.917	28.005
2.921	24.371
3.159	24.264
3.249	28.325
3.253	24.798
3.255	22.981
3.345	27.577
3.631	27.470
3.680	25.760
3.726	27.043
3.775	26.081
3.824	24.477
3.918	25.012
3.966	25.119
4.056	29.394
4.245	30.356
4.388	29.822
4.529	31.746
4.962	26.615
5.103	28.325
5.482	29.501
5.573	32.922
5.579	27.363
5.860	31.105
5.908	31.105
6.006	27.791
6.054	27.898
6.054	27.363
6.380	34.418
6.573	31.105
6.712	34.311
6.715	32.280
7.003	29.608
7.046	33.135
7.335	29.929
7.478	29.181
7.570	32.494
7.663	33.990
8.090	34.739
8.472	32.922
9.803	33.135
10.418	35.808
10.708	31.318
10.849	32.922
11.034	37.090
12.416	33.777
12.462	35.487
13.933	37.090
13.938	32.387
14.122	38.373
14.270	32.922
14.409	36.235
14.454	38.800
14.555	32.922
14.601	35.059
14.693	37.838
15.310	38.266
16.497	39.549
16.546	37.732
17.540	41.686
18.016	40.938
18.350	39.976];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(28.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EbisOzaw2009'; comment.tL_f = 'data from Yeyama';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.640	22.447
1.973	22.233
2.303	24.264
2.400	22.340
2.494	23.195
2.544	21.698
2.588	24.691
2.732	23.302
2.777	26.081
2.829	21.698
2.922	23.729
3.018	22.553
3.205	24.905
3.344	28.432
3.394	26.615
3.394	26.188
3.534	29.181
3.536	26.829
3.776	25.012
3.915	28.432
4.104	29.287
4.153	27.363
4.155	26.295
4.198	30.463
4.199	29.394
4.297	26.295
4.344	26.936
4.390	28.432
4.435	30.356
4.486	27.791
4.486	27.257
4.530	30.570
4.582	26.081
4.723	28.432
4.769	29.287
4.815	30.891
4.912	29.287
4.956	32.173
5.006	29.608
5.053	30.677
5.147	31.425
5.340	28.646
5.481	30.463
5.575	30.891
5.576	30.143
5.577	28.967
5.764	31.960
5.908	30.677
6.050	31.853
6.051	30.784
6.053	28.539
6.099	29.822
6.191	33.029
6.193	31.318
6.241	30.356
6.286	32.601
6.384	30.036
6.386	28.753
6.432	30.249
6.478	30.998
6.621	30.784
6.858	31.211
7.097	30.036
7.332	32.173
7.333	31.960
7.335	30.249
7.336	29.181
7.378	33.884
7.572	30.784
7.573	29.394
7.712	33.029
7.805	34.418
7.808	32.173
8.046	31.211
8.187	32.708
8.234	33.456
8.237	30.570
8.238	29.822
8.379	30.784
8.613	34.525
8.664	31.853
8.853	32.280
9.043	32.815
9.850	33.135
10.137	32.067
10.229	34.632
10.230	33.777
10.231	32.494
10.563	33.029
11.132	34.739
11.179	34.525
11.517	30.249
11.658	31.639
11.988	33.670
12.226	33.990
12.228	31.853
12.938	34.204
13.464	30.998
13.886	36.449
14.126	34.632
14.127	33.563
14.129	32.173
14.267	36.021
14.316	34.204
14.460	33.135
14.698	32.708
15.077	34.097
15.548	37.945
16.171	33.135
16.215	36.663
16.930	34.846
17.881	33.670
19.780	36.342
21.019	33.029
21.207	34.632
21.967	35.380
23.106	36.342
23.869	33.777
24.245	38.052];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(28.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EbisOzaw2009'; comment.tL_m = 'data from Yeyama';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwb = 5 * weights.Wwb;

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

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww ing g = 0.01585*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '722NB'; % Cat of Life
metaData.links.id_ITIS = '550899'; % ITIS
metaData.links.id_EoL = '46580958'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_atkinsoni'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_atkinsoni'; % ADW
metaData.links.id_Taxo = '178731'; % Taxonomicon
metaData.links.id_WoRMS = '278632'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-atkinsoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_atkinsoni}}';
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
bibkey = 'EbisOzaw2009'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-009-0061-9}, ' ...
'author = {Akihiko Ebisawa and Takakazu Ozawa}, ' ... 
'year = {2009}, ' ...
'title = {Life-history traits of eight \emph{Lethrinus} species from two local populations in waters off the {R}yukyu Islands}, ' ...
'journal = {Fish Sci}, ' ...
'volume = {75}, ' ...
'pages = {553–566}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GomaSiju2021'; type = 'Article'; bib = [ ... 
'doi = {10.1111/are.15461}, ' ...
'author = {Pitchaimuthu Gomathi and Ramachandran Siju and Mathavankonathu Kuttan Anil and Gopidas P. Ambarish and Sumathi Surya and Bhargavan Raju and Padikkala Kandiyil Raheem and Boby Ignatius and Achamveettil Gopalakrishnan}, ' ... 
'year = {2021}, ' ...
'title = {Embryonic and larval development of Pink ear emperor, \emph{Lethrinus lentjan} ({L}acepede, 1802) under captive conditions}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {52}, ' ...
'pages = {5857–5869}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DegoAli2013'; type = 'Article'; bib = [ ... 
'author = {A. S. O. Abu Degoon and S. M. Ali}, ' ... 
'year = {2013}, ' ...
'title = {On some reproductive aspects of the Sky Emperor, \emph{Lethrinus mahsena} ({P}ieces) in the {S}udanese {R}ed {S}ea}, ' ...
'journal = {SJBS (B)}, ' ...
'volume = {17}, ' ...
'pages = {51-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-atkinsoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
