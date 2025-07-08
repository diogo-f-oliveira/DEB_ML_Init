function [data, auxData, metaData, txtData, weights] = mydata_Pomacentrus_wardi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Pomacentrus_wardi'; 
metaData.species_en = 'Ward''s damsel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 23];

%% set data
% zero-variate data

data.ab = 13;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FowlDohe1992';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 8;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 2.5 mm and egg diameter (guessed) 1.5 mm: pi/6*0.25*0.15^2';
data.Wwp = 1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on Wwp = 0.02399*Lp^2.98, see F1';
data.Wwi = 11.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.02399*Li^2.98, see F1';

data.Ri  = 222*7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on fecundity of Chromis chromis: 222*7';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (cm)
0.000	1.726
0.001	3.255
0.002	2.314
0.022	2.647
0.023	1.294
0.044	2.431
0.045	1.980
0.983	2.800
1.048	2.329
1.965	5.306
1.987	6.051
1.988	3.914
2.009	5.129
2.010	4.737
2.011	4.639
2.031	6.816
2.969	6.047
2.991	6.479
2.992	7.910
3.013	5.380
3.014	6.282
3.952	5.769
3.971	6.926
3.972	6.553
3.973	6.416
3.974	5.965
3.975	5.690
3.976	5.592
3.977	5.455
3.996	4.984
4.017	6.690
4.956	6.667
4.978	6.294
4.979	7.059
5.000	5.608
5.982	5.741
5.983	6.133
5.984	6.408
6.943	7.698
6.965	6.992
6.985	7.071
6.986	6.659
6.987	5.835
7.969	7.185
8.974	7.102
8.975	5.985
8.996	5.494
10.000	7.275
10.001	6.961
10.002	6.726
10.022	6.118];
data.tL(:,1) = 365 * (0.7 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FowlDohe1992';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.tL = 5 * weights.tL;
weights.Wwb = 10 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;
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
F1 = 'Length-weight:  (Ww in g) = 0.02399*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQJS'; % Cat of Life
metaData.links.id_ITIS = '615539'; % ITIS
metaData.links.id_EoL = '46572457'; % Ency of Life
metaData.links.id_Wiki = 'Pomacentrus'; % Wikipedia
metaData.links.id_ADW = 'Pomacentrus_wardi'; % ADW
metaData.links.id_Taxo = '184472'; % Taxonomicon
metaData.links.id_WoRMS = '277177'; % WoRMS
metaData.links.id_fishbase = 'Pomacentrus-wardi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomacentrus}}';
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
bibkey = 'FowlDohe1992'; type = 'Article'; bib = [ ... 
'doi = {10.1071/mf9921057}, ' ...
'author = {Anthony J. Fowler and Doherty, P. J.}, ' ... 
'year = {1992}, ' ...
'title = {Validation of annual growth increments in the Otoliths of two species of Damselfish from the {S}outhern {G}reat {B}arrier {R}eef}, ' ...
'journal = {Australian Journal of Marine and Freshwater Research}, ' ...
'volume = {43(5)}, ' ...
'pages = {1057-1068}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pomacentrus-wardi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
