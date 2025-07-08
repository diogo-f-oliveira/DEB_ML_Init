function [data, auxData, metaData, txtData, weights] = mydata_Amphisbaena_alba 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Amphisbaenidae';
metaData.species    = 'Amphisbaena_alba'; 
metaData.species_en = 'Red worm lizard'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 04 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 25];


%% set data
% zero-variate data

data.ab = 4.5*30.5;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 3*365;     units.ap = 'd';    label.ap = 'age at puberty';       bibkey.ap = 'guess';
  temp.ap = C2K(26); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 15.1*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 2.68;    units.L0  = 'cm';  label.L0  = 'egg lengt';           bibkey.L0  = 'AndreNasc2006';  
%  comment.L0 = 'egg width = 1.37 cm';
data.Lp  = 45.7;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'CollZamb1999'; 
  comment.Lp = '42.2 cm for males';
data.Li  = 75;       units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'BartBart2003';

%data.Ww0 = 4.51;    units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';      bibkey.Ww0 = 'AndreNasc2006';
data.Wwb = 4.51;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'AndreNasc2006';
  comment.Wwb = 'AndreNasc2006 gives W0 = Wb for A. mertensi';
data.Ww47 = 166.5;   units.Ww47 = 'g';  label.Ww47 = 'wet weight at SV length 47.cm'; bibkey.Ww47 = 'AndreNasc2006';
  comment.Ww47 = 'tail-length 3 cm';

data.Ri  = 16/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'CollZamb1999';   
  temp.Ri = C2K(26);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'uncertain';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'D5FY'; % Cat of Life
metaData.links.id_ITIS = '1125421'; % ITIS
metaData.links.id_EoL = '1055991'; % Ency of Life
metaData.links.id_Wiki = 'Amphisbaena_alba'; % Wikipedia
metaData.links.id_ADW = 'Amphisbaena_alba'; % ADW
metaData.links.id_Taxo = '50424'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Amphisbaena&species=alba'; % ReptileDB
metaData.links.id_AnAge = 'Amphisbaena_alba'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amphisbaena_alba}}';
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
bibkey = 'CollZamb1999'; type = 'Article'; bib = [ ... 
'author = {G. R. Colli and D. S. Zamboni}, ' ... 
'year = {1999}, ' ...
'title = {Ecology of the worm-lizard \emph{Amphisbaena alba} in the {C}errado of central {B}razil.}, ' ...
'journal = {Copeia}, ' ...
'volume = {3}, ' ...
'pages = {733-742}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndreNasc2006'; type = 'Article'; bib = [ ... 
'author = {D. V. Andrade and L. B. Nascimento and A. S. Abe}, ' ... 
'year = {2006}, ' ...
'title = {Habits hidden underground: a review on the reproduction of the {A}mphisbaenia with notes on four neotropical species}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {27}, ' ...
'pages = {207--217}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BartBart2003'; type = 'Book'; bib = [ ... 
'author = {Bartlett, R. D. and Bartlett, P.}, ' ... 
'year = {2003}, ' ...
'title = {Reptiles and amphibians of the {A}mazon, an ecotourists guide.}, ' ...
'publisher = {University Press of Florida}, ' ...
'address = {Gainesville}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Amphisbaena_alba}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

