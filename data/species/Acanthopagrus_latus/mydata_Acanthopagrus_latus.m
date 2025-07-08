function [data, auxData, metaData, txtData, weights] = mydata_Acanthopagrus_latus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Acanthopagrus_latus'; 
metaData.species_en = 'Yellowfin seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 14];

%% set data
% zero-variate data

data.am = 9*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 29.7;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'WangLau2020';
data.Lpm  = 21;   units.Lpm  = 'cm';  label.Lpm  = 'fork length at puberty for males'; bibkey.Lpm  = 'WangLau2020';
data.Li  = 40;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';
data.Lim  = 32;   units.Lim  = 'cm';  label.Lim  = 'ultimate fork length for males';   bibkey.Lim  = 'WangLau2020';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp  = 371; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.01622*Lp^2.96, see F1';
data.Wwi = 896; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01622*Li^2.96, see F1';


% univariate data
% time-length
data.tL = [ ... % years class (d), standard length (cm)
227.057	7.131
256.761	9.248
288.501	10.765
319.426	11.982
365+15.870	15.016
365+105.390	18.965
365+166.427	20.898
365+196.945	21.715
365+227.057	21.931
365+256.761	23.948
365+288.501	25.065
730+15.056	24.915
730+45.574	26.032
730+287.687	28.965
1095+45.574	29.732
1095+288.501	31.365];    
data.tL(:,1) = data.tL(:,1) - 140; % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL   = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MustAhme2020';

% length-fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
23.595	1603906.461
26.675	1407310.660
27.731	1890260.522
27.734	1251964.843
28.696	1266769.724
29.400	1579280.295
30.291	2884819.185
30.456	1920386.608
30.968	2147667.051
31.476	3126718.128
31.547	1878536.716
31.831	2743968.102
32.372	3581196.015
32.950	3354618.570
33.914	3099920.649
33.984	2007767.082
34.339	1525726.689
36.827	3981231.796
42.172	6069784.041];
units.LN  = {'cm', '#'};  label.LN = {'fork length','fecundity'};  
temp.LN   = C2K(27.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'WangLau2020';

% length-weight
data.LW_f = [ ... % fork length (cm), weight (g)
14.395	65.806
14.491	104.516
14.922	73.548
15.641	89.032
16.120	92.903
16.551	81.290
16.886	170.323
16.982	112.258
17.269	108.387
17.365	154.839
17.988	147.097
18.371	150.968
18.946	147.097
18.994	174.194
18.994	201.290
19.234	112.258
19.425	232.258
19.473	181.935
19.521	131.613
19.760	209.032
19.904	154.839
20.000	236.129
20.192	150.968
20.335	267.097
20.335	189.677
20.623	224.516
20.671	166.452
20.719	298.065
21.054	216.774
21.102	298.065
21.150	255.484
21.293	181.935
21.341	154.839
21.341	247.742
21.437	220.645
21.581	290.323
21.629	348.387
21.820	193.548
21.964	263.226
22.156	313.548
22.251	232.258
22.347	243.871
22.491	278.710
22.491	185.806
22.587	348.387
22.731	298.065
22.874	197.419
22.922	247.742
23.114	290.323
23.162	402.581
23.257	228.387
23.401	483.871
23.449	352.258
23.593	445.161
23.689	290.323
23.784	274.839
23.832	232.258
24.263	360.000
24.263	514.839
24.311	456.774
24.359	305.806
24.359	270.968
24.743	336.774
24.790	383.226
24.982	212.903
25.078	309.677
25.174	240.000
25.222	387.097
25.509	305.806
25.509	259.355
25.557	360.000
25.749	232.258
25.796	329.032
25.892	445.161
25.892	402.581
26.084	270.968
26.132	348.387
26.180	298.065
26.228	332.903
26.371	522.581
26.371	410.323
26.563	375.484
26.659	243.871
26.707	472.258
26.754	344.516
26.802	309.677
26.850	143.226
26.898	491.613
26.994	286.452
27.138	363.871
27.186	406.452
27.234	449.032
27.281	499.355
27.281	270.968
27.329	538.065
27.329	398.710
27.617	336.774
27.665	464.516
27.760	534.194
27.760	305.806
28.000	491.613
28.000	352.258
28.144	619.355
28.192	596.129
28.240	325.161
28.383	499.355
28.383	534.194
28.383	371.613
28.431	410.323
28.479	480.000
28.527	379.355
28.623	561.290
28.766	433.548
28.766	332.903
28.910	781.935
28.910	526.452
28.958	360.000
29.246	487.742
29.389	638.710
29.437	360.000
29.581	600.000
29.629	584.516
29.629	437.419
29.772	468.387
29.916	615.484
29.964	476.129
30.012	673.548
30.108	592.258
30.204	534.194
30.204	437.419
30.299	774.194
30.347	545.806
30.587	572.903
30.731	514.839
30.874	541.935
31.018	658.065
31.066	708.387
31.162	483.871
31.210	452.903
31.305	569.032
31.497	414.194
31.545	619.355
31.545	449.032
31.737	665.806
31.784	1281.290
32.024	677.419
32.072	739.355
32.407	1184.516
32.886	487.742
33.078	685.161
33.461	905.806
33.653	793.548
33.940	607.742
33.988	700.645
34.323	650.323
34.515	758.710
35.569	758.710
35.856	998.710
36.192	1172.903
36.814	1114.839
37.102	909.677
37.820	1010.323
38.204	1246.452
38.922	1056.774
39.401	1223.226
42.371	1652.903];
units.LW_f  = {'cm', '#g'};  label.LW_f = {'fork length','weight','female'};  
temp.LW_f   = C2K(27.4);  units.temp.LW_f = 'K'; label.temp.LW_f = 'temperature';
bibkey.LW_f = 'WangLau2020';
%
data.LW_m = [ ... % fork length (cm), weight (g)
12.148	43.103
15.505	79.741
16.272	96.983
16.564	103.448
16.892	90.517
16.966	116.379
17.223	159.483
17.331	114.224
17.441	137.931
17.661	159.483
18.061	137.931
18.063	170.259
18.316	120.690
18.464	174.569
18.645	131.466
18.865	159.483
19.339	142.241
19.377	185.345
19.558	168.103
19.634	234.914
19.997	191.810
20.069	170.259
20.180	200.431
20.181	232.759
20.435	185.345
20.691	202.586
20.692	228.448
20.981	174.569
21.058	267.241
21.239	228.448
21.456	191.810
21.676	215.517
21.713	230.603
21.787	245.690
21.972	321.121
22.005	228.448
22.040	185.345
22.041	206.897
22.185	165.948
22.295	172.414
22.405	202.586
22.482	290.948
22.517	254.310
22.992	290.948
23.030	327.586
23.064	262.931
23.357	275.862
23.357	290.948
23.428	243.534
23.464	226.293
23.577	308.190
23.578	334.052
23.792	211.207
23.979	321.121
24.050	269.397
24.055	422.414
24.087	286.638
24.124	301.724
24.126	364.224
24.199	351.293
24.564	362.069
24.855	351.293
24.998	254.310
25.255	312.500
25.256	344.828
25.258	377.155
25.329	329.741
25.512	364.224
25.548	327.586
25.659	390.086
26.244	403.017
26.499	415.948
27.925	482.759
28.252	461.207
28.775	784.483
29.166	517.241
29.242	579.741
29.280	635.776
29.384	474.138
31.985	778.017];
units.LW_m  = {'cm', '#g'};  label.LW_m = {'fork length','weight','male'};  
temp.LW_m   = C2K(27.4);  units.temp.LW_m = 'K'; label.temp.LW_m = 'temperature';
bibkey.LW_m = 'WangLau2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;
weights.Wwb = 3 * weights.Wwb;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.01622*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Protandrous hermaphrodite';
metaData.bibkey.F2 = 'WangLau2020'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '8YVH'; % Cat of Life
metaData.links.id_ITIS = '647910'; % ITIS
metaData.links.id_EoL = '46580060'; % Ency of Life
metaData.links.id_Wiki = 'Acanthopagrus_latus'; % Wikipedia
metaData.links.id_ADW = 'Acanthopagrus_latus'; % ADW
metaData.links.id_Taxo = '159913'; % Taxonomicon
metaData.links.id_WoRMS = '218587'; % WoRMS
metaData.links.id_fishbase = 'Acanthopagrus-latus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthopagrus_latus}}';
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
bibkey = 'MustAhme2020'; type = 'Article'; bib = [ ... 
'doi = {10.9734/bpi/crtbs/v1}, ' ...
'author = {Md. Golam Mustafa and Imran Ahmed and Mohammod Ilyas},'...
'title = {Population Dynamics of Five Important Commercial Fish Species in the {S}undarbans Ecosystem of {B}angladesh: Recent Advancement},'...
'journal = {Current Research Trends in Biological Science}, '...
'volume = {1}, '...
'year = {2020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WangLau2020'; type = 'Article'; bib = [ ... 
'doi = {10.1111/are.14839}, ' ...
'author = {Shyh-Bin Wang and Ka-Yiu Lau and Kwang-Min Liu and Shoou-Jeng Joung and Chun-Hung Liu},'...
'title = {Reproductive characteristics of the hermaphroditic yellowfin seabream \emph{Acanthopagrus latus} in the waters off western {T}aiwan},'...
'journal = {Current Research Trends in Biological Science}, '...
'volume = {1}, '...
'year = {2020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acanthopagrus-latus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
