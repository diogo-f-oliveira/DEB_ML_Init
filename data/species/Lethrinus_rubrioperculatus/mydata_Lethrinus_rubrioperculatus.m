function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_rubrioperculatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_rubrioperculatus'; 
metaData.species_en = 'Spotcheek  emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
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

data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EbisOzaw2009';   
  temp.am = C2K(26.9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 23; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 57;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'EbisOzaw2009';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GomaSiju2021';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 160;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01445*Lp^2.97, see F1';
data.Wwi = 2370;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^2.97, see F1';

data.GSI = 0.06; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = {'Ebis2006','guess'};
  temp.GSI = C2K(26.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Lethrinus_ornatus';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.471	26.015
1.474	21.310
1.476	19.834
1.476	19.004
1.492	25.000
1.494	23.339
1.495	21.771
1.536	22.601
1.555	24.354
1.575	25.646
1.635	27.122
1.639	22.786
1.658	24.723
1.682	21.310
1.698	26.661
1.720	25.369
1.723	22.140
1.763	23.247
1.825	24.077
1.884	26.845
1.927	25.092
1.928	23.801
1.946	27.583
1.947	25.738
1.949	24.262
1.951	21.218
1.952	20.664
1.992	22.601
1.992	21.771
2.028	28.044
2.089	30.166
2.090	29.428
2.114	25.185
2.152	28.875
2.176	25.461
2.196	25.923
2.212	31.550
2.214	29.520
2.218	24.262
2.219	22.878
2.220	22.140
2.220	21.863
2.235	28.598
2.238	24.908
2.260	23.339
2.279	26.015
2.280	25.000
2.280	24.446
2.300	26.015
2.318	28.875
2.319	27.030
2.338	30.258
2.339	28.229
2.382	26.568
2.440	31.089
2.442	29.336
2.445	25.185
2.460	32.011
2.464	27.952
2.483	30.166
2.486	26.015
2.487	25.461
2.504	29.705
2.525	29.151
2.544	31.642
2.586	30.627
2.608	28.598
2.609	27.399
2.630	27.860
2.646	32.934
2.646	32.657
2.648	30.166
2.652	26.384
2.693	26.845
2.708	33.487
2.730	31.734
2.731	30.812
2.732	29.244
2.795	28.875
2.815	29.520
2.831	34.502
2.833	32.288
2.835	30.627
2.855	31.273
2.860	24.908
2.959	30.812
2.959	30.074
2.963	25.646
2.978	32.841
2.981	29.428
2.986	23.524
3.000	31.642
3.004	26.199
3.006	24.446
3.027	23.339
3.045	27.306
3.085	28.137
3.148	27.952
3.163	34.041
3.168	28.690
3.186	32.103
3.187	30.166
3.188	29.520
3.206	33.210
3.224	35.517
3.228	31.550
3.252	27.583
3.269	32.011
3.269	31.181
3.327	36.439
3.355	28.137
3.374	30.351
3.415	29.982
3.416	29.520
3.432	35.240
3.438	28.321
3.439	27.030
3.454	33.579
3.455	32.472
3.477	30.535
3.517	33.118
3.521	27.306
3.541	28.137
3.559	31.550
3.561	29.428
3.579	32.196
3.580	31.089
3.581	30.904
3.582	29.613
3.598	35.240
3.604	28.044
3.663	31.365
3.682	33.672
3.703	32.749
3.744	33.764
3.804	35.978
3.805	35.148
3.826	34.686
3.828	32.196
3.848	33.579
3.867	35.424
3.928	36.439
3.950	35.517
3.974	31.827
3.998	27.768
4.033	34.871
4.052	37.638
4.059	28.137
4.097	32.472
4.201	32.934
4.220	34.225
4.221	33.579
4.224	29.982
4.240	35.517
4.263	32.380
4.283	33.210
4.348	30.443
4.361	39.114
4.364	35.517
4.365	34.410
4.367	32.288
4.427	34.871
4.466	37.269
4.510	35.240
4.678	32.380
4.698	33.395
4.736	37.085
4.739	33.856
4.759	34.502
4.778	36.255
4.782	31.919
4.863	33.764
4.906	31.919
4.945	34.410
4.966	35.055
5.006	35.978
5.209	41.697
5.337	37.177
5.359	36.162
5.381	33.948
5.398	38.007
5.422	34.686
5.441	36.716
5.670	35.055
5.709	38.838
5.710	36.624
5.793	37.085
6.105	35.978
6.185	39.114
6.249	37.638
6.291	36.162
13.851	41.605];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(26.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EbisOzaw2009';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.864	26.015
1.988	27.030
2.070	28.321
2.237	27.030
2.357	31.181
2.463	28.321
3.124	31.734
3.184	34.225
3.329	34.317
3.433	34.410
3.516	34.317
3.556	35.240
3.599	34.133
3.599	33.764
3.764	34.594
3.784	35.978
3.828	32.841
3.936	27.030
3.952	33.395
3.955	28.875
3.971	35.332
3.974	31.181
3.991	35.332
4.017	29.613
4.094	36.900
4.094	36.531
4.115	36.162
4.179	34.041
4.224	29.336
4.287	28.967
4.287	28.137
4.384	36.993
4.408	33.026
4.428	33.764
4.445	37.546
4.467	36.439
5.088	38.007
5.110	35.978
5.171	37.638
5.190	39.114
5.280	31.365
5.401	35.332
5.500	40.683
5.544	36.900
5.564	38.561
5.630	33.764
5.693	33.210
5.733	34.686
5.792	37.731
5.899	34.779
5.939	35.793
5.958	38.284
6.000	37.546
6.145	36.993
6.271	35.978
6.355	34.594
6.664	36.162
6.665	34.963
6.725	37.362
6.746	36.993
6.891	38.007
6.954	37.177
7.017	35.332
7.228	30.535
7.242	38.653
7.265	36.255
7.701	35.886
7.743	34.594
7.888	35.609
8.430	31.089
8.675	35.332
8.964	36.808
8.990	30.904
9.194	35.055
9.443	34.225
9.501	39.114
10.169	33.118
10.683	38.376
10.870	37.731
11.056	38.561
11.286	36.716
11.905	39.576
12.442	42.159
12.898	41.605
12.942	39.022];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(26.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EbisOzaw2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;

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
F1 = 'length-weight: Ww ing g = 0.01445*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6Q324'; % Cat of Life
metaData.links.id_ITIS = '169157'; % ITIS
metaData.links.id_EoL = '46580950'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_rubrioperculatus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_rubrioperculatus'; % ADW
metaData.links.id_Taxo = '178751'; % Taxonomicon
metaData.links.id_WoRMS = '212077'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-rubrioperculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_rubrioperculatus}}';
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
'title = {Life-history traits of eight \emph{Lethrinus} species from two local populations in waters off the {R}yukyu {I}slands}, ' ...
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
bibkey = 'Ebis2006'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-006-0345-3}, ' ...
'author = {Akihiko Ebisawa}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive and sexual characteristics in five Lethrinus species in waters off the {R}yukyu {I}slands}, ' ...
'journal = {Ichthyol Res}, ' ...
'volume = {53}, ' ...
'pages = {269–280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-rubrioperculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
