function [data, auxData, metaData, txtData, weights] = mydata_Dichelopandalus_bonnieri

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Pandalidae';
metaData.species    = 'Dichelopandalus_bonnieri'; 
metaData.species_en = 'Whip shrimp'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj';'Lp'; 'Li';'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'; 'L-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'}; 
metaData.date_subm = [2017 09 01]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 01]; 

%% set data
% zero-variate data

data.ab = 5*30.5;   units.ab = 'd';   label.ab = 'time since birth at birth';  bibkey.ab = 'AlAdBowe1977';
  temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 4*30.5;   units.tj = 'd';   label.tj = 'time since birth at metam';  bibkey.tj = 'AlAdBowe1977';
  temp.tj = C2K(10); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 480;   units.tp = 'd';   label.tp = 'time since metam at puberty for females';  bibkey.tp = 'AlAdBowe1977';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 300;   units.tpm = 'd';   label.tpm = 'time since metam at puberty for males';  bibkey.tpm = 'AlAdBowe1977';
  temp.tpm = C2K(10); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5*365;    units.am = 'd';   label.am = 'life span';                  bibkey.am = 'guess';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.5;     units.Lj  = 'cm'; label.Lj  = 'carapace length at metam';     bibkey.Lj  = 'AlAdBowe1977';  
data.Lp  = 1.4;     units.Lp  = 'cm'; label.Lp  = 'carapace length at puberty';   bibkey.Lp  = 'AlAdBowe1977'; 
data.Lpm  = 1.1;    units.Lpm  = 'cm'; label.Lpm  = 'carapace length at puberty for males';   bibkey.Lpm  = 'AlAdBowe1977'; 
data.Li  = 2.0;    units.Li  = 'cm'; label.Li  = 'ultimate carapace length';     bibkey.Li  = 'AlAdBowe1977';

data.Wwb = 7e-4;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on egg diameter of 1.1 mm of Pandalus borealis: 4/3 * pi * 0.055^3';
 
% uni-variate data
% t-L data
data.tL_f = [ ... % time (yr), carapace length (cm)
0.032	0.608
0.146	0.701
0.222	0.798
0.234	0.816
0.293	0.816
0.363	0.894
0.433	0.937
0.559	1.024
0.594	0.999
0.632	1.086
0.682	1.058
0.691	1.036
0.790	1.045
0.817	1.080
0.919	1.092
0.969	1.138
0.986	1.219
1.077	1.219
1.077	1.324
1.139	1.300
1.165	1.383
1.273	1.541
1.352	1.610
1.370	1.579
1.428	1.730
1.496	1.724
1.569	1.733
1.695	1.740
1.721	1.662
1.768	1.795
1.815	1.817
1.815	1.619
1.920	1.830
1.943	1.606
2.025	1.644
2.096	1.665
2.125	1.625
2.210	1.743
2.216	1.876
2.277	1.864
2.292	1.777
2.406	1.743
2.482	1.975
2.494	2.056
2.543	2.028
2.605	2.143
2.936	1.888];  
data.tL_f(:,1) = data.tL_f(:,1) * 365 + 4 * 12.5; % convert yr to d since birth
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AlAdBowe1977';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (yr), carapace length (cm)
0.024	0.603
0.138	0.698
0.219	0.784
0.233	0.807
0.292	0.799
0.365	0.859
0.433	0.899
0.557	1.003
0.584	0.968
0.638	1.055
0.684	0.963
0.690	0.983
0.787	1.003
0.812	1.040
0.893	1.052
0.960	1.101
0.985	1.184
1.077	1.207
1.077	1.302
1.136	1.282
1.158	1.356
1.274	1.379
1.342	1.457
1.363	1.511
1.417	1.572
1.485	1.603
1.555	1.560
1.688	1.572
1.715	1.580
1.764	1.618
1.812	1.557
1.818	1.560
1.904	1.638
1.940	1.569
2.018	1.603
2.086	1.649
2.115	1.638
2.205	1.782
2.205	1.819
2.267	1.833
2.283	1.741
2.397	1.687
2.470	1.787
2.489	2.072
2.543	1.871
2.610	2.098
2.686	1.842
2.968	1.871
3.038	1.902];  
data.tL_m(:,1) = data.tL_m(:,1) * 365 + 4 * 12.5; % convert yr to d since birth
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m   = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AlAdBowe1977';
comment.tL_m = 'Data for males';

LLW = [ ... % carapace length (mm), total length (mm), wet weight (g)
 4  28 0.1
 6  37 0.3
 8  46 0.5
10  55 0.9
12  64 1.4
14  73 2.1
16  82 3.0
18  92 4.2
20 101 5.6
22 110 7.3];
data.LL = LLW(:,[2 1])/10;
units.LL   = {'cm', 'cm'};  label.LL = {'total length', 'carapace length'};  
bibkey.LL = 'AlAdBowe1977';
%
data.LW = [LLW(:,2)/10, LLW(:,3)];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'AlAdBowe1977';

data.LN = [ ... % carapace length (cm), fecundity (#)
1.206	361.736
1.375	596.705
1.417	716.016
1.436	687.757
1.441	545.305
1.451	488.421
1.479	465.035
1.481	802.348
1.485	840.412
1.488	645.675
1.493	636.235
1.497	873.818
1.501	1068.648
1.502	707.613
1.508	1049.737
1.511	831.247
1.511	788.493
1.512	669.732
1.516	874.062
1.518	969.102
1.523	959.662
1.523	878.904
1.525	988.195
1.525	926.439
1.525	831.430
1.526	769.674
1.526	707.919
1.532	879.026
1.553	1002.813
1.563	1097.944
1.563	751.161
1.567	1002.996
1.570	941.270
1.574	1107.597
1.577	984.116
1.577	841.603
1.583	414.123
1.584	1164.725
1.584	1055.464
1.584	912.951
1.591	1012.802
1.592	642.267
1.592	418.996
1.593	1027.084
1.593	1017.583
1.601	585.384
1.602	1378.739
1.605	917.976
1.606	746.960
1.609	1260.069
1.609	1165.060
1.612	1003.576
1.614	1041.610
1.618	747.112
1.618	1364.701
1.619	1264.942
1.619	1245.940
1.619	1226.938
1.619	1203.186
1.621	1103.457
1.621	1065.454
1.622	1041.701
1.624	965.725
1.628	1331.570
1.628	1284.066
1.631	1170.085
1.634	937.344
1.634	918.342
1.636	1094.139
1.636	1070.387
1.637	1331.692
1.638	1041.915
1.642	1450.515
1.642	1174.988
1.643	842.457
1.648	880.522
1.650	899.554
1.652	1279.620
1.652	1255.868
1.652	1184.611
1.652	1165.610
1.654	1094.383
1.655	975.622
1.655	818.857
1.656	1536.206
1.657	1023.157
1.658	1365.220
1.659	1346.218
1.659	1046.940
1.661	1255.990
1.663	1308.276
1.663	1275.023
1.670	2320.243
1.670	1308.367
1.671	1170.604
1.671	918.830
1.675	1465.193
1.675	1450.942
1.675	1436.690
1.681	933.204
1.685	1066.277
1.686	838.256
1.689	1503.380
1.689	1227.854
1.691	1465.407
1.692	1175.629
1.693	852.599
1.693	1755.215
1.694	1394.181
1.703	1503.563
1.704	1213.786
1.706	1085.554
1.710	1565.410
1.711	957.353
1.712	1636.698
1.712	1508.435
1.712	1446.680
1.713	1199.656
1.713	1185.405
1.714	748.364
1.714	653.355
1.715	1280.444
1.717	1446.741
1.719	1546.531
1.720	1095.238
1.722	1423.049
1.722	1199.778
1.724	1456.333
1.729	563.279
1.730	881.590
1.731	1627.441
1.731	1503.929
1.732	1199.900
1.735	1062.168
1.741	1409.042
1.741	1356.787
1.751	1181.143
1.752	1580.211
1.753	1295.184
1.756	1000.687
1.757	1556.520
1.758	1276.243
1.760	1428.288
1.765	1300.087
1.771	1670.714
1.771	1637.460
1.771	1608.958
1.776	1428.502
1.779	1281.268
1.781	1466.566
1.783	1433.344
1.788	1566.417
1.788	1509.412
1.790	597.326
1.799	1685.331
1.801	892.006
1.801	1785.121
1.802	1481.092
1.803	1167.563
1.809	635.573
1.809	1604.696
1.809	1390.925
1.813	1851.780
1.815	863.687
1.816	1509.778
1.818	1794.836
1.822	1832.900
1.823	1604.879
1.829	2023.010
1.832	1681.008
1.833	1410.232
1.835	1571.778
1.836	1833.083
1.837	1548.056
1.855	1766.821
1.859	1325.060
1.865	1676.685
1.879	1691.119
1.881	1966.676
1.902	1914.695
1.913	1359.015
1.921	1914.940
1.928	1948.284
1.937	1986.410
1.946	2167.049
1.953	1383.286
1.958	1036.564
1.970	2262.363
1.970	1255.238
1.971	1815.821
1.973	1963.115
1.980	1787.440
1.992	1588.074
2.008	1773.555
2.010	2025.360
2.013	1669.106
2.013	1645.354
2.014	2514.717
2.031	2386.668
2.032	1583.842
2.033	2519.711
2.036	2153.957
2.045	2244.338
2.055	2030.690
2.067	1969.087
2.082	1665.241
2.087	2344.647
2.118	1252.410
2.185	2626.205
2.244	2588.964];
units.LN   = {'cm', '#'};  label.LN = {'carapace length', 'fecundity'};  
temp.LN  = C2K(10);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'AlAdBowe1977';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumped to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '97001'; % ITIS
metaData.links.id_EoL = '46516032'; % Ency of Life
metaData.links.id_Wiki = 'Pandalidae'; % Wikipedia
metaData.links.id_ADW = 'Dichelopandalus_bonnieri'; % ADW
metaData.links.id_Taxo = '352694'; % Taxo
metaData.links.id_WoRMS = '107643'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Dichelopandalus_bonnieri}}';
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
bibkey = 'AlAdBowe1977'; type = 'Article'; bib = [ ... 
'author = {A. H. Y. AL-ADHUB and A. B. BOWERS}, ' ... 
'year = {1977}, ' ...
'title = {GROWTH AND BREEDING OF \emph{Dichelopandalus bonnieri}  IN {I}SLE OF {M}AN WATERS}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {57}, ' ...
'pages = {229--238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
