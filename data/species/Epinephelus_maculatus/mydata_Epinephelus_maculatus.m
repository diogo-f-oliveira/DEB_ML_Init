  function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_maculatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_maculatus'; 
metaData.species_en = 'Highfin grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
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
data.ab = 5.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 35;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 60.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.3e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.76 mm: pi/6*0.076^3';
data.Wwp = 487;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01096*Lp^3.01, see F1';
data.Wwi = 2529;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.01, see F1';

data.Ri  = 2e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Epinephelus_fuscoguttatus: 3287515*1100/17000';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.038	26.627
1.050	33.515
1.267	31.662
1.485	30.736
1.926	31.930
1.942	40.407
2.029	28.090
2.138	27.296
2.140	28.488
2.143	29.945
2.147	32.329
2.149	33.653
2.152	35.243
2.253	30.475
2.268	38.687
3.017	27.565
3.023	30.479
3.136	32.599
3.146	37.764
3.148	39.089
3.238	28.229
3.247	32.732
3.252	35.911
3.253	36.308
3.254	36.705
3.262	41.209
3.269	44.785
3.359	34.322
3.361	35.117
3.361	35.381
3.468	33.793
3.802	35.781
4.021	35.517
4.028	39.359
4.123	31.544
4.134	37.107
4.135	37.770
4.137	38.697
4.146	43.598
4.249	39.889
4.250	40.817
4.360	40.552
5.573	42.810
7.332	43.614]; 
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaplCurr2009'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
3.860	5.770
4.482	8.797
5.602	2.500
7.096	8.528
8.964	17.607
16.313	69.388
17.434	75.454
18.805	90.765
21.548	139.931
25.911	204.382
25.912	216.744
25.913	232.196
26.909	235.184
27.409	259.856
27.661	287.645
28.037	324.693
28.284	303.033
28.407	281.387
29.034	336.952
29.409	349.275
29.532	333.810
29.533	349.262
29.784	367.780
30.166	466.637
30.532	376.974
30.533	389.336
30.653	346.057
31.159	432.539
31.528	383.053
31.783	447.927
32.035	478.806
32.406	454.044
32.653	432.385
32.655	460.199
32.787	546.720
33.526	447.747
33.534	537.371
33.538	593.000
33.654	487.911
33.656	518.816
34.034	568.225
34.158	565.122
34.276	484.756
34.405	534.191
34.539	642.345
34.898	487.783
34.909	611.402
35.032	586.665
35.527	561.890
35.532	608.247
35.534	639.152
35.666	722.582
36.035	670.005
36.036	685.458
36.038	707.091
36.281	639.075
36.536	707.040
36.659	688.484
37.035	713.170
37.173	870.771
37.284	719.325
37.293	815.130
37.652	657.477
37.793	845.983
38.160	774.864
38.280	716.132
38.402	691.395
38.407	747.024
38.550	950.983
38.660	796.446
38.782	762.438
38.787	818.066
39.041	876.760
39.286	836.558
39.527	746.908
39.664	889.058
40.291	935.351
41.057	1154.698
42.914	1030.886
43.414	1058.649]; 
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
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G5QJ'; % Cat of Life
metaData.links.id_ITIS = '167720'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_maculatus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_maculatus'; % ADW
metaData.links.id_Taxo = '105891'; % Taxonomicon
metaData.links.id_WoRMS = '273860'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-maculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Epinephelus_maculatus}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Epinephelus-maculatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

