  function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_quoyanus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_quoyanus'; 
metaData.species_en = 'Camouflage grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 27];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 40;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.3e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.76 mm: pi/6*0.076^3';
data.Wwp = 91;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01349*Lp^3.05, see F1';
data.Wwi = 1038;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^3.05, see F1';

data.Ri  = 2e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Epinephelus_fuscoguttatus: 3287515*1000/17000';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.662	19.203
0.883	21.057
1.876	27.279
2.649	31.251
2.649	30.191
2.759	33.634
2.759	31.780
2.759	26.747
2.870	33.237
2.870	27.277
2.870	26.349
2.870	25.687
3.091	28.203
3.091	24.627
3.091	22.905
3.422	30.719
3.532	32.970
3.642	32.175
3.642	28.996
3.753	28.334
3.863	34.029
3.863	31.247
4.084	32.571
4.194	30.055
4.194	31.247
4.305	29.392
4.525	32.968
4.525	30.716
4.636	27.404
4.746	31.775
4.857	36.543
4.857	34.159
4.857	30.185
4.857	28.728
5.077	33.496
5.077	30.847
5.188	27.006
5.298	32.038
5.408	32.568
5.408	31.243
5.740	35.481
5.740	31.905
5.740	34.024
5.740	31.110
5.850	26.739
5.850	29.520
5.960	35.083
5.960	33.229
6.071	39.056
6.181	28.460
6.181	30.447
6.291	34.022
6.291	32.698
6.623	33.359
6.733	30.313
6.733	31.372
6.843	32.167
6.954	34.683
6.954	29.253
6.954	30.974
7.064	33.623
7.174	26.735
7.174	27.530
7.285	32.430
7.285	28.457
7.726	34.416
7.726	29.515
7.947	33.223
7.947	32.958
7.947	31.237
8.057	34.680
8.168	35.607
8.278	30.441
8.389	31.765
8.830	30.042
8.940	28.320
8.940	31.366
8.940	32.956
8.940	33.618
8.940	34.545
8.940	36.135
9.934	32.291
9.934	32.953
9.934	33.880
9.934	27.390
9.934	26.596
10.927	36.924
10.927	31.759
14.018	34.399]; 
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaplCurr2009'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
14.345	53.965
17.588	109.471
18.586	106.388
19.085	98.678
19.459	117.181
21.206	137.225
21.206	148.018
21.206	148.018
21.206	160.352
22.204	191.189
22.328	157.269
22.578	163.436
22.703	198.899
24.075	201.982
24.449	215.859
24.823	234.361
25.073	223.568
25.447	215.859
25.447	259.031
25.696	237.445
25.696	245.154
26.071	275.991
26.195	255.947
26.195	283.700
26.195	312.996
26.320	262.115
26.320	296.035
27.069	285.242
27.193	274.449
27.193	297.577
27.443	303.744
27.942	360.793
28.067	272.908
28.067	311.454
28.067	328.414
28.191	317.621
28.316	329.956
28.441	322.247
28.441	340.749
28.441	385.463
28.565	334.582
28.690	356.167
28.940	340.749
28.940	399.339
29.314	297.577
29.314	403.965
29.688	353.084
29.813	462.555
29.813	457.930
30.062	371.586
30.062	400.881
30.062	428.634
30.187	303.744
30.312	390.088
30.437	322.247
30.437	422.467
30.561	434.802
30.561	476.432
30.686	400.881
30.686	414.758
30.936	447.137
31.060	408.590
31.185	380.837
31.185	473.348
31.310	459.471
31.809	450.220
31.933	468.722
31.933	504.185
32.058	467.181
32.183	417.841
32.183	559.692
32.308	477.974
32.308	541.189
32.557	448.678
32.557	439.427
32.682	477.974
33.056	536.564
33.181	504.185
33.181	542.731
33.306	524.229
33.430	470.264
33.555	570.485
33.680	556.608
33.680	561.233
33.805	498.018
33.805	524.229
34.054	547.357
34.054	519.604
34.553	621.366
35.676	582.819
36.674	635.242
37.672	576.652
37.672	575.110
41.081	539.648]; 
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'MaplCurr2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = weights.ab * 0;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G63J'; % Cat of Life
metaData.links.id_ITIS = '551089'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_quoyanus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_quoyanus'; % ADW
metaData.links.id_Taxo = '105901'; % Taxonomicon
metaData.links.id_WoRMS = '218252'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-quoyanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Epinephelus_quoyanus}}';  
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
bibkey = 'MaplCurr2009'; type = 'techreport'; bib = [ ... 
'howpublished = {https://rrrc.org.au/wp-content/uploads/2014/06/483-JCU-Mapleston-A-et-al-2009-Comparative-biology-of-GBR-serranid-species.pdf}, ' ...
'author = {Mapleston, A. and Currey, L.M.and Williams, A.J. and Pears, R. and Simpfendorfer, C.A. and Penny, A.L. and Tobin, A. and Welch, D}, ' ... 
'year = {2009}, ' ...
'title = {Comparative biology of key inter-reefal serranid species on the Great Barrier Reef.}, ' ...
'institution = {Reef and Rainforest Research Centre Limited, Cairns}, ' ...
'volume = {Project Milestone Report to the Marine and Tropical Sciences Research Facility}, ' ...
'pages = {55pp.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Epinephelus-quoyanus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

