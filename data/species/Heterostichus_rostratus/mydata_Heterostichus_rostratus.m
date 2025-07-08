function [data, auxData, metaData, txtData, weights] = mydata_Heterostichus_rostratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Blenniiformes'; 
metaData.family     = 'Clinidae';
metaData.species    = 'Heterostichus_rostratus'; 
metaData.species_en = 'Giant kelpfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd', 'jiMi'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 27];

%% set data
% zero-variate data

data.ab = 15;   units.ab = 'd';   label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'hatch in 13 d, yolk sac adsorbtion in 2 d';
data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'WinsClai2018';   
  temp.am = C2K(19.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Coye1982'; 
data.Li  = 61;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fisbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Step1986';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwi = 1.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.08, see F1';

data.Ri = 3*800/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'Step1986';
  temp.Ri = C2K(19.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '800 eggs per nest, assumed 3 nests per yr';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0	3.459
0	10.959
0	7.636
0	7.066
0	5.358
0	4.883
0	3.934
0	2.984
0	12.953
0	11.244
0	10.390
0	10.010
0	9.535
0	8.965
0	8.016
0	6.497
0	5.928
0	11.719
0	8.682
1	15.742
1	14.888
1	18.306
1	18.022
1	17.072
1	16.408
1	20.870
1	19.636
1	20.586
2	20.812
2	20.053
2	19.294
2	18.439
2	29.737
2	25.939
2	23.471
2	22.237
2	19.579
2	22.713
3	27.971
3	23.983
3	30.534
3	27.402
3	26.452
3	26.073
3	25.883
3	25.503
3	24.934
3	23.035
3	22.085
3	26.643
4	27.629
4	36.269
4	33.326
5	32.604
5	41.718
5	36.971];
data.tL(:,1) = 365 * (.6 + data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WinsClai2018';
%
data.tLj = [ ... % time since birth (d), total length (cm)
55.163	2.453
78.592	3.272
81.082	3.182
86.093	3.448
90.436	3.916
92.217	3.402
92.884	3.201
97.221	3.579
97.739	4.516
98.088	2.976
98.115	3.378
99.968	3.935
101.126	4.270
101.277	3.154
102.736	4.582
103.129	3.689
104.516	4.068
104.946	3.711
106.342	4.223
106.825	4.647
107.905	3.844
108.630	4.491
108.837	4.200
110.381	3.553
111.051	3.396
113.116	3.730
113.459	5.427
114.510	4.199
114.694	3.574
115.605	3.618
115.917	4.868
117.085	5.359
117.583	6.006
119.564	5.112
121.223	6.139
121.610	5.156
122.543	5.536
122.575	6.004
122.603	6.406
122.735	5.022
123.553	3.705
124.274	4.285
125.717	5.490
128.456	5.712
129.867	6.449
130.324	6.493
130.596	3.814
131.415	5.845
131.725	7.073
135.307	6.358
135.451	5.130
135.542	6.469
136.005	6.603
136.139	5.241
136.183	5.889
140.962	6.088
141.329	4.816
142.935	5.061
143.336	7.628
143.822	8.096
146.868	9.502
147.062	5.685
148.453	9.456
148.656	5.773
149.009	7.626
149.556	8.987
149.888	7.202
150.112	7.157
150.854	8.050
151.137	5.549
153.148	11.754
153.950	6.866
153.970	7.156
162.697	12.019
163.007	6.573
163.194	9.318
163.540	7.733
165.932	9.541
167.076	9.674
167.145	10.679
168.589	8.558
168.711	7.017
168.993	11.169
170.925	9.539
173.756	7.797
173.908	10.029
176.089	8.734
176.193	10.252
177.320	10.140
177.921	8.979
179.277	8.889
179.892	7.929
181.147	9.692
181.547	12.237
182.245	9.156
191.353	9.600
192.820	11.162
204.654	11.650
211.699	11.804
213.731	11.647
216.798	13.365
218.440	10.820
223.203	10.774];
units.tLj   = {'d', 'cm'};  label.tLj = {'time since birth', 'total length'};  
temp.tLj    = C2K(19.2);  units.temp.tLj = 'K'; label.temp.tLj = 'temperature';
bibkey.tLj = 'WinsClai2018';
%
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.435	11.791
0.919	18.284
1.408	21.552
1.929	24.104
2.413	27.597
2.924	32.030
3.417	34.761
3.917	38.388];
data.tL_f(:,1) = (.2+data.tL_f(:,1))*365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(19.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Step1986';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.561	12.284
1.062	18.194
1.539	21.597
2.033	23.522
2.554	26.433
3.048	28.761];
data.tL_m(:,1) = (.2+data.tL_m(:,1))*365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(19.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Step1986';
   

% length-weight
data.LW = [ ... % total length (cm), weight (g)
1.919	0.531
2.304	0.124
2.535	0.724
3.073	0.732
3.535	0.466
4.073	0.164
4.611	0.186
4.919	1.806
5.457	3.437
6.149	3.465
6.611	3.483
6.842	3.492
7.226	1.899
7.687	6.744
8.149	1.936
8.765	1.961
9.226	5.197
9.534	3.601
9.995	5.228
10.457	3.638
10.687	8.473
11.533	11.724
12.764	10.165
14.608	24.716
14.763	16.680
15.532	21.536
15.608	26.365
15.838	34.417
16.453	36.050
17.374	50.565
17.529	40.920
17.913	44.152
18.451	50.608
18.681	53.834
18.913	47.409
19.373	60.297
19.527	55.477
19.989	55.496
20.065	58.716
20.218	66.765
20.526	63.560
21.601	76.472
21.754	86.130
22.445	97.417
22.448	70.072
22.830	97.433
22.905	107.087
23.059	110.311
23.062	81.357
23.443	108.718
24.289	113.577
24.604	60.507
25.054	147.388
25.289	112.009
25.671	132.936
26.130	157.083
26.132	137.780
26.820	171.588
26.896	182.851
26.897	174.808
27.660	219.879
27.742	182.885
27.742	178.059
29.508	202.259
30.202	195.853
32.182	348.747
33.110	310.179
36.174	410.034
36.404	419.695
41.222	637.047];
units.LW   = {'d', 'cm'};  label.LW = {'total length','weight'};  
bibkey.LW = 'WinsClai2018';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 10 * weights.Wwb;
weights.Lb = 3 * weights.Lp;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tLj'}; subtitle1 = {'data for adults, juveniles'};
set2 = {'tL_f','tL_m'}; subtitle2 = {'data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6M68P'; % Cat of Life
metaData.links.id_ITIS = '171476'; % ITIS
metaData.links.id_EoL = '46574036'; % Ency of Life
metaData.links.id_Wiki = 'Heterostichus_rostratus'; % Wikipedia
metaData.links.id_ADW = 'Heterostichus_rostratus'; % ADW
metaData.links.id_Taxo = '46497'; % Taxonomicon
metaData.links.id_WoRMS = '281075'; % WoRMS
metaData.links.id_fishbase = 'Heterostichus-rostratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heterostichus_rostratus}}';
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
bibkey = 'WinsClai2018'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.13541}, ' ...
'author = {M. S. Winston and J. T. Claisse and C. M. Williams and J. P. Williams and D. J. Pondella}, ' ... 
'year = {2018}, ' ...
'title = {Age and growth of the Giant Kelpfish, \emph{Heterostichus rostratus} {G}irard 1854, in {S}outhern {C}alifornia, {USA}}, ' ...
'journal = {J Appl Ichthyol.}, ' ...
'volume = {34}, ' ...
'pages = {91–96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Coye1982'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1444613}, ' ...
'author = {James A. Coyer}, ' ... 
'year = {1982}, ' ...
'title = {Observations on the Reproductive Behavior of the Giant Kelpfish, \emph{Heterostichus rostratus} ({P}isces: {C}linidae)}, ' ...
'journal = {Copeia}, ' ...
'volume = {1982(2)}, ' ...
'pages = {344–350}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Step1986'; type = 'Article'; bib = [ ... 
'author = {Carol A. Stepien}, ' ... 
'year = {1986}, ' ...
'title = {LIFE HISTORY AND LARVAL DEVEWPMENT OF THE GIANT KELPFISH, \emph{Heterostichus rostratus} {G}IRARD, 1854}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {84(4)}, ' ...
'pages = {344–350}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Heterostichus-rostratus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

