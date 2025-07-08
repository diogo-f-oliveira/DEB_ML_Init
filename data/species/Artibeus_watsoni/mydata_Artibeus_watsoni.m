function [data, auxData, metaData, txtData, weights] = mydata_Artibeus_watsoni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Phyllostomidae';
metaData.species    = 'Artibeus_watsoni'; 
metaData.species_en = 'Thomas''s fruit-eating bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs','xiHn','xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 26]; 

%% set data
% zero-variate data

data.tg = 90;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'ChavKunz2006';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'ChavKunz2006';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 180;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'ChavKunz2006';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'time since birth at puberty: 90 d';
data.am = 13*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'ChavKunz2006';
  comment.Wwb = '2.31 g for male, 2.36 g for female';
data.Wwi = 11.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'ChavKunz2006';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'ChavKunz2006';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 2 litters per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
3.942	4.741
7.806	5.200
11.117	5.743
12.063	5.995
12.852	6.246
17.109	6.747
19.869	7.248
27.043	7.999
31.064	9.004
32.011	9.507
34.928	9.799
34.929	9.001
35.007	9.274
40.999	10.277
49.041	11.258];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ChavKunz2006';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwb = 5 * weights.Wwb;

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
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '7R5ZY'; % Cat of Life
metaData.links.id_ITIS = '946071'; % ITIS
metaData.links.id_EoL = '4438521'; % Ency of Life
metaData.links.id_Wiki = 'Dermanura_watsoni'; % Wikipedia
metaData.links.id_ADW = 'Artibeus_watsoni'; % ADW
metaData.links.id_Taxo = '64468'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801395'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dermanura_watsoni}}';
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
bibkey = 'ChavKunz2006'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.2006.00171.x}, ' ...
'author = {Chaverri, G. and Kunz, T. H.}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive biology and postnatal development in the tent-making bat \emph{Artibeus watsoni} ({C}hiroptera: {P}hyllostomidae)}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {270(4)}, ' ...
'pages = {650–656}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

