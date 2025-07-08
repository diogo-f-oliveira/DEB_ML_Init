function [data, auxData, metaData, txtData, weights] = mydata_Scorpis_lineolata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Kyphosidae';
metaData.species    = 'Scorpis_lineolata'; 
metaData.species_en = 'Silver sweep'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 01];

%% set data

% zero-variate data

data.am = 54*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'StewHugh2005';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'am is likely to be larger';

data.Lp = 17;    units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'StewHugh2005'; 
data.Li = 30;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  1.3 mm: pi/6*0.13^3';
data.Wwi = 336;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.01, see F1';
    
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'StewHugh2005';
  temp.GSI = C2K(18); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.202	8.108
0.426	5.962
0.710	9.956
0.781	10.731
0.785	9.061
0.786	8.465
0.926	11.565
0.930	9.359
1.865	16.930
2.661	20.267
2.664	18.896
2.958	18.180
3.538	20.564
3.613	19.669
3.681	22.054
4.184	25.988
4.409	23.126
4.413	21.397
4.417	19.667
4.625	24.974
5.063	25.032
5.067	23.184
5.132	26.881
5.138	24.138
5.798	23.004
5.945	22.765
6.017	23.361
6.313	21.631
6.456	23.002
6.670	25.327
6.818	24.671
6.896	22.465
7.327	25.863
8.129	26.994
8.506	21.090
8.644	25.264
8.801	19.838
10.028	27.169
10.250	25.916
10.614	26.631
11.564	26.629
11.862	24.065
11.931	25.853
11.933	25.019
11.934	24.363
12.737	25.136
12.814	23.109
12.957	24.361
12.961	22.751
13.024	27.402
13.755	27.281
13.833	25.253
13.835	23.942
13.909	23.763
13.983	23.405
14.559	27.160
14.639	23.821
14.710	25.252
14.853	26.504
15.583	27.098
15.587	25.011
15.731	25.965
16.167	27.336
16.393	24.115
17.341	25.187
19.310	26.852
19.681	24.288
20.038	28.222
20.265	24.704
20.402	29.116
21.137	27.087
21.720	27.623
22.153	30.663
22.378	27.741
22.962	27.859
23.107	28.634
23.252	29.051
24.788	28.451
26.180	26.898
26.249	28.926
26.982	27.910
27.127	28.268
28.077	28.385
29.613	27.667
30.270	28.142
31.070	30.108
31.147	28.021
32.023	28.735
33.263	29.746
34.219	26.823
34.729	27.537
34.871	29.564
35.245	25.509
36.336	28.190
36.851	26.341
36.992	28.606
37.064	29.083
37.136	29.739
40.058	30.389
42.033	29.490
42.036	28.358
47.075	30.017
48.757	29.298
52.043	30.842
54.678	28.452];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.9) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StewHugh2005';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
2.004	19.970
2.006	19.314
2.293	21.878
2.304	16.452
2.438	22.474
2.440	21.520
2.515	20.566
2.587	20.983
2.949	22.473
3.165	24.082
3.167	23.307
3.316	21.816
3.390	21.518
3.532	23.127
3.534	22.472
3.610	21.040
3.758	20.146
3.834	18.834
4.048	21.457
4.188	24.199
4.336	23.424
4.558	21.873
4.849	22.588
5.357	24.436
5.363	21.275
5.428	25.091
5.432	23.243
5.576	24.256
5.658	20.380
5.730	20.559
5.868	24.733
5.947	21.811
6.012	25.507
6.235	24.016
6.389	20.200
6.892	24.194
7.185	23.776
7.187	22.762
7.267	19.662
7.622	24.431
7.844	23.178
8.063	23.178
8.203	26.099
8.504	22.342
8.787	26.575
8.793	23.713
9.010	24.786
9.085	24.070
11.055	25.378
11.276	24.782
11.348	25.258
11.420	25.676
11.427	22.456
12.081	24.243
12.662	25.673
12.885	24.003
14.124	25.730
14.930	24.774
14.935	22.270
16.603	28.587
16.828	25.665
16.905	23.578
17.197	23.935
17.700	28.108
17.776	26.617
17.847	27.630
17.927	24.470
18.140	27.272
18.361	26.377
20.261	26.612
20.333	27.089
20.775	25.240
21.721	27.384
22.018	25.118
25.229	27.437
26.038	24.752
26.177	28.270
26.984	27.016
27.272	28.864
27.422	27.134
27.635	29.877
29.026	28.860
30.930	27.068
30.931	26.591
31.368	27.305
31.436	29.810
32.099	27.125
33.195	27.361
34.142	28.671
34.288	28.611
35.383	29.504
35.969	28.906
37.429	29.619
45.176	29.484
45.760	29.781
49.711	27.686];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.9) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','fork length','males'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StewHugh2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01202*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VX3G'; % Cat of Life
metaData.links.id_ITIS = '646031'; % ITIS
metaData.links.id_EoL = '46578646'; % Ency of Life
metaData.links.id_Wiki = 'Scorpis_lineolata'; % Wikipedia
metaData.links.id_ADW = 'Scorpis_lineolata'; % ADW
metaData.links.id_Taxo = '187230'; % Taxonomicon46581352
metaData.links.id_WoRMS = '282731'; % WoRMS
metaData.links.id_fishbase = 'Scorpis-lineolata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scorpis_lineolata}}';  
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
bibkey = 'StewHugh2005'; type = 'article'; bib = [ ...  
'doi = {10.1080/00288330.2005.9517355}, ' ...
'author = {John Stewarta and Julian M. Hughes}, ' ...
'year = {2005}, ' ...
'title = {Longevity, growth, reproduction and a description of the fishery for silver sweep \emph{Scorpis lineolatus} off {N}ew {S}outh {W}ales, {A}ustralia}, ' ... 
 'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {39(4)}, '...
'pages = {827-838}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scorpis-lineolata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
