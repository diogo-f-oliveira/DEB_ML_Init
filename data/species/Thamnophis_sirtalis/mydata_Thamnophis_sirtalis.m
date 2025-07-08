function [data, auxData, metaData, txtData, weights] = mydata_Thamnophis_sirtalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Thamnophis_sirtalis'; 
metaData.species_en = 'Common garter snake'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTg', 'biTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv','biCi'};
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
data.tp = 730;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'AnAge';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 18;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching for females';      bibkey.Lb  = 'ADW';
  comment.Lb = '12.5-23 cm';
data.Li  = 137;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';

data.Wwb = 5.3;     units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'guess';
  comment.Wwi = 'based on av total length of 55 cm corresponds with av weight 150 g: (18/55)^3*150';
data.Wwi = 2318;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on av total length of 55 cm corresponds with av weight 150 g: (137/55)^3*150';
  
data.Ri  = 24/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '12-50 young per clutch, 2 clutches per yr assumed';

% univariate data
% length-change in length
data.LdL_fm = [ ... % time lengthh (cm), change in length (cm/mnth): females, males
    17 3.28 3.69
    22 3.42 3.12
    27 2.86 2.85
    32 NaN  2.23
    37 3.98 1.11
    42 2.17 1.05
    47 1.26 0.66
    52 0.90 0.41
    57 1.17 NaN
    62 0.70 NaN];
data.LdL_fm(:,[2 3]) = data.LdL_fm(:,[2 3])/30.5; % convert change per mnth to change per d
units.LdL_fm  = {'cm', 'cm/d'};  label.LdL_fm = {'total length', 'change in total length'};  
temp.LdL_fm   = C2K(27);  units.temp.LdL_fm = 'K'; label.temp.LdL_fm = 'temperature';
bibkey.LdL_fm = 'Carp1952'; treat.LdL_fm = {1, {'female', 'male'}};
comment.LdL_fm = 'Winter ambient temperatures were 20-24 C, Summer temperatures 28-34 C during the day, 24-27 C at night; heaviest individuals are selected';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_fm = 10 * weights.LdL_fm;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Forms mating balls of 1-2 females and >10 males; ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '563LK'; % Cat of Life
metaData.links.id_ITIS = '174136'; % ITIS
metaData.links.id_EoL = '1055202'; % Ency of Life
metaData.links.id_Wiki = 'Thamnophis_sirtalis'; % Wikipedia
metaData.links.id_ADW = 'Thamnophis_sirtalis'; % ADW
metaData.links.id_Taxo = '50082'; % Taxonomicon
metaData.links.id_WoRMS = '1481923'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Thamnophis&species=sirtalis'; % ReptileDB
metaData.links.id_AnAge = 'Thamnophis_sirtalis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thamnophis_sirtalis}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Thamnophis_sirtalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Thamnophis_sirtalis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];