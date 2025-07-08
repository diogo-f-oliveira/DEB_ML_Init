function [data, auxData, metaData, txtData, weights] = mydata_Neofiber_alleni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Neofiber_alleni'; 
metaData.species_en = 'Round-tailed muskrat'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 15];              

%% set data
% zero-variate data

data.tg = 27.5;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Birk1963';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '26-29 d';
data.tx = 15;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 45;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Birk1963';
  temp.tp = C2K(38.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '90-100';
data.am = 5.2*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Wwb = 12;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Birk1963';
data.Wwx = 155;   units.Wwx = 'g';     label.Wwx = 'wet weight at waening';     bibkey.Wwx = 'Birk1963';
  comment.Wwx = '130-180 g';
data.Wwi = 262;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'Wiki';
data.Wwim = 279;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'Wiki';

data.Ri  = 4.5*2.2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Birk1963';   
  temp.Ri = C2K(38.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.2 pups per litter; 4-5 litters per yr';
   
% univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
1.735	19.134
3.006	15.528
4.282	24.194
5.920	27.869
6.099	21.055
8.103	32.012
8.737	24.754
9.013	33.851
10.832	36.167
12.105	38.015
12.285	32.110
14.291	48.521
18.112	56.793
18.113	58.612
18.201	50.886
21.028	75.044
21.117	71.864
24.573	75.128
27.212	82.008
28.311	103.398
33.132	113.057
33.402	105.336
35.223	113.561
36.324	140.405
38.416	141.818
38.417	146.364
42.331	158.274
42.517	171.006
45.056	154.248
45.140	132.886
48.700	174.788
48.707	194.334
50.148	156.641
52.236	147.599
56.353	220.424
56.436	198.153
61.427	172.816
61.429	178.271
62.610	177.844
62.793	181.030
63.441	210.591
63.721	231.507
73.627	224.468
73.637	250.832
74.896	213.589
75.716	217.245
79.621	208.246
79.631	233.701];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(38.1);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'Birk1963';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '46H8X'; % Cat of Life
metaData.links.id_ITIS = '180357'; % ITIS
metaData.links.id_EoL = '328445'; % Ency of Life
metaData.links.id_Wiki = 'Neofiber_alleni'; % Wikipedia
metaData.links.id_ADW = 'Neofiber_alleni'; % ADW
metaData.links.id_Taxo = '62755'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000328'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neofiber_alleni}}';
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
bibkey = 'Birk1963'; type = 'Article'; bib = [ ... 
'author = {Dale E. Birkenholz}, ' ... 
'year = {1963}, ' ...
'title = {A Study of the Life History and Ecology of the Round-Tailed Muskrat (\emph{Neofiber alleni} {T}rue) in North-Central {F}lorida}, ' ...
'journal = {Ecological Monographs}, ' ...
'volume = {33(3)}, ' ...
'pages = {255-280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Neofiber_alleni/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

