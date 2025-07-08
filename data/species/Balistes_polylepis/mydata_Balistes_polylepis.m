function [data, auxData, metaData, txtData, weights] = mydata_Balistes_polylepis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Balistidae';
metaData.species    = 'Balistes_polylepis'; 
metaData.species_en = 'Finescale triggerfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 27];

%% set data
% zero-variate data

data.am = 7 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'BarrCast2007';   
  temp.am = C2K(25.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 76;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.95e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MacK2008';
  comment.Wwb = 'based on egg diameter of 0.62 mm of Balistes_capriscus: pi/6*0.062^3';
data.Wwi = 6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02630*Li^2.85, see F1; max published weight 6.2 kg';

data.Ri  = 1.99e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.966	15.932
0.983	22.815
0.983	19.616
1.001	24.560
1.010	23.591
1.011	16.515
1.020	21.847
1.029	20.781
1.037	25.918
1.968	27.600
1.977	30.508
1.977	28.473
1.986	29.346
1.987	26.922
1.987	26.050
1.987	24.111
1.987	23.724
1.987	23.045
1.988	21.979
1.996	25.178
2.004	32.836
2.004	31.673
2.973	30.060
2.990	38.203
2.990	37.233
2.990	36.070
2.990	34.229
2.999	34.907
3.000	32.581
3.000	31.612
3.001	25.214
3.001	24.439
3.010	27.541
3.018	30.934
3.018	29.189
3.037	26.767
3.976	35.331
3.995	36.107
4.003	40.275
4.003	38.530
4.004	36.979
4.004	34.362
4.004	33.199
4.004	31.648
4.004	30.970
4.005	28.837
4.005	27.868
4.013	32.618
4.014	29.710
4.021	39.113
4.030	42.021
4.961	44.672
4.980	42.831
4.981	35.173
4.988	45.739
4.989	43.413
4.990	37.597
4.990	36.725
4.998	40.311
4.999	38.179
5.007	42.347
5.009	32.751
5.018	34.108
5.018	31.879
5.044	41.573
5.984	41.995
5.994	40.638
5.994	37.730
6.002	45.679
6.011	47.230
6.012	39.379
6.013	37.052
6.979	50.658];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(25.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BarrCast2007';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
15.910	104.685
15.969	73.667
16.767	131.825
17.053	155.089
18.486	100.808
18.881	213.247
19.229	112.439
19.799	158.966
20.081	255.897
20.315	131.825
20.995	283.037
21.170	221.002
21.685	205.493
22.144	193.861
22.320	104.685
22.540	283.037
22.768	310.178
22.775	158.966
23.116	205.493
23.224	333.441
23.285	259.774
23.627	290.792
23.682	325.687
23.804	186.107
23.861	182.229
23.966	383.845
23.970	302.423
24.088	221.002
24.372	255.897
24.425	352.827
24.426	333.441
24.996	387.722
25.169	352.827
25.290	213.247
25.399	333.441
25.515	302.423
25.632	232.633
25.853	403.231
25.972	310.178
26.034	213.247
26.136	473.021
26.195	438.126
26.372	329.564
26.706	523.425
26.720	232.633
26.768	414.863
26.882	438.126
26.885	364.459
27.174	298.546
27.222	492.407
27.341	407.108
27.399	379.968
27.402	321.809
27.859	352.827
27.917	317.932
27.976	298.546
28.253	476.898
28.371	407.108
28.488	348.950
28.714	410.985
28.824	511.793
28.945	360.582
28.999	438.126
29.054	480.775
29.105	604.847
29.113	442.003
29.394	558.320
29.401	399.354
29.502	682.391
29.682	511.793
29.799	453.635
29.970	484.653
30.030	418.740
30.307	604.847
30.481	550.565
30.485	473.021
30.828	492.407
30.939	550.565
31.054	535.056
31.166	597.092
31.227	519.548
31.229	465.266
31.573	453.635
31.626	558.320
31.969	550.565
32.085	527.302
32.196	604.847
32.419	725.040
32.772	519.548
32.997	600.969
32.998	577.706
33.164	690.145
33.168	612.601
33.515	527.302
33.796	639.741
33.840	918.901
33.850	701.777
34.018	787.076
34.251	694.023
34.369	624.233
34.428	593.215
34.483	639.741
35.106	767.690
35.110	686.268
35.112	647.496
35.461	535.056
35.903	852.989
36.027	663.005
36.082	701.777
36.134	806.462
36.248	833.603
36.417	887.884
36.476	837.480
36.479	787.076
36.484	686.268
36.539	728.918
36.594	775.444
36.762	852.989
36.824	752.181
36.869	996.446
36.872	946.042
36.874	907.270
37.048	849.111
37.050	806.462
37.334	845.234
37.394	787.076
37.555	1011.955
37.619	880.129
37.787	961.551
38.009	1105.008
38.025	759.935
38.080	802.585
38.248	895.638
38.299	1008.078
38.531	946.042
38.650	852.989
39.093	1159.289
39.326	1089.499
39.560	965.428
39.606	1209.693
39.671	1039.095
39.894	1159.289
39.906	907.270
40.925	1159.289
40.986	1077.868
41.207	1232.956
41.449	961.551
42.064	1256.220
42.067	1201.939
42.572	1407.431
42.859	1384.168
42.920	1310.501
43.496	1244.588
43.840	1217.448
44.401	1453.958
44.809	1310.501
45.028	1508.239
45.428	1523.748
48.909	1717.609
49.945	1601.292
50.454	1725.363];
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'BarrCast2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02630*(TL in cm)^2.85';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68D5R'; % Cat of Life
metaData.links.id_ITIS = '173140'; % ITIS
metaData.links.id_EoL = '46570659'; % Ency of Life
metaData.links.id_Wiki = 'Balistes_polylepis'; % Wikipedia
metaData.links.id_ADW = 'Balistes_polylepis'; % ADW
metaData.links.id_Taxo = '162847'; % Taxonomicon
metaData.links.id_WoRMS = '275234'; % WoRMS
metaData.links.id_fishbase = 'Balistes-polylepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Balistes_polylepis}}';
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
bibkey = 'BarrCast2007'; type = 'Article'; bib = [ ... 
'doi = {10.1353/psc.2007.0002}, ' ...
'author = {Barroso-Soto, I. and E. Castillo-Gallardo and C. Qui\~{n}onez-Vel\''{a}squez and R.E. Mor\''{a}n-Angulo}, ' ... 
'year = {2007}, ' ...
'title = {Age and growth of the finescale triggerfish, \emph{Balistes polylepis} ({T}eleostei: {B}alistidae), on the coast of {M}azatl\''{a}n, {S}inaloa, {M}exico}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {61(1)}, ' ...
'pages = {121-127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacK2008'; type = 'Phdthesis'; bib = [ ... 
'author = {C. MacKichan Simmons}, ' ... 
'year = {2008}, ' ...
'title = {Gray triggerfish \emph{Balistes capriscus}, reproductive behaviour, early life history, and competitive iteractions between red snapper, \emph{Lutjanus campechanus}, in the nothern {G}ulf of {M}exico}, ' ...
'school = {Auburn University}, ' ...
'volume = {59}, ' ...
'pages = {231--239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Balistes-polylepis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

