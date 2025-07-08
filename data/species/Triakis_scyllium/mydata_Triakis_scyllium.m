function [data, auxData, metaData, txtData, weights] = mydata_Triakis_scyllium

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Triakis_scyllium'; 
metaData.species_en = 'Banded houndshark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biSvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 29];

%% set data
% zero-variate data

data.ab = 365;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'ADW';   
  temp.ab = C2K(12.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20.6*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'FujiTana2013';   
  temp.am = C2K(12.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 25.4;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'FujiTana2013'; 
  comment.Lb = '30 to 36  cm';
data.Lp  = 108.3;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'FujiTana2013'; 
data.Li  = 150;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 61.8;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00240*Lb^3.14, see F1';
data.Wwp = 5.87e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00240*Lp^3.14, see F1';
data.Wwi = 16.3e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00240*Li^3.14, see F1';
 
data.Ri  = 15/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(12.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10-20 pups per litter';

 % uni-variate data
 
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.056	38.040
1.954	53.718
1.998	70.086
1.999	62.248
2.021	64.553
2.988	81.844
2.989	79.308
2.990	70.086
3.012	75.850
3.060	65.014
3.958	75.850
3.980	84.380
4.002	95.447
4.050	78.617
4.051	71.239
4.948	92.450
4.993	100.519
5.040	96.138
5.041	90.605
5.086	97.291
5.962	102.594
5.963	95.447
6.055	99.135
6.909	99.366
7.023	109.510
7.046	105.360
7.969	111.585
8.130	114.582
8.130	108.818
8.960	114.813
9.006	118.732
9.030	110.202
9.836	120.576
10.022	117.118
10.045	114.121
11.013	121.499
11.037	119.885
11.037	116.888
12.028	127.954
12.950	131.643
13.943	127.954
13.989	132.565
15.027	136.023
16.965	138.790];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth','total length','females'};  
temp.tL_f    = C2K(12.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'FujiTana2013';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)0.985	52.565
1.054	50.490
1.953	56.715
2.991	63.170
4.995	88.300
5.019	81.153
5.088	85.072
5.940	94.063
5.965	84.842
7.991	114.582
8.016	104.438
8.915	107.435
8.936	121.037
9.030	112.046
10.000	109.741
12.028	123.573
13.966	130.259];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth','total length','males'};  
temp.tL_m    = C2K(12.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'FujiTana2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Ww (in g) = 0.00240*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 18.8 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7CP4N'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560017'; % Ency of Life
metaData.links.id_Wiki = 'Triakis_scyllium'; % Wikipedia
metaData.links.id_ADW = 'Triakis_scyllium'; % ADW
metaData.links.id_Taxo = '106437'; % Taxonomicon
metaData.links.id_WoRMS = '279059'; % WoRMS
metaData.links.id_fishbase = 'Triakis-scyllium'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Triakis_scyllium}}';
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
bibkey = 'FujiTana2013'; type = 'Article'; bib = [ ... 
'author = {Fujinami, Y. and S. Tanaka}, ' ... 
'year = {2013}, ' ...
'title = {Age, growth and reproduction of the banded houndshark \emph{Triakis scyllium} around the tip of the {I}zu {P}eninsula, {J}apan}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {79(6)}, ' ...
'pages = {968-976}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Triakis-scyllium.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

