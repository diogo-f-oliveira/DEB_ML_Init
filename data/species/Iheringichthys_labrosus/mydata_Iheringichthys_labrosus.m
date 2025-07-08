  function [data, auxData, metaData, txtData, weights] = mydata_Iheringichthys_labrosus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pimelodidae';
metaData.species    = 'Iheringichthys_labrosus'; 
metaData.species_en = 'Long-whiskered catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 25];

%% set data
% zero-variate data
data.ab = 5.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'SantRodri2016';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10.2;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase';
  comment.Lp = 'TL 12.3 cm, which gives SL 10.2 cm ;SantRodri2016 gives 8.54 cm std length';
data.Li = 36.1;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';
  comment.Li = 'TL 43.5 cm , so SL ';

data.Wwb = 1.8e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SuzuGarc2013';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 20.9;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00851*Lp^3.09 (TL), see F1';
data.Wwi = 983.7;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.09 (TL), see F1';
 
data.Ri = 4*67274.5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate ';   bibkey.Ri = 'SuzuGarc2013';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Assumed: 4 spawnings per yr';

% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), std length (cm)
    0  8.4
    1  9.8
    2 11.2
    3 13.2
    4 16.5
    5 16.2
    6 17.6
    7 18.0];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
  temp.tL = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SantRodri2016';

% length-weight
data.LW_f = [ ... % std length (cm), weight(g), females,
6.349	4.754
7.441	8.262
7.792	10.207
7.908	8.269
7.910	12.149
7.987	9.046
8.105	12.152
8.454	9.054
8.687	8.281
8.770	19.145
8.807	14.102
8.961	10.225
9.119	16.047
9.122	22.254
9.160	20.702
9.271	7.902
9.471	18.768
9.507	12.949
9.746	24.203
9.820	16.446
9.823	22.264
9.896	12.955
10.170	16.063
10.210	18.779
10.213	25.374
10.409	28.093
10.522	18.008
10.559	14.517
10.641	24.217
10.679	22.666
10.760	29.262
10.950	18.015
10.952	21.506
10.996	34.697
11.111	30.431
11.148	25.001
11.262	19.959
11.305	27.719
11.346	33.150
11.539	30.438
11.614	22.680
11.659	37.810
11.732	26.173
11.775	34.709
11.963	18.418
11.969	32.772
12.011	41.307
12.044	25.402
12.200	27.732
12.243	37.043
12.280	30.837
12.320	35.105
12.355	26.183
12.401	42.477
12.513	30.841
12.513	31.229
12.517	39.763
12.676	46.748
12.747	32.008
12.866	37.053
12.908	42.485
12.911	49.468
13.023	38.607
13.137	32.790
13.141	42.488
13.216	35.119
13.263	52.964
13.300	48.698
13.453	42.493
13.494	48.313
13.574	53.357
13.614	55.685
13.684	36.290
13.686	40.945
13.727	46.765
13.925	54.139
13.956	36.294
13.960	43.665
14.040	49.873
14.122	58.797
14.153	40.177
14.158	51.815
14.160	56.858
14.389	45.999
14.396	62.680
14.425	39.793
14.470	53.759
14.707	60.358
14.743	53.763
14.744	56.867
14.748	65.401
15.014	51.828
15.055	55.708
15.132	53.381
15.137	65.795
15.212	58.814
15.220	76.271
15.252	61.530
15.411	68.515
15.443	53.386
15.452	72.783
15.562	56.491
15.562	58.431
15.566	66.190
15.607	70.846
15.687	75.890
15.720	62.701
15.958	73.179
16.034	67.749
16.155	78.225
16.236	85.597
16.305	64.262
16.424	70.082
16.425	72.410
16.512	92.196
16.544	76.679
16.546	80.558
16.624	81.723
16.657	68.534
16.812	65.821
16.860	87.158
17.014	84.057
17.203	70.870
17.215	98.414
17.246	78.630
17.283	74.751
17.290	90.656
17.339	114.709
17.679	89.498
17.686	107.343
17.831	80.578
18.142	79.419
18.350	111.233
18.513	127.529
18.628	122.487
19.167	108.918
19.453	139.957
20.035	134.923
20.064	112.423
20.229	133.374
20.314	150.445
20.553	163.250
20.583	142.302];
units.LW_f = {'cm', 'g'};  label.LW_f = {'std length','weight','females'};  
bibkey.LW_f = 'SantRodri2016';
%
data.LW_m = [ ... % std length (cm), weight(g), females,
7.632	8.823
7.671	6.490
7.866	10.763
7.983	8.040
8.217	7.259
8.294	12.700
8.411	16.975
8.606	10.363
8.762	8.805
8.762	13.471
9.034	11.911
9.034	17.743
9.229	14.630
9.385	20.848
9.463	10.738
9.502	7.628
9.657	20.066
9.696	15.400
9.696	23.175
9.813	13.454
10.008	24.726
10.047	17.727
10.125	32.499
10.164	15.393
10.241	21.612
10.280	14.225
10.436	26.274
10.436	17.332
10.631	29.770
10.748	17.716
10.826	23.547
11.020	20.822
11.098	16.544
11.098	29.374
11.137	27.429
11.215	17.709
11.488	21.592
11.643	26.255
11.838	28.196
11.838	30.917
11.955	26.639
12.344	32.853
12.773	37.512
12.812	30.514
12.889	35.178
13.240	34.395
13.357	41.002
13.474	37.112
13.824	39.828
13.941	43.714
14.213	50.319
14.798	48.755
14.914	57.695
15.537	67.404
15.888	62.733];
units.LW_m = {'cm', 'g'};  label.LW_m = {'std length','weight','males'};  
bibkey.LW_m = 'SantRodri2016';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'from photo: SL = 0.82 TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6N6SJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '214884'; % Ency of Life
metaData.links.id_Wiki = 'Iheringichthys_labrosus'; % Wikipedia
metaData.links.id_ADW = 'Iheringichthys_labrosus'; % ADW
metaData.links.id_Taxo = '177475'; % Taxonomicon
metaData.links.id_WoRMS = '1020411'; % WoRMS
metaData.links.id_fishbase = 'Iheringichthys_labrosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Iheringichthys_labrosus}}';  
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
bibkey = 'SantRodri2016'; type = 'Article'; bib = [ ...
'doi = {10.1111/jai.13059}, ' ...
'author = {Soares de Santana, H. and Cantarute Rodrigues, A. and Dei Tos, C.}, ' ...
'year = {2016}, ' ...
'title = {Patterns of reproduction and growth of the catfish \emph{Iheringichthys labrosus} ({L}ütken, 1874) after a reservoir formation}, ' ... 
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {32(3)}, '...
'pages = {195-201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SuzuGarc2013'; type = 'Article'; bib = [ ...
'doi = {10.7167/2013/607541}, ' ...
'author = {F\''{a}bio Mineo Suzuki and Diego Azevedo Zoccal Garcia and M\''{a}rio Luís Orsi}, ' ...
'year = {2013}, ' ...
'title = {Reproductive Dynamics of \emph{Iheringichthys labrosus} ({L}ütken, 1874) ({T}eleostei, {P}imelodidae), in the {C}apivara {R}eservoir, {P}aranapanema {R}iver, {P}arana, {B}razil}, ' ... 
'journal = {Dataset Papers in Science}, ' ...
'volume = {607541}, '...
'pages = {6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Iheringichthys_labrosus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

