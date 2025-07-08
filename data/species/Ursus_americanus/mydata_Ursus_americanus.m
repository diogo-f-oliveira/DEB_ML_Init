function [data, auxData, metaData, txtData, weights] = mydata_Ursus_americanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Ursidae';
metaData.species    = 'Ursus_americanus'; 
metaData.species_en = 'Black bear'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 70;    units.tg = 'd';    label.tg = 'gestation time';                   bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 198;    units.tx = 'd';    label.tx = 'time since birth at weaning';     bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1278;   units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'AnAge';
  temp.tp = C2K(37.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 33*365; units.am = 'd';    label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(37.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 277.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwx = 14050; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';          bibkey.Wwx = 'AnAge';
data.Wwi = 100e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'Wiki';
  comment.Wwi = '41 till 170 kg';
data.Wwim = 150e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'Wiki';
  comment.Wwim = '57 till 250 kg; max 500 kg';

data.Ri  = 0.4*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 0.4 litters per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), female body weight (g)
 10  565
 16  750
 23 1075
 30 1500
 37 1700
 44 2150
 51 2625
 79 5436
107 9060];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(37.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Hull1976';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), male body weight (g) 
 10  579
 16  735
 23  975
 30  1460
 37  1750
 44  2250
 51  2725
 79  5711
107 10400];
units.tW_m   = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(37.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Hull1976';
comment.tW_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f;
weights.tW_m = 2 * weights.tW_m;
weights.Wwx = 0 * weights.Wwx;

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Weight at weaning ignored because of inconsistence of (tx,Wwx) with tW-data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Several subspecies that differ in size';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7F2KC'; % Cat of Life
metaData.links.id_ITIS = '180544'; % ITIS
metaData.links.id_EoL = '328582'; % Ency of Life
metaData.links.id_Wiki = 'Ursus_americanus'; % Wikipedia
metaData.links.id_ADW = 'Ursus_americanus'; % ADW
metaData.links.id_Taxo = '170191'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000953'; % MSW3
metaData.links.id_AnAge = 'Ursus_americanus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ursus_americanus}}';
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
bibkey = 'Hull1976'; type = 'Article'; bib = [ ... 
'author = {Hulley, J. T.}, ' ... 
'year = {1976}, ' ...
'title = {Hand-rearing {A}merican black bear cubs at {T}oronto {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'doi = {10.1111/j.1748-1090.1976.tb00178.x},'  ...
'volume = {16}, ' ...
'pages = {202-205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ursus_americanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

