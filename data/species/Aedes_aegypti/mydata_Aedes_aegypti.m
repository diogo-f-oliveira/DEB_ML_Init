function [data, auxData, metaData, txtData, weights] = mydata_Aedes_aegypti

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Diptera'; 
metaData.family     = 'Culicidae';
metaData.species    = 'Aedes_aegypti'; 
metaData.species_en = 'Yellow fever mosquito'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TP', 'TA'};
metaData.ecoCode.habitat = {'0eFm', 'eiTf', 'eiTi'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjD', 'bjCi', 'eiTv'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ae'; 'am'; 'E0'; 'L_t'; 'Ww0'; 'Wwj'; 'Wwe'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'Ww-JO'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'James Maino','Bas Kooijman'};    
metaData.date_subm = [2012 05 23];              
metaData.email    = {'jamesmaino@gmail.com'};            
metaData.address  = {'Melbourne University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 02 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 02 12];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 02 12]; 

%% set data
% zero-variate data

data.ab = 3.083; units.ab = 'd';     label.ab = 'age at birth';             bibkey.ab = 'Chri1960';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 6;     units.tj = 'd';     label.tj = 'time since birth at pupation'; bibkey.tj = 'Chri1960';   
  temp.tj = C2K(28);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.te = 2;     units.te = 'd';     label.te = 'time since pupation at emergence'; bibkey.te = 'Chri1960';
  temp.te = C2K(28);  units.temp.te = 'K'; label.temp.te = 'temperature';
data.am = 21;    units.am = 'd';     label.am = 'life span as imago';       bibkey.am = 'Chri1960';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 0.0137e-3; units.Ww0 = 'g'; label.Ww0 = 'initial wet weight';      bibkey.Ww0 = 'Chri1960';
  comment.Ww0 = 'actually 0.01 mg  in Chris1960 but this is less than tW(1,2); mg given, mug assumed';
data.Wwj = 4.752e-3;  units.Wwj = 'g'; label.Wwj = 'wet weight of pupa';      bibkey.Wwj = 'Chri1960';
data.Wwe = 3.04e-3;   units.Wwe = 'g'; label.Wwe = 'wet weight of imago';     bibkey.Wwe = 'Chri1960';

data.E0 = 0.0182*4.184; units.E0 = 'J'; label.E0 = 'initial energy content'; bibkey.E0 = 'Brie1990';
  comment.E0 = '0.018 cal per egg';

data.Ni  = 400; units.Ni  = '#';  label.Ni  = 'total number of eggs';   bibkey.Ni  = 'Chri1960';   
  temp.Ni = C2K(28); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data

% time - length head capsule at instars
data.tL =  [ ... % instar period (d), length head capsule (mm)
    1 0.278
    1 0.463
    1 0.74
    3 0.98];
data.tL(:,1) = cumsum(data.tL(:,1)); % convert instar period to time since birth
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL  = {'d', 'mm'}; label.tL = {'time since birth', 'head capsule'};  
temp.tL   = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Chri1960';
comment.tL = 'times correspond to instars';

% time - wet weights of larva  
data.tW =  [ ... % time since birth (d), wet weight (mg)
        0           0.0137
        0.75       	0.065
        0.958333333	0.089
        1           0.09
        1.041666667	0.118
        1.083333333	0.119
        1.166666667	0.146
        1.833333333	0.414
        1.875       0.54
        1.916666667	0.52
        2           0.55
        2.125   	0.58
        2.208333333	0.69
        2.25    	0.73
        2.875       1.71
        2.916666667	1.76
        2.958333333	1.5
        3.166666667	2.07
        3.958333333	2.96
        4.791666667	3.59
        4.875       3.86
        4.958333333	4.13
        6           5.6];
data.tW(:,2) = data.tW(:,2)/ 1000; % convert mg to g
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(28);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Chri1960';

% respiration data		
TWJO = [ ... % temp (C), wet weight (mg), O2 consumption mm^3/h.g 
 25.5  10.1   990   % larva
 27.9  40 	 1200   % larva
 27.6  45.8  1048   % larva
 %27.5  14.8   736   % pupa
 %28    31.7   902   % pupa
 %28     4.86 4713   % imago
 %28 	6.38 3495   % imago
 ]; 
data.WJO = TWJO(:,[2 3])/1000 ;  % weight in g, respiration in cm^3/h.g
units.WJO   = {'g', 'cm^3/h.g'};  label.WJO = {'wet weight', 'O_2 consumption'};  
temp.WJO    = C2K(TWJO(:,1));  units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
treat.WJO = {0}; units.treat.WJO = '-'; label.treat.WJO = ''; % no interpolation
bibkey.WJO = 'Chri1960'; 
  
%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = 0 * weights.Ww0;
weights.E0 = 0 * weights.E0;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_2: model hax with constant food density replaces model hex with varying food density';
D2 = ['Ww0 and E0 are given weight 0 since Wwj is inconsistent with Ni eggs of weight Ww0; '...
      'the eggs possibly receive contributions from blood-derived material, collected by the imago'];
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = '4 instars between birth and pupation';
metaData.bibkey.F1 = 'Chri1960'; 
F2 = 'female emago takes blood for eggs, but larvae also allocate to reproduction';
metaData.bibkey.F2 = 'Chri1960'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '89W72'; % Cat of Life
metaData.links.id_ITIS = '126240'; % ITIS
metaData.links.id_EoL = '740699'; % Ency of Life
metaData.links.id_Wiki = 'Aedes_aegypti'; % Wikipedia
metaData.links.id_ADW = 'Aedes_aegypti'; % ADW
metaData.links.id_Taxo = '28492'; % Taxonomicon
metaData.links.id_WoRMS = '1490815'; % WoRMS
metaData.links.id_diptera = 'Aedes+aegypti'; % Diptera

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aedes_aegypti}}';
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
bibkey = 'Chri1960'; type = 'Book'; bib = [ ... 
'author = {Christophers, S. R.}, ' ... 
'year = {1960}, ' ...
'title = {\emph{Aedes aegypti} ({L}.) the Yellow Fever Mosquito: its Life History, Bionomics and Structure}, ' ...
'publisher = {Cambridge University Press}, ' ...
'address = {Cambridge}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brie1990'; type = 'Article'; bib = [ ... 
'author = {Briegel, H.}, ' ... 
'year = {1990}, ' ...
'title = {Metabolic relationship between female body size, reserves, and fecundity of \emph{Aedes aegypti}}, ' ...
'journal = {J. Insect Physiol.}, ' ...
'volume = {36}, ' ...
'pages = {165--172}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

