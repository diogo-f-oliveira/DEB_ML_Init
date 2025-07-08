function [data, auxData, metaData, txtData, weights] = mydata_Caracal_caracal
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Caracal_caracal'; 
metaData.species_en = 'Caracal'; 
metaData.ecoCode.climate = {'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm', 'xiCvb'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(39.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 07 24];              

%% set data

% zero-variate data
data.tg = 74;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 122;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 465;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20.3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 165; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 16000;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'Wiki';

data.Ri  = 3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter; 1 litter per yr';


% uni-variate data
% t-W data
data.tW = [ ... % time since birth (wk), wet weight (kg)
 2  0.46
 3  0.52
 5  0.74
 6  0.91
 7  1.34
 8  1.53
 9  1.87
10  2.21
11  2.32
12  2.83
13  3.80
14  4.00
15  4.44
16  4.80
17  5.00
18  5.40
19  6.40
20  6.60
21  6.80
22  6.80
23  7.20
24  7.60
25  8.00
26  8.30
27  8.80
32 10.50
35 11.20];
data.tW(:,1) =  7 * data.tW(:,1);
units.tW   = {'d', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.0);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Grob1991';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 0.1;
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'QZRR'; % Cat of Life
metaData.links.id_ITIS = '552775'; % ITIS
metaData.links.id_EoL = '312855'; % Ency of Life
metaData.links.id_Wiki = 'Caracal_caracal'; % Wikipedia
metaData.links.id_ADW = 'Caracal_caracal'; % ADW
metaData.links.id_Taxo = '167589'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000014'; % MSW3
metaData.links.id_AnAge = 'Caracal_caracal'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Caracal_caracal}}';
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
bibkey = 'Grob1991'; type = 'Article'; bib = [ ... 
'author = {Grobler, J. H.}, ' ... 
'year = {1991}, ' ...
'title = {Growth of a male caracal kitten \emph{Felis caracal} in the {M}ountain {Z}ebra {N}ational {P}ark}, ' ...
'journal = {Koedoe}, ' ...
'volume = {25}, ' ...
'pages = {117--119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Caracal_caracal}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

