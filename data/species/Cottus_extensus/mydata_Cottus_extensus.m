function [data, auxData, metaData, txtData, weights] = mydata_Cottus_extensus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Cottus_extensus'; 
metaData.species_en = 'Bear Lake sculpin'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 23];


%% set data
% zero-variate data

data.am = 4 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'RuzyWurt1998';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.75;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'RuzyWurt1998'; 
data.Lpm  = 5.75;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for maes';  bibkey.Lpm  = 'RuzyWurt1998'; 
data.Li  = 13;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';
data.Lim  = 12;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = {'fishbase','RuzyWurt1998'};
  comment.Lim = 'based on largest male of TL 9 cm, and female 9.5 cm in RuzyWurt1998';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwp = 2.089;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'RuzyWurt1998';
  comment.Wwi = 'based on 0.00891*Lp^3.12, see F1';
data.Wwpm = 2.089;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';     bibkey.Wwpm = 'RuzyWurt1998';
  comment.Wwi = 'based on 0.00891*Lpm^3.12, see F1';
data.Wwi = 26.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = {'RuzyWurt1998','fishbase'};
  comment.Wwi = 'based on 0.00891*Li^3.12, see F1';
data.Wwim = 20.7;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = {'RuzyWurt1998','fishbase'};
  comment.Wwim = 'based on 0.00891*Lim^3.12, see F1';

  
data.Ri = 486/365; units.Ri = '#/d'; label.Ri = 'reproduction rate at TL 9.5 cm'; bibkey.Ri = 'RuzyWurt1998';
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on F = -334 + 86.3 * 9.5';

% uni-variate data
% time-length
data.tL = [ ... % age (years), total length (cm) 
    1 4.6
    2 6.3
    3 8.0];
data.tL(:,1) = 365 * (.3 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RuzyWurt1998';
comment.tL = 'data for sexes combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YYGN'; % Cat of Life
metaData.links.id_ITIS = '167242'; % ITIS
metaData.links.id_EoL = '210362'; % Ency of Life
metaData.links.id_Wiki = 'Cottus_extensus'; % Wikipedia
metaData.links.id_ADW = 'Cottus_extensus'; % ADW
metaData.links.id_Taxo = '172060'; % Taxonomicon
metaData.links.id_WoRMS = '1013620'; % WoRMS
metaData.links.id_fishbase = 'Cottus-extensus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottus_extensus}}';
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
bibkey = 'RuzyWurt1998'; type = 'Article'; bib = [ ... 
'author = {James R. Ruzycki and Wayne A. Wurtsbaugh and Clyde Lay}, ' ... 
'year = {1998}, ' ...
'title = {Reproductive ecology and early life history of the lacustrine sculpin, \emph{Cottus extensus} ({T}eleostei, {C}ottidae}, ' ...
'journal = {Envir. Biol. Fishes}, ' ...
'volume = {53}, ' ...
'pages = {117-127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cottus-extensus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

