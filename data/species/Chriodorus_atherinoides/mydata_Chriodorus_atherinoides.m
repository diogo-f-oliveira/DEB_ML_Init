function [data, auxData, metaData, txtData, weights] = mydata_Chriodorus_atherinoides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae ';
metaData.species    = 'Chriodorus_atherinoides'; 
metaData.species_en = 'Hardhead halfbeak'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 30];

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'Dalz1993';   
  temp.am = C2K(28.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 26;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5-0.8 mm for tobiko: pi/6*0.07^3';
data.Wwp = 15.8;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00347*Lp^3.11, see F1';
data.Wwi = 87.3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00347*Li^3.11, see F1';

data.Ri = 9.8e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(28.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Hirundichthys_affinis: (26/30)^3*1.5e4';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), fork length (cm)
28.262	12.048
61.391	12.353
90.384	12.360
123.502	13.257
152.996	14.152
181.469	14.258
215.041	18.605
244.630	14.374
274.110	16.058
306.681	18.531
335.165	18.046
365+1.196	19.829
365+61.761	20.339
365+91.785	20.544
365+123.340	22.031
365+152.854	21.842];
data.tL(:,1) = data.tL(:,1) + 250; % set origin to birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BoniBadi2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Grouped plots
% set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00347*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YF88'; % Cat of Life
metaData.links.id_ITIS = '165499'; % ITIS
metaData.links.id_EoL = '46567046'; % Ency of Life
metaData.links.id_Wiki = 'Chriodorus_atherinoides'; % Wikipedia
metaData.links.id_ADW = 'Chriodorus_atherinoides'; % ADW
metaData.links.id_Taxo = '170998'; % Taxonomicon
metaData.links.id_WoRMS = '280164'; % WoRMS
metaData.links.id_fishbase = 'Chriodorus-atherinoides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chriodorus_atherinoides}}'];
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
bibkey = 'BoniBadi2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12322}, ' ...
'author = {Bonilla-G\''{o}mez, J. L. and Badillo-Alem\''{a}n, M. and Gallardo-Torres, A. and Chiappa-Carrara, X.}, ' ... 
'year = {2014}, ' ...
'title = {Length–weight relationship, parameters of growth and mortality for the hardhead halfbeak \emph{Chriodorus atherinoides} {G}oode \& {B}ean, 1882 ({B}eloniformes: {H}emiramphidae) from {Y}ucatan {P}eninsula, {M}exico}, ' ...
'journal = {Journal of Applied Ichthyology}, '...
'volume = {30(1)}, ' ...
'pages = {208–209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Chriodorus-atherinoides.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

