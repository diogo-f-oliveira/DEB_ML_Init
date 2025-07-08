function [data, auxData, metaData, txtData, weights] = mydata_Austroglossus_pectoralis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Austroglossus_pectoralis'; 
metaData.species_en = 'Mud sole '; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.7); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 19];

%% set data
% zero-variate data
data.am = 13*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';  
  temp.am = C2K(19.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 33;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'Zout1974';
data.Li = 60;    units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7  mm of Buglossidium luteum: pi/6*0.07^3';
data.Wwp = 214.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00501*Lp^3.05, see F2';
data.Wwi = 1.33e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00501*Li^3.05, see F2';

data.Ri = 3e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(19.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data

% time-length
data.tL = [ ... % age (years), total length (cm)
0.905	12.720
1.899	17.845
2.894	27.557
3.905	32.457
4.915	35.477
5.849	38.270
6.874	39.186
7.899	40.627
8.894	42.068
9.889	42.005
10.945	45.026];
data.tL(:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(19.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Zout1974';
% 
data.tL_fm = [ ... % age (years), total length (cm)
0.926	14.788 14.339
1.881	20.609 18.591
2.833	30.802 26.766
3.836	33.483 31.802
4.838	37.622 33.810
5.864	39.630 37.388];
data.tL_fm(:,1) = (0 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(19.7);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Zout1974'; treat.tL_fm = {1, {'females','males'}};

% time-weight
data.tW_fm = [ ... % age (years), weight (g)
0.874	 13.992  11.752
1.877	 51.611  31.351
2.888	146.644 106.114
3.885	209.026 185.378
4.920	296.190 218.505
5.845	373.172 294.383
6.853	392.782 356.764
7.856	432.652 NaN
8.870	515.304 NaN
9.929	513.549 NaN
10.862	559.015 NaN];
data.tW_fm(:,1) = (0 + data.tW_fm(:,1)) * 365; % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(19.7);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'Zout1974'; treat.tW_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: Ww in g = 0.00501*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'JWMZ'; % Cat of Life
metaData.links.id_ITIS = '173040'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Austroglossus_pectoralis'; % Wikipedia
metaData.links.id_ADW = 'Austroglossus_pectoralis'; % ADW
metaData.links.id_Taxo = '162715'; % Taxonomicon
metaData.links.id_WoRMS = '219821'; % WoRMS
metaData.links.id_fishbase = 'Austroglossus-pectoralis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Austroglossus_pectoralis}}';
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
bibkey = 'Zout1974'; type = 'article'; bib = [ ...
'doi = {10.1080/00359197409519437y}, ' ...
'author = {Zoutendyk, Peter}, ' ... 
'year   = {1974}, ' ...
'title  = {THE BIOLOGY OF THE {A}GULHAS SOLE, \emph{Austroglossus pectoralis}, {P}ART 2. {A}GE AND GROWTH}, ' ...
'journal = {Transactions of the Royal Society of South Africa}, ' ...
'page = {33–41}, ' ...
'volume = {41(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Austroglossus-pectoralis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
