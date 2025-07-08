function [data, auxData, metaData, txtData, weights] = mydata_Zelotomys_woosnami
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Zelotomys_woosnami'; 
metaData.species_en = 'Woosnam''s broad-headed mouse'; 

metaData.ecoCode.climate = {'BWh','BWk','BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH','xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 05];              

%% set data
% zero-variate data

data.tg = 31;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 35;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'BirkNel1977';   
  temp.tx = C2K(36.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 129;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(36.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3.6*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 3.8;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BirkNel1977';
data.Wwi = 54.5;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2.2*4/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'BirkNel1977';   
  temp.Ri = C2K(36.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.7 pups per litter; 4 litters per yr';
  

% univariate data

% time-weight
data.tWw = [ ...
0.086	3.778
2.232	5.331
3.842	7.058
5.182	8.872
6.657	10.777
8.489	13.225
10.143	15.492
12.199	18.213
14.031	20.482
15.998	22.303
18.322	25.206
19.887	26.123
21.719	28.932
24.222	32.377
25.294	33.558
27.038	35.107
29.452	37.382
31.821	39.657
34.014	39.771
35.846	42.670
37.993	43.143
39.826	44.153];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(36.6);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'BirkNel1977';  
   
%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;

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
D1 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '5CZW6'; % Cat of Life
metaData.links.id_ITIS = '585616'; % ITIS
metaData.links.id_EoL = '1179464'; % Ency of Life
metaData.links.id_Wiki = 'Zelotomys_woosnami'; % Wikipedia
metaData.links.id_ADW = 'Zelotomys_woosnami'; % ADW
metaData.links.id_Taxo = '89331'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001878'; % MSW3
metaData.links.id_AnAge = 'Zelotomys_woosnami'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zelotomys_woosnami}}';
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
bibkey = 'BirkNel1977'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00445096.1977.11447588}, ' ...
'author = {P. J. Birkenstock and J. A. J. Nel}, ' ... 
'year = {1977}, ' ...
'title = {Laboratory and Field Observations on \emph{Zelotomys woosnami} ({R}odentia: {M}uridae)}, ' ...
'journal = {Zoologica Africana}, ' ...
'volume = {12(2)}, ' ...
'pages = {429-443}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Zelotomys_woosnami}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

