function [data, auxData, metaData, txtData, weights] = mydata_Bison_bonasus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Bison_bonasus'; 
metaData.species_en = 'European bison'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 270;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 213;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 730; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.4);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 26.4*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(38.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 24.4e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'Wiki';
data.Wwbm = 27.6e3;  units.Wwbm = 'g';   label.Wwbm = 'wet weight at birth for male';      bibkey.Wwbm = 'Wiki';
data.Wwi = 424e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
data.Wwim = 634e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW_fC = [ ... % time since birth (mnth), wet weight (kg)
 0  24 
 1  30 
 4  66
 6 111 
 7 120 
 8 159 
11 200 
12 190 
24 228 
36 227 
48 400 
60 439 
72 460];
data.tW_fC(:,1) = data.tW_fC(:,1) * 30.5; % convert mnth to d
data.tW_fC(:,2) = data.tW_fC(:,2) * 1e3; % convert kg to g
units.tW_fC   = {'d', 'g'};  label.tW_fC = {'time since birth', 'wet weight', 'female, captive'};  
temp.tW_fC    = C2K(38.4);  units.temp.tW_fC = 'K'; label.temp.tW_fC = 'temperature';
bibkey.tW_fC = 'KrasKras2002';
comment.tW_fC = 'Data for captive females';
%
data.tW_fF = [ ... % time since birth (mnth), wet weight (kg)
 3  47 
 4  66 
 5  72 
 6  91 
 7  97 
 8 111 
 9 124 
12 119 
24 213 
36 252 
48 341 
60 407 
72 424];
data.tW_fF(:,1) = data.tW_fF(:,1) * 30.5; % convert mnth to d
data.tW_fF(:,2) = data.tW_fF(:,2) * 1e3; % convert kg to g
units.tW_fF   = {'d', 'g'};  label.tW_fF = {'time since birth', 'wet weight', 'female, free'};  
temp.tW_fF    = C2K(38.4);  units.temp.tW_fF = 'K'; label.temp.tW_fF = 'temperature';
bibkey.tW_fF = 'KrasKras2002';
comment.tW_fF = 'Data for free-ranging females';
%
data.tW_mC = [ ... % time since birth (mnth), wet weight (g)
 0  28 
 1  52 
 4  83
 6 143
 7 150
 8 170
11 187
12 175
24 331
36 387
48 502
60 591
72 747];
data.tW_mC(:,1) = data.tW_mC(:,1) * 30.5; % convert mnth to d
data.tW_mC(:,2) = data.tW_mC(:,2) * 1e3; % convert kg to g
units.tW_mC   = {'d', 'g'};  label.tW_mC = {'time since birth', 'wet weight', 'male, captive'};  
temp.tW_mC    = C2K(38.4);  units.temp.tW_mC = 'K'; label.temp.tW_mC = 'temperature';
bibkey.tW_mC = 'KrasKras2002';
comment.tW_mC = 'Data for captive males';
%
data.tW_mF = [ ... % time since birth (mnth), wet weight (g)
 2  41 
 3  53 
 4  76 
 5  82
 6  99
 7 101
 8 103
 9 109
12 124
24 220
36 303
48 366 
60 467
72 634];
data.tW_mF(:,1) = data.tW_mF(:,1) * 30.5; % convert mnth to d
data.tW_mF(:,2) = data.tW_mF(:,2) * 1e3; % convert kg to g
units.tW_mF   = {'d', 'g'};  label.tW_mF = {'time since birth', 'wet weight', 'male, free'};  
temp.tW_mF    = C2K(38.4);  units.temp.tW_mF = 'K'; label.temp.tW_mF = 'temperature';
bibkey.tW_mF = 'KrasKras2002';
comment.tW_mF = 'Data for free-ranging males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_fC','tW_fF','tW_mC','tW_mF'}; subtitle1 = {'Data for females (captive & free) and males (captive & free)'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Slow foetal development is assumed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'LWY7'; % Cat of Life
metaData.links.id_ITIS = '183836'; % ITIS
metaData.links.id_EoL = '328110'; % Ency of Life
metaData.links.id_Wiki = 'Bison_bonasus'; % Wikipedia
metaData.links.id_ADW = 'Bison_bonasus'; % ADW
metaData.links.id_Taxo = '68228'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200670'; % MSW3
metaData.links.id_AnAge = 'Bison_bonasus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bison_bonasus}}';
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
bibkey = 'KrasKras2002'; type = 'Article'; bib = [ ... 
'author = {M. Krasi\~{n}ska and Z. A. Krasin\~{n}ski}, ' ... 
'year = {2002}, ' ...
'title = {Body mass and measurements of the {E}uropean bison during postnatal development}, ' ...
'journal = {Acta Theriologica}, ' ...
'volume = {47}, ' ...
'pages = {85-106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bison_bonasus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

