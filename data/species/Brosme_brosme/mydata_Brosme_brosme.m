function [data, auxData, metaData, txtData, weights] = mydata_Brosme_brosme
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Lotidae';
metaData.species    = 'Brosme_brosme'; 
metaData.species_en = 'Cusk'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'}; 
metaData.date_subm = [2017 03 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 19]; 

%% set data
% zero-variate data
data.am = 20*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 50;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 120; units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 0.0014;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.4  mm: 4/3*pi*0.07^3';
data.Wwp = 1.66e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.01325 * Li^3.0, see F4';
data.Wwi = 23e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01325 * Li^3.0, see F4';

data.Ri = 3e6/365; units.Ri = '#/d';  label.Ri = 'ultimate reprod rate at'; bibkey.Ri = 'Wiki';
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data
data.tL = [ ... % age (years) ~ Length (cm) 
7.968	48.906
8.003	51.623
8.039	56.755
9.007	55.849
9.008	58.868
10.042	57.358
10.044	60.075
11.044	56.453
11.048	64.906
12.046	57.057
12.049	63.396
12.051	69.132
13.050	61.585
13.051	65.208
14.017	57.660
14.020	65.509
14.987	62.491
17.060	68.226];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
F1 = 'Preferred temperature 10 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Semi-pelagic species till 5 cm, then demersal';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.01325 * (L in cm)^3.0';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '5X37W'; % Cat of Life
metaData.links.id_ITIS = '164740'; % ITIS
metaData.links.id_EoL = '46564444'; % Ency of Life
metaData.links.id_Wiki = 'Brosme_brosme'; % Wikipedia
metaData.links.id_ADW = 'Brosme_brosme'; % ADW
metaData.links.id_Taxo = '44299'; % Taxonomicon
metaData.links.id_WoRMS = '126447'; % WoRMS
metaData.links.id_fishbase = 'Brosme-brosme'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brosme_brosme}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/51}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
