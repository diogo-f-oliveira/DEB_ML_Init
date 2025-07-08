function [data, auxData, metaData, txtData, weights] = mydata_Crocodylus_niloticus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodilidae';
metaData.species    = 'Crocodylus_niloticus'; 
metaData.species_en = 'Nile crocodile'; 

metaData.ecoCode.climate = {'Am', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFl', 'biFp', 'biFr'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'biCv'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 01];


%% set data
% zero-variate data

data.ab = 90;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'crocodilian';   
  temp.ab = C2K(35); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 14*365;  units.ap = 'd';    label.ap = 'age at puberty for female';  bibkey.ap = 'Wiki';
  temp.ap = C2K(23); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 90*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 29;       units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
data.Lp  = 280;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
data.Lpm  = 330;     units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'Wiki'; 
data.Li  = 427;      units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 610;     units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Wwb = 70;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwpm = 155e3;   units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty';  bibkey.Wwpm = 'Wiki';
data.Wwi = 763e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'Wiki';
data.Wwim = 1.09e6;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 95/365;   units.Ri  = '#/d'; label.Ri  = 'reprod rate at 364 cm';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% L-W Data 
data.LW = [ ... % weight (g), total length (cm)
1116.615	68.147
1229.806	73.457
1452.855	76.555
1671.981	70.804
1675.316	78.326
1899.344	83.637
1900.325	85.849
2118.862	78.771
2677.367	88.508
2784.869	80.987
3123.660	95.148
4011.539	97.807
4012.716	100.462
4569.454	106.217
5683.127	118.169
6235.941	115.074
6899.006	110.653
7567.759	119.063
7903.411	126.144
8342.643	116.855
9016.105	135.884
9455.533	127.037
10456.407	134.564
13014.109	153.603
13569.866	157.146
13675.211	144.757
16115.797	149.636
17115.102	153.623
17227.510	157.164
19116.458	167.793
19780.503	165.583
20557.152	167.357
22996.367	169.139
25550.930	181.099
28325.402	189.077
29547.561	195.720
37085.109	197.084
38194.470	199.302
38635.465	193.995
38971.313	201.518
55386.276	226.378
70464.708	236.629
70913.751	249.463
72355.233	250.798
75124.011	245.944
86098.512	249.538
89872.294	261.503];
data.LW = data.LW(:,[2 1]); % interchange cols
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = {'NgwePatz2013'};
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'temperature effects sex of neonate: below  31.7 C or above 34.5 C neonates are female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZKNK'; % Cat of Life
metaData.links.id_ITIS = '202200'; % ITIS
metaData.links.id_EoL = '795278'; % Ency of Life
metaData.links.id_Wiki = 'Crocodylus_niloticus'; % Wikipedia
metaData.links.id_ADW = 'Crocodylus_niloticus'; % ADW
metaData.links.id_Taxo = '50633'; % Taxonomicon
metaData.links.id_WoRMS = '1034995'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crocodylus&species=niloticus'; % ReptileDB
metaData.links.id_AnAge = 'Crocodylus_niloticus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocodylus_niloticus}}';
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
bibkey = 'NgwePatz2013'; type = 'Article'; bib = [ ... 
'author = {A. Ngwanya and N. Patzke and M. A. Sprocter and J.-L. Kruger and L.-A. Dell and R. Chawana and P. Mazengenya and B. K. Billings and O. Olaleye and S. Herculano-Houzel and P. R. Manger}, ' ... 
'year = {2013}, ' ...
'title = {The Continuously Growing Central Nervous System of the {N}ile Crocodile (\emph{Crocodylus niloticus})}, ' ...
'journal = {The Anatomical Record}, ' ...
'volume = {296}, ' ...
'pages = {1489-1500}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
