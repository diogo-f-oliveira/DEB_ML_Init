function [data, auxData, metaData, txtData, weights] = mydata_Myotis_blythii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Myotis_blythii'; 
metaData.species_en = 'Lesser mouse-eared bat'; 

metaData.ecoCode.climate = {'BSk','BWk','Csa','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 24]; 

%% set data
% zero-variate data

data.tg = 69;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 421;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Males: 502 d';
data.am = 33*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 8.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'Shar2004';
data.Wwi = 30;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Shar2004';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litters per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.606	8.508
0.848	11.759
0.959	10.237
2.594	15.148
2.827	15.771
2.944	16.255
2.945	16.532
2.953	19.022
2.955	19.644
6.867	13.765
7.100	14.387
7.102	15.148
7.107	16.532
7.109	17.292
7.113	18.261
7.116	19.368
7.120	20.543
7.123	21.304
7.127	22.619
10.014	21.719
10.018	22.826
10.372	24.970
11.750	22.273
11.984	23.034
11.990	24.901
13.348	16.186
13.363	20.543
13.564	11.482
13.585	17.708
13.596	21.166
13.599	21.996
13.840	24.970
14.305	25.731
16.836	21.996
16.964	25.870
17.073	23.725
17.315	26.976
20.382	10.583
20.517	16.324
20.529	20.059
20.867	17.431
20.870	18.330
20.889	23.933
20.966	12.312
20.989	19.229
20.995	21.166
27.573	17.569
27.808	18.883
27.945	25.316
31.608	14.249
31.628	20.336
31.637	23.034
31.864	21.719
39.987	30.850
40.072	21.719
40.085	25.731
40.088	26.423
40.190	22.549
40.192	23.103
40.194	23.656
40.219	31.334
40.223	32.510
40.321	27.184
40.429	24.694
40.441	28.360
54.308	26.700
54.407	21.512
54.426	27.253
54.640	22.134
54.642	22.895
54.646	24.071
54.784	30.919
69.557	23.449
69.561	24.417
69.564	25.385
69.566	26.146
69.577	29.466
84.481	26.561
85.064	28.083
85.068	29.190];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Shar2004';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Body temperature is guessed';
D3 = 'scaled function response during lactation is assume to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '8LZ54'; % Cat of Life
metaData.links.id_ITIS = '632003'; % ITIS
metaData.links.id_EoL = '327571'; % Ency of Life
metaData.links.id_Wiki = 'Myotis_blythii'; % Wikipedia
metaData.links.id_ADW = 'Myotis_blythii'; % ADW
metaData.links.id_Taxo = '64681'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13802363'; % MSW3
metaData.links.id_AnAge = 'Myotis_blythii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myotis_blythii}}';
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
bibkey = 'Shar2004'; type = 'Article'; bib = [ ... 
'doi = {10.1515/mamm.2004.027}, ' ...
'author = {Sharifi, Mozafar}, ' ... 
'year = {2004}, ' ...
'title = {Postnatal growth in \emph{Myotis blythii} ({C}hiroptera, {V}espertilionidae)}, ' ...
'journal = {Mammalia}, ' ...
'volume = {68(4)}, ' ...
'pages = {283-289}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDBarr1993'; type = 'Book'; bib = [ ...  
'author = {David MacDonald and Priscilla Barrett}, ' ...
'year = {1993}, ' ...
'title  = {Mammals of Britain and Europe}, ' ...
'publisher = {HarperCollins, London}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Myotis_blythii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

