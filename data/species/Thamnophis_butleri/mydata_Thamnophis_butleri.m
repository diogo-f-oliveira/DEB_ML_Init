function [data, auxData, metaData, txtData, weights] = mydata_Thamnophis_butleri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Thamnophis_butleri'; 
metaData.species_en = 'Butler''s garter snake'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTg', 'biTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 12 24];

%% set data
% zero-variate data

data.ab = 100;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 730;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'AnAge';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 913;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(15); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 15;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching for females';      bibkey.Lb  = 'Wiki';
  comment.Lb = '13-18 cm';
data.Li  = 51;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';

data.Wwb = 3.2;     units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on (Lb/Li)^3*Wwi = (15/51)^3*125';
data.Wwi = 125;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'AnAge';
  
data.Ri  = 12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(15);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '12 young per clutch';

% univariate data
% length-change in length
data.LdL_fm = [ ... % time lengthh (cm), change in length (cm/mnth): females, males
    22 1.15 1.92
    27 NaN  2.93
    32 1.24 0.80
    37 0.55 0.18
    42 0.20 NaN]; 
data.LdL_fm(:,[2 3]) = data.LdL_fm(:,[2 3])/30.5; % convert change per mnth to change per d
units.LdL_fm  = {'cm', 'cm/d'};  label.LdL_fm = {'total length', 'change in total length'};  
temp.LdL_fm   = C2K(17);  units.temp.LdL_fm = 'K'; label.temp.LdL_fm = 'temperature';
bibkey.LdL_fm = 'Carp1952'; treat.LdL_fm = {1, {'female', 'male'}};
comment.LdL_fm = 'Winter ambient temperatures were 1 C, Summer temperatures 18 C';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_fm = 10 * weights.LdL_fm;
weights.Li = 5 * weights.Li;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;
weights.ab = 5 * weights.ab;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'The species hibernates communally, often with other garter snake species; ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '563KB'; % Cat of Life
metaData.links.id_ITIS = '174139'; % ITIS
metaData.links.id_EoL = '790473'; % Ency of Life
metaData.links.id_Wiki = 'Thamnophis_butleri'; % Wikipedia
metaData.links.id_ADW = 'Thamnophis_butleri'; % ADW
metaData.links.id_Taxo = '610607'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Thamnophis&species=butleri'; % ReptileDB
metaData.links.id_AnAge = 'Thamnophis_butleri'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thamnophis_butleri}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Thamnophis_butleri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
