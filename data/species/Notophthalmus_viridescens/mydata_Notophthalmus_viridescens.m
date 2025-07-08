function [data, auxData, metaData, txtData, weights] = mydata_Notophthalmus_viridescens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Notophthalmus_viridescens'; 
metaData.species_en = 'Eastern newt'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jpTg', 'jpTf', 'jpTh', 'piFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp 
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 07 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 25 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.41;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'amphibiaweb';
  comment.Lb = 'based on TL 0.75 cm, using F2';
data.Lj  = 2;   units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'amphibiaweb';
  comment.Lj = 'varies among locations';
data.Lp  = 3.6;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'CaetLecl1996';
data.Lpm  = 3.4;   units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for females';   bibkey.Lpm  = 'CaetLecl1996';
data.Li  = 4.7;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'CaetLecl1996';
data.Lim = 5.1;    units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';     bibkey.Lim  = 'CaetLecl1996';

data.Wwi = 1.64;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
   comment.Wwi = 'based length-weight of Triturus cristatus:(4.7/8.4)^3*9.4';
data.Wwim = 2.1;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
   comment.Wwim = 'based length-weight of Triturus cristatus: (5.1/8.4)^3*9.4';

data.Ri  = 300/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'amphibiaweb';   
temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '200 to 375 eggs per clutch, 1 clutch per yr' ;

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
    1 2.49
    2 2.93
    3 3.41
    4 3.79
    5 4.00
    6 4.22
    7 4.30
    8 4.36];
data.tL_f(:,1) = (0.85 + data.tL_f(:,1)) * 365; % convert yr since birth to d since puberty
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(19);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CaetLecl1996';
comment.tL_f = 'Data for females from Mastogou';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
    1 2.47
    2 2.89
    3 3.40
    4 3.87
    5 4.15
    6 4.38
    7 4.48
    8 4.54];
data.tL_m(:,1) = (0.85 + data.tL_m(:,1)) * 365; % convert yr since birth to d since puberty
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(19);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CaetLecl1996';
comment.tL_m = 'Data for males from Mastogou';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 *  weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Aquatic larval and adult stages, with a terrestrial post-larval juvenile stage, called eft. The peninsula newt (N. v. piaropicola) is usually neotenic, skipping the eft-stage, while te adult keeps gills.';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-length: SVL = 0.55 * TL';
metaData.bibkey.F2 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '47XFZ'; % Cat of Life
metaData.links.id_ITIS = '173615'; % ITIS
metaData.links.id_EoL = '1025186'; % Ency of Life
metaData.links.id_Wiki = 'Notophthalmus_viridescens'; % Wikipedia
metaData.links.id_ADW = 'Notophthalmus_viridescens'; % ADW
metaData.links.id_Taxo = '47298'; % Taxonomicon
metaData.links.id_WoRMS = '1453452'; % WoRMS
metaData.links.id_amphweb = 'Notophthalmus+viridescens'; % AmphibiaWeb
metaData.links.id_AnAge = 'Notophthalmus_viridescens'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notophthalmus_viridescens}}';
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
bibkey = 'CaetLecl1996'; type = 'article'; bib = [ ...
'doi = {10.13128/Acta_Herpetol-21171}, ' ...
'author = {Maria Helena Caetano and Raymond Leclair Jr.}, ' ... 
'year = {1996}, ' ...
'title = {Growth and Population Structure of Red-Spotted Newts (\emph{Notophthalmus viridescens}) in {P}ermanent {L}akes of the {L}aurentian {S}hield, {Q}uebec}, ' ...
'journal = {Copeia}, ' ...
'volume = {1996(4)}, ' ...
'pages = {866-874}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Notophthalmus+viridescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Notophthalmus_viridescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


