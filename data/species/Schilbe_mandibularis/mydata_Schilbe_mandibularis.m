  function [data, auxData, metaData, txtData, weights] = mydata_Schilbe_mandibularis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Schilbeidae';
metaData.species    = 'Schilbe_mandibularis'; 
metaData.species_en = 'African butter catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 14];

%% set data
% zero-variate data
data.ab = 6.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 50;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'OuatLass2008';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 28.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00646*Lip^3.11, see F1';
data.Wwi = 1.24e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00646*Li^3.11, see F1';
  
data.Ri = 2e5/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'OuatLass2008';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on rel fecundity of 163600 oocytes per kg ';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
41.582	8.236
72.380	8.449
104.649	8.619
133.986	8.746
164.782	9.002
194.438	9.780
225.240	9.949
281.328	10.463
314.337	10.546
365+103.954	13.088
365+133.292	13.214
365+223.489	13.811
365+315.103	15.101
730+72.234	15.434
730+164.291	15.683
1095+40.923	17.217
1095+72.464	17.300
1095+313.786	18.052];
data.tL(:,1) = data.tL(:,1) + 100; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
  temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RomuFeli2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^3.11'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79VP6'; % Cat of Life
metaData.links.id_ITIS = '681882'; % ITIS
metaData.links.id_EoL = '224983'; % Ency of Life
metaData.links.id_Wiki = 'Schilbe'; % Wikipedia
metaData.links.id_ADW = 'Schilbe_mandibularis'; % ADW
metaData.links.id_Taxo = '186739'; % Taxonomicon
metaData.links.id_WoRMS = '1461243'; % WoRMS
metaData.links.id_fishbase = 'Schilbe-mandibularis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Schilbe}}';  
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
bibkey = 'RomuFeli2017'; type = 'Article'; bib = [ ...
'author = {ASSI Sonan Romuald and Konan Koffi F\''{e}lix and Aliko N''guessan Gustave and Boussou Koffi Charles and Bony Kotchi Yves and Coulibaly Kalpy Julien}, ' ...
'year = {2017}, ' ...
'title = {Growth patterns of two freshwater fish belonging to the genus {S}chilbe {O}ken, 1817 (\emph{Schilbe mandibularis} and \emph{S. intermedius}) in the estuarine system of {A}ghien {L}agoon, {W}est {A}frica}, ' ... 
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {5(6)}, '...
'pages = {331-336}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OuatLass2008'; type = 'article'; bib = [ ...
'author = {Minata Ouattara and Doumbia Lassina and K. Yao and G. Gour\`{e}ne}, ' ...
'year = {2008}, ' ...
'title = {Reproduction of the {A}frican catfish \emph{Schilbe mandibularis} ({G}\"{u}nther 1867) ({S}iluroidei; {S}chilbeidae) in lacustrine and fluviatil areas ({I}vory {C}oast)}, ' ... 
'howpublished = {\url{http://www.lrrd.org/lrrd20/1/ouat20012.htm}}, ' ...
'journal = {Livestock Research for Rural Development}, '...
'volume = {20(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Schilbe-mandibularis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

