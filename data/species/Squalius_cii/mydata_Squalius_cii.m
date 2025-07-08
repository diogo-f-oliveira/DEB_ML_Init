  function [data, auxData, metaData, txtData, weights] = mydata_Squalius_cii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Squalius_cii'; 
metaData.species_en = 'Marmara chub'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 02 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 24]; 

%% set data
% zero-variate data
data.am = 14*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Rutilus rutilus';

data.Lp = 7.6;  units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'guess'; 
  comment.Lp = 'Based on same relative length as Rutilus rutilus: 27.5*12.1/44';
data.Li = 27.5;    units.Li = 'cm'; label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';
  comment.Li = 'Computed from fork length 28.9 cm  by FL = 0.95 * TL, based on photo';

data.Wwb = 4.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'EconDaou1991';
  comment.Wwb = 'Based on egg diameter of 2 mm for Rutilus rutilus: pi/6*0.2^3';

data.GSI = 5;   units.GSI = '-';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'KocErdo2007';
  temp.GSI = C2K(22); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.992	12.165
0.992	12.472
0.992	12.780
0.992	12.857
0.992	13.011
1.003	11.242
1.003	13.626
1.995	12.330
1.995	12.868
1.995	14.022
1.995	14.330
1.995	15.560
1.995	16.253
2.007	13.176
2.007	14.791
2.007	14.945
2.007	15.176
2.007	15.176
2.018	13.407
2.987	16.571
3.010	13.879
3.010	14.648
3.010	15.187
3.010	15.495
3.010	16.033
3.010	16.187
3.010	16.187
3.010	17.341
3.010	17.725
3.010	18.033
3.967	18.582
3.979	17.351
3.979	17.505
3.979	17.736
3.979	17.736
3.979	18.044
3.990	15.890
3.990	16.198
3.990	16.275
3.990	16.659
3.990	16.967
3.990	17.044
4.982	20.516
4.982	21.516
5.005	18.363
5.974	18.758
5.985	22.297
5.997	19.451
5.997	19.835
5.997	19.989
5.997	20.066];
n = size(data.tL_f,1);
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1));
for i = 2:n
    if data.tL_f(i,1) <= data.tL_f(i-1,1)
        data.tL_f(i,1) = max(data.tL_f(i-1,1), data.tL_f(i-1,1) + 1e-4);
    end
end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KocErdo2007';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.985	11.207
0.997	11.744
1.009	12.358
1.009	12.511
1.009	12.664
1.009	12.971
1.010	13.891
1.980	16.586
1.991	16.049
2.001	12.905
2.001	13.212
2.001	13.442
2.001	13.672
2.002	15.359
2.002	15.666
2.013	13.979
2.025	14.516
2.025	14.593
2.025	14.823
2.025	15.206
2.993	13.300
2.993	13.836
2.993	14.220
2.994	14.680
2.994	14.987
2.994	15.217
2.995	16.981
2.995	17.057
2.995	17.671
3.006	15.907
3.006	16.444
3.986	15.304
3.997	14.998
3.997	15.535
4.008	14.691
4.009	15.688
4.009	16.302
4.009	16.838
4.010	17.375
4.010	17.529
4.010	17.912
4.010	18.679
4.010	18.986
4.990	17.693
5.002	18.843
5.015	22.294
5.015	22.678
5.026	20.377
5.996	23.149
6.017	19.008
6.017	19.314];
n = size(data.tL_m,1);
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1));
for i = 2:n
    if data.tL_m(i,1) <= data.tL_m(i-1,1)
        data.tL_m(i,1) = max(data.tL_m(i-1,1), data.tL_m(i-1,1) + 1e-4);
    end
end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KocErdo2007';
comment.tL_m = 'Data for males';

data.LW_f = [ ... % fork length (cm), wet weight (g)
11.070	19.426
11.277	19.426
11.733	21.115
11.774	30.405
11.774	42.230
12.065	37.162
12.189	30.405
12.313	34.628
12.355	32.095
12.604	34.628
12.604	58.277
12.894	43.919
12.935	33.784
12.977	40.541
13.101	33.784
13.350	40.541
13.474	47.297
13.599	38.851
13.972	40.541
14.055	33.784
14.096	48.986
14.221	92.061
14.262	57.432
14.428	97.973
14.552	47.297
14.552	58.277
14.594	40.541
14.635	57.432
14.760	45.608
14.842	43.074
14.884	50.676
15.174	72.635
15.216	63.345
15.340	67.568
15.381	74.324
15.381	49.831
15.713	57.432
15.879	81.081
15.962	43.074
15.962	54.054
16.169	75.169
16.211	81.081
16.252	59.966
16.252	54.899
16.584	63.345
16.667	70.101
16.667	77.703
16.667	81.081
16.708	96.284
17.040	64.189
17.040	94.595
17.040	86.993
17.040	82.770
17.164	70.101
17.496	76.014
17.537	91.216
17.662	104.730
17.703	92.905
17.703	81.081
17.869	81.081
18.076	101.351
18.159	90.372
18.159	96.284
18.367	103.041
18.657	112.331
18.698	99.662
18.947	97.973
19.113	90.372
19.196	104.730
19.196	111.486
19.279	131.757
19.486	115.709
19.776	114.865
19.942	165.541
20.357	125.845
20.398	136.824
21.352	155.405
22.388	163.851
22.844	158.784
23.922	243.243
24.876	240.709];
units.LW_f = {'cm', 'g'}; label.LW_f = {'fork length','wet weight','female'};  
bibkey.LW_f = 'KocErdo2007';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % fork length (cm), wet weight (g)
12.065	33.333
12.065	33.333
12.355	36.667
12.438	34.167
12.521	26.667
12.728	30.000
12.811	35.833
12.894	36.667
13.143	42.500
13.308	31.667
13.433	43.333
13.474	48.333
13.516	52.500
13.599	72.500
13.682	50.000
13.723	39.167
14.055	51.667
14.138	43.333
14.179	49.167
14.221	60.833
14.221	48.333
14.262	55.833
14.386	50.000
14.469	54.167
14.469	60.833
14.511	40.833
14.718	36.667
14.760	63.333
14.884	45.000
14.967	53.333
15.174	56.667
15.299	76.667
15.423	52.500
15.630	60.000
15.672	65.833
15.713	80.833
15.796	52.500
15.962	59.167
15.962	79.167
16.045	60.000
16.045	90.000
16.252	80.000
16.294	73.333
16.418	60.000
16.459	82.500
16.501	76.667
16.542	71.667
16.584	64.167
16.874	75.000
16.915	85.000
16.957	90.000
17.040	91.667
17.040	65.000
17.206	99.167
17.454	86.667
17.496	77.500
17.496	73.333
17.537	91.667
17.537	99.167
17.828	80.833
17.869	87.500
17.952	99.167
18.201	90.833
18.201	120.833
18.325	99.167
18.367	103.333
18.698	112.500
19.527	130.000
23.549	173.333];
units.LW_m = {'cm', 'g'}; label.LW_m = {'fork length','wet weight','male'};  
bibkey.LW_m = 'KocErdo2007';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 2 * weights.tL_f;
weights.tL_m = 2 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'temperatures are guessed';
D3 = 'shape of tL curves suggest that food is increasing in time, which has been implemented';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '6ZDRV'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '221014'; % Ency of Life
metaData.links.id_Wiki = 'Squalius_cii'; % Wikipedia
metaData.links.id_ADW = 'Squalius_cii'; % ADW
metaData.links.id_Taxo = '1682883'; % Taxonomicon
metaData.links.id_WoRMS = '1021373'; % WoRMS
metaData.links.id_fishbase = 'Squalius-cii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Squalius_cii}}';  
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
bibkey = 'EconDaou1991'; type = 'Article'; bib = [ ...  
'author = {A. N. Economou and Ch. Daoulan and T. Psarras}, ' ...
'year = {1991}, ' ...
'title = {Growth and morphological development of chub, \emph{Leuciscus cephalus} ({L}.), during the first year of life}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {39}, '...
'pages = {393-408}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KocErdo2007'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1439-0426.2006.00787.x}, ' ...
'author = {Ko\c{c}, H. T. and Erdogan, Z. and Tinkci, M. and Treer, T.}, ' ...
'year = {2007}, ' ...
'title = {Age, growth and reproductive characteristics of chub, \emph{Leuciscus cephalus} ({L}., 1758) in the {I}kizcetepeler dam lake ({B}alikesir), {T}urkey.}, ' ... 
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {23}, '...
'pages = {19-24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Squalius-cii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

