function [data, auxData, metaData, txtData, weights] = mydata_Poromitra_crassiceps
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beryciformes'; 
metaData.family     = 'Melamphaidae';
metaData.species    = 'Poromitra_crassiceps'; 
metaData.species_en = 'Crested bigscale'; 
metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPNE', 'MAS', 'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mpb'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(3.2); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 23]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 23]; 

%% set data
% zero-variate data
data.am = 8.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'ChilTayl1980';  
  temp.am = C2K(3.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'ChilTayl1980';
data.Li = 14.8;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ChilTayl1980';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 11; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','ChilTayl1980'};  
  comment.Wwp = 'based on 0.01000*Lp^3.04, see F3';
data.Wwi = 36.1;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01000*Li^3.04, see F3';

data.Ri = 3.7e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(3.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (yr), standard length (cm) 
0.492	2.401
0.985	2.807
1.510	3.557
1.972	3.808
2.514	4.152
2.975	4.932
3.500	5.557
3.994	5.715
4.503	6.371
4.964	7.027
6.013	10.270
6.984	11.270
8.002	13.610
8.526	14.827];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(3.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChilTayl1980';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
%weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 3.2 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Length-Weight relationship: W in g = 0.01000*(SL in cm)^3.04';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '4LY7K'; % Cat of Life
metaData.links.id_ITIS = '166108'; % ITIS
metaData.links.id_EoL = '46567130'; % Ency of Life
metaData.links.id_Wiki = 'Poromitra_crassiceps'; % Wikipedia
metaData.links.id_ADW = 'Poromitra_crassiceps'; % ADW
metaData.links.id_Taxo = '184588'; % Taxonomicon
metaData.links.id_WoRMS = '127273'; % WoRMS
metaData.links.id_fishbase = 'Poromitra-crassiceps'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Poromitra_crassiceps}}';
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
bibkey = 'ChilTayl1980'; type = 'article'; bib = [ ...
'author = {J. J. Childress and S. M. Taylor and G. M. Cailliet and M. H. Price}, ' ... 
'year   = {1980}, ' ...
'title  = {Patterns of Growth, Energy Utilization and Reproduction in Some Meso- and Bathypelagic Fishes off {S}outhern {C}alifornia}, ' ...
'journal = {Marine Biology}, ' ...
'page = {27-40}, ' ...
'volume = {61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Poromitra-crassiceps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

