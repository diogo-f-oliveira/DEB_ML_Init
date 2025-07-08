function [data, auxData, metaData, txtData, weights] = mydata_Cervus_elaphus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Cervus_elaphus'; 
metaData.species_en = 'Red deer'; 

metaData.ecoCode.climate = {'BS', 'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 10 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 245;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'Wiki';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '240-262 d';
data.tx = 156;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 852;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 31.5*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 10100;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 56500;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 150e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '120 to 170 kg';
data.Wwim = 230e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  comment.Wwim = '160 to 240 kg kg';
  
data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW_f = [ % time  (yr), larger carcass weight (kg)
0.008	31.532
1.041	51.813
1.986	59.102
2.953	60.053
4.006	65.123
4.994	68.292
6.027	68.926
7.016	69.243
8.006	66.074
8.693	70.035
9.658	79.067]; 
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to f
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time', 'larder carcas weight', 'female'};  
temp.tW_f  = C2K(38.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Gold1987';
comment.tW_f = 'Data for females';
%
data.tW_m = [ % time since birth (yr), larder carcass weight (kg)
0.031	36.603
1.012	58.612
2.021	76.316
2.993	88.517
4.038	112.201
4.996	144.737
5.986	140.670
6.881	138.278]; 
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to f
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time', 'larder carcas weight', 'male'};  
temp.tW_m  = C2K(38.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Gold1987';
comment.tW_m = 'Data for males';

data.WW = [ ... 5 total weight (kg), larder carcas weight (kg)
    31.3 20.7
    61.0 40.1
    74.4 46.9
    78.8 49.6
    80.5 50.7
    85.2 53.7
    88.8 54.1
    75.5 47.6
    86.7 54.6
    92.0 58.0
    84.0 52.9
    86.5 54.5];
units.WW  = {'kg', 'kg'};  label.WW = {'total weight', 'larder carcas weight'};  
bibkey.WW = 'Gold1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;
weights.WW = 2 * weights.WW;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_1: (tx,Wwx) is at odds with tW data, Wwx is ignored';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'T56G'; % Cat of Life
metaData.links.id_ITIS = '180695'; % ITIS
metaData.links.id_EoL = '328649'; % Ency of Life
metaData.links.id_Wiki = 'Cervus_elaphus'; % Wikipedia
metaData.links.id_ADW = 'Cervus_elaphus'; % ADW
metaData.links.id_Taxo = '167650'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200352'; % MSW3
metaData.links.id_AnAge = 'Cervus_elaphus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cervus_elaphus}}';
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
bibkey = 'Gold1987'; type = 'Article'; bib = [ ... 
'author = {C. R. Goldspink}, ' ... 
'year = {1987}, ' ...
'title = {The growth, reproduction and mortality of an enclosed population of red deer (\emph{Cervus elaphus}) in north-west {E}ngland}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {213}, ' ...
'pages = {23--44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cervus_elaphus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

