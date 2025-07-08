  function [data, auxData, metaData, txtData, weights] = mydata_Limnothrissa_miodon
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Limnothrissa_miodon'; 
metaData.species_en = 'Lake Tanganyika sardine'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 06]; 

%% set data
% zero-variate data
data.am = 2.3*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Kimu1995';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 17;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.35e-5; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Pete1999';
  comment.Wwb = 'based on egg diameter of 0.4 mm: pi/6*0.04^3';
data.Wwp = 3.1;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Pete1999';
  comment.Wwi = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 40;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','Kimu1995'};
    
% uni-variate data

% time-length
data.tL = [ ... % year class (yr), standard length (cm)
16.161	1.203
17.511	1.346
21.502	1.089
24.198	1.318
25.548	1.461
26.886	1.461
30.882	1.261
36.276	1.748
37.581	1.375
40.300	1.862
42.952	1.605
43.037	2.549
45.623	1.547
45.648	1.834
45.687	2.263
48.362	2.263
49.677	2.006
51.066	2.578
52.404	2.578
57.732	2.321
61.794	2.865
65.823	3.037
67.094	2.293
67.125	2.636
67.140	2.808
69.785	2.464
69.805	2.693
76.497	2.722
77.860	3.009
83.257	3.524
84.501	2.465
84.503	2.494
84.618	3.782
87.263	3.438
88.545	2.809
93.962	3.553
96.618	3.324
96.648	3.668
97.943	3.181
98.014	3.983
104.708	4.040
106.020	3.754
108.678	3.554
112.694	3.582
115.385	3.754
116.766	4.241
119.401	3.783
119.444	4.270
120.754	3.955
120.764	4.069
127.512	4.728
131.456	3.955
131.505	4.499
136.859	4.528
136.892	4.900
136.905	5.043
138.138	3.869
139.603	5.301
142.184	4.242
142.202	4.442
146.244	4.757
147.536	4.242
147.630	5.301
150.247	4.643
151.610	4.929
156.918	4.443
158.309	5.044
158.350	5.502
160.893	4.013
160.962	4.786
160.977	4.958
161.013	5.359
167.687	5.187
167.733	5.703
168.907	3.871
169.040	5.359
170.439	6.046
171.682	4.987
174.404	5.502
174.424	5.731
174.434	5.846
179.729	5.216
179.803	6.047
181.090	5.474
182.425	5.446
185.086	5.274
187.815	5.875
190.475	5.703
190.539	6.419
195.860	6.076
198.515	5.847
201.221	6.190
202.543	6.019
209.291	6.677
213.233	5.876
215.947	6.305
222.639	6.334
231.990	6.192
237.375	6.564
252.154	7.280
257.539	7.652
499.979	11.010
503.956	10.610
517.421	11.583
523.970	10.009
537.537	12.128
538.701	10.182
545.484	11.241
552.237	11.957
554.872	11.499
570.828	10.412
570.943	11.700
576.282	11.557
581.554	10.670
581.594	11.128
592.338	11.586
592.368	11.930
592.468	13.046
597.750	12.273
603.066	11.873
607.130	12.445
613.788	12.102
613.801	12.245
614.968	10.327
616.520	12.732
616.551	13.076
620.498	12.331
628.514	12.217
635.208	12.275
640.580	12.504
645.860	11.703
651.262	12.275
651.270	12.361
651.293	12.619
655.247	11.961
664.576	11.560
665.957	12.047
675.373	12.620
678.008	12.162
683.410	12.734
694.031	11.819
702.162	12.993
720.848	12.507
723.572	13.051
736.914	12.650
737.062	14.311
747.553	11.935
756.979	12.623
770.357	12.623
787.766	12.824
803.863	13.311
807.754	11.937
807.843	12.939
845.352	13.513];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Kimu1995';

data.WN = [ ... % weight weight (g), fecundity (#)
11.129	16137.485
12.969	17225.353
17.592	50837.352
19.338	23916.609
23.451	40231.753
23.918	51624.960];
units.WN = {'g', '#'};  label.WN = {'wet weight', 'fecundity'};  
temp.WN = C2K(26);  units.temp.WN = 'K'; label.temp.WN = 'temperature'; 
bibkey.WN = 'Pete1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temeratures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00437*(TL in cm)^3.1';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72CMT'; % Cat of Life
metaData.links.id_ITIS = '551265'; % ITIS
metaData.links.id_EoL = '223192'; % Ency of Life
metaData.links.id_Wiki = 'Limnothrissa_miodon'; % Wikipedia
metaData.links.id_ADW = 'Limnothrissa_miodon'; % ADW
metaData.links.id_Taxo = '178865'; % Taxonomicon
metaData.links.id_WoRMS = '1026860'; % WoRMS
metaData.links.id_fishbase = 'Limnothrissa-miodon'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Limnothrissa_miodon}}';  
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
bibkey = 'Kimu1995'; type = 'Article'; bib = [ ... 
'author = {S. Kimura}, ' ... 
'year = {1995}, ' ...
'title = {Growth of the clupeid fishes, \emph{Stolothrissa tanganicae} and \emph{Limnothrissa miodon}, in the {Z}ambian waters of {L}ake {T}anganyika}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {47}, ' ...
'pages = {569-575}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pete1999'; type = 'Misc'; bib = [ ...
'author = {Happy K. Peter}, ' ... 
'year = {1999}, ' ...
'title = {Fecundity and egg sizes of pelagic fishes, \emph{Stolothrissa tanganicae} and \emph{Limnothrissa miodon} in relation to size of the fish}, ' ...
'note = {No date found, supervised by Peter McIntyre}, ' ...
'howpublished = {\url{https://www.geo.arizona.edu/nyanza/pdf/Peter.pdf}}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Limnothrissa-miodon.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
