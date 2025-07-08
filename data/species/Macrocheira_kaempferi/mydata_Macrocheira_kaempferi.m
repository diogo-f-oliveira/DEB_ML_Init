function [data, auxData, metaData, txtData, weights] = mydata_Macrocheira_kaempferi

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Inachidae';
metaData.species    = 'Macrocheira_kaempferi'; 
metaData.species_en = 'Japanese spider crab'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb', 'jiMv'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab', 'aj_T', 'ap', 'am', 'Lj', 'Lp', 'Li', 'Wwb', 'Wwj', 'Wwp', 'Wwi', 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 08 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 31]; 

%% set data
% zero-variate data

data.ab = 10;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'ADW';   
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj18 = 41;  units.tj18 = 'd'; label.tj18 = 'time since birth at metam'; bibkey.tj18 = 'Okam1993';   
  temp.tj18 = C2K(18.3); units.temp.tj18 = 'K'; label.temp.tj18 = 'temperature';
  comment.tj18 = '16 d zoea, 25 d megalopa';
data.tj11 = 78;  units.tj11 = 'd'; label.tj11 = 'time since birth at metam'; bibkey.tj11 = 'Okam1993';   
  temp.tj11 = C2K(11); units.temp.tj11 = 'K'; label.temp.tj11 = 'temperature';
  comment.tj11 = '33 d zoea, 45 d megalopa';
data.tp = 5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'ADW';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '5-8 yr';
data.am = 100*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(10);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lj  = 0.6;   units.Lj  = 'cm';  label.Lj  = 'carapace length at settle'; bibkey.Lj  = 'guess';
data.Lp  = 8;  units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 37;  units.Li  = 'cm';  label.Li  = 'ultimate carapace length'; bibkey.Li  = 'ADW';
  comment.Li = '4 m between tips of chelipeds';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ADW';
  comment.Wwb = 'Based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwj = 0.081;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';       bibkey.Wwj = 'guess';
  comment.Wwj = 'Computed as (Lj/ Li)^3 * Wwi';
data.Wwp = 192;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'guess';
  comment.Wwp = 'Computed as (Lp/ Li)^3 * Wwi';
data.Wwi = 19e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'Wiki';

data.Ri  = 1.5e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Largest arthropod, not the haviest';
metaData.bibkey.F1 = 'EoL'; 
F2 = 'At 12 till 15 C,  2 zoeal stages lasting between 12 and 37 d, 1 megalopa stage of 30 d, see ADW';
metaData.bibkey.F2 = 'ADW'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3X3WC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46507307'; % Ency of Life
metaData.links.id_Wiki = 'Macrocheira_kaempferi'; % Wikipedia
metaData.links.id_ADW = 'Macrocheira_kaempferi'; % ADW
metaData.links.id_Taxo = '34004'; % Taxonomicon
metaData.links.id_WoRMS = '346131'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrocheira_kaempferi}}';
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
bibkey = 'Okam1993'; type = 'Article'; bib = [ ... 
'author = {K. Okamoto}, ' ... 
'year = {1993}, ' ...
'title = {Influence  of  Temperature   on  Survival  and  Growth   of  Larvae of  the  Giant  Spider  Crab  \emph{Macrocheira  kaempferi} ({C}rustacea,  {D}ecapoda,  {M}ajidae)}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {59}, ' ...
'pages = {419--424}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/2924326/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Macrocheira_kaempferi/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
