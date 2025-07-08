function [data, auxData, metaData, txtData, weights] = mydata_Eutrigla_gurnardus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Eutrigla_gurnardus'; 
metaData.species_en = 'Grey gurnard'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % in K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 19]; 

%% set data
% zero-variate data
data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'fishbase';    
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 2.5*365;  units.ap = 'd';    label.ap = 'age at puberty for female';        bibkey.ap = 'ICES'; 
  temp.ap = C2K(6); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 9*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ICES';  
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18.8;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 60;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.4  mm: 4/3*pi*0.07^3';
data.Wwp = 37;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.0044 * Lp^3.081, see F4';
data.Wwi = 1.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.0044 * Li^3.081, see F4';

data.Ri = 3e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'Wiki';
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data
data.tL = [ ... % age (years) ~ Length (cm) 
3.004	22.973
4.030	27.799
4.962	33.784
5.000	38.031
5.019	35.328
5.989	30.888
6.008	34.170
6.996	31.660
6.996	38.996
7.015	33.977
7.015	34.556
7.985	32.432
7.985	33.205
7.985	33.784
7.985	36.100
9.011	35.521];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Magn2007';

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

%% Facts
F1 = 'Preferred temperature 6 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small, but females grow faster to a larger size and live longer';
metaData.bibkey.F2 = 'ICES'; 
F3 = 'Pelagic species till 3cm, then demersal';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.0044 * (L in cm)^3.081';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '6HKHX'; % Cat of Life
metaData.links.id_ITIS = '167044'; % ITIS
metaData.links.id_EoL = '46568716'; % Ency of Life
metaData.links.id_Wiki = 'Eutrigla_gurnardus'; % Wikipedia
metaData.links.id_ADW = 'Eutrigla_gurnardus'; % ADW
metaData.links.id_Taxo = '380822'; % Taxonomicon
metaData.links.id_WoRMS = '150637'; % WoRMS
metaData.links.id_fishbase = 'Eutrigla-gurnardus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eutrigla_gurnardus}}';
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
bibkey = 'Magn2007'; type = 'article'; bib = [ ...
'author = {E. Magnussen}, ' ... 
'year   = {2007}, ' ...
'title  = {Interpopulation comparison of growth patterns of 14 fish species on {F}aroe {B}ank: are all fishes on the bank fast-growing?}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {453-475}, ' ...
'volume = {71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/68}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ICES'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.ices.dk/explore-us/projects/EU-RFP/EU~Repository/ICES~FIshMap/ICES~FishMap species~factsheet-greygurnard.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
