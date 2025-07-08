function [data, auxData, metaData, txtData, weights] = mydata_Ovis_ammon
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Ovis_aries'; 
metaData.species_en = 'Domestic sheep'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'T'};
metaData.ecoCode.habitat = {'0iTd', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Le'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2024 05 22];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 22];

%% set data
% zero-variate data

data.tg = 146;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 135;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(38.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 548 ;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 914 ; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.8);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 22.8*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(38.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.4e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'LewiEmma2002';
data.Wwi = 86e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'LewiEmma2002';
data.Wwim = 110e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'LewiEmma2002';
  
data.Ri  = 1.58/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.58 calf per litter, 1 litter per yr';

% univariate data
% time-weight
data.tW_f = [ ... % time (d), body weight (kg)
0.000	5.387
26.064	10.475
50.532	17.525
76.064	26.533
106.915	37.734
134.574	46.492
163.830	55.247
191.489	62.046
221.809	68.595
256.383	73.665
299.468	78.472
348.404	81.553];
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f = {'d', 'g'};  label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f  = C2K(38.8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'LewiEmma2002';
comment.tW_f = 'data for females from computed Gompertz curve, not measurments';
%
data.tW_m = [ ... % time (mnth), body weight (kg)
0.000	5.387
22.872	9.992
43.085	16.806
65.426	25.086
86.170	33.859
108.511	43.363
131.915	53.355
155.851	63.100
185.638	73.323
215.426	81.587
242.021	87.899
272.340	93.468
308.511	98.290
348.404	102.370];
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m = {'d', 'g'};  label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m  = C2K(38.8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'LewiEmma2002';
comment.tW_m = 'data for males from computed Gompertz curve, not measurments';

% time-length of foetus
data.tLe = [ ... % time since copulation (d), crown-rump length (cm)
    36  2.7
    38  3.1
    39  3.9
    40  4.0
    41  4.0
    43  4.6
    45  5.0
    46  6.5
    47  6.5
    48  8.0
    61 14.0
    64 13.0
    66 14.0
    68 13.0
    73 18.0
    80 20.0
    92 21.0
    95 25.0
    99 30.0
   104 28
   110 28
   111 32
   120 40
   124 40
   128 35];
units.tLe = {'d', 'cm'};  label.tLe = {'time', 'crown-rump length'};  
temp.tLe  = C2K(38.8);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'Harr1936';


%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;
weights.tp = 3 * weights.tp;
weights.Wwb = 5 * weights.Wwb;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_2: foetal data added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '4B9VF'; % Cat of Life
metaData.links.id_ITIS = '552475'; % ITIS
metaData.links.id_EoL = '311906'; % Ency of Life
metaData.links.id_Wiki = 'Ovis_aries'; % Wikipedia
metaData.links.id_ADW = 'Ovis_aries'; % ADW
metaData.links.id_Taxo = '68603'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200825'; % MSW3
metaData.links.id_AnAge = 'Ovis_aries'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ovis_aries}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ovis_aries}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LewiEmma2002'; type = 'Article'; bib = [ ... 
'doi = {10.1017/s1357729800052176}, ' ...
'author = {Lewis, R. M. and Emmans, G. C. and Dingwall, W. S. and Simm, G.}, ' ... 
'year = {2002}, ' ...
'title = {A description of the growth of sheep and its genetic analysis}, ' ...
'journal = {Animal Science}, ' ...
'volume = {74(1)}, ' ...
'pages = {51–62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1936'; type = 'Article'; bib = [ ... 
'author = {Harris, H.A.}, ' ... 
'year = {1937}, ' ...
'title = { The foetal growth of the sheep}, ' ...
'journal = {J. Anat.}, ' ...
'volume = {71}, ' ...
'pages = {516-527}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

