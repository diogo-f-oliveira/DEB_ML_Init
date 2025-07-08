function [data, auxData, metaData, txtData, weights] = mydata_Albula_vulpes

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Albuliformes'; 
metaData.family     = 'Albulidae';
metaData.species    = 'Albula_vulpes'; 
metaData.species_en = 'Bonefish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAW', 'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'as'; 'aj'; 'ap'; 'am'; 'Lb'; 'Ls'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2014 05 03];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.author_mod_1   = {'Bas Kooijman'};                             
metaData.date_mod_1     = [2017 11 12];                          
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.author_mod_2   = {'Bas Kooijman'};                             
metaData.date_mod_2     = [2024 07 28];                          
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 28];

%% set data
% zero-variate data;
data.ab = 2.5;   units.ab = 'd';    label.ab = 'age at birth';                            bibkey.ab = 'guess';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
  comment.ab = 'temps guessed from distribution for all data; ab is actually hatch age at hatch';
data.as = data.ab + 55;  units.as = 'd';    label.as = 'age at metamorphisis to stage 2'; bibkey.as = 'red_list'; 
  comment.as  = 'redlist: 41-71 d';    
  temp.as = C2K(25); units.temp.as = 'K'; label.temp.as = 'temperature'; 
data.aj = data.as + 11;  units.aj = 'd';    label.aj = 'age at metamorphisis to stage 3'; bibkey.aj = 'flmnh';
  temp.aj = C2K(25);  units.temp.aj = 'K'; label.temp.aj = 'temperature'; 
data.ap = 2*365;  units.ap = 'd';    label.ap = 'age at puberty';                         bibkey.ap = 'flmnh'; 
  comment.ap = 'red_list: females 4.2 yr; males 3.6 yr';
  temp.ap = C2K(25); units.temp.ap = 'K'; label.temp.ap = 'temperature'; 
data.am = 20*365;units.am = 'd';    label.am = 'life span';                               bibkey.am = 'red_list';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.6;   units.Lb  = 'cm';  label.Lb  = 'standard length at birth';              bibkey.Lb  = 'guess';
  comment.Lb = 'based on Megalops_atlanticus';
data.Ls  = 6.3;   units.Ls  = 'cm';  label.Ls  = 'standard length at metamorphosis to stage 2'; bibkey.Ls  = 'flmnh';
data.Lj  = 1.4;   units.Lj  = 'cm';  label.Lj  = 'standard length at metamorphosis to stage 3'; bibkey.Lj  = 'flmnh';
data.Lp  = 25;    units.Lp  = 'cm';  label.Lp  = 'standard length at puberty';              bibkey.Lp  = 'flmnh'; 
  comment.Lp = 'red list; females 48.8 cm; males 41.8 cm';
data.Li  = 104;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';              bibkey.Li  = 'Smithsonian';

data.Wwi = 8100;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                   bibkey.Wwi = 'Smithsonian'; 

data.Ri  = 3e6/365; units.Ri  = '#/d';label.Ri  = 'reprod rate at Lw = 200 cm';           bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data

% time-length
data.tL = [ ... % times ince  birth (yr), fork length (cm)
0.092	4.919
0.115	4.288
0.160	11.477
0.161	3.658
0.185	2.649
0.208	8.198
0.209	5.423
0.230	10.342
0.231	8.450
0.232	3.910
0.254	5.928
0.277	9.459
0.300	6.559
0.346	14.378
0.368	17.910
0.369	11.477
0.415	20.937
0.416	16.396
0.438	25.351
0.461	19.171
0.507	20.432
0.531	21.315
0.577	27.117
0.578	24.847
0.600	29.135
0.601	21.946
0.623	23.964
0.646	27.495
0.669	31.153
0.714	27.369
0.715	28.505
0.716	19.802
0.738	23.459
0.739	22.577
0.760	30.523
0.761	29.387
0.762	24.973
0.807	19.550
0.900	31.910
0.901	21.568
0.922	27.117
0.923	20.180
0.924	22.703
0.992	29.514
1.015	24.973
1.084	26.108
1.107	31.405
1.153	27.874
1.176	30.523
1.178	28.757
1.269	26.234
1.292	28.505
1.384	30.649
1.407	31.910
1.453	25.099
1.915	33.550
2.007	32.288
2.191	35.189
2.837	38.847
2.860	37.207
2.861	35.189
2.884	37.964
2.953	36.450
3.137	38.847
3.506	40.234
3.760	41.117
3.806	37.712
3.807	41.369
3.852	46.667
3.875	44.270
3.898	48.054
3.899	35.568
3.921	40.234
3.922	43.009
4.106	49.568
4.221	37.838
4.314	36.829
4.336	42.883
4.337	35.820
4.360	45.279
4.637	46.288
4.821	41.874
4.844	45.153
4.866	55.369
4.867	52.721
4.913	47.171
4.914	46.414
5.144	58.270
5.260	53.730
5.283	50.577
5.329	47.171
5.652	60.667
5.744	52.216
5.836	57.640
6.067	53.225
6.182	61.045
6.228	58.018
6.367	57.009
6.368	53.351
6.436	54.739
6.551	64.450
6.644	59.279
6.667	53.225
6.897	58.396
7.082	62.811
7.083	58.901
7.128	60.162
7.129	58.523
7.173	64.450
7.174	54.991
7.175	53.351
7.405	62.685
7.451	59.279
7.474	60.919
7.612	63.441
7.659	62.432
7.866	62.054
7.889	59.279
7.958	70.505
8.005	63.063
8.097	69.495
8.374	66.342
8.512	56.757
8.881	71.640
9.066	55.622
9.112	67.604
9.113	60.541
9.343	68.360
9.596	64.198
9.619	62.054
10.035	67.225
10.058	61.676
10.196	60.162
10.519	65.838
10.542	69.243
10.588	74.036
10.681	68.613
10.682	70.505
10.911	66.595
11.003	70.883
11.142	67.351
11.857	65.333
12.065	69.117
12.364	68.108
13.149	71.514
13.379	72.018
13.725	72.270
14.625	70.378
15.848	67.856
16.448	68.360
16.563	69.874
17.347	70.505
18.039	64.829
19.562	64.577
20.092	69.748
21.084	70.883];
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth','fork length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RayKuma2022';

% length-weight
data.LW = [ ... % standard length (cm), wet weight (g)
22.469	233.842
23.476	273.786
23.315	193.897
23.651	193.897
24.154	220.527
25.246	253.814
24.987	333.703
25.152	366.990
25.581	280.444
25.832	293.759
26.423	280.444
26.420	313.731
26.417	347.018
26.412	400.277
25.657	373.648
27.842	420.250
28.351	373.648
29.024	386.963
29.018	453.537
30.282	440.222
30.535	440.222
30.871	453.537
30.868	486.824
30.528	520.111
30.864	533.426
31.539	513.454
31.788	560.055
32.293	560.055
32.545	566.713
32.540	626.630
34.054	646.602
34.548	773.093
37.405	839.667
39.501	946.186
39.075	1006.103
37.896	1006.103
39.224	1225.798
43.095	1252.427
42.166	1285.714
42.246	1332.316
41.908	1345.631
41.988	1398.890
46.293	1279.057
43.594	1325.659
45.020	1392.233
45.352	1445.492
44.428	1425.520
43.073	1505.409
43.490	1558.669
44.078	1571.983
44.500	1558.669
43.739	1591.956
43.065	1598.613
43.565	1665.187
45.342	1565.326
45.503	1645.215
46.089	1685.160
45.329	1711.789
45.928	1598.613
46.350	1585.298
46.669	1791.678
46.320	1938.141
46.557	2111.234
44.172	2417.476
47.751	1938.141
47.746	1998.058
48.411	2097.920
49.613	1831.623
50.787	1884.882
50.782	1944.799
52.874	2097.920
48.989	2231.068
48.727	2337.587
47.704	2470.735
48.458	2523.994
49.899	2417.476
51.089	2290.985
51.078	2410.818
51.586	2377.531
52.344	2377.531
50.648	2517.337
49.806	2517.337
50.134	2617.198
51.819	2603.883
51.477	2663.800
50.877	2783.634
52.310	2770.319
52.906	2690.430
53.152	2770.319
53.578	2710.402
53.001	2570.596
53.757	2590.569
55.180	2690.430
55.175	2750.347
55.680	2743.689
55.254	2803.606
54.831	2823.578
54.159	2803.606
54.157	2830.236
54.237	2883.495
54.986	2976.699
54.223	3043.273
53.211	3049.931
54.718	3156.449
52.853	3296.255
54.036	3249.653
54.537	3296.255
54.607	3462.691
53.507	3522.607
55.613	3509.293
56.712	3462.691
56.635	3376.144
57.475	3409.431
57.899	3369.487
58.831	3302.913
56.913	3089.875
56.649	3223.024
55.802	3282.940
60.071	3575.867
57.621	3655.756
57.027	3715.673
56.434	3755.617
57.445	3748.960
57.951	3735.645
58.616	3835.506
59.298	3748.960
60.476	3755.617
64.100	3715.673
59.115	3908.738
57.679	3955.340
59.109	3975.312
59.441	4035.229
60.453	4015.257
60.795	3955.340
61.220	3908.738
61.469	3948.682
58.598	4048.544
58.088	4101.803
57.744	4175.035
58.244	4241.609
59.423	4234.951
59.325	4394.730
58.816	4441.331
59.573	4447.989
60.084	4388.072
61.705	4148.405
62.292	4175.035
62.113	4294.868
63.034	4348.128
63.374	4321.498
63.882	4288.211
65.795	4561.165
63.323	4894.036];
% Fork length = 1.07 * standard lengthdata.
units.LW = {'cm', 'g'};     label.LW = {'standard length', 'wet weight'};  
bibkey.LW = 'Brug1974';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D2 = 'Observed Lj < L_s, which seems unlikely';
D3 = 'mod_2: growth data added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = [ ... 
   'Early stage 1 leptocephali lack dorsal, anal, and pectoral fins and are small, usually less than about 30mm.',... 
   'Late in stage 1 the nascent dorsal and anal fins appear and the larvae approaches its maximum size of approximately 63mm',...
   'At this length the larvae begins a rapid metamorphosis in which the entire body shrinks for 10-12 days until it reaches half its original length. '...
   'During this transformation (stage II) the anal and dorsal fins move forward and the snout projects noticeably beyond the mandible.',...
   'The subsequent appearance of scales, the lateral line, and the onset of an overall appearance of that of a miniature bonefish mark the transformation to a fry (stage III). ',...
   'Pigmentation and crossbands appear at about 4 cm in length, followed', ...
   'by the appearance of longitudinal stripes and the disappearance of the crossbands. '];
metaData.bibkey.F1 = 'flmnh';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '65W5L'; % Cat of Life
metaData.links.id_ITIS = '161121'; % ITIS
metaData.links.id_EoL = '46581467'; % Ency of Life
metaData.links.id_Wiki = 'Albula_vulpes'; % Wikipedia
metaData.links.id_ADW = 'Albula_vulpes'; % ADW
metaData.links.id_Taxo = '42516'; % Taxonomicon
metaData.links.id_WoRMS = '212256'; % WoRMS
metaData.links.id_fishbase = 'Albula-vulpes'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Albula_vulpes}}';   % replace my_pet by latin species name
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
bibkey = 'Brug1974'; type = 'Techreport'; bib = [ ... 
'author = {Bruger, G.}, ' ...
'year = {1974}, ' ...
'title  = {Age, growth, food habits, and reproduction of bonefish \emph{Albula vulpes}, in {S}outh {F}lorida {W}aters}, ' ...
'institute = {Florida Dept of Natural Resources Marine Research Lab.}, ' ...
'howpublished = {\url{http://aquaticcommons.org/763/1/FMRP003.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Renn2017'; type = 'phdthesis'; bib = [ ... 
'author = {acob Joseph Rennert}, ' ...
'year = {2017}, ' ...
'title  = {Age And Growth Of Bonefish, \emph{Albula} Species Among Cuban Habitats}, ' ...
'school = {University of North Carolina Wilmington; Florida Institute of Technology}, ' ...
'howpublished = {\url{https://repository.fit.edu/cgi/viewcontent.cgi?article=2187&context=etd}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'flmnh'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.flmnh.ufl.edu/natsci/ichthyology/Gallery/Descript/bonefish/bonefish.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/228}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Albula_vulpes/}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'red_list'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/194303/0}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Smithsonian'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sms.si.edu/irlspec/Albula_vulpes.htm}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marinebio'; type = 'Misc'; bib = ...
'howpublished = {\url{http://marinebio.org/species.asp?id=393}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


