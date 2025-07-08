function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_atrovirens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_atrovirens'; 
metaData.species_en = 'Kelp rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 23];

%% set data
% zero-variate data

data.am = 20*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(16.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 42;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 75.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 1e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 530e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(16.7);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sebastes_carnatus: 425e3*(42/39)^3';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
  0  7.3
  1 10.2
  2 12.4
  3 18.3
  4 21.6
  5 24.6
  6 26.7
  7 27.4
  8 28.5
  9 29.4
 10 31.1
 11 30.3
 12 32.9
 24 32.0];
data.tL(:,1) = 365*(0.9+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(16.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeaMcAl1999'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
4.975	7.125
5.271	5.117
5.763	7.009
6.059	8.930
6.305	14.788
6.305	12.823
6.453	14.766
6.502	12.794
6.847	12.744
6.995	6.828
7.192	12.693
7.487	6.755
7.684	10.656
7.931	6.690
8.325	12.526
8.571	8.560
8.670	8.546
8.965	12.431
9.704	12.323
9.802	20.167
9.999	14.244
12.610	27.612
13.102	35.398
13.939	41.168
14.333	50.933
14.726	54.805
14.923	58.705
15.219	64.555
15.416	52.738
15.563	64.504
15.957	68.376
16.450	74.197
16.991	81.976
16.991	76.082
17.139	89.813
17.335	91.748
17.484	81.903
17.532	103.507
17.582	89.747
17.680	89.733
17.877	97.562
19.255	124.864
19.404	109.125
19.896	112.982
19.994	118.861
20.043	130.642
20.189	160.090
20.485	152.188
20.682	163.947
20.732	132.505
20.929	148.193
21.027	144.249
21.175	154.051
21.323	146.170
21.569	159.887
21.863	185.384
22.110	173.559
22.254	236.407
22.356	183.346
22.454	195.120
22.454	189.226
22.650	206.879
22.699	214.730
22.700	197.048
22.896	222.560
22.896	212.736
23.094	202.884
23.143	200.912
23.338	236.247
23.339	224.459
23.438	202.833
23.584	247.998
23.585	232.281
23.635	216.557
23.636	189.052
23.733	224.401
23.930	220.443
24.125	257.742
24.225	238.081
24.225	230.222
24.371	273.423
24.469	289.125
24.470	253.762
24.471	243.938
24.471	238.045
24.714	310.700
24.716	275.337
24.717	243.902
24.814	271.393
24.962	263.512
25.160	251.695
25.257	281.151
25.357	263.454
25.404	292.917
25.454	292.910
25.504	269.327
25.553	281.107
25.553	273.249
25.749	296.795
25.796	334.116
25.947	281.049
25.948	267.297
26.094	296.745
26.141	330.136
26.193	292.801
26.286	392.983
26.388	326.171
26.389	306.524
26.435	379.209
26.536	312.396
26.586	306.495
26.833	300.565
26.880	343.780
26.881	316.275
26.927	377.172
26.976	392.882
27.079	306.423
27.125	355.532
27.225	333.906
27.271	390.874
27.276	300.500
27.369	416.399
27.373	337.813
27.373	320.132
27.469	381.021
27.469	373.163
27.472	326.011
27.522	304.393
27.616	400.646
27.616	390.823
27.619	335.813
27.667	359.381
27.715	379.020
27.863	380.963
27.866	320.059
27.913	363.274
28.009	424.164
28.010	406.482
28.013	335.754
28.110	367.174
28.111	347.528
28.156	426.107
28.158	394.672
28.159	376.990
28.206	414.311
28.260	314.107
28.305	412.332
28.352	453.583
28.356	384.820
28.406	359.272
28.454	376.947
28.457	333.724
28.501	426.056
28.551	416.225
28.552	398.543
28.604	349.420
28.696	471.214
28.701	372.981
28.796	443.694
28.798	408.330
28.801	335.638
28.845	445.652
28.940	512.435
28.992	469.206
28.996	376.867
29.039	516.350
29.040	488.845
29.045	392.577
29.092	431.863
29.096	343.453
29.139	473.113
29.139	473.113
29.189	473.106
29.192	396.484
29.288	453.445
29.289	427.904
29.387	451.466
29.536	414.115
29.580	522.164
29.587	386.603
29.631	486.793
29.633	459.288
29.634	433.747
29.733	427.839
29.734	408.192
29.778	516.241
29.783	400.327
29.830	455.330
29.833	394.425
29.875	533.908
29.883	372.807
29.883	372.807
29.976	484.778
29.980	404.227
30.028	433.689
30.075	488.692
30.076	451.364
30.077	443.505
30.123	502.438
30.174	476.890
30.177	408.127
30.220	537.787
30.367	545.624
30.371	478.826
30.372	453.285
30.374	417.921
30.415	571.157
30.416	551.510
30.422	445.419
30.519	472.910
30.568	474.867
30.569	441.468
30.570	427.716
30.665	498.429
30.762	523.954
30.812	523.947
30.859	559.304
30.860	551.445
30.908	575.014
30.914	457.135
30.954	626.087
31.059	498.370
31.152	608.376
31.158	504.250
31.208	472.808
31.259	443.331
31.305	517.981
31.353	545.479
31.401	571.012
31.499	578.856
31.547	588.672
31.550	533.662
31.552	496.333
31.601	504.185
31.650	506.142
31.702	455.054
31.744	606.325
31.798	508.085
31.839	667.214
31.843	590.593
31.843	590.593
31.896	513.964
31.944	533.603
31.945	525.745
31.988	635.758
31.995	500.197
32.040	598.422
32.041	570.917
32.140	566.974
32.146	437.307
32.189	559.108
32.192	508.027
32.237	582.676
32.239	553.206
32.282	684.831
32.284	631.785
32.329	714.293
32.334	618.025
32.343	449.065
32.476	741.777
32.483	592.463
32.484	580.675
32.527	704.441
32.532	598.350
32.535	549.234
32.536	517.799
32.578	661.211
32.580	621.918
32.627	667.098
32.631	582.618
32.678	645.480
32.681	572.788
32.685	502.060
32.731	559.028
32.773	714.228
32.775	671.006
32.826	625.811
32.876	617.946
32.878	588.476
32.880	537.395
32.973	655.259
33.023	635.606
33.026	566.843
33.028	535.408
33.068	714.184
33.171	623.796
33.223	582.531
33.268	670.933
33.272	574.665
33.311	788.805
33.316	694.502
33.318	645.385
33.367	651.272
33.372	555.004
33.461	737.702
33.514	663.038
33.516	633.568
33.568	574.622
33.616	604.084
33.659	716.062
33.665	609.971
33.762	637.461
33.807	723.899
33.809	678.712
33.859	664.952
33.860	653.164
33.905	727.814
33.959	635.468
34.004	712.082
34.004	712.082
34.007	657.072
34.009	625.637
34.055	684.569
34.056	666.888
34.059	607.948
34.152	708.131
34.153	696.343
34.198	786.710
34.202	706.159
34.253	657.035
34.255	625.601
34.305	615.770
34.351	670.773
34.394	812.221
34.544	759.154
34.598	670.737
34.694	717.874
34.697	649.111
34.788	810.198
34.791	753.223
34.791	739.471
34.889	764.997
34.890	741.421
34.893	664.800
34.937	776.777
34.985	802.311
35.131	841.582
35.326	880.846
35.384	707.949
35.432	725.624
35.483	692.218
35.526	821.877
35.729	696.111
35.775	764.866
35.872	806.109
35.883	580.174
36.073	713.742
36.269	741.218
36.321	692.094
36.420	678.327
36.704	910.112
38.622	974.663
38.675	898.034];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LeaMcAl1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;
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
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Data Wwp and Wwi are at odds with LW data and ignored';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7KW'; % Cat of Life
metaData.links.id_ITIS = '166747'; % ITIS
metaData.links.id_EoL = '46568118'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_atrovirens'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_atrovirens'; % ADW
metaData.links.id_Taxo = '187250'; % Taxonomicon
metaData.links.id_WoRMS = '274772'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-atrovirens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_atrovirens}}';
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
bibkey = 'LeaMcAl1999'; type = 'techreport'; bib = [ ... 
'author = {Lea, R.N. and R.D. McAllister and D.A. VenTresca},' ...
'year = {1999}, ' ...
'title = {Biological Aspects of Nearshore Rockfishes of the Genus \emph{Sebastes} from {C}entral {C}alifornia With Notes On Ecologically Related Sport Fishes}, ' ...
'institution = {State of California, the Resources Agency, Department of Fish and Game}, ' ...
'volume = {Fish Bulletin 177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-atrovirens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
