function [data, auxData, metaData, txtData, weights] = mydata_Paralichthys_californicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Paralichthys_californicus'; 
metaData.species_en = 'California halibut'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 03 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.tj = 25;     units.tj = 'd';  label.tj = 'time since hatch at metam';bibkey.tj = 'ADW';
  temp.tj = C2K(19);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '20 to 29 d';
data.tp = 4.5*365;     units.tp = 'd';  label.tp = 'time since birth at puberty for females'; bibkey.tp = 'ADW';
  temp.tp = C2K(19);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2.5*365;     units.tpm = 'd';  label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(19);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'MacNDome2001';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'ADW';  
data.Lj  = 0.8;    units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'ADW';  
  comment.Lj = '7.5 to 9.4 mm';
data.Lp  = 40;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';     bibkey.Lp  = 'ADW'; 
  comment.Lp = '38 to 43 cm';
data.Lpm  = 21.5;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'ADW'; 
  comment.Lpm = '20 to 23 cm';
data.Li  = 136.8;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'MacNDome2001';
data.Lim = 92.5;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'MacNDome2001';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
  comment.Wwb = 'based on egg diameter of 0.7 to 0.8 mm: 4/3*pi*0.0375^3';
data.Wwi = 33e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight at 152 cm';      bibkey.Wwi = 'ADW';

data.Ri  = 5e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data females
data.tL_f = [... % time since birth (yr), total length (cm)
 1 25.2
 2 29.2
 3 36.4
 4 46.3
 5 52.0
 6 59.1
 7 61.6
 8 66.6
 9 73.6
10 82.8
11 83.6
13 96.4]; 
data.tL_f(:,1) = (data.tL_f(:,1) + 0.8) * 365; % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'age', 'total length', 'female'};  
temp.tL_f = C2K(19); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MacNDome2001';
comment.tL_f = 'data for females in Southern California';
% t-L data males
data.tL_m = [... % time since birth (yr), total length (cm)
 1 25.9
 2 28.9
 3 31.9
 4 37.7
 5 41.7
 6 48.2
 7 50.6
 8 53.8
 9 55.2
10 57.8
11 57.7
12 58.6]; 
data.tL_m(:,1) = (data.tL_m(:,1) + 0.8) * 365; % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'age', 'total length', 'male'};  
temp.tL_m = C2K(19); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MacNDome2001';
comment.tL_m = 'data for males  in Southern California';
%
% t-L data females
data.tL_fC = [... % time since birth (yr), total length (cm)
 2  31.3
 3  37.3
 4  49.3
 5  60.6
 6  67.2
 7  72.6
 8  81.0
 9  84.2
10  97.0
12 102.7]; 
data.tL_fC(:,1) = (data.tL_fC(:,1) + 0.8) * 365; % convert yr to d
units.tL_fC = {'d', 'cm'}; label.tL_fC = {'age', 'total length', 'female'};  
temp.tL_fC = C2K(19); units.temp.tL_fC = 'K'; label.temp.tL_fC = 'temperature';
bibkey.tL_fC = 'MacNDome2001';
comment.tL_fC = 'data for females in Central California';
% t-L data males
data.tL_mC = [... % time since birth (yr), total length (cm)
 2 32.6
 3 38.5
 4 44.8
 5 49.3
 6 53.9
 7 59.6
 8 58.2
 9 64.9
10 78.1
11 73.7]; 
data.tL_mC(:,1) = (data.tL_mC(:,1) + 0.8) * 365; % convert yr to d
units.tL_mC = {'d', 'cm'}; label.tL_mC = {'age', 'total length', 'male'};  
temp.tL_mC = C2K(19); units.temp.tL_mC = 'K'; label.temp.tL_mC = 'temperature';
bibkey.tL_mC = 'MacNDome2001';
comment.tL_mC = 'data for males  in Central California';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for females, males in Southern California'};
set2 = {'tL_fC','tL_mC'}; subtitle2 = {'Data for females, males in Central California'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'The reproduction rate seems very small for a big fish with tiny eggs';
D3 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4);

%% Facts
F1 = 'Subtropical; Weight (g) - Total Length (cm) relationship: W = 0.00814*TL^3.071';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Both eyes can be dextral or sinistral (left or right side of body)';
metaData.bibkey.F2 = 'ADW'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4CYVD'; % Cat of Life
metaData.links.id_ITIS = '172743'; % ITIS
metaData.links.id_EoL = '46570506'; % Ency of Life
metaData.links.id_Wiki = 'Paralichthys_californicus'; % Wikipedia
metaData.links.id_ADW = 'Paralichthys_californicus'; % ADW
metaData.links.id_Taxo = '46919'; % Taxonomicon
metaData.links.id_WoRMS = '275809'; % WoRMS
metaData.links.id_fishbase = 'Paralichthys-californicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralichthys_californicus}}';
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
bibkey = 'MacNDome2001'; type = 'Article'; bib = [ ... 
'author = {L. S. MacNair and M. L. Domeier and C. S. Y. Chun}, ' ... 
'year = {2001}, ' ...
'title = {Age, growth, and mortality of California halibut, \emph{Paralichthys californicus}, along southern and central {C}alifornia}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {99}, ' ...
'pages = {588-600}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4228}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Paralichthys_californicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

