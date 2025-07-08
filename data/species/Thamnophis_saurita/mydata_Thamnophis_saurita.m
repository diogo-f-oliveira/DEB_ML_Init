function [data, auxData, metaData, txtData, weights] = mydata_Thamnophis_saurita

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Thamnophis_saurita'; 
metaData.species_en = 'Ribbon snake'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bF'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 12 25];

%% set data
% zero-variate data

data.ab = 100;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'AnAge';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 730;   units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'AnAge';
  temp.ap = C2K(25); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 10.6*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 19.3;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching for females';      bibkey.Lb  = 'virgi';
  comment.Lb = '16-21 cm';
data.Li  = 970;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'virgi';

data.Wwb = 1;     units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'virgi';
  comment.Wwb = '0.8-1.2 g';
data.Wwi = 407;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'AnAge';
  
data.Ri  = 25/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-27 young per clutch, 1-2 clutches per yr';

% univariate data
% length-change in length
data.LdL_fm = [ ... % time lengthh (cm), change in length (cm/mnth): females, males
    17 3.93 NaN
    22 5.03 2.43
    27 NaN  2.14
    32 NaN  0.89
    37 NaN  1.50
    42 NaN  0.58
    47 1.13 0.47
    52 0.43 NaN];
data.LdL_fm(:,[2 3]) = data.LdL_fm(:,[2 3])/30.5; % convert change per mnth to change per d
units.LdL_fm  = {'cm', 'cm/d'};  label.LdL_fm = {'total length', 'change in total length'};  
temp.LdL_fm   = C2K(27);  units.temp.LdL_fm = 'K'; label.temp.LdL_fm = 'temperature';
bibkey.LdL_fm = 'Carp1952'; treat.LdL_fm = {1, {'female', 'male'}};
comment.LdL_fm = 'Winter ambient temperatures were 20-24 C, Summer temperatures 28-34 C during the day, 24-27 C at night; heaviest individuals are selected';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_fm = 10 * weights.LdL_fm;
weights.Lb = 0 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = '(Lb/Li)^3 deviates strongly from Wwb/Wwi, so strong deviation from isomorphy, which is hard to beleave';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '563LG'; % Cat of Life
metaData.links.id_ITIS = '1084919'; % ITIS
metaData.links.id_EoL = '62658098'; % Ency of Life
metaData.links.id_Wiki = 'Thamnophis_saurita'; % Wikipedia
metaData.links.id_ADW = 'Coluber_saurita'; % ADW
metaData.links.id_Taxo = '4907947'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Thamnophis&species=saurita'; % ReptileDB
metaData.links.id_AnAge = 'Thamnophis_sauritus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thamnophis_sauritus}}';
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
bibkey = 'Carp1952'; type = 'Article'; bib = [ ... 
'author = {Charles C. Carpenter}, ' ... 
'year = {1952}, ' ...
'title = {Growth and Maturity of the Three Species of \emph{Thamnophis} in {M}ichigan}, ' ...
'journal = {Copeia}, ' ...
'volume = {1952(4)}, ' ...
'pages = {237-243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Thamnophis_sauritus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Thamnophis_sauritus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'virgi'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.virginiaherpetologicalsociety.com/reptiles/snakes/common-ribbonsnake/common_ribbonsnake.php}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
