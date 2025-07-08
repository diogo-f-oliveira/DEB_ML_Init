function [data, auxData, metaData, txtData, weights] = mydata_Gobius_cobitis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Gobius_cobitis'; 
metaData.species_en = 'Giant goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE','MAE','MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 26];

%% set data
% zero-variate data

data.ab = 8;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'Gibs1970'; 
data.Li  = 27;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Wiki';

data.Wwb = 1.6e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.5 mm and width of 0.45 mm of G.niger: pi/6*0.15*0.045^2';
data.Wwp = 18.7;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','Gibs1970'};
  comment.Wwp = 'based on 0.00912*Lp^3.10, see F1';
data.Wwi = 259.6;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.10, see F1';

% uni-variate data
% time-length
data.tL = [... %  yr class (yr), std length (cm)
1	 4.184  4.572
2	 7.588  7.024
3	10.252  9.724
4	12.142 12.459
5	14.314 15.792
6	16.238 14.760
7	14.818 18.762
8	16.215 NaN
10	19.114 19.537];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); 
data.tL(:,2:3) = data.tL(:,2:3)*1.17; % convert SL to TL see F2
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gibs1970'; treat.tL = {1 {'Roscoff','Banyuls'}};

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
10.564	2076.527
10.822	2205.332
11.081	3122.769
11.684	2251.022
12.180	2934.842
12.546	4833.124
12.589	2659.210
13.968	5157.891
14.829	9594.345
16.575	11177.809
16.575	8833.226
19.397	7543.075];
data.LN(:,1) = data.LN(:,1)*1.17; % convert SL to TL see F2
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN   = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Gibs1970'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.00912*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
F2 = 'TL = 1.17 * SL';
metaData.bibkey.F2 = 'Gibs1970';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3GPQG'; % Cat of Life
metaData.links.id_ITIS = '171841'; % ITIS
metaData.links.id_EoL = '46575227'; % Ency of Life
metaData.links.id_Wiki = 'Gobius_cobitis'; % Wikipedia
metaData.links.id_ADW = 'Gobius_cobitis'; % ADW
metaData.links.id_Taxo = '175369'; % Taxonomicon
metaData.links.id_WoRMS = '126886'; % WoRMS
metaData.links.id_fishbase = 'Gobius-cobitis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gobius_cobitis}}';
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
bibkey = 'Gibs1970'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1970.tb03286.x}, ' ...
'author = {R. N. Gibson}, ' ... 
'year = {1970}, ' ...
'title = {Observations on the biology of the giant goby \emph{Gobius cobitis} {P}allas}, ' ...
'journal = {Journal of Fish Biology }, ' ...
'volume = {2(3)}, ' ...
'pages = {281–288}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Gobius-cobitis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

