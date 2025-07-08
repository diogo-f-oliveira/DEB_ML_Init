function [data, auxData, metaData, txtData, weights] = mydata_Paralabrax_auroguttatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Paralabrax_auroguttatus'; 
metaData.species_en = 'Goldspotted sand bass'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 31];

%% set data
% zero-variate data

data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(17.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 34 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(17.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 35;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 71;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 742;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01349*Lp^3.07, see F1';
data.Wwi = 6.5e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^3.07, see F1; max published weight 2.7 kg';
 
data.Ri = 2560000/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(17.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Paralabrax_clathratus';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    2 NaN  22.5 18.0 24.0
    3 22.1 25.7 19.9 21.9
    4 24.2 25.0 22.2 26.4
    5 25.9 27.3 25.0 27.6
    6 28.4 28.9 27.9 30.5
    7 27.8 29.5 31.9 30.7
    8 30.8 32.8 31.1 32.1
    9 31.1 NaN  30.5 NaN
   10 NaN  30.0 NaN  35.0
   11 37.4 NaN  35.7 42.9
   12 NaN  39.5 NaN  NaN
   13 41.5 NaN  NaN  NaN
   15 42.2 NaN  NaN  NaN
   16 38.5 NaN  NaN  NaN
   24 47.9 NaN  NaN  NaN];
data.tL_fm(:,1) = (0.9+data.tL_fm(:,1)) * 365;
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(17.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PondAlle2001'; 
treat.tL_fm = {1, {'females Islas Encantadas','males Islas Encantadas','females Bahia de los Angeles','males Bahia de los Angeles'}};
title.tL_fm = {'(fe)males from Islas Encantadas, Bahia de los Angeles'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CXQM'; % Cat of Life
metaData.links.id_ITIS = '167836'; % ITIS
metaData.links.id_EoL = '46579338'; % Ency of Life
metaData.links.id_Wiki = 'Paralabrax'; % Wikipedia
metaData.links.id_ADW = 'Paralabrax_auroguttatus'; % ADW
metaData.links.id_Taxo = '182781'; % Taxonomicon
metaData.links.id_WoRMS = '282052'; % WoRMS
metaData.links.id_fishbase = 'Paralabrax-auroguttatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralabrax}}';
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
bibkey = 'PondAlle2001'; type = 'article'; bib = [ ... 
'doi = {10.1577/1548-8659(2001)130<0686:dpogsr>2.0.co;2}, ' ...
'author = {Pondella, D. J. and Allen, L. G. and Rosales Casian and J. A. and Hovey, T. E.}, ' ... 
'year = {2001}, ' ...
'title = {Demographic Parameters of Golden Spotted Rock Bass \emph{Paralabrax auroguttatus} from the Northern {G}ulf of {C}alifornia}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {130(4)}, ' ...
'pages = {686–691}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Paralabrax-auroguttatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

