function [data, auxData, metaData, txtData, weights] = mydata_Cheilotrema_saturnum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Cheilotrema_saturnum'; 
metaData.species_en = 'Black croaker'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 01];

%% set data
% zero-variate data

data.ab = 15;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(16.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(16.3);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27;   units.Lp   = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 45;  units.Li   = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based of egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 255; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00933*Lp^3.10, see F1';
data.Wwi = 1244; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.10, see F1; max piblished weight 700 g';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(16.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Argyrosomus regius';
 
% uni-variate data
% time-length
data.tL_fm =	[ ... % time since birth (yr), total length (cm)
    1 15.4 15.2
    2 18.5 17.7
    3 19.9 17.8
    4 20.0 20.1
    5 21.0 20.2
    6 20.9 21.0
    7 22.1 20.7
    8 22.4 22.1
    9 22.9 22.7
   10 22.4 23.1
   11 24.4 22.1
   12 24.1 23.9
   13 22.7 21.5
   14 23.3 26.9
   15 23.0 23.8
   16 NaN  22.0
   17 24.3 24.5
   18 NaN  24.0
   19 20.6 29.0
   21 NaN  24.2];
data.tL_fm(:,1) = (1.4+data.tL_fm(:,1))*365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(16.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MillPond2008'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.weights = weights;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f22','tL_f21'}; subtitle1 = {'mesocosm'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TSZY'; % Cat of Life
metaData.links.id_ITIS = '169358'; % ITIS
metaData.links.id_EoL = '46579114'; % Ency of Life
metaData.links.id_Wiki = 'Cheilotrema'; % Wikipedia
metaData.links.id_ADW = 'Cheilotrema_saturnum'; % ADW
metaData.links.id_Taxo = '170709'; % Taxonomicon
metaData.links.id_WoRMS = '280137'; % WoRMS
metaData.links.id_fishbase = 'Cheilotrema-saturnum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cheilotrema}}';
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
bibkey = 'MillPond2008'; type = 'Article'; bib = [ ... 
'author = {EricF. Miller and Daniel J. Pondella and Larry G. Allen and Keevin T. Herbinson}, ' ... 
'year = {2008}, ' ...
'title = {The life history and ecology of black croaker, \emph{Cheilotrema saturnum}}, ' ...
'journal = {California Cooperative Oceanic Fisheries Investigations Report}, ' ...
'volume = {49}, ' ...
'pages = {191-201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cheilotrema-saturnum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
