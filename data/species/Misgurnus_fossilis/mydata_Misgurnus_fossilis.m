  function [data, auxData, metaData, txtData, weights] = mydata_Misgurnus_fossilis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Misgurnus_fossilis'; 
metaData.species_en = 'Weatherfish'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 02];

%% set data
% zero-variate data
data.am = 21.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'EoL';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Schu2023 gives 20 yrs; PyrzZieb2020 gives 6 yrs in the field';

data.Lb = 0.44;  units.Lb = 'cm'; label.Lb = 'total length at birth';                bibkey.Lb = 'DrozKour2009'; 
data.Lp = 11;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';   bibkey.Lp = 'fishbase'; 
data.Li = 27.9;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'PyrzZieb2020';
  comment.Li = 'fishbase gives 30.7 cm';
data.Lim = 22;    units.Lim = 'cm'; label.Lim = 'ultimate total length for males'; bibkey.Lim = 'PyrzZieb2020';

data.Wwb = 8.8e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'DrozKour2009';
  comment.Wwb = 'Egg diameter of 1.24 mm: pi/6*0.124^3 = 9.98e-4 g, so actual weight is a little less';
data.Wwp = 7.05;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00417*Lp^3.10, see F2';
data.Wwi = 126.3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = {'fishbase','PyrzZieb2020'};
  comment.Wwi = 'Based on 0.00417*Li^3.10, see F2';

data.Ri = 6900/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate at TL = 23 cm';    bibkey.Ri = 'DrozKour2009';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'total fecundity at 23 cm';

% univariate data

% time-length
data.tL_fmRN = [ ... % time since birth (yr), total length (cm) for femlae, male
1	6.41  8.72
2   8.40 10.76
3  13.39 14.25
4  15.06 15.67
5  18.50 NaN
6  19.07 NaN];
data.tL_fmRN(:,1) = (.5 + data.tL_fmRN(:,1)) * 365; % convert yr to d
units.tL_fmRN = {'d', 'cm'}; label.tL_fmRN = {'time since birth', 'total length'};  
temp.tL_fmRN = C2K(16);  units.temp.tL_fmRN = 'K'; label.temp.tL_fmRN = 'temperature';
treat.tL_fmRN = {1 {'female','male'}}; label.treat.tL_fmRN = 'River Ner';
bibkey.tL_fmRN = 'PyrzZieb2020'; 
comment.tL_fmRN = 'Data for females, males from River Ner, Poland; length based on otolith data';
%
data.tL_fmNR = [ ... % time since birth (yr), total length (cm)
1  7.89  5.92
2  9.47  7.52
3 13.33  9.46
4 15.25 11.88
5 17.50 13.83
6 17.50 NaN];
data.tL_fmNR(:,1) = (.5 + data.tL_fmNR(:,1)) * 365; % convert yr to d
units.tL_fmNR = {'d', 'cm'}; label.tL_fmNR = {'time since birth', 'total length'};  
temp.tL_fmNR = C2K(16);  units.temp.tL_fmNR = 'K'; label.temp.tL_fmNR = 'temperature';
treat.tL_fmNR = {1 {'female','male'}}; label.treat.tL_fmNR = 'Nowy Row canal';
bibkey.tL_fmNR = 'PyrzZieb2020';
comment.tL_fmNR = 'Data for females, males from Nowy Row canal, Poland; length based on otolith data';

% temperature-age at birth
data.Tab = [ ... % temperature (C), incubation time (d)
    9 18.61
   12  8.57
   15  5.84
   18  3.63
   21  2.40
   24  1.80];
units.Tab = {'C', 'd'}; label.Tab = {'temperature', 'incubation time'};  
bibkey.Tab = 'DrozKour2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fmRN = 3 * weights.tL_fmRN;
weights.tL_fmNR = 3 * weights.tL_fmNR;
weights.Wwp = 0 * weights.Wwp;

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
D2 = 'Wwp is ignorned, due to weak basis and deviating length-weight relationship';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Facultative air-breathers';
metaData.bibkey.F1 = {'Schu2023', 'fishbase'}; 
F2 = 'length-weight: Ww (in g) = 0.00417 * (TL in cm)^3.10';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Larvae have external filamentous gills';
metaData.bibkey.F3 = 'DrozKour2009'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '43NKC'; % Cat of Life
metaData.links.id_ITIS = '163979'; % ITIS
metaData.links.id_EoL = '217145'; % Ency of Life
metaData.links.id_Wiki = 'Misgurnus_fossilis'; % Wikipedia
metaData.links.id_ADW = 'Misgurnus_fossilis'; % ADW
metaData.links.id_Taxo = '43986'; % Taxonomicon
metaData.links.id_WoRMS = '154352'; % WoRMS
metaData.links.id_fishbase = 'Misgurnus-fossilis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Misgurnus_fossilis}}';  
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
bibkey = 'PyrzZieb2020'; type = 'Article'; bib = [ ...  
'doi = {10.25225/jvb.19041}, ' ...
'author = {Pyrzanowski, Kacper and Zi\c{e}ba, Grzegorz, and Przybylski, Miros{\l}aw}, ' ...
'year = {2020}, ' ...
'title = {Endangered weatherfish (\emph{Misgurnus fossilis}) age and growth is affected by the size of the watercourses}, ' ... 
'journal = {Journal of Vertebrate Biology}, ' ...
'volume = {69(1)}, '...
'pages = {1-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DoroBurl2002'; type = 'Article'; bib = [ ...  
'doi = {10.1023/a:1016065423945}, ' ...
'author = {N. Yu. Doronina and O. V. Burlakova and A. B. Burlakov and V. A. Golichenkov}, ' ...
'year = {2002}, ' ...
'title = {Growth Rate of Loach (\emph{Misgurnus fossilis} {L}.) Embryos and Expression of Distant Mutual Influence in Early Ontogeny}, ' ... 
'journal = {Doklady Biological Sciences}, ' ...
'volume = {384}, '...
'pages = {221–223}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DrozKour2009'; type = 'Article'; bib = [ ...  
'doi = {10.1051/kmae/2009010}, ' ...
'author = {B. Drozd and J. Kouril and M. Blaha and J. Hamackova}, ' ...
'year = {2009}, ' ...
'title = {Effect of temperature on early life history in weatherfish, \emph{Misgurnus fossilis} ({L}. 1758)}, ' ... 
'journal = {Knowledge and Management of Aquatic Ecosystems}, ' ...
'volume = {394}, '...
'pages = {04}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schu2023'; type = 'Book'; bib = [ ... 
'author = {Schuurmans, T.}, ' ...
'year = {2023}, ' ...
'title  = {Vieze vissen}, ' ...
'publisher = {OPA}, ' ...
'address = {Geup, Hoekse Waard}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Misgurnus-fossilis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/217145}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
