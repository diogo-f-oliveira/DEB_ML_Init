function [data, auxData, metaData, txtData, weights] = mydata_Crassostrea_corteziensis 

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Ostreida'; 
metaData.family     = 'Ostreidae';
metaData.species    = 'Crassostrea_corteziensis'; 
metaData.species_en = 'Corteziensis oyster'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMm', '0iMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biB'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab';'aj';'ap';'am';'Lb';'Lj';'Lp';'Li';'Wdi';'Ri'}; 
metaData.data_1     = {'t-L';'T-F';'T-JO';'T-JX'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Brecht Stechele'};    
metaData.date_subm = [2021 05 12];              
metaData.email    = {'brecht.stechele@hotmail.com'};            
metaData.address  = {'Campus Coupure - Blok F Ghent University Coupure Links 653, B-9000 Gent, Belgium'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 07 29]; 

%% set data
% zero-variate data

data.ab = 5.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'RicoPouv2009';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Larval growth between C. gigas and C. corteziensis is very similar';
data.tj = 14.5;   units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'RicoBern2010';   
  temp.tj = C2K(25);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'Larval growth between C. gigas and C. corteziensis is very similar';
data.tp = 26.6;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Mark2011';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(7.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.01;  units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'RicoPouv2009';
    comment.Lb = 'Larval growth between C. gigas and C. corteziensis is very similar';
data.Lj  = 0.034; units.Lj  = 'cm';  label.Lj  = 'shell length at metam';   bibkey.Lj  = 'RicoBern2010';
    comment.Lj = 'Larval growth between C. gigas and C. corteziensis is very similar';
data.Lp  = 2.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Rodr2017';
data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Gong2018';

data.Wdi = 9;   units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';         bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Crassostrea_virginica: (13/20.6)^3*35.8';

data.Ri  = 0.4e6; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'PouvBour2006';   
  temp.Ri = C2K(7.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - length data
data.tL = [ ... % time (d), shell length (cm)
0	0.49
30	0.81
62	0.86
91	1.33
122	2.03
151	2.12
182	3.42
212	4.44
242	4.91
274	5.70
303	6.14
335	6.58
365	7.17];  
units.tL   = {'d', 'cm'};  label.tL = {'time since start', 'shell length', '25 C'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Chav2005';
%
data.tL2 = [...
1.06	0.314
66.7	1.885
100.58	4.614
132.34	5.137
166.22	5.082
197.99	5.973
231.87	5.97
263.63	6.782
296.45	7.437
330.33	7.513
364.21	7.668
394.91	7.666
428.79	8.006
463.73	8.266
493.38	8.264
527.26	8.34
565.37	9.283
595.01	9.412
624.66	9.411
658.54	9.723
694.54	9.774
723.12	9.929
754.89	9.953
791.94	10.26];
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since start', 'shell length', '27 C'};  
temp.tL2    = C2K(27);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Chav2008';

% Filtration and clearance rate
data.TF = [ ... % temperature (C), Filtration rate (L/h.g)
23 2.05
26 2.83
29 1.92
32 3.71];  
units.TF   = {'C', 'L/h.g'};  label.TF = {'temperature', 'spec filtration rate'};  
bibkey.TF = 'Guzm2013';
comment.TF = 'shell length was 4.5 cm';

data.TJX = [ ... % temperature (C), Ingestion (mg/h.g)
23 0.0286
26 0.0344
29 0.0252
32 0.0495];
units.TJX   = {'C', 'g/h.g'};  label.TJX = {'temperature', 'spec ingestion rate'};  
bibkey.TJX = 'Guzm2013';
comment.TJX = 'shell length was 4.5 cm';

data.TJO = [ ... % temperature (C), Oxygen consumption (mg/h.g)
23  8.47
26 12.87
29  8.34
32  5.71];
units.TJO   = {'C', 'mg/h.g'};  label.TJO = {'temperature', 'spec dioxygen consumption'};  
bibkey.TJO = 'Guzm2013';
comment.TJO = 'shell length was 4.5 cm';

% data.TJN = [ ... % temperature (C), Ammonia production (ug/h.g)
% 23 5.30
% 26 61.78
% 29 57.12
% 32 5.74];
% units.TJN   = {'C', 'ug/h.g'};  label.TJN = {'temperature', 'N excretion rate'};  
% bibkey.TJN = 'Guzm2013';
% comment.TJN = 'shell length was 4.5 cm';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tj = weights.tj * 0.5;
weights.Lj = weights.Lj * 0;
weights.tL = weights.tL * 0.5;
weights.tL2 = weights.tL2 * 3;
%weights.TJN = weights.TJN * 0.2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL2','tL'}; subtitle1 = {'data at 27 (Chav2008), 25 (Chav2005) C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'spec filtering, ingestion and respiration rates were assumpt to be on the basis of dry weight';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'Z6Z4'; % Cat of Life
metaData.links.id_ITIS = '79880'; % ITIS
metaData.links.id_EoL = '46467125'; % Ency of Life
metaData.links.id_Wiki = 'Crassostrea'; % Wikipedia
metaData.links.id_ADW = 'Crassostrea_corteziensis'; % ADW
metaData.links.id_Taxo = '333917'; % Taxonomicon
metaData.links.id_WoRMS = '605704'; % WoRMS
metaData.links.id_molluscabase = '605704'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crassostrea_corteziensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chav2005'; type = 'Article'; bib = [ ... 
'author = {Chavez-Villalba, J. and Lopez-Tapia, M. and Mazon-Suastegui, J. and Robles-Mungaray, M.}, ' ... 
'year = {2005}, ' ...
'title = {Growth of the oyster \emph{Crasssostrea coreziensis} ({H}ertlein, 1951) in {S}onora, {M}exico}, ' ...
'journal = {Aquaculture Research}, '...
'volume = {36}, ' ...
'number = {14}, '...
'pages = {1337-1344}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chav2008'; type = 'Article'; bib = [ ... 
'author = {Chavez-Villalba, J. and Hermandez-Ibarra, A. and Lopez-Tapia, M.R. and Mazon-Suastegui, J.M.}, ' ... 
'year = {2008}, ' ...
'title = {Prospective Culture of the Cortez oysters \emph{Crasssostrea coreziensis} from {N}orthwestern {M}exico: Growth, Gametogenic Activity, and Condition Index}, ' ...
'journal = {Journal of Shellfish Research}, '...
'volume = {27}, ' ...
'number = {4}, '...
'pages = {711--720}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rodr2017'; type = 'Article'; bib = [ ... 
'doi = {10.1080/07924259.2017.1315341}, ' ...
'author = {Rodriguez-Jalamillo, C. and Ibarra, AM. and Soudant, P. and Palacios, E.}, ' ... 
'year = {2017}, ' ...
'title = {Comparison of quantitative gonad maturation scales in a temperatue oysters \emph{Crasssostrea gigas} and a sub-tropical oyster \emph{Crasssostrea coreziensis}}, ' ...
'journal = {Invertebrate reproduction and development}, ' ...
'volume = {61(3)}, ', ...
'pages = {147-156}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Guzm2013'; type = 'Article'; bib = [ ... 
'author = {Guzman-Aguero, J.E. and Nieves-Soto, M.N. and Hurtado, M. A. and Pina-Valdez, P. and Garza-Aguirre M.C.}, ' ... 
'year = {2005}, ' ...
'title = {Feeding physiology and scope for growth of the oyster \emph{Crasssostrea coreziensis} ({H}ertlein, 1951) acclimated to different conditions of temperature and salinity}, ' ...
'journal = {Aquaculture International}, '...
'volume = {21}, ' ...
'pages = {283-297}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gong2018'; type = 'Article'; bib = [ ... 
'author = {Gongora-Gomez, A.M. and Leal-Supulveda, A.L. and Garcia-Ulloa, M. and Aragon-Noriega, E.A. and Valenzuela-Quinonez, W.}, ' ... 
'year = {2018}, ' ...
'title = {Morphometric relationships and growth models for the oyster \emph{Crasssostrea coreziensis} cultivated at the southeastern coast of the {G}ulf of {C}alifornia, {M}exico}, ' ...
'journal = {Aquaculture International}, '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RicoPouv2009'; type = 'Article'; bib = [ ... 
'author = {Rico-Villa, B. and Pouvreau, S. and Robert, R.}, ' ... 
'year = {2009}, ' ...
'title = {Influence of food density and temperature on ingestion, growth and settlement of {P}acific oyster larvae, \emph{Crassostrea gigas}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {287}, ' ...
'pages = {395--401}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RicoBern2010'; type = 'Article'; bib = [ ... 
'author = {Rico-Villa, B. and Bernard, I. and Robert, R. and Pouvreau, S.}, ' ... 
'year = {2010}, ' ...
'title = {A {D}ynamic {E}nergy {B}udget ({D}{E}{B}) growth model for pacific oyster larvae, \emph{Crassostrea gigas}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {305}, ' ...
'pages = {84--94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mark2011'; type = 'Misc'; bib = [ ...
'author = {Nicola Mark}, ' ... 
'year = {2011}, ' ...
'note = {pers. comm.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PouvBour2006'; type = 'Article'; bib = [ ... 
'author = {Pouvreau, S. and Bourl\`{e}s, Y. and Lefebvre, S. and Gangnery, A. and Alunno-Bruscia, M.}, ' ... 
'year = {2006}, ' ...
'title = {Application of a {D}ynamic {E}nergy {B}udget model to the {P}acific oyster, \emph{Crassostrea gigas}, reared under various environmental conditions}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {56}, ' ...
'pages = {156--167}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
