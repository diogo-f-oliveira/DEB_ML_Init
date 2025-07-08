function [data, auxData, metaData, txtData, weights] = mydata_Crocidura_fuscomurina
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Crocidura_fuscomurina'; 
metaData.species_en = 'Tiny musk shrew';

metaData.ecoCode.climate = {'BSk','BWk','Cfb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 08]; 

%% set data
% zero-variate data

data.tg = 27;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(35.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 25;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(35.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 175;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(35.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2.5*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(35.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Dipp1979';
  comment.Wwb = 'EoL gives 0.82 g';
data.Wwx = 3;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'EoL';
data.Wwi = 5.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'EoL';

data.Ri  = 2 * 2.8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(35.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.8 pups per litter, guessed: 2 litters per yr';
   
% univariate data
% time-weigth data
data.tWw = [ ... % time since birth (d), wet weight (g)
    1 1.4
    2 1.6
    2 1.3
    3 1.7
    3 1.5
    5 1.5
    6 1.9
    6 1.7
    8 2.2 
    8 2.1
    9 2.3
    9 2.2
   10 2.4
   10 2.1
   11 2.6
   11 2.5
   12 2.7
   12 2.6
   13 2.8
   13 2.7
   15 2.7
   15 2.7
   17 2.5
   17 2.5
   23 3.4
   23 3.0];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(35.1);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Dipp1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'ZK4K'; % Cat of Life
metaData.links.id_ITIS = '633593'; % ITIS
metaData.links.id_EoL = '1178787'; % Ency of Life
metaData.links.id_Wiki = 'Crocidura_fuscomurina'; % Wikipedia
metaData.links.id_ADW = 'Crocidura_fuscomurina'; % ADW
metaData.links.id_Taxo = '61070'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700075'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocidura_fuscomurina}}';
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
bibkey = 'Dipp1979'; type = 'article'; bib = [ ... 
'doi = {10.1515/mamm.1979.43.1.83}, ' ...
'author = {Dippenaar, N. J.}, ' ... 
'year = {1979}, ' ...
'title = {Notes on the early post-natal development and behaviour of the tiny musk shrew, \emph{Crocidura bicolor} {B}oeage, 1889 ({I}nsectivora : {S}oricidae)}, ' ...
'journal = {Mammalia}, ' ...
'volume = {43(1)}, ' ...
'pages = {83-91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1178787/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


