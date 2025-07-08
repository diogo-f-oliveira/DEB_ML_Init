  function [data, auxData, metaData, txtData, weights] = mydata_Umbra_pygmaea

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Esociformes'; 
metaData.family     = 'Umbridae';
metaData.species    = 'Umbra_pygmaea'; 
metaData.species_en = 'Eastern mudminnow';

metaData.ecoCode.climate = {'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 09]; 

%% set data
% zero-variate data
data.tp = 0.9*365;  units.tp = 'd';   label.tp = 'time since birth at puberty';  bibkey.tp = 'PaneWeis2012';
  temp.tp = C2K(13);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 5*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'PaneWeis2012';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.7;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 13.7;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'PaneWeis2012';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*.14^3';
data.Wwi = 13.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389 *Li^3.12, see F1';
      
% uni-variate data
% time - length
data.tL = [ ... ; % time since birth (yr) total length (cm)
1  4.0
2  5.8
3  7.3
4  8.8
5 10.7];
data.tL(:,1) = (0.25 + data.tL(:,1)) * 365; % convert year to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(13); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'PaneWeis2012'};

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
4.65	203.18
4.67	138.62
4.99	307.44
5.10	326.32
5.19	413.16
5.27	326.67
5.28	413.40
5.37	299.26
5.38	493.55
5.46	702.92
5.47	523.77
5.58	607.23
5.58	439.32
5.68	556.28
5.77	1032.63
5.81	509.72
5.95	495.41
6.07	557.73
6.08	1097.44
6.16	893.60
6.27	1131.60
6.29	526.61
6.57	1069.01
6.78	668.51
6.87	846.43
6.98	1205.75
7.07	1104.51
7.15	1207.14
7.26	983.14
7.27	1621.43
7.38	1825.28
7.67	957.18
7.96	827.78
7.96	616.76
8.09	804.47
8.75	602.00
8.77	1256.44
8.77	936.16
8.97	1738.92
9.25	1153.86
9.68	1301.64
9.75	1227.78
9.84	970.88
9.94	1303.89
10.00	2151.05
10.55	2223.29
10.69	2037.34];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'}; 
temp.LN = C2K(13); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'PaneWeis2012'};
    
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'No clear difference between males and females';
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts 
F1 = 'length-weight: Ww in g = 0.00389 *(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DGKY'; % Cat of Life
metaData.links.id_ITIS = '162152'; % ITIS
metaData.links.id_EoL = '344994'; % Ency of Life
metaData.links.id_Wiki = 'Umbra_pygmaea'; % Wikipedia
metaData.links.id_ADW = 'Umbra_pygmaea'; % ADW
metaData.links.id_Taxo = '42904'; % Taxonomicon
metaData.links.id_WoRMS = '154221'; % WoRMS
metaData.links.id_fishbase = 'Umbra-pygmaea'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Umbra_pygmaea}}';  
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
bibkey = 'PaneWeis2012'; type = 'Article'; bib = [ ...  
'author = {Frank M. Panek and Judith S. Weis}, ' ...
'doi = {10.1656/045.019.0206}, ' ...
'year = {2012}, ' ...
'title = {Age, Growth, and Reproduction of the Eastern Mudminnow (\emph{Umbra pygmaea}) at the {G}reat {S}wamp {N}ational {W}ildlife {R}efuge, {N}ew {J}ersey}, ' ... 
'journal = {Northeastern Naturalist}, ' ...
'volume = {19}, '...
'pages = {217-228}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Umbra-pygmaea.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

