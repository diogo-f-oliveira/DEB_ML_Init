function [data, auxData, metaData, txtData, weights] = mydata_Lophuromys_sikapusi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Lophuromys_sikapusi'; 
metaData.species_en = 'Rusty-bellied brush-furred rat'; 

metaData.ecoCode.climate = {'Aw', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 11 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 18]; 

%% set data
% zero-variate data

data.tg = 28;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 12;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Chee1981';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 189;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'guess';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Chee1981';
data.Wwx = 13.9;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';  bibkey.Wwx = 'Chee1981';
data.Wwi = 78;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Chee1981';

data.Ri  = 3.2*3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Chee1981';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 pups per litter; 3 litters per yr assumed';
   
% univariate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
1.104	7.786
2.316	9.070
3.207	10.156
4.170	10.257
5.377	10.851
6.101	11.247
7.066	11.545
8.190	11.843
9.232	11.747
10.041	12.734
10.928	13.327
12.055	13.921
12.943	14.712
14.153	15.700
15.286	17.082
16.182	18.858
17.082	21.027
18.214	22.311
19.103	23.200
20.075	24.483
21.205	25.471
22.177	26.656
23.066	27.545
24.279	28.927
25.086	29.618
26.138	30.803
26.955	32.776
28.012	34.552
29.142	35.540
30.038	37.315
31.163	37.712
32.047	37.911
32.851	38.308
33.897	38.704
34.949	39.988
35.919	40.975
37.124	41.274
38.086	41.375
38.891	41.771
40.095	41.971];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'Chee1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7VQQW'; % Cat of Life
metaData.links.id_ITIS = '585299'; % ITIS
metaData.links.id_EoL = '47050781'; % Ency of Life
metaData.links.id_Wiki = 'Lophuromys_sikapusi'; % Wikipedia
metaData.links.id_ADW = 'Lophuromys_sikapusi'; % ADW
metaData.links.id_Taxo = '63014'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001042'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lophuromys_sikapusi}}';
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
bibkey = 'Chee1981'; type = 'Article'; bib = [ ... 
'doi = {10.1515/mamm.1981.45.4.483}, ' ...
'author = {Cheeseman, G. L. }, ' ... 
'year = {1981}, ' ...
'title = {Observations on the reproductive biology and early post-natal development of two species of {A}frican rodents}, ' ...
'journal = {Mammalia}, ' ...
'volume = {45}, ' ...
'number = {4}, ' ...
'pages = {484-491}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

