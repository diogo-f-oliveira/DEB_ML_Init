function [data, auxData, metaData, txtData, weights] = mydata_Octopus_joubini

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Octopus_joubini'; 
metaData.species_en = 'Atlantic pygmy octopus'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'; 't-JX'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.ab = 49;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Fors1984';   
  temp.ab = C2K(24);     units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 182;     units.tp = 'd';    label.tp = 'age at puberty';              bibkey.tp = 'Wiki';   
  temp.tp = C2K(24);     units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 250;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Fors1984';   
  temp.am = C2K(24);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '193 to 331 d';
  
data.Wwb = 0.035; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Fors1984';
data.Wwp = 30;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Wiki';
data.Wwi = 55;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on tW_f data (with Ww = 20 g at t = 182 d), given (tp, Wp)';

data.Ni  = 800; units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'guess';   
  temp.Ni = C2K(24);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on kap = 0.75';
 
% uni-variate data
% t-W data
data.tW_f = [ ... % time since birth (d), wet weight (g)
    1  0.035
   15  0.10
   29  0.28
   51  0.73
   66  1.50
   80  2.36
   94  3.41
  121  5.95
  141 10.85
  155 13.80
  169 17.39
  195 22.71
  220 23.51
  253 27.68];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f    = C2K(24);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Fors1984';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
    1  0.035
   15  0.12
   29  0.28
   51  0.66
   66  1.36
   80  2.11
   94  2.94
  121  4.85
  141  8.11
  155 10.17
  169 12.41
  195 14.47
  220 14.57
  253 16.44];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m    = C2K(24);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Fors1984';
comment.tW_m = 'Data for males';

% t-JX data
data.tJX_f = [ ... % time since birth (d), food intake (g crab flesh/d)
    1  0.019
   15  0.024
   29  0.044
   51  0.075
   66  0.17
   80  0.14
   94  0.38
  121  0.47
  141  0.65
  155  0.71
  169  0.80];
units.tJX_f   = {'d', 'g/d'};  label.tJX_f = {'time', 'eaten crab flesh', 'female'};  
temp.tJX_f    = C2K(24);  units.temp.tJX_f = 'K'; label.temp.tJX_f = 'temperature';
bibkey.tJX_f = 'Fors1984';
comment.tJX_f = 'Data for females';
%
data.tJX_m = [ ... % time since birth (d), wet weight (g)
    1  0.017
   15  0.021
   29  0.042
   51  0.072
   66  0.18
   80  0.15
   94  0.34
  121  0.39
  141  0.54
  155  0.58
  169  0.65];
units.tJX_m   = {'d', 'g/d'};  label.tJX_m = {'time', 'eaten crab flesh', 'male'};  
temp.tJX_m    = C2K(24);  units.temp.tJX_m = 'K'; label.temp.tJX_m = 'temperature';
bibkey.tJX_m = 'Fors1984';
comment.tJX_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f;
weights.tW_m = 2 * weights.tW_m;
weights.am = 3 * weights.am;
weights.Ni = 3 * weights.Ni;
weights.Wwb = 3 * weights.Wwb;

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
set2 = {'tJX_f','tJX_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'z is not well-fixed by data, size ultimate size is much larger than size at death';
D2 = 'in view of fitting results, puberty does not coincide with mating and part of structure converts to eggs just before death';
D3 = 'model abj has been used, meaning that settlement has no effect on acceleration';
D4 = 'males are assumed to differ from females by {p_Am} only';
D5 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'semelparous: death at first spawning, female ventilates eggs and dies after hatching; No food intake during this period';
metaData.bibkey.F1 = 'Fors1984'; 
F2 = 'large bentic eggs';
metaData.bibkey.F2 = 'Fors1984'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '74G2B'; % Cat of Life
metaData.links.id_ITIS = '82607'; % ITIS
metaData.links.id_EoL = '492283'; % Ency of Life
metaData.links.id_Wiki = 'Octopus_joubini'; % Wikipedia
metaData.links.id_ADW = 'Octopus_joubini'; % ADW
metaData.links.id_Taxo = '158240'; % Taxonomicon
metaData.links.id_WoRMS = '341985'; % WoRMS
metaData.links.id_molluscabase = '341985'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Octopus_joubini}}';
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
bibkey = 'Fors1984'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1984.tb05091.x}, ' ...
'author = {J. W. Forsythe}, ' ... 
'year = {1984}, ' ...
'title = {\emph{Octopus joubini} ({M}ollusca: {C}ephalopoda): a detailed study of growth through the full life cycle in a closed seawater system}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {202}, ' ...
'pages = {393--417}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Octopus_joubini/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

