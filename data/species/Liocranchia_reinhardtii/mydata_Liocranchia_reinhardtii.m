function [data, auxData, metaData, txtData, weights] = mydata_Liocranchia_reinhardtii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Cranchiidae';
metaData.species    = 'Liocranchia_reinhardtii'; 
metaData.species_en = 'Glass squid'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'guess';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'guess';
data.Lp  = 10;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'guess';
data.Li  = 23;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'Arkh1996';

data.Wwi  = 226.9;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';       bibkey.Wwi  = 'QuetAlem2000';
  comment.Wwi = 'based on size-corrected value for Cranchia_scabra: 26*(21/10.2)^3';
  
data.GSI  = 0.15; units.GSI  = '-';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'guess';   
  temp.GSI = C2K(10);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
108.858	14.268
118.357	12.769
124.775	12.301
125.800	13.690
125.801	16.570
125.802	9.780
126.573	16.518
127.856	11.990
128.370	14.305
130.424	11.988
134.788	15.277
135.302	9.670
140.436	12.649
141.463	13.317
143.004	17.586
144.288	14.344
145.571	13.006
147.882	14.135];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Arkh1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
95.250	13.199
117.073	11.021
119.384	14.929
119.641	18.118
120.411	13.334
122.978	12.457
123.748	15.029
128.626	12.967
135.558	20.421
137.356	11.726
140.693	15.941
147.368	18.148];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Arkh1996';
comment.tL_m = 'Data for males';

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
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3V5HX'; % Cat of Life
metaData.links.id_ITIS = '556787'; % ITIS
metaData.links.id_EoL = '52572813'; % Ency of Life
metaData.links.id_Wiki = 'Fusocranchia_alpha'; % Wikipedia
metaData.links.id_ADW = 'Fusocranchia_alpha'; % ADW
metaData.links.id_Taxo = '4475733'; % Taxonomicon
metaData.links.id_WoRMS = '341818'; % WoRMS
metaData.links.id_molluscabase = '341818'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Liocranchia_reinhardtii}}';
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
bibkey = 'Arkh1996'; type = 'article'; bib = [ ... 
'author = {Alexander Arkhipkin}, ' ... 
'year = {1996}, ' ...
'title = {Age and growth of planktonic squids \emph{Cranchia scabra} and \emph{Liocranchia reinhardti} ({C}ephalopoda, {C}ranchiidae) in epipelagic waters of the central-east {A}tlantic}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {18(9)}, ' ...
'pages = {l675-1683}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nesi82'; type = 'Book'; bib = [ ...  
'author = {Nesis, K. N.}, ' ...
'year = {1982}, ' ...
'title  = {Cephalopods of the world}, ' ...
'publisher = {T.F.H. Publications}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'address = {Neptune City, NY}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'QuetAlem2000'; type = 'article'; bib = [ ... 
'author = {Antonio Quetglas and Francese Alemany and Aina Carbonelli and Pilar S\''{a}nchez}, ' ... 
'year = {2000}, ' ...
'title = {The first record of \emph{Cranchia scabra} a{L}each, 1817 ({C}ephalopoda, {C}ranchiidae) in in the {M}editerranean {S}ea}, ' ...
'journal = {Bollettino Malacologico Roma}, ' ...
'volume = {35(1-4)}, ' ...
'pages = {1-2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

