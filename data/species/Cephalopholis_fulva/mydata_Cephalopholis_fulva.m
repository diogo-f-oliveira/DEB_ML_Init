  function [data, auxData, metaData, txtData, weights] = mydata_Cephalopholis_fulva
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Cephalopholis_fulva'; 
metaData.species_en = 'Coney'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hs'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 09];

%% set data
% zero-variate data
data.ab = 5.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'BurtPott2015';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14.7;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 44;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.49e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 41.56;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01175*Lp^3.04, see F1';
data.Wwi = 1.2e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.04, see F1';

data.Ri = 28e4 /365; units.Ri = '#/d'; label.Ri = 'reproduction rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 22.5
    2 25.5
    3 27.3
    4 29.4
    5 30.8
    6 32.1
    7 32.9
    8 34.2
    9 35.7
   10 33.8
   11 36.0
   12 35.3 
   13 34.5
   14 37.0
   15 28.5
   16 35.6
   17 38.8
   18 39.3
   19 40.0];
data.tL(:,1) = 365 * (0.8+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BurtPott2015';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
15.000	75.832
19.110	136.079
19.707	193.086
19.707	142.111
20.575	145.162
20.738	157.166
20.901	175.166
20.901	163.172
21.118	184.175
21.118	121.206
21.498	193.193
21.987	184.227
21.987	169.235
22.258	196.237
22.313	193.242
22.476	223.237
22.584	169.270
22.747	220.255
22.910	208.270
23.018	169.296
23.073	238.265
23.398	229.289
23.398	199.304
23.398	265.271
23.887	250.308
23.941	313.280
24.104	241.326
24.159	280.309
24.159	202.348
24.159	217.341
24.213	232.337
24.376	256.334
24.484	406.266
24.484	298.320
24.484	328.305
24.484	232.353
24.647	211.373
24.756	277.347
24.756	292.339
24.810	226.375
24.864	211.386
24.864	241.371
24.973	334.331
25.027	310.346
25.136	253.381
25.190	262.380
25.190	295.364
25.244	385.322
25.407	286.381
25.461	400.328
25.461	301.377
25.570	307.381
25.679	277.402
25.679	238.422
25.733	322.383
25.733	328.380
25.841	295.403
25.950	355.379
26.059	202.462
26.113	400.367
26.113	307.413
26.167	340.400
26.167	430.355
26.330	259.450
26.439	349.412
26.439	451.361
26.493	226.476
26.602	316.438
26.602	325.433
26.656	361.419
26.656	211.494
26.764	412.400
26.764	289.461
26.873	361.432
26.927	373.429
26.982	277.480
26.982	328.455
26.982	478.380
26.982	265.486
27.090	451.400
27.199	346.459
27.199	295.484
27.307	334.471
27.362	400.441
27.416	286.502
27.470	340.478
27.470	322.487
27.579	397.456
27.687	367.477
27.796	514.411
27.850	427.457
27.904	346.501
27.904	280.534
27.904	325.512
28.067	382.493
28.122	592.391
28.122	445.465
28.122	400.487
28.122	343.516
28.176	301.540
28.393	604.401
28.393	361.523
28.393	313.547
28.447	487.463
28.447	508.453
28.502	610.405
28.502	478.471
28.502	421.499
28.556	451.488
28.556	409.509
28.664	376.532
28.773	481.486
28.827	1165.147
28.827	388.535
28.882	409.528
28.936	427.522
28.936	340.566
28.990	472.503
29.099	499.496
29.153	544.477
29.207	454.525
29.207	379.563
29.316	385.566
29.370	454.535
29.533	475.534
29.587	400.575
29.642	439.559
29.642	481.538
29.642	364.596
29.696	562.501
29.805	532.522
29.967	514.541
30.076	439.585
30.185	478.572
30.293	514.560
30.347	532.555
30.347	487.577
30.456	604.525
30.619	586.544
30.619	418.628
30.673	481.600
30.727	553.567
30.727	529.579
30.782	610.542
30.782	583.555
30.890	592.557
30.945	520.596
31.107	517.608
31.107	463.635
31.162	616.561
31.162	394.672
31.270	481.635
31.270	448.652
31.379	493.636
31.433	592.590
31.650	571.613
31.705	619.592
31.813	580.618
31.976	715.561
31.976	562.637
31.976	463.687
32.030	535.654
32.085	715.567
32.085	616.617
32.193	520.671
32.193	496.683
32.193	460.701
32.193	448.707
32.248	571.649
32.519	664.619
32.519	583.659
32.573	1009.450
32.573	505.702
32.628	643.636
32.682	577.672
32.790	718.608
32.790	643.646
32.899	604.672
33.008	634.663
33.062	817.575
33.062	613.677
33.062	595.686
33.062	508.729
33.170	661.659
33.170	706.637
33.225	679.654
33.225	568.709
33.279	607.693
33.496	571.724
33.550	556.735
33.713	919.563
33.713	856.595
33.713	652.696
33.931	676.697
33.985	634.722
33.985	607.735
34.039	793.646
34.093	754.668
34.256	709.701
34.256	676.717
34.311	736.690
34.365	682.721
34.365	652.736
34.365	622.751
34.528	760.691
34.582	805.672
34.691	661.751
34.745	838.665
34.745	742.713
34.745	709.730
34.908	823.683
34.908	559.815
35.016	793.704
35.179	607.807
35.233	814.707
35.233	751.738
35.342	844.698
35.451	637.808
35.559	793.737
35.668	670.805
35.831	781.759
35.939	745.783
36.048	814.755
36.048	835.745
36.048	766.779
36.156	694.822
36.482	910.734
36.536	877.753
36.699	862.771
36.971	916.760
36.971	841.797
37.025	862.790
37.134	880.788
37.296	811.832
37.459	1003.746
37.514	904.798
37.568	1057.725
37.568	937.785
37.731	760.883
37.839	916.812
37.894	829.859
38.002	1021.769
38.056	940.813
38.111	826.873
38.219	979.803
38.436	943.834
38.545	1105.760
38.545	1165.730
38.654	973.832
38.762	997.827
38.817	1123.767
38.979	1009.834
39.034	970.857
39.359	1207.758
39.468	850.943
39.685	1174.794
40.065	1210.799
40.119	1012.901
40.879	1066.919
42.780	1711.711
42.834	1513.813];
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'BurtPott2015';

%% set weights for all real data
weights = setweights(data, []);
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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'transition from female to male at 20 cm'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'SDMZ'; % Cat of Life
metaData.links.id_ITIS = '167740'; % ITIS
metaData.links.id_EoL = '65059019'; % Ency of Life
metaData.links.id_Wiki = 'Cephalopholis_fulva'; % Wikipedia
metaData.links.id_ADW = 'Cephalopholis_fulva'; % ADW
metaData.links.id_Taxo = '166795'; % Taxonomicon
metaData.links.id_WoRMS = '279148'; % WoRMS
metaData.links.id_fishbase = 'Cephalopholis-fulva'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cephalopholis_fulva}}';  
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
bibkey = 'BurtPott2015'; type = 'Article'; bib = [ ...
'doi = {10.7717/peerj.825}, ' ...
'author = {Michael L. Burton and Jennifer C. Potts and Daniel R. Carr}, ' ...
'year = {2015}, ' ...
'title = {Age, growth and natural mortality of coney (\emph{Cephalopholis fulva}) from the southeastern {U}nited {S}tates}, ' ... 
'journal = {PeerJ}, ' ...
'volume = {3}, '...
'pages = {e825}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cephalopholis-fulva.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

