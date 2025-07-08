function [data, auxData, metaData, txtData, weights] = mydata_Hyporhamphus_melanochir
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae';
metaData.species    = 'Hyporhamphus_melanochir'; 
metaData.species_en = 'Southern garfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 10];

%% set data
% zero-variate data

data.am = 10*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'fishbase';   
  temp.am = C2K(17.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on tL data at ap = 1 yr';
data.Li  = 52;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Lin1958';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwi = 600;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00240*Li^3.10.00257*Li^3.090, see F1';

data.Ri = 1e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [... % time since birth (d), fork length (cm)
    1  9.3  9.7
    2 16.7 16.3
    3 22.5 22.4
    4 27.8 26.7
    5 32.2 33.0
    6 32.1 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0) * 365;
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length', 'female'};  
temp.tL_fm    = C2K(17.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1 {'females','males'}};
bibkey.tL_fm = 'Lin1958';
comment.tL_fm = 'data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'wet weight (g) = 0.00257*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic to Australian temperate waters (Murchison River, Kalbarri in Western Australia to Eden, New South Wales, including Tasmania).';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6MR7X'; % Cat of Life
metaData.links.id_ITIS = '165496'; % ITIS
metaData.links.id_EoL = '46567016'; % Ency of Life
metaData.links.id_Wiki = 'Hyporhamphus_melanochir'; % Wikipedia
metaData.links.id_ADW = 'Hyporhamphus_melanochir'; % ADW
metaData.links.id_Taxo = '177185'; % Taxonomicon
metaData.links.id_WoRMS = '272186'; % WoRMS
metaData.links.id_fishbase = 'Hyporhamphus-melanochir'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporhamphus_melanochir}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%165496
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lin1958'; type = 'Article'; bib = [ ... 
'author = {J . K . Lin}, ' ... 
'year = {1958}, ' ...
'title = {THE SEA GARFISH \emph{Reporhamphus_melanochir} ({C}UVIER \& {V}ALENCIENNES) ({H}EMIRAMPHIDAE) IN SOUTH {A}USTRALIA: BREEDING, AGE DETERMINATION. AND GROWTH RATE}, ' ...
'journal = {Australian journal of marine and freshwater research}, ' ...
'volume = {9(1)}, ' ...
'pages = {60-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hyporhamphus-melanochir.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

