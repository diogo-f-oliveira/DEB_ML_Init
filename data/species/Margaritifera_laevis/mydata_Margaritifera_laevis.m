function [data, auxData, metaData, txtData, weights] = mydata_Margaritifera_laevis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Margaritiferidae';
metaData.species    = 'Margaritifera_laevis'; 
metaData.species_en = 'Freshwater pearl mussel'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.4; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 05];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 67*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AkiyIwak2009';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Baue1987 gives 93 yrs is typical in natural populations';

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'AkiyIwak2009';  
data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'AkiyIwak2009'; 
  comment.Lp = 'based on tp = 13 yr';
data.Li  = 13.3;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'AkiyIwak2009';

data.Wwi  = 84.7; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(13.3/7.3)^3';

data.Ri = 8e6/365;    units.Ri = '1/d';    label.Ri = 'maximum reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 comment.Ri = 'based on Margaritifera margaritifera';

% uni-variate data
  
% time-length
data.tL1 = [ ... % time since birth (yr), shell length (cm)
2.744	1.023
2.841	1.440
2.842	1.565
3.031	1.711
3.032	1.774
3.127	1.899
4.271	3.590
5.021	3.151
5.029	4.174
5.030	4.383
5.890	5.885
6.059	3.443
6.929	6.219
7.209	5.927
8.063	6.720
8.164	7.576
8.165	7.701
8.166	7.805
8.255	7.200
8.922	8.118
9.106	7.638
9.108	7.826
9.110	8.118
9.300	8.306
10.060	9.183
10.144	7.784
10.245	8.682
10.246	8.828
10.336	8.285
10.338	8.536
11.010	10.143
11.101	9.704
11.102	9.850
11.854	9.704
12.039	9.329
12.044	9.850
12.132	9.057
12.136	9.621
12.225	8.995
12.236	10.330
12.988	10.143
13.076	9.350
13.078	9.579
13.177	10.247
13.178	10.435
14.119	10.205
14.119	10.247
14.119	10.289
14.120	10.351
14.120	10.372
14.121	10.456
14.122	10.623
14.123	10.748
14.212	10.101
14.212	10.163
14.222	11.374
15.050	8.870
15.064	10.706
15.068	11.165
15.154	10.101
16.007	10.790
16.007	10.810
16.013	11.520
16.098	10.435
16.291	11.019
17.045	10.977
17.046	11.144
17.984	10.706
19.961	10.477
20.066	11.875
21.099	11.520
21.290	11.833];
data.tL1(:,1) = 365 * (0 + data.tL1(:,1));
units.tL1 = {'d', 'cm'}; label.tL1 = {'time', 'shell length', 'Shiribetsu River in Rankoshi, Japan'};  
temp.tL1 = C2K(15);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'AkiyIwak2009';
comment.tL1 = 'Data from Shiribetsu River in Rankoshi, Japan; mean temperature is guessed';
%
data.tL2 = [ ... % time since birth (yr), shell length (cm)
2.837	0.877
2.838	1.023
2.839	1.148
2.840	1.252
3.124	1.523
3.220	1.711
3.222	2.024
3.873	0.939
3.878	1.607
4.064	1.315
4.160	1.440
4.252	1.148
4.256	1.732
5.005	1.148
5.006	1.231
5.008	1.565
5.857	1.628
5.857	1.732
5.858	1.816
6.048	2.024
6.143	2.129
6.799	1.690
6.892	1.544
6.994	2.504
6.995	2.692
7.085	2.170
7.086	2.317
7.087	2.400
7.177	1.857
7.179	2.045
8.131	3.381
8.213	1.837
8.216	2.254
8.218	2.442
9.067	2.609
9.068	2.755
9.069	2.901
9.159	2.296
9.259	3.110
9.919	3.172
9.921	3.423
9.923	3.715
10.103	2.609
10.865	3.673
11.045	2.609
11.046	2.734
11.048	2.984
11.049	3.130
11.050	3.235
11.051	3.402
11.052	3.548
11.055	3.882
11.055	3.965
11.056	4.090
11.810	4.111
11.811	4.237
11.906	4.320
11.994	3.590
12.002	4.508
12.084	3.047
12.098	4.821
12.180	3.214
12.181	3.381
12.933	3.151
12.942	4.320
12.945	4.675
12.946	4.779
12.949	5.155
13.127	3.903
13.128	4.049
13.218	3.485
13.219	3.631
13.981	4.675
13.982	4.758
13.988	5.614
14.067	3.631
14.072	4.320
14.077	4.883
14.173	5.176
14.182	6.282
14.257	3.777
14.258	4.028
14.354	4.153
15.017	4.675
15.020	5.092
15.021	5.217
15.026	5.802
15.027	5.927
15.103	3.631
15.104	3.736
15.108	4.278
15.113	4.863
15.130	7.054
15.211	5.405
15.869	5.155
15.964	5.322
16.051	4.445
16.065	6.177
16.142	3.965
16.161	6.365
16.241	4.570
16.252	5.948
16.259	6.950
16.993	4.466
17.009	6.490
17.105	6.616
17.183	4.570
17.184	4.717
17.192	5.760
17.193	5.864
17.194	5.990
17.196	6.219
17.196	6.323
17.744	4.049
17.945	5.656
17.945	5.739
18.029	4.383
18.036	5.238
18.038	5.593
18.143	6.970
18.230	6.052
18.233	6.386
18.898	7.096
18.984	6.052
19.074	5.489
19.165	5.071
19.178	6.741
19.269	6.428
19.924	5.843
19.926	6.031
20.105	4.863
20.133	8.410
20.216	7.012
20.217	7.096
20.224	8.056
20.776	6.303
20.969	6.950
21.143	5.176
21.905	6.177
21.908	6.595
21.910	6.824
22.100	7.096
22.198	7.513
23.040	6.803
23.220	5.718
23.320	6.449
23.885	6.490
24.080	7.242
24.084	7.826
24.174	7.325
24.175	7.409
25.010	5.781
25.025	7.638
25.113	6.908
25.217	8.160
25.321	9.350
25.972	8.390
26.058	7.242
26.060	7.555
26.161	8.431
26.257	8.682
27.006	8.077
27.103	8.369
27.184	6.762
27.185	6.866
27.186	6.991
28.145	9.162
28.312	6.470
55.192	10.998
55.387	11.854];
data.tL2(:,1) = 365 * (0 + data.tL2(:,1));
units.tL2 = {'d', 'cm'}; label.tL2 = {'time', 'shell length', 'Chitose Rivers in Chitose, Japan'};  
temp.tL2 = C2K(5);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'AkiyIwak2009';
comment.tL2 = 'Data from Chitose Rivers in Chitose, Japan; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 5 * weights.tL1;
weights.tL2 = 5 * weights.tL2;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.p_M = 0;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Data from rivers Shiribetsu and Chitose, Japan'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3Y44K'; % Cat of Life
metaData.links.id_ITIS = '983842'; % ITIS
metaData.links.id_EoL = '51891247'; % Ency of Life
metaData.links.id_Wiki = 'Margaritifera'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1685891'; % Taxonomicon
metaData.links.id_WoRMS = '866255'; % WoRMS
metaData.links.id_molluscabase = '866255'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Margaritifera}}';
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
bibkey = 'AkiyIwak2009'; type = 'Article'; bib = [ ...
'doi = {10.1127/1863-9135/2009/0175-0295}, ' ...
'author = {Yoshihiro B. Akiyama and Toshio Iwakuma}, ' ... 
'year = {2009}, ' ...
'title = {Growth parameters of endangered freshwater pearl mussel (\emph{Margaritifera laevis}, {U}nionoida)}, ' ...
'journal = {Fundamental and Applied Limnology Archiv f\"{u}r Hydrobiologie}, ' ...
'volume = {175(4)}, ' ...
'pages = {295-305}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

