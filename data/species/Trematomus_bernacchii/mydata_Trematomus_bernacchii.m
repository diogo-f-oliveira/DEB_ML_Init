  function [data, auxData, metaData, txtData, weights] = mydata_Trematomus_bernacchii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Trematomus_bernacchii'; 
metaData.species_en = 'Emerald rockcod '; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 27];

%% set data
% zero-variate data
data.ab = 95;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'fishbase';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 33*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'MesaArne1996';   
  temp.am = C2K(-1.7); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 18;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase'; 
data.Li = 33;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'MesaArne1996';

data.Wwb = 0.036;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 4.1 mm: pi/6*0.41^3';
data.Wwp = 62.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00537*Lp^3.24, see F1, F2';
data.Wwi = 446.6; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = {'fishbase','MesaArne1996'};
  comment.Wwi = 'based on 0.00537*Li^3.24, see F1, F2';

data.Ri = 3123/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-1.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
6.865	15.797
7.895	15.803
8.032	18.315
8.924	19.013
8.993	19.446
9.062	21.178
9.817	18.412
9.886	21.529
9.954	21.183
9.955	20.144
10.092	20.837
10.846	22.833
10.847	21.361
10.915	22.574
10.984	23.700
11.051	20.930
11.052	20.583
11.053	20.237
11.054	20.064
11.121	21.969
11.875	26.129
11.876	24.398
11.945	23.186
11.946	19.463
12.011	23.619
12.012	22.753
12.013	22.320
12.014	21.195
12.081	21.974
12.082	21.628
12.083	20.676
12.700	23.796
12.838	24.403
12.906	21.633
12.907	22.845
12.908	23.191
13.043	24.577
13.044	25.703
13.112	25.011
13.799	27.699
13.867	24.929
13.936	25.362
13.937	24.756
13.938	23.717
13.939	23.370
14.005	26.574
14.142	22.506
14.897	22.943
14.897	23.549
14.897	24.415
14.897	28.398
14.963	23.117
14.964	25.195
14.965	25.628
14.966	25.887
14.967	26.493
14.968	26.753
14.969	30.389
15.031	27.100
15.032	27.360
15.033	27.792
15.034	28.658
15.035	29.178
15.720	27.363
15.721	26.931
15.788	26.325
15.789	24.420
15.857	22.256
15.858	28.490
15.859	28.057
15.927	24.767
15.995	29.183
16.064	25.547
16.682	26.676
16.816	24.426
16.817	26.071
16.818	27.716
16.819	28.409
16.888	27.110
16.955	30.228
16.956	25.033
16.957	29.102
17.712	27.981
17.849	29.107
17.916	27.463
17.918	27.030
17.986	25.645
18.055	31.533
18.056	28.676
19.015	28.854
19.016	29.374
19.153	29.981
19.771	30.504
19.840	29.985
19.908	31.630
19.977	29.553
20.938	27.913
20.939	33.368
21.007	31.463];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-5;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(-1.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MesaArne1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
7.772	15.724
8.032	20.130
8.033	19.611
8.036	18.920
8.040	17.797
8.041	17.451
8.858	19.438
8.872	15.378
8.931	17.970
8.936	16.501
8.989	21.080
9.061	20.130
9.066	18.661
9.067	18.402
9.126	21.425
9.608	20.994
9.887	19.698
9.948	21.944
10.078	23.931
10.079	23.585
10.287	23.067
10.766	23.413
10.842	21.339
10.847	20.043
10.906	22.721
10.917	19.611
10.918	19.266
11.115	21.857
11.119	20.562
11.534	19.784
11.806	20.475
11.939	21.857
12.001	23.672
12.004	22.721
12.006	22.289
12.078	21.339
12.621	23.067
12.623	22.376
12.835	20.821
12.893	23.931
12.895	23.153
12.900	21.685
12.905	20.216
12.957	25.140
13.039	21.425
13.857	23.067
13.869	19.525
13.921	24.363
13.993	23.499
13.997	22.289
14.882	24.363
14.886	23.153
15.021	23.931
15.910	24.881
15.983	23.758
15.987	22.376
16.047	25.054
16.113	25.832];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(-1.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MesaArne1996';
comment.tL_m = 'Data for males';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
15.467	41.503
15.574	90.110
17.765	65.716
18.364	70.552
18.866	88.356
19.163	72.140
19.267	106.164
19.462	72.128
19.564	91.569
19.865	98.038
19.867	114.242
19.880	203.361
20.061	75.345
20.264	98.022
20.362	86.675
20.458	60.745
20.466	117.458
20.764	109.344
20.767	128.788
20.861	91.516
20.862	97.998
21.261	97.981
21.268	148.213
21.362	106.079
21.465	132.001
21.469	157.927
21.563	119.034
21.965	140.082
21.969	166.008
22.261	112.524
22.266	149.793
22.370	177.335
22.563	136.818
22.659	106.027
22.767	167.596
22.864	148.148
22.970	191.894
23.262	141.650
23.371	201.600
23.465	161.087
23.467	180.531
23.469	193.494
23.862	146.487
23.970	209.677
24.067	191.849
24.265	180.499
24.573	240.440
24.667	201.547
24.671	224.232
24.868	208.020
24.873	242.048
24.975	261.488
25.161	165.879
25.263	180.458
25.264	191.801
25.368	220.963
25.469	229.061
25.673	261.460
25.688	363.543
25.760	169.095
25.771	246.873
25.865	206.360
26.164	201.486
26.266	217.686
26.274	274.399
26.275	282.500
26.277	298.704
26.486	363.510
26.570	256.563
26.666	229.012
26.867	240.347
26.971	269.509
26.979	321.361
27.074	292.190
27.185	368.343
27.270	266.256
27.375	303.521
27.381	342.409
27.479	331.063
27.567	250.041
27.572	285.689
27.582	353.744
27.789	410.448
28.069	274.326
28.076	319.696
28.173	303.488
28.177	332.655
28.495	459.031
28.565	250.000
28.669	285.644
28.674	321.292
28.678	348.838
28.787	410.408
28.870	295.358
28.876	337.488
28.882	379.617
28.980	366.650
29.281	374.740
29.283	394.184
29.372	318.023
29.474	332.602
29.482	386.074
29.576	348.802
29.988	437.906
30.080	387.670
30.089	450.864
30.275	352.014
30.279	377.940
30.407	578.861
30.786	437.873
31.183	428.135
31.289	467.020
31.496	522.104
31.577	392.471
32.706	612.796
33.389	502.583];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight','females'};  
bibkey.LW_f = 'MesaArne1996';
%
data.LW_m = [ ... % total length (cm), weight (g)
14.732	43.053
15.328	33.485
16.127	58.998
17.124	71.754
17.222	60.592
17.922	81.321
18.417	66.970
18.618	79.727
19.019	102.050
19.310	47.836
19.417	98.861
19.419	114.806
19.514	82.916
19.612	73.349
20.013	92.483
20.215	114.806
20.412	100.456
20.415	124.374
20.916	146.697
20.918	157.859
21.109	103.645
21.111	119.590
21.113	130.752
21.207	97.267
21.415	159.453
21.906	114.806
21.910	143.508
22.105	111.617
22.107	124.374
22.511	165.831
22.612	175.399
22.707	145.103
22.805	137.130
22.907	154.670
23.010	175.399
23.102	125.968
23.106	154.670
23.505	162.642
23.509	188.155
23.801	141.914
23.904	170.615
23.910	208.884
23.911	215.262
24.106	186.560
24.403	176.993
24.805	208.884
25.395	157.859];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight','males'};  
bibkey.LW_m = 'MesaArne1996';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  3 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;
% weights.Ri =  5 * weights.Ri;
% weights.Wwi =  5 * weights.Wwi;
% weights.Wwb =  10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00537*(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5838C'; % Cat of Life
metaData.links.id_ITIS = '643036'; % ITIS
metaData.links.id_EoL = '46573021'; % Ency of Life
metaData.links.id_Wiki = 'Trematomus_bernacchii'; % Wikipedia
metaData.links.id_ADW = 'Trematomus_bernacchii'; % ADW
metaData.links.id_Taxo = '189298'; % Taxonomicon
metaData.links.id_WoRMS = '234802'; % WoRMS
metaData.links.id_fishbase = 'Trematomus-bernacchii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Trematomus_bernacchii}}';  
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
bibkey = 'MesaArne1996'; type = 'Article'; bib = [ ... 
'author = {M. La Mesa and E. Arneri and G. Giannetti and S. Greco and M. Vacchi}, ' ...
'year = {1996}, ' ...
'title = {Age and growth of the nototheniid fish \emph{Trematomus bernacchii} {S}oulenger from {T}erra {N}ova {B}ay, {A}ntarctica}, ' ... 
'journal = {Polar Biol}, ' ...
'volume = {16}, ' ...
'pages = {139-145}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Trematomus-bernacchii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
