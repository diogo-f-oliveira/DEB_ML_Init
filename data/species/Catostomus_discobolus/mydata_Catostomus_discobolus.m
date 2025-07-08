  function [data, auxData, metaData, txtData, weights] = mydata_Catostomus_discobolus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Catostomus_discobolus'; 
metaData.species_en = 'Bluehead sucker'; 

metaData.ecoCode.climate = {'Cfb', 'Cfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 29];

%% set data
% zero-variate data
data.am = 25*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'WaltDoug2006';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess'; 
data.Li = 41;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'Wiki';

data.Wwb = 4.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'Computed from egg diameter of 2.2 mm of Catostomus catostomus: pi/6*0.22^3';
data.Wwi = 482; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 0.00501*Li^3.09, see F1';

data.Ri = 35e3/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Catostomus catostomus';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
2.862	15.846
3.053	22.125
3.456	14.925
3.532	19.766
3.858	19.371
4.037	18.977
4.267	21.593
4.279	16.882
4.331	19.629
4.363	18.582
4.442	22.507
4.486	16.749
4.650	22.244
4.655	20.281
4.687	19.234
4.780	17.532
4.920	20.803
4.982	19.363
5.008	20.933
5.015	18.054
5.135	17.399
5.191	18.707
5.372	17.528
5.374	16.743
5.456	19.228
5.480	21.191
5.807	20.796
5.899	19.617
5.933	17.785
5.981	22.103
6.019	18.831
6.105	19.747
6.157	22.756
6.219	33.224
6.250	20.792
6.282	20.007
6.421	23.670
6.506	24.978
6.515	21.576
6.525	17.650
6.776	23.406
6.830	25.630
6.852	16.862
7.134	22.225
7.166	21.309
7.206	17.121
7.213	25.888
7.367	23.663
7.422	25.363
7.430	22.354
7.812	23.267
8.043	25.228
8.063	17.377
8.128	26.667
8.196	23.395
8.258	22.086
8.296	18.945
8.494	22.346
8.519	24.177
8.649	19.597
8.668	23.784
8.842	25.091
8.967	22.604
9.017	26.006
9.039	29.015
9.235	21.817
9.280	27.312
9.319	23.648
9.375	25.087
9.444	32.545
9.498	23.123
9.502	21.422
9.510	30.058
9.610	25.478
9.702	24.169
9.715	19.196
9.790	24.691
10.002	22.596
10.041	18.801
10.126	20.371
10.349	25.603
10.392	31.884
10.490	28.219
10.532	23.639
10.944	24.421
11.010	33.057
11.245	22.194
11.440	27.165
11.580	30.174
11.601	21.930
11.843	19.834
11.868	32.919
12.057	28.600
12.319	30.299
12.443	27.943
12.552	31.475
12.570	24.670
12.926	24.406
12.947	27.415
12.987	23.620
13.334	26.627
13.468	20.345
13.717	27.148
13.761	21.521
14.444	20.469
14.734	22.822
14.847	24.784
15.059	22.689
15.363	19.807
15.412	23.471
15.659	31.190
15.865	31.581
16.103	30.924
16.878	28.432
17.274	24.242
18.540	26.457
19.746	29.065
20.052	25.137
23.603	24.325
24.688	27.981];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WaltDoug2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00501*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XFCM'; % Cat of Life
metaData.links.id_ITIS = '163902'; % ITIS
metaData.links.id_EoL = '1156455'; % Ency of Life
metaData.links.id_Wiki = 'Catostomus_discobolus'; % Wikipedia
metaData.links.id_ADW = 'Catostomus_discobolus'; % ADW
metaData.links.id_Taxo = '166642'; % Taxonomicon
metaData.links.id_WoRMS = '1020556'; % WoRMS
metaData.links.id_fishbase = 'Catostomus-discobolus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Catostomus_discobolus}}';  
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
bibkey = 'WaltDoug2006'; type = 'incollection'; bib = [ ...  
'author = {Walters, C. and M. Douglas and W.R. Persons and R.A. Valdez}, ' ...
'year = {2006}, ' ...
'title = {Assessment of growth and apparent population trends in {G}rand {C}anyon native fishes from tag-recapture data}, ' ... 
'booktitle = {Fishes in databases and ecosystems. Fisheries Centre, University of British Columbia.}, ' ...
'editor = {M.L.D. Palomares and K.I. Stergiou and D. Pauly}, ' ...
'volume = {Fisheries Centre Research Reports 14(4)}, '...
'pages = {78-88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Catostomus-discobolus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
