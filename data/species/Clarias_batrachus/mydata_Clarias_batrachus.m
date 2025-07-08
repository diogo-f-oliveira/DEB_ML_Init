function [data, auxData, metaData, txtData, weights] = mydata_Clarias_batrachus

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Clariidae';
metaData.species    = 'Clarias_batrachus'; 
metaData.species_en = 'Philippine catfish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 01];

%% set data
% zero-variate data;

data.ab = 1.5;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.am = 15*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'guess';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28;   units.Lp  = 'cm';	label.Lp  = 'total length at puberty';    bibkey.Lp  = 'DuraJawa2014'; 
data.Li  = 47;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 
  
data.Wwb = 1.2e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 1.3 mm of Clarias_gariepinus: pi/6*0.13^3';
data.Wwp = 158.6;   units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.00912*Lp^2.93, see F1';
data.Wwi = 723; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^2.93, see F1';

data.Ri = 13400/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'fishbase';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (wk), total length (cm), weight (g)
0	4.184 1.177
1	4.620 1.563
2	5.165 1.959
3	5.622 2.250
4	6.080 2.637
5	6.472 3.060
6	6.886 3.371
7	7.322 3.757
8	7.496 4.011
9	7.758 4.322];
data.tLW(:,1) = 7 * data.tLW(:,1); % convert wk to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'total length', 'weight'};  
temp.tLW    = C2K(25);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'DuraJawa2014'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
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
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00912*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'VR9G'; % Cat of Life
metaData.links.id_ITIS = '164120'; % ITIS
metaData.links.id_EoL = '203710'; % Ency of Life
metaData.links.id_Wiki = 'Clarias_batrachus'; % Wikipedia
metaData.links.id_ADW = 'Clarias_batrachus'; % ADW
metaData.links.id_Taxo = '44066'; % Taxonomicon
metaData.links.id_WoRMS = '280201'; % WoRMS
metaData.links.id_fishbase = 'Clarias-batrachus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Clarias_batrachus}}';
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
bibkey = 'DuraJawa2014'; type = 'Article'; bib = [ ... 
'author = {R. Durairaja and P.  Jawahar}, ' ...
'year = {2014}, ' ...
'title = {GROWTH COMPENSATION IN {A}SIAN CATFISH, \emph{Clarias batrachus} ({L}INNAEUS) FOLLOWING FEED RESTRICTION AND DEPRIVATION PROTOCOL}, ' ...
'journal = {J. Exp. Zool. India}, ' ...
'volume = {17(2)}, ' ...
'pages = {443-450}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Clarias-batrachus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
