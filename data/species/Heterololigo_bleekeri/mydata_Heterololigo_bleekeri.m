function [data, auxData, metaData, txtData, weights] = mydata_Heterololigo_bleekeri

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Heterololigo_bleekeri'; 
metaData.species_en = 'Spear squid'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14.7); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 04 16];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 16]; 

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'Wiki';   
  temp.am = C2K(14.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.32;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';     bibkey.Lb  = 'IkedSaku2005';
  comment.Lb = 'based on Doryteuthis_pealeii';
data.Lp  = 25;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';     bibkey.Lp  = 'guess';
  comment.Lb = 'based on Doryteuthis_pealeii: (17/27)*40';
data.Li  = 40;  units.Li  = 'cm'; label.Li  = 'mantle length at death';     bibkey.Li  = 'sealifebase';

data.Wwi  = 2e3;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'guess';
  comment.Wwi = 'based in length-weight of Doryteuthis_opalescens: (40/14)^3*86';

data.Ni  = 1.2e4; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'guess';   
  temp.Ni = C2K(14.7);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on Doryteuthis_pealeii and corrected for mantle length at birth and death: (0.2/0.32)^3 * (40/27)^3 * 1.5e4';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
8.136	0.344
8.137	0.364
8.138	0.428
13.046	0.459
13.327	0.367
15.150	0.431
15.291	0.399
16.693	0.447
17.816	0.411
18.236	0.507
23.848	0.558
28.758	0.506
29.038	0.466
30.862	0.682
32.124	0.509
32.125	0.461
32.826	0.589
32.966	0.706
33.106	0.649
33.246	0.537
33.387	0.493
34.790	0.589
35.210	0.641
36.894	0.585
43.768	0.700
43.769	1.001
48.116	0.856
49.940	1.028
50.080	1.064
50.782	1.201
51.062	1.012
51.904	0.936
53.026	0.944
53.307	0.599
55.411	1.048
60.040	0.859
60.180	1.332
62.004	1.560
62.425	0.774];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(14.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'IkedSaku2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 5 * weights.Wwi;
weights.am = 5 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'End of acceleration is assumed to coincide with puberty';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6LSSW'; % Cat of Life
metaData.links.id_ITIS = '556653'; % ITIS
metaData.links.id_EoL = '489661'; % Ency of Life
metaData.links.id_Wiki = 'Heterololigo_bleekeri'; % Wikipedia
metaData.links.id_ADW = 'Loligo_bleekeri'; % ADW
metaData.links.id_Taxo = '3960595'; % Taxonomicon
metaData.links.id_WoRMS = '574562'; % WoRMS
metaData.links.id_molluscabase = '574562'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heterololigo_bleekeri}}';
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
bibkey = 'IkedSaku2005'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1365-2109.2005.01217.x}, ' ...
'author = {Yuzuru Ikeda and Ikuko Sakurazawa and Kingo Ito and Yasunori Sakurai and Gen Matsumoto}, ' ... 
'year = {2005}, ' ...
'title = {Rearing of squid hatchlings, \emph{Heterololigo bleekeri} ({K}eferstein 1866) up to 2 months in a closed seawater system}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {36}, ' ...
'pages = {409-412}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Heterololigo-bleekeri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

