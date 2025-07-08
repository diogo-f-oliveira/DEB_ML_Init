function [data, auxData, metaData, txtData, weights] = mydata_Phorcus_lineatus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Vetigastropoda'; 
metaData.family     = 'Trochidae';
metaData.species    = 'Phorcus_lineatus'; 
metaData.species_en = 'Lined top shell'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 31]; 

%% set data
% zero-variate data

data.ab = 30/24;    units.ab = 'd';    label.ab = 'time since birth at metam'; bibkey.ab = 'Crot2001';
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 3;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Crot2001';
  temp.tj = C2K(12);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'marlin';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'marlin';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.1;   units.Lp  = 'cm';  label.Lp  = 'shell diam at puberty'; bibkey.Lp  = 'Crot2001';
data.Li  = 2.3;   units.Li  = 'cm';  label.Li  = 'ultimate shell height'; bibkey.Li  = 'Crot2001';
  comment.Li = 'shell height and width are about equal';

data.Wwb = 3e-6;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Crot2001';
  comment.Wwb = 'Based on egg diameter of 165-195 mum:  4/3*pi*0.009^3';
data.Wwi = 0.8;  units.Wwi = 'g'; label.Wwi = 'wet tissue weight at 2 cm shell height'; bibkey.Wwi = 'GestFili2012';
  comment.Wwi = 'Shell height was assumed, not given';

data.Ri  = 250/365; units.Ri  = '#/d'; label.Ri = 'reproduction rate at 2 cm';  bibkey.Ri  = 'Unde1972';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Counts based on mature + immature oocytes; size and mapping to cumulative yearly reproduction is assumed. This can be false!';

% uni-variate data
% t-L data
data.tL94 = [ ... % time since birth (d), shell height (cm)
59.035	0.198
89.733	0.504
120.431	0.478
151.130	0.479
184.189	0.485
210.165	0.453
243.224	0.447
271.561	0.415
302.259	0.498
330.596	0.549
363.656	0.626
391.992	0.849
425.052	1.059
453.389	1.123
488.810	1.218
514.785	1.186
545.484	1.193
576.182	1.187
604.518	1.174
642.301	1.161
668.276	1.161
696.613	1.161
729.673	1.263
755.648	1.436
788.708	1.633
821.767	1.614
850.104	1.538
878.441	1.563
911.501	1.570
939.837	1.570
972.897	1.557
1001.234	1.564
1031.932	1.576
1064.992	1.564
1095.690	1.672
1124.027	1.653
1154.725	1.634
1185.423	1.640
1216.121	1.698
1246.819	1.698
1277.517	1.692
1308.216	1.698
1338.914	1.692
1369.612	1.685
1402.672	1.705
1433.370	1.749
1459.345	1.698
1643.535	1.807
1674.233	1.820
1702.570	1.750
1733.268	1.820
1766.327	1.827
1797.026	1.852
1823.001	1.871
1853.699	1.897
1889.120	1.916
1917.457	1.903
1948.155	1.853
1974.131	1.935
2007.190	2.050
2037.888	2.165
2068.587	2.038
2099.285	2.006
2134.706	1.980
2153.597	2.006
2191.380	2.057
2219.716	2.000
2248.053	1.993
2283.474	1.981
2314.172	1.981
2342.509	2.045
2373.207	2.057
2401.544	2.070
2436.965	2.109];
units.tL94   = {'d', 'cm'};  label.tL94 = {'time since birth', 'shell height'};  
temp.tL94    = C2K(14);  units.temp.tL94 = 'K'; label.temp.tL94 = 'temperature';
bibkey.tL94 = 'Crot2001';
comment.tL94 = 'Data for the 1994 cohort at Gore Point, Somerset, England; temp is taken as constant mean';
%
data.tL95 = [ ...
59.416	0.298
87.826	0.349
125.731	0.438
151.689	0.413
182.402	0.413
213.115	0.413
243.813	0.400
272.133	0.375
305.291	0.444
333.799	0.578
364.729	0.762
395.690	0.971
424.258	1.156
457.385	1.200
488.121	1.219
516.426	1.181
551.894	1.206
575.572	1.251
610.987	1.232
636.968	1.225
670.020	1.206
703.178	1.276
731.604	1.340
760.014	1.390
793.202	1.486
826.300	1.505
852.288	1.505
878.275	1.505
911.366	1.517
946.811	1.524
977.494	1.498
1005.927	1.568
1034.277	1.568
1067.352	1.568
1097.983	1.498
1282.515	1.714
1310.813	1.670
1343.888	1.670
1374.631	1.695
1403.064	1.765
1436.012	1.657
1459.787	1.784
1492.893	1.810
1525.968	1.810
1551.896	1.759
1582.698	1.835
1611.056	1.841
1646.502	1.848
1677.230	1.860
1703.120	1.778
1741.085	1.917
1771.701	1.835
1800.141	1.911
1828.596	2.000
1856.797	1.873
1887.555	1.911
1918.283	1.924
1951.320	1.892
1979.723	1.937
2008.088	1.949
2041.186	1.968
2074.299	2.000];
units.tL95   = {'d', 'cm'};  label.tL95 = {'time since birth', 'shell height'};  
temp.tL95    = C2K(14);  units.temp.tL95 = 'K'; label.temp.tL95 = 'temperature';
bibkey.tL95 = 'Crot2001';
comment.tL95 = 'Data for the 1995 cohort at Gore Point, Somerset, England; temp is taken as constant mean';
%
data.tL96 = [ ...
58.991	0.310
89.666	0.405
117.981	0.481
153.376	0.481
181.691	0.500
210.007	0.506
243.041	0.532
268.997	0.481
302.032	0.582
335.067	0.608
363.382	0.759
391.698	0.962
424.733	1.051
450.689	1.158
486.083	1.171
514.398	1.177
542.714	1.184
578.108	1.203
604.064	1.222
637.099	1.120
665.414	1.234
696.090	1.342
726.765	1.399
910.816	1.652
939.131	1.538
967.446	1.557
998.122	1.627
1031.156	1.519
1061.832	1.519
1090.147	1.639
1125.541	1.690
1156.217	1.696
1212.848	1.797
1241.163	1.810
1276.557	1.823
1302.513	1.848
1335.548	1.747
1368.583	1.785
1399.258	1.772
1425.214	1.823
1458.249	1.854
1488.924	1.823
1514.880	1.873
1550.274	1.905
1578.590	1.924
1611.624	1.930
1639.940	1.924
1665.896	1.924
1703.650	1.924];
units.tL96   = {'d', 'cm'};  label.tL96 = {'time since birth', 'shell height'};  
temp.tL96    = C2K(14);  units.temp.tL96 = 'K'; label.temp.tL96 = 'temperature';
bibkey.tL96 = 'Crot2001';
comment.tL96 = 'Data for the 1996 cohort at Gore Point, Somerset, England; temp is taken as constant mean';

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
set1 = {'tL94','tL95','tL96'}; subtitle1 = {'Data for cohorts 1996, 1995, 1994 at Gore Point'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Length-weight relationship and reproduction data is speculative';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Veliger stage starts to crawl at 4 d; metamorphosis is complete at 6 d';
metaData.bibkey.F1 = 'Crot2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GRD2'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '619858'; % Ency of Life
metaData.links.id_Wiki = 'Phorcus_lineatus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3976194'; % Taxonomicon
metaData.links.id_WoRMS = '689176'; % WoRMS
metaData.links.id_molluscabase = '689176'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phorcus_lineatus}}';
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
bibkey = 'Crot2001'; type = 'Article'; bib = [ ... 
'author = {J. H. Crothers}, ' ... 
'year = {2001}, ' ...
'title = {COMMON TOPSHELLS: {A}N INTRODUCTION TO THE BIOLOGY OF \emph{Osilinus lineatus} WITH NOTES ON OTHER SPECIES IN THE GENUS}, ' ...
'journal = {Field Studies}, ' ...
'volume = {10}, ' ...
'pages = {115--160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Unde1972'; type = 'Article'; bib = [ ... 
'author = {A. J. Underwood}, ' ... 
'year = {1972}, ' ...
'title = {Observations on the Reproductive Cycles of \emph{Monodonta lineata}, \emph{Gibbula umbilicalis} and \emph{G. cineraria}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {17}, ' ...
'pages = {333--340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GestFili2012'; type = 'Article'; bib = [ ... 
'author = {M. Gesto and L. Filipe and C. Castro and M. A. Reis-Henriques and M. M. Santos}, ' ...
'doi = {10.1371/journal.pone.0035138}, ' ...
'year = {2012}, ' ...
'title = {Retinol Metabolism in the Mollusk \emph{Osilinus lineatus} Indicates an Ancient Origin for Retinyl Ester Storage Capacity}, ' ...
'journal = {Plos One}, ' ...
'volume = {7(4)}, ' ...
'pages = {e35138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4200}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

