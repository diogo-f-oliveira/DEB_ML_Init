function [data, auxData, metaData, txtData, weights] = mydata_Raconda_russeliana

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Pristigasteridae';
metaData.species    = 'Raconda_russeliana'; 
metaData.species_en = 'Raconda'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'piMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCik'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-N';'Ww-N'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 22];

%% set data
% zero-variate data
data.ab = 6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Varg1961';   
  temp.am = C2K(28.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;     units.Lp = 'cm';   label.Lp = 'std length at puberty';bibkey.Lp = 'Varg1961';
data.Li = 19;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'Varg1961';
  comment.Li = 'max total length 245 mm';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Varg1961';
  comment.Wwb = 'based on egg diameter of 0.866 mm: pi/6*0.08^3';
data.Wwp = 7.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Varg1961';
data.Wwi = 34;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Varg1961';
  comment.Wwi = 'based on 0.00832*Li^3.05, see F1, gives 66.1 g';

% uni-variate data
data.tL = [ ... % time since birth (yr), std length (cm)
    0  8.8
    1 13.8
    2 16.3
    3 18.3
    4 20.3
    5 23.3];
data.tL(:,1) = (0.9 + data.tL(:,1)) * 365;
units.tL = {'d', 'cm'};  label.tL = {'time since birth','std length'};  
  temp.tL = C2K(28.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Varg1961';

% length-fecundity
data.LN = [ ... std length (cm), fecundity (#)
12.253	1338.681
13.282	2334.121
13.729	2656.711
14.246	2439.821
14.747	2991.504
15.195	2855.665
15.695	3919.710
16.210	4403.947
16.779	4793.679
17.198	5426.444
17.726	6166.831
18.214	6300.565
18.715	6771.349];
units.LN = {'cm', '#'};  label.LN = {'std length','fecundity'};  
  temp.LN = C2K(28.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'Varg1961';
 
% weight-fecundity
data.WN = [ ... weight (g), fecundity (#)
7.311	1207.547
11.235	2296.092
12.238	2936.323
12.332	2335.243
13.019	2545.020
13.569	1542.892
13.795	2394.122
14.888	2683.694
16.502	3333.432
17.272	3452.989
17.603	3172.245
17.977	2771.265
18.163	5645.901
18.543	2961.110
18.648	3812.442
19.195	2930.516
20.107	4081.675
20.143	4291.995
20.219	4562.382
20.463	2548.822
20.535	5022.886
20.754	6254.757
21.052	5613.440
21.160	4311.180
21.190	6815.328
21.205	4100.791
21.503	3419.407
22.053	4370.534
22.139	4180.145
22.153	3478.965
22.246	2887.902
22.421	4290.093
22.693	4910.901
22.841	5621.963
22.950	4279.635
23.315	4319.397
23.364	3948.739
23.463	5050.492
23.561	4249.075
23.805	6272.244
23.876	4779.697
23.885	4328.938
24.187	5470.589
24.243	4699.257
24.416	4218.311
24.524	4899.356
24.576	6321.683
24.792	3707.146
25.058	4628.460
25.871	4677.865
26.357	4797.659
26.451	6149.834
26.683	6730.609
27.322	5347.772
27.707	6419.237
28.191	4625.845
28.442	6278.390
28.966	6488.302
29.135	4214.372
29.531	6738.249
29.735	6687.995
30.389	6527.182
30.515	6326.742
30.866	7097.735
30.952	6867.279
31.293	6075.676
31.594	7267.411
31.798	5263.902
32.474	6034.624
33.763	6664.599
33.859	7906.589
34.038	5111.782];
units.WN = {'g', '#'};  label.WN = {'weight','fecundity'};  
  temp.WN = C2K(28.8);  units.temp.WN = 'K'; label.temp.WN = 'temperature'; 
bibkey.WN = 'Varg1961';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4R8QS'; % Cat of Life
metaData.links.id_ITIS = '551337'; % ITIS
metaData.links.id_EoL = '46562755'; % Ency of Life
metaData.links.id_Wiki = 'Raconda_russeliana'; % Wikipedia
metaData.links.id_ADW = 'Raconda_russeliana'; % ADW
metaData.links.id_Taxo = '185693'; % Taxonomicon
metaData.links.id_WoRMS = '282538'; % WoRMS
metaData.links.id_fishbase = 'Raconda-russeliana'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Raconda_russeliana}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...Photopectoralis-bindus
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Varg1961'; type = 'Article'; bib = [ ... 
'author = {T. J. Varghese }, ' ...
'year = {1961}, ' ...
'title = {OBSERVATIONS ON THE BIOLOGY OF \emph{Raconda russeliana} ({G}RAY)}, ' ... 
'journal = {Indian Journal of Fisheries}, ' ...
'volume = {8(1)}, '...
'pages = {96-106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Raconda-russeliana.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  