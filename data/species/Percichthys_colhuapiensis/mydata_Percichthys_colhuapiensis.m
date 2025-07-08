  function [data, auxData, metaData, txtData, weights] = mydata_Percichthys_colhuapiensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Percichthys_colhuapiensis'; 
metaData.species_en = 'Largemouth perch '; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 12];

%% set data
% zero-variate data
data.tp = 4.4*365;      units.tp = 'd';  label.tp = 'age at puberty for females';  bibkey.tp = 'CazoSido2008';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 7*365;      units.tpm = 'd';  label.tpm = 'age at puberty for males';  bibkey.tpm = 'CazoSido2008';
  temp.tpm = C2K(20); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 11*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'CazoSido2008';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 24.3;    units.Lp = 'cm'; label.Lp = 'std length at puberty for females'; bibkey.Lp = 'CazoSido2008';
data.Lpm = 27.1;    units.Lpm = 'cm'; label.Lpm = 'std length at puberty for males'; bibkey.Lpm = 'CazoSido2008';
data.Li = 59.1;    units.Li = 'cm'; label.Li = 'ultimate std length for females';            bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: 4/3*pi*0.04^3';
data.Wwi = 1.6e3;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';               bibkey.Wwi = 'CazoSido2008';
 
data.Ri = 1.5e5/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'GuerBisb1992';
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length-weight
data.tL = [ ... % time since birth (yr), total length (cm)
    0 10.98
    1 14.36
    2 20.21
    3 27.19
    4 32.85
    5 36.71
    6 37.16
    7 37.30
    8 36.26
    9 47.50
   10 42.50
   11 40.15];
data.tL (:,1) = (0.9 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CazoSido2008';

% length-weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
13.147	39.417
14.326	60.302
14.506	27.229
14.779	60.377
15.051	68.698
15.141	39.748
15.278	72.874
15.413	35.655
15.596	77.064
15.686	60.527
15.777	64.680
15.912	39.875
16.140	81.292
16.184	35.782
16.502	81.352
16.637	35.857
17.046	56.615
17.136	56.630
17.182	77.327
17.454	56.682
17.544	60.835
17.681	89.823
17.998	65.048
17.999	106.428
18.497	73.406
18.497	106.510
18.951	98.309
19.041	102.462
19.313	106.645
19.449	69.426
19.677	152.223
19.721	98.437
20.311	110.948
20.402	123.377
20.402	144.067
20.855	135.866
20.991	106.923
21.263	106.968
21.581	127.710
21.763	173.257
22.171	156.773
22.537	293.386
22.625	206.504
22.714	136.173
22.986	136.218
22.987	156.908
23.215	214.877
23.531	177.688
23.575	140.454
23.939	190.169
24.075	165.364
24.167	223.310
24.666	260.635
24.710	182.021
24.983	239.997
25.254	194.525
25.528	264.915
25.663	231.834
25.751	128.400
25.892	318.768
26.070	198.798
26.072	273.281
26.435	281.617
26.751	219.600
27.024	273.439
27.293	161.759
27.297	335.553
27.385	203.154
27.431	232.127
27.659	273.544
27.796	327.359
28.023	356.363
28.071	434.991
28.203	302.599
28.338	257.104
28.612	344.046
28.659	397.847
28.838	319.256
28.928	269.616
29.021	381.355
29.293	360.711
29.337	315.201
29.565	381.445
29.700	344.226
30.018	381.520
30.107	307.052
30.202	456.033
30.291	389.841
30.607	336.101
31.062	418.934
31.064	489.280
31.242	381.723
31.377	336.228
31.516	460.389
31.969	435.636
32.152	489.460
32.153	530.839
32.290	576.379
32.329	344.662
32.382	617.774
32.422	431.574
32.610	675.742
32.831	456.469
33.057	444.092
33.286	526.889
33.424	593.119
33.470	651.057
33.603	502.114
33.878	630.435
34.103	564.266
34.374	535.345
34.514	684.333
34.558	630.548
35.053	502.354
35.055	580.975
35.103	688.569
35.418	597.587
35.512	725.878
35.874	696.972
36.056	738.382
36.284	792.213
36.552	622.602
36.599	676.403
36.784	821.261
36.916	676.455
37.096	622.692
37.185	568.914
37.238	866.853
37.459	643.442
37.461	709.649
37.596	676.568
37.602	904.155
37.644	788.300
37.739	945.557
37.824	713.847
37.867	635.233
38.054	838.023
38.324	759.447
38.956	668.517
39.461	925.152
39.687	892.086
39.692	1111.397
39.821	830.039
40.097	974.913
40.182	747.341
40.183	805.272
40.550	958.436
40.592	834.305
40.955	863.331
41.003	950.235
41.276	1004.073
41.410	900.647
41.592	962.746
41.775	1020.708
41.777	1099.329
41.818	933.818
41.910	983.489
42.220	669.057
42.368	1157.358
42.505	1182.208
42.639	1099.471
43.276	1223.715
44.178	1033.519
44.222	963.182
45.679	1244.802
46.954	1476.737
47.403	1278.191
47.501	1592.690];
units.LWw_f = {'cm', 'g'}; label.LWw_f  = {'std length', 'wet weight', 'females'};  
bibkey.LWw_f = 'CazoSido2008';
comment.LWw_f = 'data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
16.036	71.163
17.477	96.279
18.423	104.651
18.423	83.721
18.829	75.349
19.009	92.093
19.144	129.767
19.595	104.651
20.045	146.512
20.450	100.465
20.721	129.767
20.811	180.000
20.946	104.651
21.126	146.512
21.351	150.698
21.667	154.884
21.937	192.558
22.072	117.209
22.432	154.884
22.477	196.744
23.198	184.186
23.559	221.860
24.144	188.372
24.459	213.488
24.505	159.070
24.730	251.163
24.910	184.186
25.045	238.605
25.270	213.488
25.495	276.279
25.811	255.349
25.991	272.093
26.036	196.744
26.306	234.419
26.486	272.093
26.892	309.767
26.982	255.349
27.252	305.581
27.568	284.651
28.063	226.046
28.108	318.139
28.153	276.279
28.333	255.349
28.514	301.395
28.964	376.744
29.099	355.814
29.459	318.139
29.640	397.674
29.775	351.628
30.360	397.674
30.405	339.070
30.676	347.442
30.766	426.977
30.946	372.558
31.126	523.256
31.171	422.791
31.802	410.232
32.207	431.163
32.297	602.791
32.297	406.046
32.477	552.558
32.613	527.442
32.838	477.209
32.883	615.349
32.928	426.977
33.649	506.512
33.829	602.791
34.054	523.256
34.369	535.814
34.640	615.349
34.730	736.744
34.775	686.512
34.775	556.744
35.090	648.837
35.405	615.349
35.541	673.953
35.631	569.302
35.631	648.837
35.811	711.628
36.036	540.000
36.036	606.977
36.126	686.512
36.351	665.581
36.396	732.558
36.441	598.605
36.712	644.651
36.757	866.512
36.982	694.884
37.252	766.046
37.613	648.837
37.658	745.116
37.703	1054.884
37.793	958.605
38.468	858.140
38.649	745.116
39.009	774.419
39.099	887.442
39.820	644.651
40.270	883.256
42.297	824.651
42.477	895.814
42.523	1013.023
43.018	753.488
44.144	1100.930
45.270	1264.186
45.676	1297.674
46.351	1381.395];
units.LWw_m = {'cm', 'g'}; label.LWw_m  = {'std length', 'wet weight', 'males'};  
bibkey.LWw_m = 'CazoSido2008';
comment.LWw_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.tp = 0 * weights.tp;
weights.tpm = 0 * weights.tpm;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp';
D2 = 'Data tp and tpm ignored to to inconsistency wqith tL and Lp; Wwi is inconsistent with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Endemic to Patagonia';
metaData.bibkey.F1 = 'CazoSido2008'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6V44F'; % Cat of Life
metaData.links.id_ITIS = '641905'; % ITIS
metaData.links.id_EoL = '994133'; % Ency of Life
metaData.links.id_Wiki = 'Percichthys'; % Wikipedia
metaData.links.id_ADW = 'Percichthys_colhuapiensis'; % ADW
metaData.links.id_Taxo = '183457'; % Taxonomicon
metaData.links.id_WoRMS = '1014029'; % WoRMS
metaData.links.id_fishbase = 'Percichthys-colhuapiensis'; % fishbase

%% References
bibkey = 'CazoSido2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12439}, ' ...
'author = {Andrea Lopez Cazorla and Nora Sidorkewicj}, ' ...
'year = {2008}, ' ...
'title = {Age and growth of the largemouth perch \emph{Percichthys colhuapiensis} in the {N}egro river, {A}rgentine {P}atagonia}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {92}, '...
'pages = {169–179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GuerBisb1992'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12439}, ' ...
'author = {Guerrero, C.A. and Bisbal, G.}, ' ...
'year = {1992}, ' ...
'title = {Fecundidad de \emph{Percichthys colhuapiensis} ({P}erciformes, {P}ercichthyidae) del embalse {E}zequiel {R}amos {M}exia, provincias de {N}euquen y {R}io {N}egro, {A}rgentina}, ' ... 
'journal = {Physis. Seccion B. Las Aguas Continentales y sus Organismos}, ' ...
'volume = {47(113)}, '...
'pages = {33-37}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Percichthys-colhuapiensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
