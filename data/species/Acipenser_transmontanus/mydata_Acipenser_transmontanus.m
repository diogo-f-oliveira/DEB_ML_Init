function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_transmontanus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_transmontanus'; 
metaData.species_en = 'White sturgeon'; 

metaData.ecoCode.climate = {'MC','BSk','Dfc'};
metaData.ecoCode.ecozone = {'MPNE','THn'};
metaData.ecoCode.habitat = {'0iMcd', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp - this is not sure as the species  migrates from sea to fresh water
metaData.data_0     = {'ah';  'ab'; 'ap'; 'am'; 'Lb';  'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'Ww-dWw'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 22];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 23]; 

%% set data
% zero-variate data;
data.ah = 210/24; units.ah = 'd';      label.ah = 'age at hatch';   bibkey.ah = 'ParsKofo2013';    
  temp.ah = C2K(13); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'temp is variable see fig. 6, also authors explored effect of different substrates on hatching'; 
data.ab = data.ah + 7; units.ab = 'd';      label.ab = 'age at birth';   bibkey.ab = 'pices';    
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp is guessed, birth taken as first feeding which this ref says happens at yolk sac depletion 7-10d after hatch'; 
data.tp = 13*365;  units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'temp is guessed- wiki says between 11 and 34 years';
data.am = 108*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'Wiki';   
  temp.am = C2K(13);units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temperature is guessed';

data.Lb  = 1.2;      units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ParsKofo2013';
data.Lp  = 160;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki';
data.Li  = 610;      units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Wiki';
  comment.Li = 'common total length 210 cm; since Li does not corrspond to Wwi, given Ww290, we ignore this data point';

data.Wwb = 2.24e-2;    units.Wwb = 'g';   label.Wwb = 'wet weight birth';   bibkey.Wwb = 'CherClar1982';
  comment.Wwb = 'based on egg diameter of 3.5 mm: pi/6*0.35^3';
data.Wwi = 816e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';
data.Ww290 = 225e3;    units.Ww290 = 'g';   label.Ww290 = 'wet weight at TL 290 cm';   bibkey.Ww290 = 'pices';
 
data.Ri  = 200000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'pices';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temperature is guessed, 200000 eggs estimated in 1.5m indivdual; this is changed to 170 cm in view of Lp';
  
% uni-variate data
% weight - change in weight
data.WdW = [ ... % weight (g), change in weight (%/d)
0.05	12.343
0.05	11.314
0.05	11.069
0.06	10.776
0.06	10.555
0.10	9.257
1.937	7.543
1.937	7.396
5.811	6.392
7.748	6.024
13.559	5.412
13.559	5.314
33.898	2.792
45.521	2.424
59.080	1.886
74.576	1.396
130.751	2.743
420.339	1.567
471.671	0.955];
units.WdW = {'g', '%/d'};     label.WdW = {'wet weight', 'change in wet weight'};  bibkey.WdW = 'LeeSonm2017';
  temp.WdW = C2K(19.2);  units.temp.WdW = 'K'; label.temp.WdW = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 0 * weights.Li;
weights.tp = 0.2 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '9C7V'; % Cat of Life
metaData.links.id_ITIS = '161068'; % ITIS
metaData.links.id_EoL = '46561176'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_transmontanus'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_transmontanus'; % ADW
metaData.links.id_Taxo = '42446'; % Taxonomicon
metaData.links.id_WoRMS = '238345'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-transmontanus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/White_sturgeon}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParsKofo2013'; type = 'techreport'; bib = [ ...    
'author = {Michael J. Parsley and Eric Kofoot}, ' ...
'institution = {U.S. Department of the Interior; U.S. Geological Survey}, ' ...
'number = {5180}, ' ...
'year  = {2013}, ' ...
'title = {Effects of Incubation Substrates on Hatch Timing and Success of White Sturgeon (\textit{Acipenser transmontanus}) Embryos}'  ]; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'pices'; type = 'Misc'; bib = ...
'howpublished = {\url{https://pisces.ucdavis.edu/content/acipenser-transmontanus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeeSonm2017'; type = 'Article'; bib = [ ...  
'author = {Seunghyung Lee and Ozan Sonmez and Silas S.O. Hung and James G. Fadel}, ' ...
'doi = {10.1016/j.aninu.2016.10.005}, ' ...
'year = {2017}, ' ...
'title = {Development of growth rate, body lipid, moisture, and energy models for white sturgeon (\emph{Acipenser transmontanus}) fed at various feeding rates}, ' ... 
'journal = {Animal Nutrition}, ' ...
'volume = {3}, ' ...
'pages = {46e60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CherClar1982'; type = 'Article'; bib = [ ...  
'author = {Gary N. Cherr and Wallis H. Clark}, ' ...
'year = {1982}, ' ...
'title = {Fine Structure of the Envelope and Micropyles in the Eggs of the White Sturgeon, \emph{Acipenser transmontanus} {R}ichardson}, ' ... 
'journal = {Develop., Growth and Differ}, ' ...
'volume = {24}, ' ...
'pages = {341-352}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

