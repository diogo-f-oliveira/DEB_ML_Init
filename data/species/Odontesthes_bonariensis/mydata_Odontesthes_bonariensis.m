function [data, auxData, metaData, txtData, weights] = mydata_Odontesthes_bonariensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Odontesthes_bonariensis'; 
metaData.species_en = 'Argentinian silverside'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcp', '0iMm', 'jiFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 04];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'ChalGarr2014';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13.2;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on "reserve accumulation in winter", combined with tL data';
data.Li  = 50;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'ChalGarr2014';
  comment.Wwb = 'based of egg diameter of 1.6 mm: pi/6*0.16^3';
data.Wwp  = 17.5;  units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'based on 0.00741*Lp^3.01, see F1';
data.Wwi  = 963;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00741*Li^3.01, see F1';

data.Ri = 5.6e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'ChalGarr2014';   
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity of 58483 per kg';

% uni-variate data
% time-length
data.tL_fm = [ ... time since birth (yr), total length (cm)
    3 28.8 28.0
    5 31.9 30.0
    7 37.6 37.7
   10 43.3 41.7];
data.tL_fm(:,1) = (0.6+data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'}; 
temp.tL_fm    = C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ChalGarr2014'; treat.tL_fm = {1 {'females','males'}}; 

% time-weight
data.tW_fm = [ ... time since birth (yr), weight (g)
    3 196.2 167.0
    5 295.0 243.6
    7 428.6 375.8
   10 654.2 584.6];
data.tW_fm(:,1) = (0.6+data.tW_fm(:,1)) * 365; % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'}; 
temp.tW_fm    = C2K(17);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'ChalGarr2014'; treat.tW_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.tW_fm = weights.tW_fm * 5;
weights.Wwb = weights.Wwb * 10;
weights.Wwi = weights.Wwi * 3;
weights.Ri = weights.Ri * 3;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00741*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '48NRG'; % Cat of Life
metaData.links.id_ITIS = '630684'; % ITIS
metaData.links.id_EoL = '46566584'; % Ency of Life
metaData.links.id_Wiki = 'Odontesthes_bonariensis'; % Wikipedia
metaData.links.id_ADW = 'Odontesthes_bonariensis'; % ADW
metaData.links.id_Taxo = '181638'; % Taxonomicon
metaData.links.id_WoRMS = '281825'; % WoRMS
metaData.links.id_fishbase = 'Odontesthes-bonariensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Odontesthes_bonariensis}}'];
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
bibkey = 'RosDoma2006'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2012.03494.x}, ' ...
'author = {Alberto Espinach Ros and Alejandro Dom\''{a}nico}, ' ... 
'year = {2006}, ' ...
'title = {GROWTH OF ARGENTINE SILVERSIDE (\emph{Odontesthes bonariensis}) STOCKED AT LOW DENSITIES IN TWO OLIGOHALINE SHALLOW LAKES({B}UENOS {A}IRES PROVINCE, {A}RGENTINA)}, ' ...
'journal = {Rev. Invest. Desarr. Pesq.}, ' ...
'volume = {18}, ' ...
'pages = {75-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChalGarr2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/are.12555}, ' ...
'author = {Tom''{a}s Chalde and \''{A}ngela G\''{a}rriz and Eduardo A. Sanches and Leandro A. Miranda}, ' ... 
'year = {2014}, ' ...
'title = {Influence of pejerrey \emph{Odontesthes bonariensis} ({V}alenciennes, 1835) broodstock age on gamete quality, reproductive performance and plasma sex steroid levels during the spawning season}, ' ...
'journal = {Aquaculture Research, , }, ' ...
'pages = {1–14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Odontesthes-argentinensis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

