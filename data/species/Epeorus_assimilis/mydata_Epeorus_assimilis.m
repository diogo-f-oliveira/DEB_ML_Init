function [data, auxData, metaData, txtData, weights] = mydata_Epeorus_assimilis 
  global tT

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Ephemeroptera'; 
metaData.family     = 'Heptageniidae';
metaData.species    = 'Epeorus_assimilis'; 
metaData.species_en = 'Mayfly'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0eFr', '0eFc', 'eiTg'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'beH', 'beD', 'beS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'L0'; 'Lj'; 'Li'; 'Ni'};  
metaData.data_1     = {'t-L'; 'L-Wd'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Kim Rakel', 'Andre Gergs', 'Kristin Katrin Weiss'};                            
metaData.date_subm = [2017 08 31];                              
metaData.email    = {'rakel@gaiac-eco.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'}; 

metaData.author_mod_1   = {'Kim Rakel', 'Andre Gergs', 'Kristin Katrin Weiss'};                            
metaData.date_mod_1     = [2018 02 18];                              
metaData.email_mod_1    = {'rakel@gaiac-eco.de'};            
metaData.address_mod_1  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 02 18]; 

%% set data
% zero-variate data;

data.ab = 17;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Degr1960';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'lab data; same as age at hatching'; 
data.tj = 360;     units.tj = 'd';    label.tj = 'time since birth at emergence'; bibkey.tj = 'HaybMalz2002';   
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.am = 7;     units.am = 'd';    label.am = 'life span as (sub)imago';     bibkey.am = 'guess';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'temperature guessed; based on fact that (sub)imago does not feed'; 

data.L0  = 0.0234;   units.L0  = 'cm';   label.L0  = 'egg length';     bibkey.L0  = 'Degr1960';    
data.Lj  = 2;   units.Lj  = 'cm';   label.Lj  = 'ultimate length';    bibkey.Lj  = 'BaueSold2012';
  comment.Lj = 'body length of the larvae, measured from head to end of abdomen'; 
data.Li  = 1.9;   units.Li  = 'cm';   label.Li  = 'ultimate forewing length';    bibkey.Li  = 'BaueSold2012';
  comment.Li = 'forewing length of the imago'; 

data.Ni  = 9341;    units.Ni  = '#';  label.Ni  = 'maximum egg number';              bibkey.Ni  = 'Degr1960';  
  temp.Ni = C2K(10);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'eggs are set on the last day of lifespan; temperature guessed';


% uni-variate data

% time-length
data.tL = [... Time (d) length (cm)
0.00	0.20
31.63	0.31
59.84	0.55
90.61	0.63
121.40	0.65
150.40	0.66
184.60	0.67
212.00	0.68
241.90	0.82
270.10	1.21
302.60	1.31];
units.tL   = {'d','cm'};  label.tL = {'time', 'length'};
% temp for tL is vaying, as specified below
tT = [ ... time (d), temperature (C)
0.00	13.61
31.63	13.61
59.84	9.69
90.61	6.39
121.40	0.62
150.40	0.82
184.60	2.06
212.00	6.19
241.90	11.96
270.10	15.46
302.60	15.88];
tT = [tT(:,1), C2K(tT(:,2))];
bibkey.tL = 'Sand1981';

% length-weight
data.LW = [ ... % total length (cm), dry weight (g) 
1.2	0.0148
1.5	0.0282
1.2	0.0152
0.6	0.0021
0.8	0.0024
1.2	0.0148
1.5	0.0282
1.2	0.0152];
units.LW = {'cm', 'g'};  label.LW = {'total length', 'dry weight', '10 C from Haue2011'};  
temp.LW  = C2K(10);  units.temp.LW = 'K'; label.temp.LW = 'temperature';
bibkey.LW = 'Haue2011';
comment.LW = 'body length measured without antennae, gills, etc., field data, temperature guessed, original unit mm';
%
data.LW2 = [ ... % total length (cm), dry weight (g) 
1.05	0.00989
0.95	0.00838
0.96	0.00765
0.91	0.00937
0.79	0.00341
0.89	0.00458
0.86	0.0072
0.76	0.00403
0.77	0.00398
1.03	0.00914
1	    0.00779
0.89	0.00712
0.91	0.00684
1.1	    0.01261
0.96	0.00449
0.79	0.00404
1.01	0.0089
1.03	0.01027
0.82	0.0048
1	    0.00852
1.567	0.01824
0.909	0.00325
0.974	0.00448
1.359	0.01172
1.109	0.00711
1.02	0.00598
1.128	0.00692
1.387	0.0118
1.567	0.01696
1.511	0.01095
1.452	0.0129
1.278	0.00888
1.57	0.018
1.363	0.01224
1.009	0.00445
0.663	0.00162
1.435	0.01308
1.015	0.00482
1.422	0.01179
1.313	0.00957];
units.LW2 = {'cm', 'g'};  label.LW2 = {'total length', 'dry weight', '4 C from Beck2011' };  
temp.LW2  = C2K(4);  units.temp.LW2 = 'K'; label.temp.LW2 = 'temperature'; 
bibkey.LW2 = 'Beck2011';
comment.LW2 = 'length measured from head to end of abdomen, original units mm and ug, measured individuals were caught at the same sampling site in january (small group) or october (large group), field data, temperature guessed';

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
set1 = {'LW','LW2'}; subtitle1 = {'length-weight including eggs'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Acknowledgment
metaData.acknowledgment = 'This entry was financially supported by the CEFIC Long-range Research Initiative (project number ECO28)';

%% Links
metaData.links.id_CoL = '6FNVW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3684227'; % Ency of Life
metaData.links.id_Wiki = 'Epeorus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '660868'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Degr1960'; type = 'Article'; bib = [ ...  
'author = {Degrange, C.},'...
'year = {1960},'...
'title = {Recherches sur la Reproduction des Ephemeropteres},'...
'journal = {Travaux du Labotoire dHydrobiologie et de Pisciculture},'...
'volume = {50/51},'...
'pages = {7--193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Beck2011'; type = 'PhDthesis'; bib = [ ...  
'author = {Becker, D.},'...
'year = {2011},'...
'title = {Sensitivity distinctions of lotic insect larvae exposed to imidacloprid},'...
'school = {Institute for Environmental Research, RWTH Aachen University, Aachen, Germany},' ...
'pages = {124}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'HaybMalz2002'; type = 'Article'; bib = [ ...  
'author = {Haybach, A. and Malzacher, P.},'...
'year = {2002},'...
'title = {Verzeichnis der {E}intagsfliegen {D}eutschlands ({I}nsecta: {E}phemeroptera)},'...
'journal = {Entomologische Zeitschrift},'...
'volume = {112},'...
'number = {2},'...
'pages = {34--45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haue2011'; type = 'Article'; bib = [ ...  
'author = {Hauer, C. and Nachname2, Vorname2. and Nachname3},'... 
'year = {2012},'... 
'title = {Hydro-morphologically related variance in benthic drift and its importance for numerical habitat modelling},'...
'journal = {Hydrobiologia},'...
'volume = {683},'...
'pages = {83--108},'...
'DOI = {10.1007/s10750-011-0942-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BaueSold2012'; type = 'book'; bib = [ ...  
'author = {Bauernfeind, E. and Soldan, T.},'...
'publisher = {Apollo Books},'...
'year = {2012},'...
'title = {The Mayflies of Europe (Ephemeroptera)},'...
'pages = {319},'...
'ISBN = {978-87-88757-45-3}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sand1981'; type = 'Article'; bib = [ ...  
'author = {Sander, U.},'...
'year = {1981},'...
'title = {Faunistisch-\"{o}kologische {U}ntersuchungen \"{u}ber die {E}phemeroptera des s\"{u}dlichen {S}chwarzwaldes unter besonderer {B}er\"{u}cksichtigung der {D}onauquellfl\"{u}{\ss}e {B}reg und {B}rigach und des obersten {D}onauabschnittes bis zur {V}ersickerung bei {I}mmendingen},'...
'journal = {Archiv f\"{u}r Hydrobiologie},'...
'volume = {52},'...
'number = {4},'...
'pages = {409--461}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
