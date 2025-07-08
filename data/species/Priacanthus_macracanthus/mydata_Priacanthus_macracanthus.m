function [data, auxData, metaData, txtData, weights] = mydata_Priacanthus_macracanthus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Priacanthiformes'; 
metaData.family     = 'Priacanthidae';
metaData.species    = 'Priacanthus_macracanthus'; 
metaData.species_en = 'Red bigeye'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 12]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18.9; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'LiuHung2001'; 
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 7.4e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LiuHung2001';
  comment.Wwb = 'based egg diameter of 0.52 mm: 4/3*pi*0.026^3'; 
data.Wwp = 101; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'JounChen1992';
  comment.Wwp = 'based on 1.148e-5 * (10*Lp)^3.05, see F1';
data.Wwi = 413; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'JounChen1992';
  comment.Wwi = 'based on 1.148e-5 * (10*Li)^3.05, see F1';

data.GSI  = 0.07;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'LiuHung2001';   
  temp.GSI = C2K(28);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.512	14.020
2.119	16.023
2.639	17.905
3.131	20.364
3.651	21.436
4.128	22.679
4.619	25.195];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JounChen1992';
comment.tL_f = 'data for females';
% 
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.637	14.846
2.122	15.375
2.636	17.466
3.149	19.788
3.677	20.665
4.146	22.698
4.616	24.209];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JounChen1992';
comment.tL_m = 'data for males';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am}  only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'weight-length relationship: W = 1.148e-5 * (FL in mm)^3.05';
metaData.bibkey.F1 = 'JounChen1992'; 
F2 = 'Marine; reef-associated; oceanodromous; depth range 12 - 400 m. Preferred 28 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4MBWZ'; % Cat of Life
metaData.links.id_ITIS = '168186'; % ITIS
metaData.links.id_EoL = '46578904'; % Ency of Life
metaData.links.id_Wiki = 'Priacanthus'; % Wikipedia
metaData.links.id_ADW = 'Priacanthus_macracanthus'; % ADW
metaData.links.id_Taxo = '45154'; % Taxonomicon
metaData.links.id_WoRMS = '273765'; % WoRMS
metaData.links.id_fishbase = 'Priacanthus-macracanthus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Priacanthus}}';
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
bibkey = 'JounChen1992'; type = 'Article'; bib = [ ... 
'author = {S.-J. Joung and C.-T. Chen}, ' ... 
'year = {1992}, ' ...
'title = {Age and Growth of the Big Eye \emph{Priacanthus macracanthus} from the Surrounding Water of {G}uei-{S}han {I}sland, {T}aiwan}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {58}, ' ...
'pages = {481--488}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LiuHung2001'; type = 'Article'; bib = [ ... 
'author = {K.-M. Liu and K.-Y. Hung and C.-T. Chen}, ' ... 
'year = {2001}, ' ...
'title = {Reproductive biology of the big eye \emph{Priacanthus macracanthus} in the north-eastern waters off {T}aiwan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {67}, ' ...
'pages = {1008--1014}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/356}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
