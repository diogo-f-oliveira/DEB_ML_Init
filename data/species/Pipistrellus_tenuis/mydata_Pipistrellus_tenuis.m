function [data, auxData, metaData, txtData, weights] = mydata_Pipistrellus_tenuis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Pipistrellus_tenuis'; 
metaData.species_en = 'Least pipistrelle'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 23]; 

%% set data
% zero-variate data

data.tg = 60;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'IsaaMari1996';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 33;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'IsaaMari1996';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 120;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'IsaaMari1996';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 34*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.48; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'IsaaMari1996';
data.Wwi = 4.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'ADW';
  comment.Wwi = 'Wiki: 6-8 g';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter; 2 litters per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.481	0.576
0.642	0.481
1.925	0.821
1.926	0.736
2.888	1.114
4.492	1.407
5.775	1.502
5.776	1.285
5.936	1.587
5.937	1.200
7.701	1.597
7.861	1.804
8.824	1.597
8.825	1.503
9.786	1.880
9.787	1.786
10.267	1.984
10.268	1.588
10.909	2.183
11.872	1.692
12.834	2.381
12.835	1.806
12.836	1.995
12.837	2.098
13.957	2.486
14.118	2.599
14.119	1.759
15.080	2.486
15.241	2.260
16.043	2.297
16.044	2.486
16.045	2.373
16.364	2.147
16.365	2.194
17.326	2.298
17.968	2.374
17.969	2.468
18.289	2.798
20.053	2.299
20.054	2.525
21.016	2.393
21.176	2.488
22.299	2.639
22.460	2.601
23.262	2.790
23.583	2.517
23.904	2.517
24.064	2.866
24.065	2.687
24.066	2.413
24.225	2.791
24.226	2.602
24.866	2.593
25.508	2.791
26.310	2.574
26.952	2.490
28.075	2.716
28.076	2.801
28.235	2.905
30.321	2.632
31.123	2.991
31.124	3.095
33.209	3.095
33.210	2.680
34.011	3.520
34.012	2.907
34.332	3.294
35.294	2.794
35.615	3.294
36.096	2.408
37.219	3.210
37.540	3.427
38.021	3.003
39.305	3.616
39.465	3.512
41.070	3.107
41.071	2.617
42.353	3.211
44.439	3.212
47.166	3.704
47.167	3.930
48.128	2.911
50.214	3.629
52.460	3.035
54.225	3.215
58.396	3.518
59.358	3.622
62.406	3.331
63.369	3.020
67.540	3.823
69.465	3.729];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'IsaaMari1996';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.tp = 3 * weights.tp;

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
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
D3 = 'scaled function response during lactation is assume to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5KGHH'; % Cat of Life
metaData.links.id_ITIS = '948477'; % ITIS
metaData.links.id_EoL = '289430'; % Ency of Life
metaData.links.id_Wiki = 'Pipistrellus_tenuis'; % Wikipedia
metaData.links.id_ADW = 'Pipistrellus_tenuis_mimus'; % ADW
metaData.links.id_Taxo = '2680053'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13802115'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pipistrellus_tenuis}}';
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
bibkey = 'IsaaMari1996'; type = 'Article'; bib = [ ... 
'author = {S. Suthakar Isaac and G. Marimuthu}, ' ... 
'year = {1996}, ' ...
'title = {Postnatal Growth and Age Estimation in the {I}ndian Pygmy Bat \emph{Pipistrellus mimus}}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {77(1)}, ' ...
'pages = {199-204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pipistrellus_tenuis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

