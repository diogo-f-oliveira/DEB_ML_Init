function [data, auxData, metaData, txtData, weights] = mydata_Symphurus_plagiusa
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Symphurus_plagiusa'; 
metaData.species_en = 'Blackcheek tongue fish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.4); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 15];

%% set data
% zero-variate data
data.ab = 2.5;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(24.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(24.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'TerwMunr1999';
data.Lpm = 9.1;   units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';      bibkey.Lpm = 'TerwMunr1999';
data.Li = 21;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 6.6e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'OlneGran1976';
  comment.Wwb = 'based TL 1.3 mm of early larva, so estimated egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 6.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00437*Lp^3.19, see F1';
data.Wwi = 72.2; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00437*Li^3.19, see F1';

data.Ri = 800; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(24.46); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Pegusa impar';

% uni-variate data
% time-length        
data.tL_fm = [ ... % age (yrs), total length (cm) 
    1  7.8835  7.5675
    2 10.9745 10.6765
    3 13.0731 12.6946
    4 14.8049 14.5094
    5 16.7936 16.3721];
data.tL_fm(:,1) = 365 * (0.8+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(24.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'TerwMunr1999'; treat.tL_fm = {1 {'females','male'}};

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
4.580	0.000
4.782	0.776
4.955	0.621
5.041	0.776
5.329	0.776
5.531	0.621
5.617	0.776
5.963	1.397
6.136	1.862
6.367	1.862
6.395	2.017
6.511	1.862
6.540	2.793
6.712	2.017
6.885	2.328
7.145	2.638
7.232	3.414
7.375	2.948
7.607	4.500
7.635	2.948
7.693	3.724
7.865	2.948
7.981	3.879
8.011	5.431
8.211	4.034
8.355	3.724
8.384	4.500
8.470	3.569
8.760	5.741
8.846	4.966
9.048	6.052
9.134	4.966
9.192	6.983
9.337	8.069
9.395	9.000
9.422	5.586
9.653	6.517
9.654	7.603
9.798	8.845
9.799	9.155
9.941	7.138
9.973	11.483
10.001	10.552
10.116	9.776
10.144	8.534
10.346	9.310
10.346	9.310
10.462	11.172
10.519	10.241
10.577	10.552
10.981	11.793
11.038	10.862
11.268	10.397
11.270	13.190
11.301	16.603
11.327	11.793
11.559	15.207
11.615	11.328
11.616	13.655
11.675	15.672
11.761	14.431
11.877	15.983
12.051	18.155
12.165	16.448
12.223	17.379
12.282	18.776
12.454	17.690
12.541	18.310
12.598	17.069
12.656	18.155
12.716	21.569
12.829	19.241
12.858	18.621
12.888	20.638
12.972	17.845
13.030	17.690
13.033	22.345
13.090	20.793
13.177	23.121
13.351	23.586
13.352	25.138
13.522	21.879
13.551	22.034
13.554	27.155
13.582	24.517
13.609	22.966
13.697	24.828
13.728	28.086
13.784	25.914
13.813	26.845
13.869	24.207
13.957	25.759
14.045	28.862
14.070	22.500
14.159	27.155
14.221	33.207
14.248	30.259
14.359	24.207
14.361	27.621
14.506	28.707
14.507	30.724
14.532	24.828
14.535	28.552
14.565	31.500
14.678	26.845
14.679	29.638
14.824	30.259
14.854	32.121
14.855	33.672
14.856	35.534
14.909	28.086
14.910	29.793
14.940	31.190
15.027	32.431
15.143	33.828
15.144	35.534
15.169	30.259
15.203	37.086
15.287	34.448
15.289	37.241
15.377	38.948
15.399	29.172
15.400	30.724
15.431	33.828
15.493	40.500
15.524	45.155
15.580	42.362
15.603	32.586
15.604	35.069
15.607	39.569
15.690	34.448
15.691	35.845
15.835	35.069
15.894	37.707
15.923	38.172
16.015	47.172
16.037	35.845
16.038	37.241
16.063	31.500
16.155	39.569
16.241	40.345
16.242	41.276
16.242	41.431
16.243	42.672
16.244	45.000
16.274	46.086
16.356	40.034
16.417	45.310
16.471	38.793
16.475	45.155
16.480	52.293
16.531	42.517
16.531	42.828
16.615	38.483
16.678	46.862
16.704	42.983
16.789	40.810
16.818	40.500
16.850	45.931
16.933	40.345
16.933	40.810
16.964	43.603
17.022	44.534
17.047	39.259
17.054	49.345
17.201	54.621
17.342	50.121
17.458	51.207
17.462	57.259
17.482	43.914
17.489	54.931
17.514	49.034
17.541	45.466
17.542	46.552
17.776	52.448
18.267	55.241
18.557	57.569
18.616	60.052
19.026	71.690
19.456	67.190
20.273	84.414];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'TerwMunr1999';
%
data.LW_m = [ ... % total length (cm), weight (g)
4.811	0.776
5.012	0.776
5.185	0.931
5.473	1.397
5.733	1.707
6.482	1.707
6.828	2.483
7.087	3.103
7.463	4.190
7.924	4.500
8.241	5.431
8.674	6.207
8.759	4.345
8.905	7.293
9.192	6.207
9.308	8.224
9.913	7.914
10.087	8.845
10.349	13.190
10.549	11.328
10.576	9.155
10.608	13.190
10.780	12.414
10.894	9.776
11.126	12.569
11.328	13.810
11.445	15.672
11.878	17.534
12.048	13.655
12.222	15.362
12.369	20.483
12.539	15.672
12.599	18.931
12.774	22.500
13.177	21.879
13.524	24.672
13.784	25.448
13.814	27.466
13.839	22.345
14.101	26.069
14.159	26.690
14.218	29.483
14.387	22.966
14.416	23.431
14.418	25.603
14.563	27.310
14.708	29.483
14.739	32.276
14.969	31.500
15.024	28.862
15.258	33.672
15.287	33.828
15.374	34.759
15.378	41.741
15.457	30.414
15.607	38.328
15.692	36.310
15.896	41.121
15.948	32.121
15.955	43.138
16.045	48.103
16.124	36.310
16.268	37.397
16.390	46.707
16.474	42.983
16.498	36.155
16.555	35.379
16.556	37.552
16.848	42.983
16.852	49.345
16.878	44.534
16.937	47.017
17.080	45.931
17.084	51.052
17.229	52.759
17.398	47.483
17.459	52.448
17.576	54.776
17.576	55.707
17.629	48.569
17.692	56.328
17.746	50.431
17.801	46.552
17.891	52.448
18.556	56.638
19.023	66.569];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'TerwMunr1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00437*(TL in cm)^3.19';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C5Z9'; % Cat of Life
metaData.links.id_ITIS = '616343'; % ITIS
metaData.links.id_EoL = '46570070'; % Ency of Life
metaData.links.id_Wiki = 'Symphurus'; % Wikipedia
metaData.links.id_ADW = 'Symphurus_plagiusa'; % ADW
metaData.links.id_Taxo = '172578'; % Taxonomicon
metaData.links.id_WoRMS = '274222'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-robustus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Symphurus}}';
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
bibkey = 'TerwMunr1999'; type = 'article'; bib = [ ...
'author = {Mark R. Terwilliger and Thomas A. Munroe}, ' ...
'year = {1999}, ' ...
'title = {Age, growth, longevity, and mortality of blackcheek tonguefish, \emph{Symphurus plagiusa} ({C}ynoglossidae: {P}leuronectiformes), in {C}hesapeake Bay, {V}irginia}, ' ... 
'journal = {Fish. Bull.}, ' ...
'volume = {97}, ' ...
'pages = {340–361}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OlneGran1976'; type = 'article'; bib = [ ...
'author = {John E. Olney and George C. Grant}, ' ...
'year = {1976}, ' ...
'title = {Early Planktonic Larvae of the Blackcheek Tonguefish, \emph{Symphurus plagiusa} ({P}isces: {C}ynoglossidae), in the {L}ower {C}hesapeake {B}ay}, ' ... 
'journal = {Cheasapeake Science}, ' ...
'volume = {17(4) ' ...
'pages = {229-237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Symphurus-plagiusa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
