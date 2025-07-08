function [data, auxData, metaData, txtData, weights] = mydata_Pomacentrus_moluccensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Pomacentrus_moluccensis'; 
metaData.species_en = 'Lemon damselfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 22];

%% set data
% zero-variate data

data.ab = 10;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Fowl1990';   
  temp.am = C2K(28.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 9;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 2.5 mm and egg diameter (guessed) 1.5 mm: pi/6*0.25*0.15^2';
data.Wwp = 1.79;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwp = 0.02951*Lp^2.96, see F1';
data.Wwi = 19.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.02951*Li^2.96, see F1';

data.Ri  = 444*7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (cm)
0.986	2.254
0.987	2.223
1.000	2.440
1.001	1.929
1.012	2.734
1.013	2.347
1.025	3.508
1.026	3.028
1.027	2.920
1.028	2.827
1.029	2.595
1.038	3.322
1.039	2.641
1.040	1.991
2.014	4.543
2.015	4.265
2.025	4.899
2.026	3.180
2.027	2.964
2.040	5.163
2.041	4.001
2.042	3.258
2.053	3.552
3.004	2.915
3.005	3.333
3.006	3.782
3.016	4.556
3.029	4.076
4.005	4.228
5.033	3.498
6.034	4.517
7.049	4.251
8.051	4.078];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fowl1990';


%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.tL = 5 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 10 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-weight:  (Ww in g) = 0.02951*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQFB'; % Cat of Life
metaData.links.id_ITIS = '615461'; % ITIS
metaData.links.id_EoL = '46572439'; % Ency of Life
metaData.links.id_Wiki = 'Pomacentrus_moluccensis'; % Wikipedia
metaData.links.id_ADW = 'Pomacentrus_moluccensis'; % ADW
metaData.links.id_Taxo = '184453'; % Taxonomicon
metaData.links.id_WoRMS = '277159'; % WoRMS
metaData.links.id_fishbase = 'Pomacentrus-amboinensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomacentrus_moluccensis}}';
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
bibkey = 'Fowl1990'; type = 'Article'; bib = [ ... 
'author = {Anthony J. Fowler}, ' ... 
'year = {1990}, ' ...
'title = {Validation of annual growth increments in the otoliths of a small, tropical coral reef fish}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {64}, ' ...
'pages = {25-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pomacentrus-amboinensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
