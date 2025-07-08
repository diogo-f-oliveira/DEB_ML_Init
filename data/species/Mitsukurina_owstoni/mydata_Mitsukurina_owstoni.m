function [data, auxData, metaData, txtData, weights] = mydata_Mitsukurina_owstoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Mitsukurinidae';
metaData.species    = 'Mitsukurina_owstoni'; 
metaData.species_en = 'Goblin shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 10 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 16];


%% set data
% zero-variate data

data.ab = 7*365;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'guess';   
  temp.ab = C2K(4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on litter interval';
data.am = 122*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Li and tL data; CaltSide2020 suggest 55 yrs and Li = 364 cm';

data.Lb  = 82;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wiki'; 
data.Lp  = 294;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = '264 - 322 cm';
data.Li  = 617;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = {'fishbase','ParsWalt2002'};
  comment.Li = 'female of TL 540 to 617 cm';

data.Wwb = 3.64e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00389*Lb^3.12, see F3';
data.Wwp = 195.5e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F3';
data.Wwi = 1.975e6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F3';
 
data.Ri  = 10/365/8;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Greenland shark, 10 pups per litter each 8 yrs';

 % uni-variate data
 
% time-length data 
data.tL = [ ... % time since birth (yr), total length (cm)
0.090	90.000
0.890	102.857
2.166	111.429
3.364	120.000
4.082	127.143
5.040	135.000
5.921	152.857
7.118	160.000
8.235	167.857
9.113	174.286
10.071	181.429
10.949	190.714
11.906	194.286
13.104	205.714
14.063	219.286
14.863	229.286
16.060	239.286
17.097	243.571
18.135	252.143
19.013	260.000
20.210	269.286
21.168	277.143
22.127	289.286
23.164	292.143
24.121	297.143
24.839	301.429
26.115	307.143
27.074	316.429];
data.tL(:,1) = 365*data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
temp.tL    = C2K(4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'CaltSide2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
% weights.Wwi = 5 * weights.Wwi;
% weights.Li = 5 * weights.Li;
% weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.v = 5 * weights.psd.v;
% weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females due to lack of data';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Ovoviparity (aplacental viviparity) and oophagous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 4 C, at bottum of all oceans';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Ww (in g) = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '43RPG'; % Cat of Life
metaData.links.id_ITIS = '159895'; % ITIS
metaData.links.id_EoL = '46559760'; % Ency of Life
metaData.links.id_Wiki = 'Mitsukurina_owstoni'; % Wikipedia
metaData.links.id_ADW = 'Mitsukurina_owstoni'; % ADW
metaData.links.id_Taxo = '41890'; % Taxonomicon
metaData.links.id_WoRMS = '105842'; % WoRMS
metaData.links.id_fishbase = 'Mitsukurina-owstoni'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mitsukurina_owstoni}}';
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
bibkey = 'CaltSide2020'; type = 'Article'; bib = [ ... 
'doi = {10.1101/2020.02.04.934281.}, ' ...
'author = {Fabio P. Caltabellotta and Zachary A. Siders and Gregor Cailliet and Fabio S. Motta and Otto B. F. Gadig}, ' ... 
'year = {2020}, ' ...
'title = {First study on age and growth of the deep-water Goblin Shark, \emph{Mitsukurina owstoni} ({J}ordan, 1898)}, ' ...
'journal = {bioRxiv preprint}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParsWalt2002'; type = 'Article'; bib = [ ... 
'author = {Glenn R. Parsons and G. Walter Ingram and Ralph Havard}, ' ... 
'year = {2002}, ' ...
'title = {First Record of the Goblin Shark \emph{Mitsukurina owstoni}, {J}ordan (Family {M}itsukurinidae) in the {G}ulf of {M}exico}, ' ...
'journal = {Southeastern Naturalist}, ' ...
'volume = {1(2)}, ' ...
'pages = {189-192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mitsukurina-owstoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Triakis_semifasciata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

