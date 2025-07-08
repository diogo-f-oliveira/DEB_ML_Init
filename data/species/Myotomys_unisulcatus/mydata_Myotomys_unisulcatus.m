function [data, auxData, metaData, txtData, weights] = mydata_Myotomys_unisulcatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Myotomys_unisulcatus'; 
metaData.species_en = 'Bush vlei rat'; 

metaData.ecoCode.climate = {'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 17];              

%% set data
% zero-variate data

data.tg = 37;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Pill2001';   
  temp.tg = C2K(33);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 8;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Pill2001';   
  temp.tx = C2K(33);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 35;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Pill2001';
  temp.tp = C2K(33); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(33); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 9.6;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Pill2001';
  comment.Wwb = '6.1-9.6 g';
data.Wwi = 135;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Pill2001';

data.Ri  = 2.5*6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(33); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-3 pups per litter; assumed 6 litter per yr assumed';

% univariate data
data.tWw = [ ... % time since birth (d), weight (g)
0.165	10.411
7.107	16.949
14.215	24.938
21.157	37.998
27.934	50.091
35.041	58.804
42.149	61.720
47.769	67.772
54.215	70.928
62.975	75.780
70.083	77.246
77.355	80.646
84.298	80.662
91.405	83.095
98.512	88.185];
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(33);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'Pill2001';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb;
weights.tWw = 10 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '456HT'; % Cat of Life
metaData.links.id_ITIS = '970915'; % ITIS
metaData.links.id_EoL = '1179581'; % Ency of Life
metaData.links.id_Wiki = 'Myotomys_unisulcatus'; % Wikipedia
metaData.links.id_ADW = 'Myotomys_unisulcatus'; % ADW
metaData.links.id_Taxo = '2677503'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001888'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myotomys_unisulcatus}}';
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
bibkey = 'Pill2001'; type = 'Article'; bib = [ ... 
'doi = {10.1017/s0952836901001017}, ' ...
'author = {Pillay, N.}, ' ... 
'year = {2001}, ' ...
'title = {Reproduction and postnatal development in the bush Karoo rat \emph{Otomys unisulcatus} ({M}uridae, {O}tomyinae)}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {254(4)}, ' ...
'pages = {515–520}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

