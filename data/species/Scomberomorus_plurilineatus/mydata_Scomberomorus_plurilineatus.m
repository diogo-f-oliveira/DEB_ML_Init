function [data, auxData, metaData, txtData, weights] = mydata_Scomberomorus_plurilineatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomberomorus_plurilineatus'; 
metaData.species_en = 'Kanadi kingfish'; 
metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(21.8); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 02 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 09];

%% set data
% zero-variate data

data.tp = 2*365;    units.tp = 'd';   label.tp = 'age at puberty';           bibkey.tp = 'ChalGove1999';
  temp.tp = C2K(28);units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'ChalGove1999';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 80;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 120;     units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm for Scomberomorus_commerson: pi/6*0.05^3';
data.Wwp = 3.7e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 12.5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

data.Ri  = 4.7e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
temp.Ri = C2K(27.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98, as found for Scomberomorus_commerson';

% uni-variate data

% t-L data
data.tL = [ ... % yr class (yr), fork length (cm)
0.000	24.813
0.000	30.374
0.000	31.016
0.000	32.299
0.000	33.583
0.000	34.652
0.000	38.503
0.000	40.428
0.000	41.283
0.000	44.064
0.000	46.845
0.000	47.914
0.000	49.198
0.000	50.695
0.000	54.332
0.000	55.829
0.000	56.684
0.000	57.968
0.000	41.283
0.000	40.428
0.000	39.572
0.000	42.139
0.011	36.150
0.011	37.219
0.011	59.251
0.011	60.321
0.011	61.390
0.011	62.674
0.011	39.572
0.989	43.422
0.989	64.385
0.989	65.027
1.000	52.406
1.000	53.690
1.000	54.545
1.000	55.615
1.000	56.898
1.000	57.754
1.000	58.824
1.000	65.027
1.000	74.225
1.000	75.508
1.000	76.791
1.000	77.647
1.000	79.786
1.000	64.171
1.011	46.845
1.011	47.914
1.011	48.984
1.011	50.053
1.011	59.465
1.011	60.749
1.011	61.818
1.011	63.529
1.011	66.738
1.011	67.807
1.011	69.519
1.011	71.230
1.011	72.513
1.022	63.102
1.022	65.241
1.022	65.882
1.989	61.390
1.989	62.674
1.989	64.813
1.989	66.096
1.989	66.952
1.989	84.278
1.989	76.364
1.989	77.219
2.000	68.877
2.000	69.733
2.000	71.016
2.000	72.086
2.000	73.155
2.000	74.011
2.000	74.866
2.000	75.936
2.000	77.219
2.000	78.503
2.000	79.144
2.000	90.909
2.000	76.150
2.011	80.856
2.011	82.353
2.011	83.636
2.011	78.289
2.011	77.219
2.989	84.492
2.989	85.561
2.989	86.631
2.989	87.701
2.989	88.984
2.989	89.626
2.989	94.973
3.011	78.075
3.011	79.144
3.011	81.070
3.011	82.353
3.011	83.636
3.989	81.283
3.989	95.829
3.989	96.898
4.000	83.850
4.000	85.348
4.000	87.059
4.000	88.342
4.000	88.984
4.000	89.412
4.000	90.053
4.000	90.695
4.000	91.765
4.000	93.476
4.978	94.332
4.989	83.209
4.989	86.631
4.989	87.914
4.989	91.979
4.989	92.406
4.989	93.262
5.000	89.198
5.000	89.840
5.000	91.123
5.011	96.043
5.011	97.112
5.989	90.909
5.989	97.968
5.989	99.893
6.000	91.765
6.000	92.620
6.000	93.262
6.000	93.476
6.000	94.545]; 
data.tL(:,1) = (0.75 + data.tL(:,1)) * 365;   % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChalGove1999';

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

%% Discussion
D1 = 'Temeratures are guessed, based on fishbase for preferred temperature';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4VTXM'; % Cat of Life
metaData.links.id_ITIS = '202048'; % ITIS
metaData.links.id_EoL = '46577319'; % Ency of Life
metaData.links.id_Wiki = 'Scomberomorus_plurilineatus'; % Wikipedia
metaData.links.id_ADW = 'Scomberomorus_plurilineatus'; % ADW
metaData.links.id_Taxo = '187075'; % Taxonomicon
metaData.links.id_WoRMS = '219719'; % WoRMS
metaData.links.id_fishbase = 'Scomberomorus-plurilineatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberomorus_plurilineatus}}';
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
bibkey = 'ChalGove1999'; type = 'Article'; bib = [ ... 
'author = {J.R. Chale-Matsau and A. Govender and L.E. Beckley}, ' ... 
'year = {1999}, ' ...
'title = {Age and growth of the queen mackerel \emph{Scomberomorus plurilineatus} from {K}wa{Z}ulu-{N}atal, {S}outh {A}frica}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {44}, ' ...
'pages = {121-127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Scomberomorus-plurilineatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
