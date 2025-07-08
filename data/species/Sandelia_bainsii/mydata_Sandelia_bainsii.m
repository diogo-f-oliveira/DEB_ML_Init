function [data, auxData, metaData, txtData, weights] = mydata_Sandelia_bainsii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Anabantidae';
metaData.species    = 'Sandelia_bainsii'; 
metaData.species_en = 'Rocky kurper'; 

metaData.ecoCode.climate = {'BSk','Cwa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 19];

%% set data
% zero-variate data

data.ab = 6.6; units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10 * 365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6.4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 18.3;   units.Li  = 'cm';   label.Li  = 'ultimate total length for females';   bibkey.Li  = {'MayeHech1990','fishbase'};
data.Lim  = 26;   units.Lim  = 'cm';   label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at puberty';     bibkey.Wwb = 'MayeHech1990';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 4.6; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01778*Lp^2.99, see F1';
data.Wwi = 105; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwim = 'based on (Li/Lim)^3*Wwim: (18.3/26)^3*302';
data.Wwim = 302; units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.01778*Li^2.99, see F1; max published weight 130 g';
 
data.GSI = 0.13;   units.GSI = '-';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'MayeHech1990';
  temp.GSI = C2K(23); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time - length - weight
data.tL_fm = [ ... % time  (d), std length (cm)
    1  7.3  8.4
    2  9.8 11.2
    3 11.7 14.3
    4 13.6 16.3];
data.tL_fm(:,1) = 365 * (0.8+data.tL_fm(:,1)); % convert yr to d
data.tL_fm(:,2:3) = 1.3 * data.tL_fm(:,2:3);
units.tL_fm   = {'d', 'cm', 'g'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(23);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MayeHech1988'; treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;

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
F1 = 'length-weight: Ww in g = 0.01778*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: TL = 1.3*SL';
metaData.bibkey.F2 = 'MayeHech1988'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79HLX'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sandelia_bainsii'; % Wikipedia
metaData.links.id_ADW = 'Sandelia_bainsii'; % ADW
metaData.links.id_Taxo = '186510'; % Taxonomicon
metaData.links.id_WoRMS = '1021156'; % WoRMS
metaData.links.id_fishbase = 'Sandelia-bainsii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anabas_testudineus}}';
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
bibkey = 'MayeHech1988'; type = 'Article'; bib = [ ... 
'doi = {10.1080/02541858.1988.11448115}, ' ...
'author = {Mayekiso, M. and T. Hecht}, ' ... 
'year = {1988}, ' ...
'title = {Age and growth of \emph{Sandelia bainsii} {C}astelnau ({P}isces: {A}nabantidae) in the {T}yume {R}iver, {E}astern {C}ape ({S}outh {A}frica)}, ' ...
'journal = {S. Afr. J. Zool.}, ' ...
'volume = {23(4)}, ' ...
'pages = {295-300}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MayeHech1990'; type = 'Article'; bib = [ ... 
'doi = {10.1080/02541858.1988.11448115}, ' ...
'author = {Mayekiso, M. and T. Hecht}, ' ... 
'year = {1990}, ' ...
'title = {The feeding and reproductive biology of a {S}outh {A}frican {A}nabantid jish, \emph{Sandelia bainsii}}, ' ...
'journal = {Rev. Hydrobiol. trop.}, ' ...
'volume = {23(3))}, ' ...
'pages = {219-230}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Anabas-testudineus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

