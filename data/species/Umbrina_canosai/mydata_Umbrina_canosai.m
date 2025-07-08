function [data, auxData, metaData, txtData, weights] = mydata_Umbrina_canosai

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Umbrina_canosai'; 
metaData.species_en = 'Argentine croaker'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.8 ); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L_Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 19];

%% set data
% zero-variate data


data.am = 26*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(14.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15.9;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 53.3;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 44.7;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00891*Lp^3.08, see F1';
data.Wwi = 18544;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.08, see F1';

data.GSI = 0.045; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'HaimAbsa2006';
  temp.GSI = C2K(14.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), total length (cm)
 2	21.473
 3	28.036
 4	31.518
 5	33.929
 6	35.759
 7	36.161
 8	37.455
 9	38.170
10	38.705
11	39.107
12	38.214
13	37.991
14	39.196
15	40.089];
data.tL(:,1) = (1.8 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(14.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HaimAbsa2006'; 

% length-weight
data.LW = [ ... % total length (cm), weights (g)
11.478	23.041
12.298	26.553
12.676	28.308
13.497	37.045
13.750	47.504
14.695	42.312
14.949	52.770
15.581	66.726
16.525	54.567
16.778	63.284
16.970	84.191
17.537	80.727
17.663	84.215
18.359	108.622
18.547	91.212
18.800	101.671
18.924	84.259
19.559	124.339
19.935	101.710
20.315	117.398
20.570	143.532
20.693	117.412
20.758	133.089
21.703	131.380
21.768	145.316
21.770	167.957
22.212	173.198
22.400	155.788
22.465	181.915
22.719	194.115
23.095	171.487
23.472	159.308
23.538	185.435
23.604	213.304
23.853	190.671
24.044	206.353
24.235	223.776
24.550	218.562
24.611	201.148
24.616	248.172
24.993	234.252
25.120	244.707
25.180	216.842
25.251	291.736
25.626	258.657
25.880	279.566
26.191	239.519
26.442	222.111
26.450	297.003
26.451	307.453
26.573	274.365
27.010	232.581
27.021	331.856
27.078	276.125
27.082	316.183
27.206	297.029
27.328	253.492
27.589	338.842
27.708	270.922
27.773	286.599
27.903	324.920
28.031	349.307
28.153	307.512
28.286	366.733
28.539	375.450
28.591	270.952
28.597	328.427
28.662	345.846
28.978	358.049
29.168	359.797
29.223	286.649
29.296	382.443
29.300	422.501
29.425	413.797
29.610	370.262
29.675	392.906
29.796	340.661
29.797	347.627
30.054	392.919
30.245	413.826
30.313	464.336
30.367	377.255
30.436	429.507
30.685	396.424
30.756	476.543
30.813	422.554
30.879	445.198
30.995	347.669
30.997	365.086
31.134	469.590
31.320	446.955
31.441	396.451
31.570	420.838
31.703	488.768
31.705	502.701
31.708	530.567
31.826	457.422
31.891	474.841
32.010	410.404
32.024	542.770
32.456	452.219
32.516	422.613
32.649	490.542
32.848	579.373
32.903	504.484
33.026	478.364
33.104	617.699
33.212	450.504
33.215	474.887
33.350	563.716
33.420	628.160
33.473	527.146
33.723	507.996
33.732	593.338
33.793	575.923
33.979	542.838
34.099	492.334
34.102	514.976
34.108	568.967
34.118	668.242
34.305	652.574
34.427	609.037
34.549	568.983
34.625	694.385
34.743	617.756
34.873	656.077
35.057	602.092
35.124	643.894
35.128	683.952
35.304	553.334
35.316	670.026
35.437	623.005
35.639	744.928
35.756	657.849
35.761	706.616
35.884	670.045
35.997	549.875
36.075	689.210
36.195	631.740
36.205	731.014
36.446	619.557
36.462	776.306
36.503	565.568
36.529	811.142
36.580	694.453
36.581	710.128
36.764	645.693
37.086	710.145
37.145	670.089
37.147	696.214
37.281	767.627
37.409	785.048
37.421	901.739
37.797	882.594
37.842	706.688
37.975	776.359
38.671	793.800
38.675	828.633
38.854	734.590
40.715	1042.928];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'HaimAbsa2006'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5* weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: Ww in g  = 0.00891*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; demersal. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7DGKM'; % Cat of Life
metaData.links.id_ITIS = '169299'; % ITIS
metaData.links.id_EoL = '46578949'; % Ency of Life
metaData.links.id_Wiki = 'Umbrina'; % Wikipedia
metaData.links.id_ADW = 'Umbrina_canosai'; % ADW
metaData.links.id_Taxo = '189714'; % Taxonomicon
metaData.links.id_WoRMS = '273796'; % WoRMS
metaData.links.id_fishbase = 'Umbrina-canosai'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Umbrina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publUmbrina_canosaiisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaimAbsa2006'; type = 'Article'; bib = [ ... 
'author = {Manuel Haimovici and Luciano Absalonsen and Gonzalo Velasco and Laura W. Miranda}, ' ... 
'year = {2006}, ' ...
'title = {Diagn\''{o}stico do estoque e orienta\c_c}\~{o}es para o ordenamento da pesca de \emph{Umbrina canosai} ({B}erg, 1895)}, ' ...
'journal = {SERIE REVIZEE – SCORE SUL}, ' ...
'howpublished = {\url{https://demersais.furg.br/images/producao/2006_haimovici_umbrina_canosai_diagnostico_revizee.pdf}}, ' ...
'pages = {77-85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Umbrina-canosai.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

