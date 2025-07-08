  function [data, auxData, metaData, txtData, weights] = mydata_Catostomus_tahoensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Catostomus_tahoensis'; 
metaData.species_en = 'Tahoe sucker'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 30]; 

%% set data
% zero-variate data
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'KennSigl1978'; 
  comment.Lp = 'based on tp 4/5 yr and tL data';
data.Li = 61;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 3.1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'KennSigl1978';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwp = 33.2; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','KennSigl1978'};
  comment.Wwp = 'based on 0.01000*Lp^3.04, see F1';
data.Wwi = 2.68e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';

% univariate data

% time-length
data.tL = [ ... % year class (yr), fork length (cm)
    4 14.7
    5 17.0
    6 20.1
    7 22.9
    8 24.9
    9 27.7
   10 31.0];
data.tL(:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/0.98; % convert FL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KennSigl1978';
comment.tL = 'Data form Lake Tahoe';

% time - weight
data.tWw = [ ... % year class (yr), wet weight (g)
    4  45
    5  72
    6 118
    7 172
    8 222
    9 304
   10 426];
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'wet weight'};  
temp.tWw = C2K(14);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'KennSigl1978';
comment.tWw = 'Data form Lake Tahoe';

% length - fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
    14.543	2667.848
15.529	3931.875
16.102	3935.876
16.624	3520.473
16.932	4884.537
17.197	3524.475
17.871	4576.806
18.032	2901.737
18.549	4162.494
19.127	2385.579
20.161	4907.090
20.367	5746.620
20.725	8263.406
20.893	4074.102
20.941	5541.104
21.042	6798.951
21.301	7115.049
21.305	5753.168
21.411	4915.820
21.506	8164.101
21.772	6385.004
21.883	4081.014
22.133	7539.909
22.286	8902.877
22.388	9636.923
22.405	3456.093
22.548	8171.377
22.552	6809.500
22.852	11211.591
23.229	6814.229
23.391	4720.120
23.529	11321.081
23.584	10273.847
23.747	7865.464
23.804	6189.668
24.156	10382.609
24.205	11430.571
24.212	9230.614
24.628	9233.524
24.688	6719.653
24.788	8187.018
24.932	12378.500
25.154	7665.763
25.402	11962.734
25.671	8821.759
25.764	12908.121
26.381	15636.239
26.394	11131.570
26.438	13855.686
26.544	13227.856
26.555	9351.744
26.972	9145.132
27.265	16270.985
27.469	17634.317
27.837	16379.743
27.854	10617.954
27.896	13970.633
28.059	11771.767
28.209	13972.815
28.301	18163.938
28.990	13873.510
29.458	14086.306
29.971	17127.976
30.135	14091.035
30.140	12310.119
30.144	10948.238
30.184	15243.758
30.355	10111.617
30.946	22163.362
31.212	20174.742
31.371	19023.475
31.375	17871.116
31.645	14206.341
31.654	11377.826
31.794	16931.190
31.901	15884.319
31.996	19132.601
32.118	12952.499
32.185	26048.204
32.259	18191.583
32.316	16620.548
32.366	17249.470
32.566	20184.200
32.622	18822.687
32.678	17565.931
32.684	15470.736
32.685	14946.935
32.928	21234.344
33.199	17255.290
33.238	21969.845
33.282	24903.484
33.397	21132.861
33.503	20190.748
33.701	23858.797
33.715	19144.605
33.767	37583.060
33.912	23022.172
34.114	25433.106
34.182	19776.436
34.215	26481.431
34.329	23025.082
34.386	21349.290
34.393	18730.294
34.451	16530.701
34.646	21351.109
34.745	23027.992
34.892	26590.921
35.068	19363.580
35.391	15908.691
35.439	17166.170
35.946	22198.283
35.957	18217.410
36.334	13924.800
36.367	20525.033
36.404	25868.151
36.614	25241.043
36.933	23043.270
37.042	21263.081
37.564	20847.678
37.692	30696.193
37.966	26088.581
37.969	25040.983
38.408	16977.386
38.440	24206.177
39.066	24001.024
39.122	22429.989
39.432	23375.009
39.446	18346.538
40.646	35850.159
40.702	34802.925
41.182	49158.658
41.391	30407.741
42.353	40157.317
42.553	24863.471
43.339	59859.437
43.823	36081.868];
data.LN(:,1) = data.LN(:,1)/0.98; % convert FL to TL
units.LN = {'d', 'cm'}; label.LN = {'time since birth', 'total length'};  
temp.LN = C2K(14);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KennSigl1978';
comment.LN = 'Data form Lake Tahoe';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000 * (TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL = 0.98 cm';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'RW5D'; % Cat of Life
metaData.links.id_ITIS = '163914'; % ITIS
metaData.links.id_EoL = '47064977'; % Ency of Life
metaData.links.id_Wiki = 'Catostomus_tahoensis'; % Wikipedia
metaData.links.id_ADW = 'Catostomus_tahoensis'; % ADW
metaData.links.id_Taxo = '166654'; % Taxonomicon
metaData.links.id_WoRMS = '1020100'; % WoRMS
metaData.links.id_fishbase = 'Catostomus-tahoensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Catostomus_tahoensis}}';  
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
bibkey = 'KennSigl1978'; type = 'article'; bib = [ ... 
'author = {Joseph L. Kennedy and W. F. Sigler and Paul A. Kucera}, ' ...
'year = {1978}, ' ...
'title = {The reproductive ecology of the {T}ahoe sucker, \emph{Catostomus tahoensis}, in {P}yramid {L}ake, {N}evada}, ' ... 
'journal = {Great Basin Naturalist}, ' ...
'volume = {38(2)}, ' ...
'pages = {Article 3}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Catostomus-tahoensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

