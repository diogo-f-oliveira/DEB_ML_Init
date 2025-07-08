function [data, auxData, metaData, txtData, weights] = mydata_Leuroglossus_stilbius
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Argentiniformes'; 
metaData.family     = 'Bathylagidae';
metaData.species    = 'Leuroglossus_stilbius'; 
metaData.species_en = 'Southern smoothtongue'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpm'};
metaData.ecoCode.embryo  = {'Mpm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(6.2); % in K, body temp
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
data.am = 5.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'ChilTayl1980';  
  temp.am = C2K(6.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'ChilTayl1980';
data.Li = 15;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ChilTayl1980';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 1; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','ChilTayl1980'};  
  comment.Wwp = 'based on 0.00562*Lp^2.9, see F3';
data.Wwi = 14.5;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00562*Li^2.9, see F3';

data.Ri = 2e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(6.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (yr), standard length (cm) 
0.422	2.896
1.494	5.859
2.010	7.208
2.477	7.875
2.994	8.884
3.512	9.420
4.017	10.114
4.483	10.885
5.026	11.868];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(6.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChilTayl1980';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 6.2 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Length-Weight relationship: W in g =  0.00562*(SL in cm)^2.9';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6Q7D8'; % Cat of Life
metaData.links.id_ITIS = '162096'; % ITIS
metaData.links.id_EoL = '46562937'; % Ency of Life
metaData.links.id_Wiki = 'Leuroglossus_stilbius'; % Wikipedia
metaData.links.id_ADW = 'Leuroglossus_stilbius'; % ADW
metaData.links.id_Taxo = '178812'; % Taxonomicon
metaData.links.id_WoRMS = '313514'; % WoRMS
metaData.links.id_fishbase = 'Leuroglossus-stilbius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leuroglossus_stilbius}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Leuroglossus-stilbius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

