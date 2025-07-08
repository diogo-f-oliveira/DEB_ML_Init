function [data, auxData, metaData, txtData, weights] = mydata_Lachnolaimus_maximus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Lachnolaimus_maximus'; 
metaData.species_en = 'Hogfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 24];

%% set data
% zero-variate data

data.am = 23*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.1;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 91;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm of Labrus merula: pi/6*0.09^3';
data.Wwp = 112.3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02188*Lp^2.95, see F1';
data.Wwi = 13159;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02188*Li^2.95, see F1';

data.Ri = 83e4/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(27.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (mm) 
0.403	180.406
0.720	143.318
0.725	173.394
0.764	127.113
0.767	145.621
0.769	159.503
0.821	198.823
1.137	161.735
1.285	221.857
1.363	133.922
1.373	196.388
1.411	140.852
1.418	187.123
1.459	157.037
1.608	226.413
1.704	251.842
1.709	284.231
1.835	205.540
1.882	214.784
1.899	323.521
1.939	284.181
1.981	258.721
2.037	318.864
2.169	279.503
2.175	321.147
2.199	180.010
2.209	242.476
2.243	166.119
2.252	219.330
2.259	270.228
2.334	154.531
2.342	205.429
2.392	235.495
2.395	256.317
2.406	325.723
2.526	210.015
2.632	300.223
2.672	260.883
2.737	381.177
2.804	221.522
2.866	323.308
2.907	290.908
2.961	344.110
2.966	376.499
2.970	397.321
3.072	464.394
3.134	267.722
3.142	318.620
3.184	290.847
3.225	260.761
3.286	360.233
3.327	325.520
3.367	286.180
3.452	242.202
3.608	355.535
3.618	422.628
3.650	332.390
3.693	309.244
3.730	249.082
3.780	279.148
3.805	441.096
3.891	401.745
3.932	367.032
3.969	309.183
3.972	330.005
3.987	427.174
4.108	313.780
4.159	343.846
4.211	385.479
4.222	454.886
4.261	408.605
4.317	475.687
4.386	322.973
4.471	278.995
4.495	434.003
4.529	353.019
4.542	438.620
4.607	262.770
4.681	445.530
4.705	302.080
4.708	318.275
4.725	429.325
4.725	429.325
4.748	283.562
4.761	366.849
4.765	394.612
4.779	484.840
4.806	357.585
4.869	468.625
4.952	413.080
4.965	496.367
4.981	297.392
5.047	431.568
5.086	385.287
5.122	315.870
5.123	325.124
5.280	445.398
5.280	445.398
5.313	362.100
5.412	408.351
5.439	281.096
5.440	290.350
5.489	306.535
5.495	348.179
5.547	389.812
5.558	459.219
5.560	468.473
5.584	327.336
5.634	355.089
5.636	368.970
5.645	422.182
5.677	334.257
5.822	380.497
5.830	433.709
5.871	394.368
5.914	378.163
5.964	405.916
5.968	431.365
6.017	449.863
6.239	394.287
6.278	350.320
6.386	452.095
6.424	398.874
6.437	482.161
6.570	449.741
6.607	391.892
6.610	410.401
6.641	310.908
6.699	394.186
6.739	354.845
6.781	324.759
6.798	435.809
6.925	364.059
6.928	380.254
6.939	456.601
6.979	412.633
7.119	424.170
7.133	521.339
7.194	313.100
7.221	488.929
7.243	336.225
7.248	366.301
7.250	377.869
7.266	484.292
7.304	433.384
7.379	618.458
7.400	456.499
7.524	363.927
7.530	407.884
7.552	546.697
7.571	671.629
7.637	505.033
7.644	548.990
7.664	382.405
7.685	511.963
7.686	523.531
7.730	505.013
7.757	680.842
7.775	500.375
7.797	641.502
7.816	467.976
7.876	560.507
7.990	398.529
7.998	456.367
7.999	460.994
8.062	569.721
8.261	363.765
8.337	565.033
8.424	525.682
8.502	437.747
8.554	477.067
8.557	497.889
8.591	416.905
8.610	537.210
8.630	673.709
8.685	426.139
8.687	440.020
8.698	516.367
8.703	546.443
8.714	620.477
8.752	564.942
8.944	615.799
8.957	402.943
9.019	502.415
9.233	699.026
9.288	453.770
9.482	518.508
9.577	539.310
9.717	550.847
9.721	576.296
9.754	492.998
9.773	617.930
9.994	557.727
10.493	509.031
10.567	687.164
10.586	513.638
10.596	576.103
10.656	670.949
10.732	562.192
10.772	522.851
10.832	615.383
10.936	691.710
11.055	564.434
11.388	638.397
11.497	749.427
11.522	608.290
11.583	705.449
11.606	555.058
11.704	594.368
11.713	654.521
11.725	730.868
11.736	504.130
11.800	619.797
11.826	492.542
11.957	744.698
12.269	672.907
12.440	591.892
12.494	642.780
12.528	566.423
12.547	684.414
12.642	702.902
12.643	714.470
12.677	633.486
12.711	557.128
12.722	628.848
12.732	691.314
13.005	668.118
13.407	591.679
13.457	617.118
13.496	570.837
13.515	693.455
13.565	721.207
13.640	605.510
13.771	561.522
13.773	573.090
14.399	753.414
14.451	788.108
14.489	737.199
14.624	716.347
14.710	674.683
14.714	704.759
14.752	653.851
15.181	746.301
15.487	639.807
15.499	718.468
15.506	762.425
15.612	556.489
15.640	734.632
16.559	722.861
17.483	743.480
18.510	828.858
20.378	701.197
20.436	777.534
21.846	666.169
22.386	580.446
23.650	714.358];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'McBrRich2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 3 * weights.Wwi;
weights.Wwp = 3 * weights.Wwp;
weights.Lp = 3 * weights.Lp;

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
D1 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length weight: Ww in g = 0.02188*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RPV4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46571820'; % Ency of Life
metaData.links.id_Wiki = 'Lachnolaimus_maximus'; % Wikipedia
metaData.links.id_ADW = 'Lachnolaimus_maximus'; % ADW
metaData.links.id_Taxo = '178030'; % Taxonomicon
metaData.links.id_WoRMS = '158822'; % WoRMS
metaData.links.id_fishbase = 'Lachnolaimus-maximus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lachnolaimus_maximus}}';
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
bibkey = 'McBrRich2007'; type = 'Article'; bib = [ ... 
'author = {Richard S. McBride and Adam K. Richardson}, ' ... 
'year = {2007}, ' ...
'title = {EvIdENCE OF SIzE-SELECTIvE FIShINg MORTALITy FROM AN AgE ANd gROwTh STUdy OF hOgFISh ({L}ABRIdAE: \emph{LachnoLaimus maximus}), A hERMAPhROdITIC REEF FISh}, ' ...
'journal = {BULLETIN OF MARINE SCIENCE}, ' ...
'volume = {80(2)}, ' ...
'pages = {401–417}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lachnolaimus-maximus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

