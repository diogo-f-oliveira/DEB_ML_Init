function [data, auxData, metaData, txtData, weights] = mydata_Clemmys_guttata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Clemmys_guttata'; 
metaData.species_en = 'Spotted turtle';

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFm'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 77;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'AnAge';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'ADW: 44-83 d';
data.tp = 7*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '7-14 yr';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.8; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'ADW';
  comment.Lb = '25-31 mm';
data.Lp = 8.05; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';      bibkey.Lp = 'Erns1975';
data.Li = 13.6; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'ADW';

data.Wwi = 387; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'EoL';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-8 eggs per clutch, 1 clutch per yr, sometimes a 2nd clutch; max 42 eggs/yr';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
    0 2.15
    1 3.25
    2 4.09
    3 5.00
    4 5.38
    5 5.92
    6 6.45
    7 6.98
    8 7.42
    9 7.81
   10 8.21
   11 8.20
   12 8.51
   13 8.81
   14 8.88
   15 8.64
   16 8.70
   17 8.93
   18 9.23];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Erns1975';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), plastron length (cm)
    0 2.34
    1 3.12
    2 3.92
    3 4.72
    4 5.40
    5 5.88
    6 6.30
    7 6.89
    8 7.32
    9 7.40
   10 7.75
   11 8.04
   12 8.23
   13 8.28
   14 8.61];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Erns1975';
comment.tL_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
mmetaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Temperatures < 22.5-27 C give males > 30 C females';
metaData.bibkey.F1 = 'ADW';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'VYSQ'; % Cat of Life
metaData.links.id_ITIS = '173771'; % ITIS
metaData.links.id_EoL = '1056844'; % Ency of Life
metaData.links.id_Wiki = 'Clemmys_guttata'; % Wikipedia
metaData.links.id_ADW = 'Clemmys_guttata'; % ADW
metaData.links.id_Taxo = '321909'; % Taxonomicon
metaData.links.id_WoRMS = '1500054'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Clemmys&species=guttata'; % ReptileDB
metaData.links.id_AnAge = 'Clemmys_guttata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Clemmys_guttata}}';
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
bibkey = 'Erns1975'; type = 'Article'; bib = [ ... 
'author = {Carl H. Ernst}, ' ... 
'year = {1975}, ' ...
'title = {Growth of the Spotted Turtle, \emph{Clemmys guttata}}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {9(3))}, ' ...
'pages = {313-318}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Clemmys_guttata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1056844}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Clemmys_guttata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

