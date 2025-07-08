  function [data, auxData, metaData, txtData, weights] = mydata_Luciobarbus_sclateri

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Luciobarbus_sclateri'; 
metaData.species_en = 'Andalusian barbel'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'};  
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.tp = 5*365;      units.tp = 'd';  label.tp = 'age at puberty for females';         bibkey.tp = 'HerrHern1988';
  temp.tp = C2K(16.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'from tL_f data at Lp';
data.am = 18*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(16.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
  comment.Lp = '11 to 16 cm';
data.Li = 41.3;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'HerrHern1988';
  comment.Wwb = 'based on egg diameter of 1.7 mm: 4/3*pi*0.085^3';
    
data.GSI = 0.18; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';          bibkey.GSI = 'HerrHern1988';
  temp.GSI = C2K(15); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
% females
data.tL_f = [ ... % time since birth (yr), fork length (cm)
 1  3.7
 2  5.7
 3  8.1
 4 10.7
 5 13.3
 6 15.7
 7 18.1
 8 20.1
 9 22.5
10 24.6];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
data.tL_f(:,2) = 0.1 + 1.1 * data.tL_f(:,2); % convert fork to total length
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(16.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HerrHern1988';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1  3.5
2  5.4
3  7.6
4 10.1
5 12.1
6 14.0
7 16.0
8 17.1];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
data.tL_m(:,2) = 0.1 + 1.1 * data.tL_m(:,2); % convert fork to total length
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(16.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HerrHern1988';
comment.tL_m = 'Data for males';

% time-weight
% females
data.tW_f = [ ... % time since birth (yr), wet weight (g)
 1   0.71
 2   2.78
 3   9.63
 4  20.29
 5  33.22
 6  51.64
 7  73.08
 8 125.26
 9 152.26
10 235.54];
data.tW_f(:,1) = 365 * data.tW_f(:,1);
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(16.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'HerrHern1988';
comment.tW_f = 'Data for females';
% males
data.tW_m = [ ... % time since birth (yr), wet weight (g)
1   0.57
2   2.25
3   6.42
4  15.65
5  27.49
6  44.33
7  62.20
8  79.04];
data.tW_m(:,1) = 365 * data.tW_m(:,1);
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(16.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'HerrHern1988';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
%weights.tW_f = weights.tW_f * 2;
%weights.tW_m = weights.tW_m * 2;
%weights.Wb = weights.Wb * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3WCLB'; % Cat of Life
metaData.links.id_ITIS = '688732'; % ITIS
metaData.links.id_EoL = '225284'; % Ency of Life
metaData.links.id_Wiki = 'Luciobarbus_sclateri'; % Wikipedia
metaData.links.id_ADW = 'Luciobarbus_sclateri'; % ADW
metaData.links.id_Taxo = '1682769'; % Taxonomicon
metaData.links.id_WoRMS = '1020754'; % WoRMS
metaData.links.id_fishbase = 'Luciobarbus-sclateri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Luciobarbus_sclateri}}';  
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
bibkey = 'HerrHern1988'; type = 'Article'; bib = [ ...  
'author = {Herrera, M. and Hernando, J. A. and Fernandez-Delgado, C. and Bellido, M.}, ' ...
'year = {1988}, ' ...
'title = {Age, growth and reproduction of the barbel, \emph{Barbus sclateri} ({G}uenther, 1868), in a first-order stream in southern {S}pain}, ' ... 
'journal = {J. Fish Biol.}, ' ...
'pages = {371--381}, ' ...
'volume = {33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/23605}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

