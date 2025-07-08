function [data, auxData, metaData, txtData, weights] = mydata_Ateles_paniscus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Atelidae';
metaData.species    = 'Ateles_paniscus'; 
metaData.species_en = 'Red-faced spider monkey'; 
metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(36.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 11]; 

%% set data
% zero-variate data

data.tg = 229;    units.tg = 'd';    label.tg = 'gestation time';            bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 795;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1516;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1280;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.0);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 46*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(36.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 480;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 8400; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
data.Wwim = 9100; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight';  bibkey.Wwim = 'Wiki';

data.Ri  = 0.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 child per litter, 0.5 litters per yr';   
  
% univariate data

% time-weight
data.tW = [ ... % time since birth (d), weight (g)
  0  480
  2  495
 13  590
 20  660
 27  640
 44  780
 58  810
 83  850
 99  940
215 1210];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Gens1965';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Links
metaData.links.id_CoL = 'J8PD'; % Cat of Life
metaData.links.id_ITIS = '572953'; % ITIS
metaData.links.id_EoL = '323933'; % Ency of Life
metaData.links.id_Wiki = 'Ateles_paniscus'; % Wikipedia
metaData.links.id_ADW = 'Ateles_paniscus'; % ADW
metaData.links.id_Taxo = '65865'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100407'; % MSW3
metaData.links.id_AnAge = 'Ateles_paniscus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ateles_paniscus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ateles_paniscus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gens1965'; type = 'Article'; bib = [ ... 
'author = {Gensrh, W.}, ' ... 
'doi = {10.1111/j.1748-1090.1965.tb01591.x}, ' ...
'year = {1965}, ' ...
'title = {BIRTH AND REARING OF A BLACK-FACED SPIDER MONKEY \emph{Ateles paniscus chamek} {H}umboldt AT {D}RESDEN {Z}OO}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {5}, ' ...
'pages = {110}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

