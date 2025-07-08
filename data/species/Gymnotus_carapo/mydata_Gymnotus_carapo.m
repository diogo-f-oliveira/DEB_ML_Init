  function [data, auxData, metaData, txtData, weights] = mydata_Gymnotus_carapo
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gymnotiformes'; 
metaData.family     = 'Gymnotidae';
metaData.species    = 'Gymnotus_carapo'; 
metaData.species_en = 'Banded knifefish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 25];

%% set data
% zero-variate data
data.ab = 12.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Barb1995';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 24.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'BarbBarb1983';
data.Li = 76;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'CognFial2006';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 45.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Barb1995'};
  comment.Wwp = 'based on 0.00372*Lp^2.93, see F1';
data.Wwi = 1.2e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00372*Li^2.93, see F1';
 
data.Ri = 915/30; units.Ri = '#/d';  label.Ri = 'max reproduction rate ';   bibkey.Ri = 'CognFial2006';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'abs fecundity is 915.3, assumed to be monthly';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm), femles, males
   -0.125  2.2  2.1
    0.125  3.6  3.5
    0.375  8.5  8.8
    0.625 11.4 12.6
    0.875 16.3 16.2
    1.125 19.9 19.1
    1.375 20.5 21.3
    1.625 23.5 22.0
    1.875 26.6 25.1
    2.125 27.6 27.5
    2.375 30.1 30.6
    2.625 31.3 30.8
    2.875 32.5 32.0
    3.125 33.9 32.5
    3.375 34.2 34.4
    3.625 35.2 33.6
    3.875 36.2 36.3
    4.125 35.3 35.2
    4.375 37.5 36.6
    4.625 37.6 39.2
    4.875 38.0 40.1
    5.125 39.7 39.2
    5.375 41.7 41.1
    5.625 40.9 42.3
    5.875 41.3 43.5
    6.125 40.7 44.5
    6.375 43.7 45.3
    6.625 45.1 48.8
    6.875 46.1 46.5
    7.125 45.0 48.0
    7.375 46.2 48.6];
data.tL_fm(:,1) = (.25 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(24.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'BarbBarb1983';

% length-weight
data.LW_fm = [ ... % total length (cm), weight(g), females, males
    1.7   0.03   0.03
    3.1   0.12   0.13
    5.1   0.45   0.40
    7.2   1.20   1.10
    8.9   2.07   1.90
   10.9   3.38   3.26
   12.8   5.41   6.00
   15.2   9.01   8.25
   16.9  12.61  12.72
   19.0  17.32  18.36
   20.9  25.83  25.26
   22.9  32.60  34.07
   25.0  40.31  40.32
   27.0  56.11  54.90
   28.9  68.85  70.08
   30.9  83.58  80.09
   33.0  97.18  91.08
   34.8 119.29 115.45
   37.0 136.16 131.78
   38.9 146.90 145.09
   41.0 161.83 157.68
   42.8 184.27 180.92
   45.2 221.37 196.42
   46.9 236.60 215.28
   49.1 251.00 248.69
   51.1 NaN    285.27
   52.1 NaN    315.00];
units.LW_fm = {'cm', 'g'};  label.LW_fm = {'total length','weight'};  
  treat.LW_fm = {1, {'females','males'}};
bibkey.LW_fm = 'BarbBarb1983';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;
weights.tL_fm = weights.tL_fm * 3;
weights.ab = weights.ab * 0;

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
F1 = 'length-weight: Ww in g = 0.00372*(TL in cm)^2.93'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3HVM4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '219380'; % Ency of Life
metaData.links.id_Wiki = 'Gymnotus_carapo'; % Wikipedia
metaData.links.id_ADW = 'Gymnotus_carapo'; % ADW
metaData.links.id_Taxo = '43456'; % Taxonomicon
metaData.links.id_WoRMS = '1020602'; % WoRMS
metaData.links.id_fishbase = 'Gymnotus-carapo'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Gymnotus_carapo}}';  
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
bibkey = 'BarbBarb1983'; type = 'Article'; bib = [ ...
'author = {Barbieri, G. and Barbieri, M. C.}, ' ...
'year = {1983}, ' ...
'title = {Growth and first sexual maturation size of \emph{Gymnotus carapo} ({L}innaeus, 1758) in the {L}obo reservoir ({S}tate of {S}\~{a}o {P}aulo, {B}razil) ({P}isces, {G}ymnotidae)}, ' ... 
'journal = {Revista Hydrobiologia Tropical}, ' ...
'volume = {16(2)}, '...
'pages = {195-201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CognFial2006'; type = 'Article'; bib = [ ...
'author = {Diego de Paula Cognato and Clarice Bernhardt Fialho}, ' ...
'year = {2006}, ' ...
'title = {Reproductive biology of a population of \emph{Gymnotus aff. carapo} ({T}eleostei: {G}ymnotidae)  from southern {B}razil}, ' ... 
'journal = {Neotropical Ichthyology}, ' ...
'volume = {4(3}, '...
'pages = {339-348}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnotus-carapo.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

