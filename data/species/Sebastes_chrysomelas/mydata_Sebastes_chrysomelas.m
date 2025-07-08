function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_chrysomelas
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_chrysomelas'; 
metaData.species_en = 'Black-and-yellow rockfish'; 

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

data.am = 22*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(16.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 39;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 43;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 825;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 425e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(16.7);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
  1 10.5
  2 13.0
  3 18.0
  4 21.0
  5 24.0
  6 26.0
  7 26.8
  8 27.8
  9 28.7
 10 29.3
 11 30.1
 12 30.8
 13 32.1
 14 32.7
 15 32.5 
 16 31.6
 17 29.2
 18 30.0
 19 32.0
 20 33.3
 21 33.4];
data.tL(:,1) = 365*(0.4+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(16.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeaMcAl1999'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
8.105	11.155
9.408	21.390
9.578	17.389
10.315	23.524
10.655	25.582
10.938	27.632
11.165	25.650
12.639	35.908
13.432	46.075
13.715	52.149
13.999	50.175
14.849	68.398
15.189	90.576
15.472	78.542
15.869	84.631
15.982	82.634
16.266	94.745
16.492	96.787
17.739	115.063
17.796	127.143
18.193	119.148
18.306	131.236
18.646	129.269
18.646	129.269
19.043	147.431
19.156	141.410
19.270	145.450
19.496	151.516
19.666	139.467
19.836	157.598
19.950	165.662
20.063	161.653
20.233	161.675
20.346	171.751
20.743	214.058
20.800	177.848
20.913	171.827
21.083	189.958
21.140	169.845
21.140	165.821
21.253	200.042
21.253	220.162
21.537	220.200
21.650	200.095
21.820	208.166
21.990	222.273
22.103	212.228
22.273	250.480
22.273	246.456
22.273	200.178
22.330	238.415
22.557	264.603
22.557	232.410
23.010	256.615
23.123	268.703
23.350	270.745
23.690	280.851
23.690	266.767
23.804	240.625
23.860	303.007
23.860	284.898
23.917	301.003
24.030	284.921
24.087	268.832
24.144	309.081
24.200	371.463
24.370	331.244
24.484	299.066
24.540	351.388
24.540	260.845
24.597	284.997
24.654	367.500
24.710	315.193
24.767	272.948
24.824	327.281
24.824	303.136
24.880	291.071
25.050	351.456
25.164	341.411
25.164	341.411
25.277	331.366
25.334	345.458
25.447	319.316
25.504	315.300
25.560	383.718
25.617	395.798
25.617	371.653
25.617	365.617
25.617	357.569
25.730	407.886
25.844	395.828
25.844	347.539
25.957	411.940
26.071	430.064
26.127	460.253
26.127	365.685
26.184	367.705
26.241	426.063
26.297	395.889
26.354	474.368
26.354	379.800
26.467	391.888
26.467	407.984
26.524	464.330
26.524	375.799
26.524	405.980
26.637	337.585
26.694	498.558
26.751	444.240
26.751	428.143
26.807	480.465
26.921	397.985
26.977	416.101
27.034	448.302
27.034	226.974
27.091	428.189
27.147	391.979
27.261	381.934
27.261	347.729
27.317	484.557
27.317	464.437
27.317	412.123
27.374	532.855
27.374	504.686
27.431	474.512
27.431	434.271
27.487	534.882
27.544	464.467
27.601	444.354
27.601	420.209
27.601	398.076
27.714	476.562
27.771	496.691
27.771	450.413
27.827	536.940
27.827	544.988
27.997	675.795
27.997	464.528
27.997	426.298
28.054	516.849
28.111	406.193
28.168	530.949
28.168	482.659
28.224	500.775
28.224	396.148
28.338	488.718
28.394	587.317
28.394	420.315
28.394	390.134
28.451	549.096
28.451	547.084
28.508	506.850
28.508	452.524
28.564	541.063
28.564	533.014
28.621	522.962
28.734	492.796
28.791	595.419
28.791	464.634
28.848	609.511
28.904	516.963
28.961	541.116
28.961	502.886
29.018	573.317
29.018	551.184
29.131	539.127
29.131	514.982
29.131	533.090
29.244	581.395
29.358	595.495
29.358	547.205
29.528	535.156
29.528	515.035
29.584	645.827
29.584	621.682
29.584	559.308
29.584	452.668
29.641	561.328
29.641	547.243
29.698	577.432
29.698	525.118
29.754	583.476
29.868	531.177
29.924	718.307
29.924	422.533
29.981	591.554
29.981	482.903
30.038	609.671
30.094	517.123
30.151	565.420
30.151	549.324
30.208	595.609
30.208	539.271
30.321	706.288
30.378	706.296
30.435	641.917
30.435	563.446
30.491	690.214
30.548	569.498
30.605	615.783
30.661	710.358
30.718	804.933
30.718	611.774
30.888	696.304
30.888	746.606
31.058	654.073
31.115	714.443
31.285	656.116
31.341	646.063
31.398	696.372
31.455	718.513
31.625	660.185
31.908	738.694
31.908	664.248
31.908	692.417
32.135	718.604
32.305	778.989
32.475	754.867
32.588	642.206
33.212	988.366
33.212	861.605
33.495	837.499
33.948	962.308];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LeaMcAl1999';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7LF'; % Cat of Life
metaData.links.id_ITIS = '166773'; % ITIS
metaData.links.id_EoL = '46568115'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_chrysomelas'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_chrysomelas'; % ADW
metaData.links.id_Taxo = '135764'; % Taxonomicon
metaData.links.id_WoRMS = '240737'; % WoRMS
metaData.links.id_fishbase = 'Sebastes_chrysomelas'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_chrysomelas}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-chrysomelas.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
