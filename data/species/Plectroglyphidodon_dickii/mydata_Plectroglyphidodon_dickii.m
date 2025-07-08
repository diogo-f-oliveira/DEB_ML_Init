function [data, auxData, metaData, txtData, weights] = mydata_Plectroglyphidodon_dickii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Plectroglyphidodon_dickii'; 
metaData.species_en = 'Blackbar devil'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 05];

%% set data
% zero-variate data

data.ab = 5.3;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'RuttHami2011';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 11.6;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Chromis chromis: pi/6*0.085^3'; 
data.Wwp = 2.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01995*Li^2.98, see F1';
data.Wwi = 29.65;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^2.98, see F1';

data.Ri  = 200; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL_P = [ ... % time since hatch (yr), std length (cm)
1.077	2.300
1.564	3.008
2.949	4.350
2.974	4.098
2.974	4.023
3.026	4.653
3.974	4.758
3.974	4.859
3.974	5.161
4.000	4.582
4.000	4.935
5.000	4.989
5.026	5.191
5.051	5.418
5.077	4.737
5.974	4.918
6.026	5.321
6.026	5.473
6.026	5.624
6.051	4.742
6.077	5.095
6.949	5.804
7.026	5.149
7.051	5.552
7.949	6.287];
data.tL_P(:,1) = (0 + data.tL_P(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_P,1); if data.tL_P(i,1)<=data.tL_P(i-1,1);data.tL_P(i,1)=data.tL_P(i-1,1)+1e-8;end;end
units.tL_P = {'d', 'cm'};  label.tL_P = {'time since birth', 'std length','Palmyra'};  
temp.tL_P = C2K(28.5);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'RuttHami2011';
comment.tL_P = 'Data from Palmyra'; 
%
data.tL_K = [ ... % time since hatch (yr), std length (cm)
2.923	4.224
4.000	4.456
4.077	5.313
4.077	4.935
4.974	4.208
4.974	4.485
5.051	5.569
5.077	5.519
5.949	5.800
6.000	4.716
6.077	4.590
7.000	4.897
7.051	4.645
7.051	5.351
7.974	4.750
8.026	5.557
8.026	5.128
9.000	5.384
9.000	6.040
9.949	5.640
10.026	6.725
10.026	6.145
11.000	5.569
11.026	6.452];
data.tL_K(:,1) = (0 + data.tL_K(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_K,1); if data.tL_K(i,1)<=data.tL_K(i-1,1);data.tL_K(i,1)=data.tL_K(i-1,1)+1e-8;end;end
units.tL_K = {'d', 'cm'};  label.tL_K = {'time since birth', 'std length','Kiritimati'};  
temp.tL_K = C2K(28.5);  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'RuttHami2011';
comment.tL_K = 'Data from Kiritimati'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_P = 10 * weights.tL_P;
weights.tL_K = 10 * weights.tL_K;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight Ww in g = 0.01995*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Group plots
set1 = {'tL_P','tL_K'}; subtitle1 = {'Data from Palmyra, Kiritimati'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '6W2JS'; % Cat of Life
metaData.links.id_ITIS = '613224'; % ITIS
metaData.links.id_EoL = '46572472'; % Ency of Life
metaData.links.id_Wiki = 'Plectroglyphidodon_dickii'; % Wikipedia
metaData.links.id_ADW = 'Plectroglyphidodon_dickii'; % ADW
metaData.links.id_Taxo = '184112'; % Taxonomicon
metaData.links.id_WoRMS = '212855'; % WoRMS
metaData.links.id_fishbase = 'Plectroglyphidodon-dickii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plectroglyphidodon_dickii}}';
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
bibkey = 'RuttHami2011'; type = 'Article'; bib = [ ...
'doi = {10.1371/journal.pone.0021062}, ' ...
'author = {Ruttenberg B.I. and Hamilton, S.L. and Walsh, S.M. and Donovan, M.K. and Friedlander, A. and et al.}, ' ...
'year = {2011}, ' ...
'title = {Predator-Induced Demographic Shifts in Coral Reef Fish Assemblages}, ' ... 
'journal = {PLoSONE}, ' ...
'volume = {6(6)}, '...
'pages = {e21062}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Plectroglyphidodon-dickii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

