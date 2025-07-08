function [data, auxData, metaData, txtData, weights] = mydata_Gobiomorus_dormitor

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Eleotridae';
metaData.species    = 'Gobiomorus_dormitor'; 
metaData.species_en = 'Bigmouth Sleeper'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Md'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'L-dL'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 21];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 30; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 90; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 8.7e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BachNeal2004';
  comment.Wwb = 'based on egg diameter of 0.55 mm : pi/6*0.055^3';
data.Wwi = 7.5e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

data.GSI = 0.13 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female'; bibkey.GSI = 'BachNeal2004'; 
  temp.GSI = C2K(26); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% length-change in length
data.LdL = [ ... % total length (cm), change in total length (cm/d)
18.034200	0.009514
18.320627	0.007971
19.651585	0.000086
25.735305	-0.000043
27.310652	0.003471
28.963306	0.004286
29.832561	0.000857
30.205558	0.003729
30.722836	-0.000043
30.943356	-0.003514
32.289633	-0.003557
32.502672	-0.007929
34.196651	0.003857
36.658710	0.000043];
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'total length', 'change in total length'};  
temp.LdL   = C2K(26);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Bach2002';

% length - weight
data.LWw = [ ... % log10 total length (mm), log10 wet weight (g)
1.7879	0.7156
1.8497	0.4823
1.9273	0.8489
1.9600	0.4759
1.9818	0.8661
1.9976	0.8427
2.0012	1.0408
2.0145	1.0931
2.0145	0.9009
2.0230	0.9941
2.0327	1.0581
2.0412	0.9590
2.0497	1.0988
2.0545	0.8949
2.0606	0.9997
2.0667	1.1744
2.0703	1.1569
2.0776	1.0987
2.0800	0.9996
2.0812	1.0404
2.0873	1.1976
2.0921	1.3083
2.0958	1.1568
2.1018	1.1859
2.1018	0.9704
2.1042	1.1160
2.1079	1.1975
2.1139	1.2150
2.1152	1.1800
2.1188	1.3023
2.1212	1.1916
2.1236	1.2615
2.1273	1.2732
2.1333	1.1741
2.1345	1.2207
2.1406	1.3605
2.1442	1.3022
2.1491	1.4129
2.1491	1.3721
2.1564	1.3429
2.1564	1.3022
2.1636	1.4536
2.1685	1.5060
2.1697	1.3603
2.1745	1.4186
2.1952	1.4068
2.1976	1.5291
2.2024	1.4534
2.2085	1.5000
2.2218	1.5290
2.2218	1.5756
2.2303	1.6455
2.2352	1.5523
2.2558	1.6162
2.2606	1.6919
2.2630	1.6337
2.2691	1.6861
2.2703	1.6278
2.2788	1.7093
2.2812	1.6918
2.2861	1.7559
2.2861	1.6627
2.2897	1.7267
2.3079	1.8257
2.3139	1.7849
2.3176	1.7033
2.3224	1.8198
2.3382	1.8488
2.3491	1.8896
2.3527	1.9245
2.3648	1.9070
2.3709	1.9885
2.3721	2.0351
2.3818	1.9477
2.3830	2.0059
2.3915	2.0874
2.3927	2.0466
2.4012	2.2039
2.4012	2.0874
2.4097	2.0291
2.4109	2.0640
2.4218	2.0931
2.4303	2.1571
2.4327	2.2212
2.4339	2.0930
2.4376	2.0697
2.4400	2.3318
2.4436	2.1571
2.4448	2.0930
2.4521	2.2095
2.4533	2.2386
2.4558	2.1162
2.4594	2.2036
2.4594	2.1919
2.4606	2.2735
2.4642	2.2327
2.4679	2.3142
2.4703	2.1802
2.4727	2.2967
2.4727	2.2327
2.4824	2.2559
2.4861	2.3491
2.4885	2.2326
2.4933	2.3957
2.4933	2.3141
2.4970	2.2558
2.5018	2.5529
2.5030	2.3956
2.5067	2.3665
2.5103	2.1567
2.5127	2.4305
2.5139	2.3198
2.5139	2.5004
2.5152	2.3664
2.5176	2.4072
2.5248	2.3198
2.5297	2.5295
2.5358	2.4537
2.5358	2.3896
2.5370	2.5353
2.5382	2.3721
2.5442	2.4711
2.5455	2.5061
2.5455	2.1974
2.5624	2.5002
2.5758	2.4710
2.6000	2.6922];
data.LWw = 10.^data.LWw; % remove log transform
data.LWw(:,1) = data.LWw(:,1)/10; % convert mm to cm
units.LWw   = {'cm', 'g'};  label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'Bach2002';


%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 0 * weights.Wwi;
weights.LdL = 0 * weights.LdL;

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
D1 = 'males are assumed not to differ from females';
D2 = 'Growth data has too much scatter to estimate both [p_M] and v';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6KN86'; % Cat of Life
metaData.links.id_ITIS = '171921'; % ITIS
metaData.links.id_EoL = '46576887'; % Ency of Life
metaData.links.id_Wiki = 'Gobiomorus'; % Wikipedia
metaData.links.id_ADW = 'Gobiomorus_dormitor'; % ADW
metaData.links.id_Taxo = '46545'; % Taxonomicon
metaData.links.id_WoRMS = '280896'; % WoRMS
metaData.links.id_fishbase = 'Gobiomorus-dormitor'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gobiomorus_dormitor}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gobiomorus-dormitor.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/gobiomorus dormitor.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bach2002'; type = 'phdthesis'; bib = [ ... 
'author = {Nathan Mitchell Bacheler}, ' ... 
'year = {2002}, ' ...
'title = {Ecology of bigmouth sleepers ({E}leotridae: \emph{Gobiomorus dormitor}) in a {P}uerto {R}ico reservoir}, ' ...
'school = {North Carolina State Univ.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BachNeal2004'; type = 'article'; bib = [ ... 
'author = {Nathan Mitchell Bacheler and J. Wesley Neal and Richard L. Noble}, ' ... 
'year = {2004}, ' ...
'title = {Reproduction of a landlocked diadromous fish population: {B}igmouth sleepers \emph{Gobiomorus dormitor} in a reservoir in {P}uerto Rico}, ' ...
'journal = {Caribbean Journal of Science}, ' ...
'volume = {40(2)}, ' ...
'pages = {223-231}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


