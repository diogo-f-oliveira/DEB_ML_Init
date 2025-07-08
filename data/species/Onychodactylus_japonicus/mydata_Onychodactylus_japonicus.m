function [data, auxData, metaData, txtData, weights] = mydata_Onychodactylus_japonicus

global tT

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Hynobiidae';
metaData.species    = 'Onychodactylus_japonicus'; 
metaData.species_en = 'Japanese clawed salamander'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 11 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 28]; 


%% set data
% zero-variate data

data.ab = 148;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Kuzm1995';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 5*365;  units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'Kuzm1995';
  temp.tj = C2K(12);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 14.2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  

data.Lb  = 2.6;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Kuzm1995';
data.Lj  = 8;     units.Lj  = 'cm';  label.Lj  = 'total length at metam'; bibkey.Lj  = 'Kuzm1995'; 
data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length as Hynobius nebulosus: 17 * 5.5/ 7.8';
data.Li  = 17;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Kuzm1995';

data.Wwb = 0.0654; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Kuzm1995';
  comment.Wwb = 'based on egg diameter of 5 mm (4.5-5.4 mm): pi/6*0.5^3';
data.Wwi = 9.65;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Kuzm1995';

data.Ri = 36/365;  units.Ri = '#/d';    label.Ri = 'max reprod rate';                bibkey.Ri = 'Kuzm1995';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% univariate data
% time-length of larvae
data.tL_73 = [... % time since 1 Aug 1976 (d), total length (cm)
6.783	8.064
25.118  8.000
43.452	7.944];
units.tL_73  = {'d', 'cm'}; label.tL_73 = {'time', 'total length'};  
bibkey.tL_73 = 'Kuzm1995';
comment.tL_73 = 'Data for cohort 1973, Tsukuba mountain, Ibaraki prefecture, Japan';
%
data.tL_74 = [... % time since 1 Aug 1976 (d), total length (cm)
4.999	6.870
41.643	6.733
73.104	6.459
96.752	6.956
128.815	7.086
152.731	7.096
183.697	7.158
216.732	7.272
252.882	7.471
285.097	7.702
317.286	7.916
348.353	8.046
384.402	8.178
409.365	8.221];
units.tL_74  = {'d', 'cm'}; label.tL_74 = {'time', 'total length'};  
bibkey.tL_74 = 'Kuzm1995';
comment.tL_74 = 'Data for cohort 1974, Tsukuba mountain, Ibaraki prefecture, Japan';
%
data.tL_75 = [... % time since 1 Aug 1976 (d), total length (cm)
1.708	4.667
40.697	4.766
69.721	4.861
91.300	5.307
121.790	5.050
150.788	5.128
181.905	5.292
211.901	5.371
249.818	5.419
284.251	5.803
314.053	6.419
344.400	6.734
378.658	6.999
405.538	6.993
435.558	7.089
465.126	6.882
495.147	6.978
526.163	7.074
556.033	7.069
590.810	7.015
627.387	7.500
668.268	7.533
687.352	7.641
719.667	7.939
753.673	8.037
780.603	8.064];
units.tL_75  = {'d', 'cm'}; label.tL_75 = {'time', 'total length'};  
bibkey.tL_75 = 'Kuzm1995';
comment.tL_75 = 'Data for cohort 1975, Tsukuba mountain, Ibaraki prefecture, Japan';
%
data.tL_76 = [... % time since 1 Aug 1976 (d), total length (cm)
179.619	3.762
211.809	3.976
245.614	3.939
278.473	3.935
302.791	4.213
336.646	4.210
375.241	4.712
397.440	4.906
428.332	4.918
456.108	4.845
492.383	5.128
523.274	5.140
555.212	5.186
588.967	5.115
619.289	5.413
666.828	5.902
683.868	5.976
715.061	6.190
749.344	6.472
781.081	6.384
814.819	6.968
847.301	6.712
881.182	6.725
913.162	6.133
948.390	6.382
977.682	5.990
1017.51	7.316
1049.60	7.463
1078.00	7.811];
units.tL_76  = {'d', 'cm'}; label.tL_76 = {'time', 'total length'};  
bibkey.tL_76 = 'Kuzm1995';
comment.tL_76 = 'Data for cohort 1976, Tsukuba mountain, Ibaraki prefecture, Japan';
%
data.tL_77 = [... % time since 1 Aug 1976 (d), total length (cm)
584.739	3.618
616.626	3.630
662.515	3.682
679.782	3.907
710.899	4.070
742.217	4.368
777.070	4.365
807.215	4.545
838.777	4.339
874.131	4.672
904.746	4.499
939.950	4.731
968.672	4.625
1006.92	4.892
1045.39	5.311
1074.09	5.860];
units.tL_77  = {'d', 'cm'}; label.tL_77 = {'time', 'total length'};  
bibkey.tL_77 = 'Kuzm1995';
comment.tL_77 = 'Data for cohort 1977, Tsukuba mountain, Ibaraki prefecture, Japan';
%
data.tL_78 = [... % time since 1 Aug 1976 (d), total length (cm)
901.447	3.624
936.374	3.671
968.136	3.600
1002.17	3.714
1035.43	3.979
1065.78	4.293];
units.tL_78  = {'d', 'cm'}; label.tL_78 = {'time', 'total length'};  
bibkey.tL_78 = 'Kuzm1995';
comment.tL_78 = 'Data for cohort 1978, Tsukuba mountain, Ibaraki prefecture, Japan';
%
tT = [ ... % time since 1 Aug 1976 (d), temperature (C)
0    	16.296
27.692	15.272
58.719	13.726
86.892	10.836
116.211	6.449
136.337	4.361
165.174	4.806
207.633	8.471
236.271	10.915
268.990	12.376
298.524	15.824
321.338	16.745
359.151	17.059
386.943	18.000
417.124	14.951
450.142	13.412
472.442	9.499
503.568	6.953
544.352	7.444
575.229	7.398
604.597	12.512
644.219	14.665
676.623	19.291
710.305	21.088
743.987	22.886
767.083	20.976
784.555	15.543
824.541	14.032
861.608	11.842
900.765	8.661
931.361	11.446
965.209	11.578
991.739	15.181
1017.69	14.615
1056.13	18.597];


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_78','tL_77','tL_76','tL_75','tL_74','tL_73'}; subtitle1 = {'Data for cohorts 1978,.,1973'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';     
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '49R6D'; % Cat of Life
metaData.links.id_ITIS = '668231'; % ITIS
metaData.links.id_EoL = '330495'; % Ency of Life
metaData.links.id_Wiki = 'Onychodactylus_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Onychodactylus_japonicus'; % ADW
metaData.links.id_Taxo = '47239'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Onychodactylus+japonicus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Onychodactylus_japonicus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onychodactylus_japonicus}}';
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
bibkey = 'Kuzm1995'; type = 'Book'; bib = [ ... 
'author = {Kuzmin, S. L.}, ' ... 
'year = {1995}, ' ...
'title = {The clawed salamanders of {A}sia ({\em Onychodactylus})}, ' ...
'publisher = {Westarp Wissenschaften}, ' ...
'volume = {622}, ' ...
'series = {Di Neue Brehm Buecherei}, ' ...
'address = {Magdeburg}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/species/3906}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Onychodactylus_japonicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

