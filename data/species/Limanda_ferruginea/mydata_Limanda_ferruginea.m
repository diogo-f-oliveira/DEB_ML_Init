function [data, auxData, metaData, txtData, weights] = mydata_Limanda_ferruginea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Limanda_ferruginea'; 
metaData.species_en = 'Yellowtail flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2017 03 18];              
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

data.tp = 5.3*365;    units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'fishbase';   
  temp.tp = C2K(7); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 12*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 29.9;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'fishbase';
data.Li  = 64;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 3.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'nefsc';
  comment.Wwb = 'based on egg diameter 0.88 mm: 4/3*pi*0.044^3';
data.Wwi = 1.5e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  
data.Ri  = 737200/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 51 cm';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Data from Grand Bank, assumed max length of tL data';
  
% uni-variate data
% time-length
tL = [ ... % time since birth (yr), total length males, females (cm)
 0  3.0  3.0
 1 12.0  9.8
 2 14.1 15.0
 3 19.5 20.5
 4 24.0 24.5
 5 28.8 27.2
 6 33.7 35.0
 7 36.4 38.6
 8 38.0 42.8
 9 42.6 44.2
10 43.5 45.6
11 44.6 48.3
12 43.7 48.1
13 42.5 47.8
14 46.5 49.0
15  0   50.8];
tL(:,1) = 365 * (.75 + tL(:,1)); 
data.tL_f = tL(:,[1 3]);
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DwyeWals2003';
comment.tL_f = 'Data for females';
% 
data.tL_m = tL(:,[1 2]); data.tL_m(end,:) = [];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DwyeWals2003';
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
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Preferred temperature 7 C';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6PZCL'; % Cat of Life
metaData.links.id_ITIS = '172909'; % ITIS
metaData.links.id_EoL = '46570104'; % Ency of Life
metaData.links.id_Wiki = 'Limanda_ferruginea'; % Wikipedia
metaData.links.id_ADW = 'Limanda_ferruginea'; % ADW
metaData.links.id_Taxo = '178824'; % Taxonomicon
metaData.links.id_WoRMS = '158879'; % WoRMS
metaData.links.id_fishbase = 'Limanda-ferruginea'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Limanda_ferruginea}}';
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
bibkey = 'DwyeWals2003'; type = 'Article'; bib = [ ... 
'author = {K. S. Dwyer and S. J. Walsh and S. E. Campana}, ' ... 
'year = {2003}, ' ...
'title = {Age determination, validation and growth of {G}rand {B}ank yellowtail flounder (\emph{Limanda ferruginea})}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {60}, ' ...
'pages = {1123-1138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/521}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nefsc'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nefsc.noaa.gov/nefsc/publications/tm/tm140/tm140.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

