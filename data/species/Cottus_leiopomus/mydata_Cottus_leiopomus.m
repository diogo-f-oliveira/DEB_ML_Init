function [data, auxData, metaData, txtData, weights] = mydata_Cottus_leiopomus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Cottus_leiopomus'; 
metaData.species_en = 'Wood River sculpin'; 

metaData.ecoCode.climate = {'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 24];


%% set data
% zero-variate data

data.am = 8 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'MeyeCass2008';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'MeyeCass2008'; 
data.Lpm  = 6;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for maes';  bibkey.Lpm  = 'MeyeCass2008'; 
data.Li  = 12.1;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'MeyeCass2008';
data.Lim  = 12.1;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'MeyeCass2008';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwp = 2.2;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'MeyeCass2008';
  comment.Wwi = 'based on 0.00001*(10*Lp)^3.071, see F1';
data.Wwpm = 2.89;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';     bibkey.Wwpm = 'MeyeCass2008';
  comment.Wwi = 'based on 0.00001*(10*Lpm)^3.071, see F1';
data.Wwi = 24.9;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'MeyeCass2008';
  comment.Wwi = 'based on 0.00001*(10*Li)^3.071, see F1';
data.Wwim = 24.9;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'MeyeCass2008';
  comment.Wwim = 'based on 0.00001*(10*Lim)^3.071, see F1';

% uni-variate data
% time-length
data.tL = [ ... % age (years), total length (cm) 
0.508	2.486
1.481	4.571
2.483	6.029
3.470	7.429
4.486	8.714
5.502	9.914
6.503	10.571
7.505	12.086
8.506	11.314];
data.tL(:,1) = 365 * (.3 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MeyeCass2008';
comment.tL = 'data for sexes combined';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#) 
5.608	115.618
5.824	37.939
5.843	89.335
5.941	103.085
5.941	100.097
5.941	92.925
6.059	66.636
6.294	73.222
6.431	109.085
6.431	78.010
6.471	135.980
6.510	88.173
6.569	79.809
6.588	121.643
6.588	116.862
6.608	98.337
6.647	86.984
6.745	119.260
6.765	134.201
6.843	140.181
6.863	132.413
6.863	125.840
6.902	109.109
7.059	159.316
7.059	109.714
7.078	132.424
7.078	125.851
7.157	103.145
7.176	155.138
7.216	140.200
7.294	135.423
7.314	166.500
7.431	161.725
7.451	191.606
7.608	134.243
7.608	126.474
7.647	110.341
7.667	171.896
8.157	182.080
8.255	142.045
8.392	133.087
8.569	171.343
8.941	185.704
10.176	268.236];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MeyeCass2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'ength-weight: Ww in g = 0.00001*(TL in mm)^3.071';
metaData.bibkey.F1 = 'MeyeCass2008'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YYJD'; % Cat of Life
metaData.links.id_ITIS = '167246'; % ITIS
metaData.links.id_EoL = '210365'; % Ency of Life
metaData.links.id_Wiki = 'Cottus_leiopomus'; % Wikipedia
metaData.links.id_ADW = 'Cottus_leiopomus'; % ADW
metaData.links.id_Taxo = '172073'; % Taxonomicon
metaData.links.id_WoRMS = '1019367'; % WoRMS
metaData.links.id_fishbase = 'Cottus-leiopomus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottus_leiopomus}}';
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
bibkey = 'MeyeCass2008'; type = 'Article'; bib = [ ... 
'author = {Kevin A. Meyer and John D. Cassinelli and F. Steven Elle}, ' ... 
'year = {2008}, ' ...
'title = {Life History Characteristics of the Wood River Sculpin, \emph{Cottus leiopomus} ({C}ottidae), in {I}daho}, ' ...
'journal = {Copeia}, ' ...
'volume = {2008(3)}, ' ...
'pages = {648-655}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cottus-leiopomus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

