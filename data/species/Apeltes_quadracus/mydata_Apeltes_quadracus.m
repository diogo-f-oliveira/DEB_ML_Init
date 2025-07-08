function [data, auxData, metaData, txtData, weights] = mydata_Apeltes_quadracus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Gasterosteidae';
metaData.species    = 'Apeltes_quadracus'; 
metaData.species_en = 'Fourspine stickleback'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFe','0iMm'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 09 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 6;       units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ADW';   
  temp.ab = C2K(21.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;     units.am = 'd';  label.am = 'life span';                 bibkey.am = 'Schw1965';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'males live 1 yr';

data.Lp  = 2.5;    units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'Schw1965'; 
  comment.Lp = 'based on tp = 1 yr and tL data';
data.Li  = 6.4;    units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'CraiFitz1982';
  comment.Wwb = 'based on egg diameter of 1.4 mm for Gasterosteus aculeatus: pi/6*0.14^3';
data.Wwp = 0.17;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'CraiFitz1982','fishbase'};
  comment.Wwp = 'based on 0.01023*Lp^3.07, see F1';
data.Wwi = 3.05;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.07, see F1';

data.Ri = 36/ 365; units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'CraiFitz1982';   
temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
%  time - length
data.tL_f = [... % time  (d), total length (cm)
    0 0.43   % hatch 
    9 2.95   % nov, assuming birth in mar
   12 4.14   % next spring
   28 5.76]; % 2 annuli
data.tL_f(:,1) = data.tL_f(:,1) * 30.5; % set origin at birth
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(12);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Schw1965';
comment.tL_f = 'data for females';
%
data.tL_m = [... % time since hatch (mnt), total length (cm)
    0 0.43   % hatch 
    9 3.00   % nov, assuming birth in mar
   12 3.85]; % next spring
data.tL_m(:,1) = data.tL_m(:,1) * 30.5; % onvert mnth to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(12);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Schw1965';
comment.tL_m = 'data for males';

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length - weight: Ww in g = 0.01023*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length - length from photo: SL = 0.89 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'F9CZ'; % Cat of Life
metaData.links.id_ITIS = '166397'; % ITIS
metaData.links.id_EoL = '46567453'; % Ency of Life
metaData.links.id_Wiki = 'Apeltes_quadracus'; % Wikipedia
metaData.links.id_ADW = 'Apeltes_quadracus'; % ADW
metaData.links.id_Taxo = '44797'; % Taxonomicon
metaData.links.id_WoRMS = '159436'; % WoRMS
metaData.links.id_fishbase = 'Apeltes-quadracus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apeltes_quadracus}}';
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
bibkey = 'Schw1965'; type = 'Article'; bib = [ ... 
'author = {Schwarz, F. J.}, ' ... 
'year = {1965}, ' ...
'title = {Age, Growth, and Egg Complement of the Stickleback \emph{Apeltes quadracus} at {S}olomons, {M}aryland}, ' ...
'journal = {Chesapeake Sci.}, ' ...
'volume = {6(2)}, ' ...
'pages = {116-118}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CraiFitz1982'; type = 'Article'; bib = [ ... 
'author = {David Craig and Gerard J. FitzGerald}, ' ... 
'year = {1982}, ' ...
'title = {Reproductive tactics of four sympatric sticklebacks ({G}asterosteidae)}, ' ...
'journal = {Ehv. Biol. Fish.}, ' ...
'volume = {7(4)}, ' ...
'pages = {369-375}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Apeltes-quadracus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Apeltes_quadracus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

