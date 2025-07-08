function [data, auxData, metaData, txtData, weights] = mydata_Amphibalanus_amphitrite

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Sessilia'; 
metaData.family     = 'Balanidae';
metaData.species    = 'Amphibalanus_amphitrite'; 
metaData.species_en = 'Striped barnacle'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'as'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 03 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 03 09]; 

%% set data
% zero-variate data

data.ts = 8;         units.ts = 'd';      label.ts = 'time since birth at settlement';   bibkey.ts = 'AlAiSath2014';   
  temp.ts = C2K(28); units.temp.ts = 'K'; label.temp.ts = 'temperature'; 
  comment.ts = 'nauplius stages 6d, cypris stage 2 d';
data.am = 1.4*365;   units.am = 'd';      label.am = 'life span';                        bibkey.am = 'sms';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '77 d in the Mediterranean, 1.26-1.4 yr normally, 4-6 yr in S. Africa and Argentina';

data.Lj  = 0.25;    units.Lj  = 'cm';    label.Lj  = 'basal diameter at metam';          bibkey.Lj  = 'Spiv1989';
  comment.Lj = 'Read from tL data';
data.Lp  = 0.75;    units.Lp  = 'cm';    label.Lp  = 'basal diameter at puberty';        bibkey.Lp  = 'Spiv1989';
  comment.Lp = 'Between 6 and 9 mm for most Balanus species; sms gives 5 mm';
data.Li  = 1.85;    units.Li  = 'cm';    label.Li  = 'ultimate basal diameter';          bibkey.Li  = 'SimpHurl1998';

data.Wwb = 1.63e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'BarnBarn1956';
  comment.Wwb = 'Based on egg diameter of 0.146 mm of Balanus glandula: pi/6*0.0146^3';
data.Wwi = 4.688;   units.Wwi = 'g';   label.Wwi = 'ultimate soma wet weight';           bibkey.Wwi = 'Spiv1989';
  comment.Wwi = 'Based on F3,F4: 1e-3*10^(1.092-0.734+3.106*log10(Li*10)/1.188)';

data.Ri  = 20e4/ 365;    units.Ri  = '#/d';   label.Ri  = 'reprod rate at 15.6 mm basal diameter';   bibkey.Ri  = 'sms';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1e3-1e4 eggs/brood, upto 24 broods/yr';

% uni-variate data

% tL-data
data.tL1 = [  ... % time since settlement (d), basal diameter (cm)
4.800	0.041
14.171	0.132
21.029	0.325
27.886	0.685
34.057	0.905
42.971	1.103
49.371	1.257
85.029	1.467
119.771	1.489];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since settlement', 'basal diameter'};  
temp.tL1    = C2K(28);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'SimpHurl1998';
comment.tL1 = 'Individual 1; Data from Hirano and Okushi 1952 for A. a. hawaiiensis, temp is guessed';
%
data.tL2 = [  ... % time since settlement (d), basal diameter (cm)
15.119	0.107
25.115	0.540
32.399	0.795
43.813	1.049
54.112	1.161
64.876	1.250
78.165	1.330];
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since settlement', 'basal diameter'};  
temp.tL2    = C2K(28);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'SimpHurl1998';
comment.tL2 = 'Individual 2; Data from Hirano and Okushi 1952 for A. a. hawaiiensis, temp is guessed';
%
data.tL3 = [  ... % time since settlement (d), basal diameter (cm)
10.514	0.155
20.800	0.649
32.000	0.958
38.857	1.091
45.943	1.171
52.800	1.171];
units.tL3   = {'d', 'cm'};  label.tL3 = {'time since settlement', 'basal diameter'};  
temp.tL3    = C2K(28);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'SimpHurl1998';
comment.tL3 = 'Individual 3; Data from Hirano and Okushi 1952 for A. a. hawaiiensis, temp is guessed';
%
data.tL4 = [  ... % time since settlement (d), basal diameter (cm)
2.764	0.044
5.298	0.076
8.752	0.129
11.747	0.187
15.202	0.298
17.735	0.479
20.960	0.608
23.724	0.679
26.948	0.834
30.173	0.914];
units.tL4   = {'d', 'cm'};  label.tL4 = {'time since settlement', 'basal diameter'};  
temp.tL4    = C2K(28);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'SimpHurl1998';
comment.tL4 = 'Individual 4; Data from Iwaka and Hattori 1987, temp is guessed';

 
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
set1 = {'tL1','tL2','tL3','tL4'}; subtitle1 = {'Individual 1,2,3,4'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'kap_R is set at 0.95/2, since the species is hermaphroditic';
D2 = 'In view of tL data, acceleration is assumed to start at birth and continues for some time after settlement';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Hermaphroditic, 6 nauplius stages, 1 non-feeding cyprid stage';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Temperature need to exceed 15 C for reproduction';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'log10 total wt in mg = 3.106 * log10(basal length in mm) - 0.734';
metaData.bibkey.F3 = 'Spiv1989'; 
F4 = 'log10 total wt in mg = 1.092 * log10(soma wet wt in mg) - 1.188';
metaData.bibkey.F4 = 'Spiv1989'; 
F5 = 'Fertilized eggs are brooded within the mantle cavity, nauplii are released in 1-3 d (aquarium conditions)';
metaData.bibkey.F5 = 'AlAiSath2014'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '629XP'; % Cat of Life present at genus level only 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1039496'; % Ency of Life
metaData.links.id_Wiki = 'Amphibalanus_amphitrite'; % Wikipedia
metaData.links.id_ADW = 'Balanus_amphitrite'; % ADW
metaData.links.id_Taxo = '3393641'; % Taxonomicon
metaData.links.id_WoRMS = '421137'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Amphibalanus_amphitrite}}';
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
bibkey = 'SimpHurl1998'; type = 'Article'; bib = [ ... 
'author = {E. P. Simpson and S. H. Hurlbert}, ' ... 
'year = {1998}, ' ...
'title = {Salinity effects on the growth, mortality and shell strength of \emph{Balanus amphitrite} from the {S}alton {S}ea, {C}alifornia}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {381}, ' ...
'pages = {179-190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Spiv1989'; type = 'Article'; bib = [ ... 
'author = {H. R. Spivey}, ' ... 
'year = {1989}, ' ...
'title = {The size variable and allometric analysis in the barnacle genus \emph{Balanus}}, ' ...
'journal = {Journal of Natural History}, ' ...
'doi = {10.1080/00222938900770931}, ' ...
'volume = {23}, ' ...
'pages = {1017--1032}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BarnBarn1956'; type = 'Article'; bib = [ ... 
'author = {H. Barnes and  M. Barnes}, ' ... 
'year = {1956}, ' ...
'title = {The General Biology of \emph{Balanus glandula} {D}arwin}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {10}, ' ...
'pages = {415--422}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlAiSath2014'; type = 'Article'; bib = [ ... 
'author = {A. M. Al-Aidaroos, S. Satheesh}, ' ... 
'year = {2014}, ' ...
'title = {Larval development and settlement of the barnacle \emph{Amphibalanus amphitrite} from the {R}ed {S}ea: {I}nfluence of the nauplii hatching season}, ' ...
'journal = {Oceanological and Hydrobiological Studies; International Journal of Oceanography and Hydrobiology}, ' ...
'volume = {43}, ' ...
'pages = {170--177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sms'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sms.si.edu/irlspec/Balanus_amphitrite.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
