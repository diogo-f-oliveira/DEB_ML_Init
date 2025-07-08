  function [data, auxData, metaData, txtData, weights] = mydata_Caranx_crysos
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Caranx_crysos'; 
metaData.species_en = 'Blue runner'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE','MAE','MAm'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 12];

%% set data
% zero-variate data
data.ab = 6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(24.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 27.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 70;     units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 299;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01660*Lp^2.96, see F1';
data.Wwi = 4804;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01660*Li^2.96, see F1';

data.Ri  = 1546000/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(26.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm), weight (g)
    1 21.4 21.1
    2 27.1 26.7
    3 32.0 31.4
    4 34.3 34.0
    5 35.6 36.0
    6 36.9 37.5
    7 37.7 38.9
    8 40.0 39.9
    9 40.6 40.6
   10 40.2 41.6
   11 41.4 43.9];
data.tL_fm(:,1) = (0.5 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
  temp.tL_fm = C2K(24.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature'; 
bibkey.tL_fm = 'GoodJohn1986'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;
weights.Wwp = weights.Wwp * 0;
weights.Li = weights.Li * 5;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01660*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2NP'; % Cat of Life
metaData.links.id_ITIS = '168612'; % ITIS
metaData.links.id_EoL = '46577966'; % Ency of Life
metaData.links.id_Wiki = 'Caranx_crysos'; % Wikipedia
metaData.links.id_ADW = 'Caranx_crysos'; % ADW
metaData.links.id_Taxo = '165427'; % Taxonomicon
metaData.links.id_WoRMS = '126802'; % WoRMS
metaData.links.id_fishbase = 'Caranx-crysos'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Caranx_crysos}}';  
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
bibkey = 'GoodJohn1986'; type = 'article'; bib = [ ...
'doi = {10.18785/negs.0802.02}, ' ...
'author = {Goodwin, J. M. and A. G. Johnson}, ' ...
'year = {1986}, ' ...
'title = {Age, Growth, and Mortality of Blue Runner, \emph{Caranx crysos}, from the {N}orthern {G}ulf of {M}exico}, ' ... 
'journal = {Northeast Gulf Science}, ' ...
'volume = {8(2)}, '...
'pages = {107-114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Caranx-crysos.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  