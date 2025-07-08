function [data, auxData, metaData, txtData, weights] = mydata_Mannophryne_trinitatis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Aromobatidae';
metaData.species    = 'Mannophryne_trinitatis'; 
metaData.species_en = 'Yellow-throated frog'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjH', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 28]; 

%% set data
% zero-variate data

data.ab = 21;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '17 to 26 d';
data.tp = 56; units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.1;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam for females'; bibkey.Lj  = 'Melr2018';
  comment.Lj = 'based on the assumption that the smallest frog found just passed matamorphosis';
data.Li  = 2.55;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Melr2018';
  comment.Li = 'Wiki gives 2.2 cm, but in view of LW data, this must be higher';
data.Lim = 2.0;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'Wiki';

data.Wwb = 2.24e-2; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 3.5 mm: pi/6*0.35^3';
data.Wwi = 1.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Melr2018';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 12 eggs per clutch, 1 clutch per yr'; 

% uni-variate data
% time-length
data.tL = [ ... % time (d), SVL (cm)
0.800	1.137
5.700	1.092
8.900	1.115
12.800	1.176
15.900	1.195
63.100	1.431];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'SVL'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'WalsDown2005';
comment.tL = 'shelter available'; 

% time-weight
data.tW = [ ... % time (d), wet weight (g)
0.604	0.228
6.040	0.196
8.859	0.199
12.886	0.240
16.007	0.242
62.819	0.453];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(27);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'WalsDown2005';
comment.tW = 'shelter available'; 

% length-weight
WL = [ ... % wet weight (g), SVL (cm)
0.185	1.246
0.244	1.178
0.246	1.287
0.266	1.231
0.279	1.374
0.325	1.355
0.379	1.438
0.403	1.442
0.458	1.416
0.466	1.525
0.475	1.620
0.490	1.578
0.532	1.699
0.532	1.578
0.580	1.643
0.580	1.643
0.582	1.616
0.608	1.631
0.623	1.741
0.625	1.684
0.627	1.729
0.645	1.654
0.664	1.782
0.667	1.699
0.671	1.748
0.710	1.718
0.752	1.888
0.758	1.790
0.763	1.888
0.769	1.986
0.806	1.994
0.841	1.911
0.841	1.783
0.854	1.987
0.856	1.858
0.861	1.998
0.887	1.964
0.937	2.024
0.939	2.002
0.983	1.760
0.987	2.017
0.993	2.040
1.007	1.994
1.031	2.002
1.033	2.074
1.087	2.028
1.089	2.044
1.111	2.195
1.115	2.100
1.129	2.149
1.146	2.130
1.146	2.093
1.150	2.247
1.153	2.059
1.159	2.232
1.159	2.146
1.168	2.074
1.170	2.119
1.185	2.263
1.192	2.244
1.198	2.285
1.203	2.248
1.205	2.206
1.216	2.232
1.216	2.108
1.224	2.319
1.233	2.233
1.235	2.214
1.242	2.199
1.242	2.123
1.248	2.225
1.248	2.183
1.285	2.251
1.296	2.131
1.305	2.229
1.314	2.259
1.320	2.319
1.320	2.195
1.322	2.335
1.322	2.274
1.349	2.304
1.349	2.320
1.364	2.304
1.366	2.240
1.403	2.320
1.407	2.271
1.412	2.180
1.425	2.259
1.427	2.361
1.434	2.414
1.434	2.229
1.451	2.259
1.460	2.290
1.479	2.199
1.479	2.331
1.486	2.410
1.486	2.448
1.512	2.282
1.525	2.210
1.529	2.346
1.540	2.392
1.542	2.320
1.566	2.380
1.595	2.471
1.599	2.395
1.654	2.441
1.671	2.460
1.671	2.441
1.704	2.384
1.730	2.441
1.734	2.381
1.756	2.354
1.771	2.471
1.784	2.490
1.797	2.456
1.819	2.551];    
data.LW = WL(:,[2 1]);
units.LW   = {'cm', 'g'};  label.LW = {'SVL', 'wet weight'};  
bibkey.LW  = 'Melr2018';
comment.LW = 'Data by Emily Hutton';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tW = 3 * weights.tW;
weights.LW = 5 * weights.LW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3XVQB'; % Cat of Life
metaData.links.id_ITIS = '662308'; % ITIS
metaData.links.id_EoL = '311650'; % Ency of Life
metaData.links.id_Wiki = 'Mannophryne_trinitatis'; % Wikipedia
metaData.links.id_ADW = 'Mannophryne_trinitatis'; % ADW
metaData.links.id_Taxo = '47985'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Mannophryne+trinitatis'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mannophryne_trinitatis}}';
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
bibkey = 'WalsDown2005'; type = 'Article'; bib = [ ...  
'author = {Patrick T. Walsh and J. Roger Downie}, ' ...
'year = {2005}, ' ...
'title  = {THE EFFECTS OF SHELTER AVAILABILITY AND SUBSTRATE QUALITY ON BEHAVIOUR AND POST-METAMORPHIC GROWTH IN THREE SPECIES OF ANURANS: IMPLICATIONS FOR CAPTIVE BREEDING}, ' ...
'journal = {Herpetological Journal}, ' ...
'volme = {15}, ' ...
'pages = {245-255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Melr2018'; type = 'techreport'; bib = [ ...  
'author = {Jessica Melrose}, ' ...
'year = {2018}, ' ...
'title  = {Trinidad Expedition}, ' ...
'school = {Univ. Glascow}, ' ...
'howpublished = {\url{glasgowexsoc.org.uk/wp.../2018-Trinidad-Prelim-Report-Final.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Mannophryne&where-species=trinitatis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

