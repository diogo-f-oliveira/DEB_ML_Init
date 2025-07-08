function [data, auxData, metaData, txtData, weights] = mydata_Paroctopus_digueti

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Paroctopus_digueti'; 
metaData.species_en = 'Pacific pigmy octopus'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.am = 221;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'ReRuFors1987';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 0.04;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'ReRuFors1987';
data.Wwp  = 8;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';     bibkey.Wwp  = 'ReRuFors1987';
  comment.Wwp = 'based on first mating';
data.Wwi  = 44.9;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'ReRuFors1987';

data.Ni  = 125; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'ReRuFors1987';   
  temp.Ni = C2K(25);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
    1 0.537
   15 0.750
   29 0.968
   43 1.296
   58 1.950
   72 2.410
   86 2.925
  100 3.876
  114 4.344
  128 4.946
  143 5.271
  156 5.695
  169 5.762];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ReRuFors1987';
comment.tL = 'Data for females and males combined';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
    1  0.04
   15  0.11
   29  0.26
   43  0.72
   58  1.83
   72  4.09
   86  8.01
  100 14.79
  114 21.34
  128 30.40
  143 37.57
  156 41.34
  169 44.13];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(25);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ReRuFors1987';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
    1  0.04
   15  0.10
   29  0.24
   43  0.64
   58  1.71
   72  3.85
   86  7.21
  100 12.18
  114 16.53
  128 21.00
  143 27.07
  156 30.13
  169 30.68];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(25);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ReRuFors1987';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
%weights.tWw_f = 5 * weights.tWw_f;
%weights.tWw_m = 5 * weights.tWw_m;
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4DQJY'; % Cat of Life
metaData.links.id_ITIS = '82634'; % ITIS
metaData.links.id_EoL = '492846'; % Ency of Life
metaData.links.id_Wiki = 'Paroctopus'; % Wikipedia
metaData.links.id_ADW = 'Octopus_digueti'; % ADW
metaData.links.id_Taxo = '3974333'; % Taxonomicon
metaData.links.id_WoRMS = '534130'; % WoRMS
metaData.links.id_molluscabase = '534130'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paroctopus}}';
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
bibkey = 'ReRuFors1987'; type = 'article'; bib = [ ... 
'author = {Randal H. DeRusha and John W. Forsythe and Roger T. Hanlon}, ' ... 
'year = {1987}, ' ...
'title = {Laboratory Growth, Reproduction and Life Span of the {P}acific Pygmy Octopus, \emph{Octopus digueti}}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {41(1-4)}, ' ...
'pages = {103365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Paroctopus-digueti.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

