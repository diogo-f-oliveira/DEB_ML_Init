function [data, auxData, metaData, txtData, weights] = mydata_Lynx_lynx
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Lynx_lynx'; 
metaData.species_en = 'Eurasian lynx'; 

metaData.ecoCode.climate = {'BWk', 'Dfc', 'Dfd'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvb', 'xiCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 02 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 66;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 87;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 639;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1009;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39.8); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 23.7*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 246.5; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 1860;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 18000;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'Wiki';
data.Wwim = 30000;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'Wiki';

data.Ri  = 2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (wk), wet weight (kg)
 1  0.58
 2  0.74
 3  0.97
 4  1.22
 5  1.50
 6  1.79
 7  1.94
 8  2.30
 9  2.47
10  2.80
11  3.03
12  3.22
13  3.70
14  3.97
15  4.47
16  5.06
17  5.44
18  5.66
19  6.44
33 12.20];
data.tWw_f(:,1) = 7 * data.tWw_f(:,1); % convert wk to d
data.tWw_f(:,2) = 1e3 * data.tWw_f(:,2); % convert kg to g
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f   = C2K(39.8);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Kunc1970';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (wk), wet weight (kg)
 1  0.61
 2  0.79
 3  0.96
 4  1.22
 5  1.49
 6  1.78
 7  1.95
 8  2.30
 9  2.62
10  3.01
11  3.025
12  3.52
13  4.04
14  4.72
15  5.45
16  6.10
17  6.32
18  6.82
19  7.52
33 15.20];
data.tWw_m(:,1) = 7 * data.tWw_m(:,1); % convert wk to d
data.tWw_m(:,2) = 1e3 * data.tWw_m(:,2); % convert kg to g
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m   = C2K(39.8);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Kunc1970';
comment.tWw_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;

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

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6QR9T'; % Cat of Life
metaData.links.id_ITIS = '180584'; % ITIS
metaData.links.id_EoL = '328603'; % Ency of Life
metaData.links.id_Wiki = 'Lynx_lynx'; % Wikipedia
metaData.links.id_ADW = 'Lynx_lynx'; % ADW
metaData.links.id_Taxo = '168586'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000156'; % MSW3
metaData.links.id_AnAge = 'Lynx_lynx'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lynx_lynx}}';
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
bibkey = 'Kunc1970'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1748-1090.1970.tb01288.x}, ' ...
'author = {Kunc, L.}, ' ... 
'year = {1970}, ' ...
'title = {Breeding and rearing the Northern lynx: at {O}strava {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {10(1)}, ' ...
'pages = {83–84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lynx_lynx}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

