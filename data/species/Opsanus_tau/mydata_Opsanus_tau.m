  function [data, auxData, metaData, txtData, weights] = mydata_Opsanus_tau

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Batrachoidiformes'; 
metaData.family     = 'Batrachoididae';
metaData.species    = 'Opsanus_tau'; 
metaData.species_en = 'Oyster toadfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMr', '0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ah'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'R_L'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L_T'; 't-Ww_T'; 'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author  = {'Bas Kooijman'};                  
metaData.date_subm    = [2014 05 15];                      
metaData.email   = {'bas.kooijman@vu.nl'};      
metaData.address = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 01]; 



%% set data
% zero-variate data
data.ah = 30;     units.ah = 'd';   label.ah = 'age at hatch';           bibkey.ah = 'Wiki'; 
  temp.ah = C2K(15); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ap = 2.9*365;units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'MensStep2001';
  temp.ap = C2K(19.5); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'MensStep2001: less than 3 yr';
data.am = 20*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0 = 0.5;    units.L0 = 'cm';  label.L0 = 'egg diameter';           bibkey.L0 = 'gma'; 
data.Lb = 1.55;   units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'gma'; 
data.Lp = 25;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'PalaSara2001'; 
  comment.Lp  = 'from Halobatrachus_didactylus';
data.Li = 43.2;   units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwi = 2200;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.RL = 1200/365;units.RL = '#/d'; label.RL = 'reprod rate L = 34.5 cm'; bibkey.RL = 'PalaSara2001';   
  temp.RL = C2K(12); units.temp.RL = 'K'; label.temp.RL = 'temperature';
  comment.RL  = 'from Halobatrachus_didactylus';
  
% uni-variate data
% t-L data from Dove1960 after hatching at 20.6 C
% huge yolk sac; development from hatch to birth
data.tL = [... % time since hatch (d), length (cm)
 1    0.74
 2    0.82
 4    0.91
 7    1.08
 8    1.24
11    1.37
12.25 1.53
14.75 1.55 % yolk sac absorbed
16.66 1.64
20    1.71];
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'length'};
temp.tL = C2K(20.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'Dove1960'};

% t-L data from MensStep2001 at 19.6 C
data.tL_19 = [ ... % time since hatch (yr), standard length (cm)
0.087	1.331
0.105	1.479
0.124	1.428
0.173	1.822
0.235	1.868
0.297	2.360
0.297	2.557
0.315	2.705
0.340	2.555
0.359	2.752
0.389	2.800
0.371	2.950
0.390	3.147
0.420	3.343
0.445	3.045
0.464	3.291
0.488	3.587
0.488	3.488
0.531	3.783
0.525	4.030
0.562	4.127
0.624	4.372
0.717	4.515
0.766	4.810
0.809	5.006
0.846	5.053
0.908	5.545
0.970	5.641
1.013	5.886
1.069	6.378
1.099	6.624
1.161	7.561
1.205	7.756
1.291	8.544
1.569	8.777
1.698	9.117
1.821	9.556
1.982	10.389
2.056	10.633
2.142	11.074
2.254	11.662
2.630	12.237
2.809	12.772
2.950	12.716
3.024	12.960
3.098	13.005];
data.tL_19(:,1) = 365 * data.tL_19(:,1); % convert yr to d
units.tL_19 = {'d', 'cm'}; label.tL_19 = {'time since hatch', 'length', '19.6 C'}; 
temp.tL_19 = C2K(19.6); units.temp.tL_19 = 'K'; label.temp.tL_19 = 'temperature';
bibkey.tL_19 = {'MensStep2001'};
%
% t-L data at 15.8 C
data.tL_15 = [ ... % time since hatch (yr), standard length (cm)
0.124	1.379
0.167	1.673
0.223	1.869
0.253	1.867
0.303	2.112
0.334	2.110
0.346	2.209
0.358	2.060
0.377	2.059
0.395	2.355
0.426	2.205
0.457	2.302
0.482	2.301
0.512	2.299
0.525	2.398
0.562	2.544
0.648	2.639
0.722	2.784
0.771	2.781
0.802	2.978
0.851	2.926
0.913	3.121
0.987	3.463
1.030	3.758
1.074	4.102
1.098	4.200
1.210	4.738
1.265	5.379
1.580	5.660
1.709	5.703
1.832	5.895
1.974	5.987
2.066	6.279
2.147	6.275
2.258	6.715
2.633	6.944
2.800	8.024
2.930	8.710
3.029	8.754
3.109	9.295];
data.tL_15(:,1) = 365 * data.tL_15(:,1); % convert yr to d
units.tL_15 = {'d', 'cm'}; label.tL_15 = {'time since hatch', 'length', '15.8 C'}; 
temp.tL_15 = C2K(15.8); units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = {'MensStep2001'};
%
% t-Ww data at 19.6C
data.tW_19 = [ ... % time since hatch (yr), wet weight (g)
0.104	0.953
0.141	0.941
0.159	1.263
0.184	1.255
0.202	1.577
0.227	1.569
0.301	0.889
0.344	0.875
0.387	0.860
0.418	1.178
0.442	1.498
0.479	1.814
0.498	2.136
0.516	2.130
0.566	2.113
0.578	2.765
0.664	3.065
0.732	4.354
0.775	3.356
0.818	3.670
0.861	3.984
0.916	6.589
0.996	6.890
1.039	8.188
1.162	10.442
1.217	14.687
1.328	17.929
1.573	23.422
1.715	23.376
1.837	30.549
1.978	39.355
2.070	39.981
2.149	51.758
2.277	63.847
2.486	64.762
2.640	65.040
2.799	77.447
2.927	81.667
3.020	80.981
3.124	87.176];
data.tW_19(:,1) = 365 * data.tW_19(:,1); % convert yr to d
units.tW_19 = {'d', 'cm'}; label.tW_19 = {'time since hatch', 'wet weight', '19.6 C'}; bibkey.tW_19 = {'MensStep2001'};
  temp.tW_19 = C2K(19.6); units.temp.tW_19 = 'K'; label.temp.tW_19 = 'temperature';
%
% t-Ww data at 15.8C
data.tW_15 = [ ... % time since hatch (yr), wet weight (g)
0.430	0.518
0.480	0.174
0.523	0.160
0.547	0.152
0.584	0.140
0.646	1.103
0.732	1.075
0.781	0.731
0.837	0.713
0.868	1.031
0.935	0.681
0.997	1.316
1.040	1.958
1.089	1.614
1.218	3.539
1.335	5.140
1.594	6.366
1.723	5.668
1.846	6.612
1.988	6.565
2.074	8.504
2.160	8.804
2.277	10.733
2.505	11.314
2.647	11.267
2.812	18.426
2.953	22.970
3.015	24.589
3.113	28.491];
data.tW_15(:,1) = 365 * data.tW_15(:,1); % convert yr to d
units.tW_15 = {'d', 'cm'}; label.tW_15 = {'time since hatch', 'wet weight', '15.8 C'}; 
temp.tW_15 = C2K(15.8); units.temp.tW_15 = 'K'; label.temp.tW_15 = 'temperature';
bibkey.tW_15 = {'MensStep2001'};

% L-Ww data from SwarEnge1968
data.LW = [ ... % length (log10 cm), wet weight (log10 g)
4.229	1.051
4.392	1.160
4.520	1.442
4.694	1.564
5.105	1.521
4.567	1.759
4.968	1.925
4.924	2.069
5.112	2.126
5.208	2.184
5.306	2.125
5.457	2.164
5.113	2.244
5.358	2.348
5.562	2.369
5.615	2.456
5.310	2.501
5.311	2.641
5.513	2.640
5.619	2.997
5.568	3.079
5.673	3.079
5.833	3.023
5.838	3.656
6.058	3.400
6.349	3.589
6.469	3.721
6.533	4.110
6.661	4.969
6.853	5.539
6.983	5.690
7.381	5.012
7.526	6.115
7.531	7.132
7.532	7.328
8.682	12.376
9.626	14.296
10.977	16.966
11.298	20.514
11.951	21.652
10.788	23.079
11.738	25.484
11.631	26.664
11.962	27.147
12.304	28.658
13.276	40.400
13.654	40.762
14.179	45.428
13.661	46.686
13.663	47.971
14.051	47.964
13.795	52.038
14.187	52.031
14.319	51.095
15.431	52.958
15.725	55.404
14.868	54.426
14.328	59.590
15.594	70.737
15.168	75.372
15.457	79.570
16.658	83.220
15.900	85.530
16.201	87.084
16.506	86.291
15.612	93.638
16.206	93.620
16.208	97.070
17.139	93.594
17.147	105.275
17.149	108.172
17.635	107.182
19.007	114.147
16.684	121.690
17.977	121.644
17.973	116.264
18.490	126.109
19.194	128.388
17.650	131.976
17.330	143.185
19.375	129.548
19.927	133.094
19.739	127.213
18.672	141.842
19.204	145.724
19.747	140.525
18.169	168.470
18.860	168.438
19.578	168.406
19.391	158.079
20.701	160.912
20.707	171.433
19.765	176.191
19.402	182.701
20.906	182.632
20.909	189.363
20.147	199.964
21.112	205.417
20.535	220.868
20.923	222.854
20.159	231.110
21.923	224.826
22.541	214.852
22.328	205.359
22.341	237.346
22.344	246.092
23.197	252.816
24.077	248.235
21.329	255.221
22.351	264.564
21.942	276.833
22.154	297.599
22.785	305.744
22.996	294.863
24.323	305.643
24.779	297.431
25.968	313.949
25.253	319.726
24.332	334.585
23.664	346.964
25.260	340.630
25.974	331.462
24.345	379.765
26.979	386.499
26.983	400.742
28.009	400.667
27.245	434.718
26.253	463.227
28.838	535.126
30.803	618.272
31.974	618.156
34.454	623.539
31.990	701.628
33.525	733.923
34.473	714.170
35.130	753.938
35.453	720.558
35.474	832.791
34.506	903.567
35.824	945.202
36.180	1082.535];
units.LW = {'cm', 'g'}; label.LW = {'length', 'wet weight'}; 
bibkey.LW = {'SwarEnge1968'};
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_19', 'tL_15'}; subtitle1 = {'Data at 19.6, 15.8 C'};
set2 = {'tW_19', 'tW_15'}; subtitle2 = {'Data at 19.6, 15.8 C'};
metaData.grp.sets = {set1, set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Facts
F1 = 'The species can live in very bad conditions and needs little food to live';
metaData.bibkey.F1 = 'Wiki';
F2 = 'The sound-producing (sonic) muscles attached to its swimbladders are the fastest known vertebrate muscles. This is used to attract females.';
metaData.bibkey.F2 = 'Wiki';
F3 = ['The male fertilizes the egg; they hatch after approximately one month;' ...
    'When the eggs hatch the young toadfish stay attached to the yolk for some time.' ...
    'When the yolk has been absorbed for energy, the young toadfish learn to swim. '...
    'Even when the young have started to swim the adult still protects its young.'];
metaData.bibkey.F3 = 'Wiki';
F4 = 'There is a large open pit of unknown function in the axil of each pectoral fin.'; 
metaData.bibkey.F4 = 'gma';
F5 = 'huge yolk sac at hatch for development from hatch to birth';
metaData.bibkey.F5 = 'Dove1960';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);
                               
%% Links
metaData.links.id_CoL = '6T47C'; % Cat of Life
metaData.links.id_ITIS = '164423'; % ITIS
metaData.links.id_EoL = '46565872'; % Ency of Life
metaData.links.id_Wiki = 'Opsanus_tau'; % Wikipedia
metaData.links.id_ADW = 'Opsanus_tau'; % ADW
metaData.links.id_Taxo = '44212'; % Taxonomicon
metaData.links.id_WoRMS = '158782'; % WoRMS
metaData.links.id_fishbase = 'Opsanus-tau'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Opsanus_tau}}';  
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
bibkey = 'Dove1960'; type = 'Article'; bib = [ ...  
'author = {W. Dovel}, ' ...
'year = {1960}, ' ...
'title = {Larval Development of the Oyster Toadfish, \emph{Opsanus tau}}, ' ... 
'journal = {Chesapeake Sci.}, ' ...
'volume = {1(3-4)}, '...
'pages = {187--195}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SwarEnge1968'; type = 'Article'; bib = [ ...  
'author = {Swartz, R. C. and Engel, W. A. van }, ' ...
'year = {1968}, ' ...
'title = {Length, weight, and girth relations in the Toadfish, \emph{Opsanus tau}}, ' ... 
'journal = {Chesapeake Sci.}, ' ...
'volume = {9(4)}, '...
'pages = {249--253}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MensStep2001'; type = 'Article'; bib = [ ...  
'author = {A. F. Mensinger and K. A. Stephenson and S. L. Pollema and H. E. Richmond and N. Price and R. T. Hanlon}, ' ...
'year = {2001}, ' ...
'title = {Mariculture of the Toadfish \emph{Opsanus tau}}, ' ... 
'journal = {Biol. Bull.}, ' ...
'volume = {201}, '...
'pages = {282-283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PalaSara2001'; type = 'Article'; bib = [ ...  
'author = {J. L. Palaz\''{o}n-Ferna\''{a}ndez and A. M. Arias and C. Sarasqete}, ' ...
'year = {2001}, ' ...
'title = {Aspects of the reproductive biology of the toadfish, \emph{Halobatrachus didactylus} ({S}chneider, 1801) ({P}isces: {B}atrachoididae)}, ' ... 
'journal = {Sci. Mar.}, ' ...
'volume = {65(2)}, '...
'pages = {131--138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'gma'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.gma.org/fogm/Opsanus_tau.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Opsanus-tau.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

