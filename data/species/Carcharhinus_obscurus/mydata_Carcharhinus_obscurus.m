function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_obscurus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_obscurus'; 
metaData.species_en = 'Dusky shark'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 01 06];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 01 06];


%% set data
% zero-variate data

data.ab = 23*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'Wiki';   
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '22 to 24 mnth';
data.tp = 20 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 78;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ThorSimp2009';  
data.Lp  = 235;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = '220  to 300 cm';
data.Li  = 420;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwi = 347e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

data.Ri  = 10/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'varies between 3 and 14 pups per yr';

 % uni-variate data
 
% time-length data post birth
data.tL = [ ... % time since birth (yr), total length (cm)
0.000	68.734
0.000	78.682
0.000	83.204
0.000	86.822
0.865	95.866
0.865	97.674
0.962	74.160
0.962	78.682
0.962	92.248
1.058	88.630
1.923	87.726
1.923	92.248
1.923	94.057
1.923	96.770
1.923	98.579
1.923	100.388
1.923	104.910
2.019	83.204
2.885	96.770
2.885	101.292
2.885	105.814
2.885	101.292
2.885	116.667
2.981	91.344
3.077	122.997
3.846	121.189
3.846	125.711
3.942	119.380
4.038	100.388
4.038	107.623
4.038	112.145
4.038	113.953
5.000	113.049
5.000	101.292
5.000	128.424
5.769	121.189
5.769	129.328
5.769	132.946
5.769	140.181
6.058	150.129
6.731	133.850
6.923	130.233
6.923	141.990
7.788	131.137
7.788	148.320
7.981	155.556
7.981	166.408
7.981	170.026
9.231	156.460
10.000	181.783
10.769	175.452
10.865	180.879
10.865	187.209
11.635	180.879
11.731	186.305
12.019	196.253
12.885	191.731
12.885	197.158
13.846	204.393
14.904	202.584
14.904	207.106
14.904	211.628
15.962	231.525
18.077	225.194
18.942	222.481
20.769	233.333
23.846	238.760];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'ThorSimp2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Temperature 8.7 - 18.6 C, mean 12.6 C; adults are commonly found at depths of 200-400 m';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R3PY'; % Cat of Life
metaData.links.id_ITIS = '160268'; % ITIS
metaData.links.id_EoL = '46559787'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_obscurus'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_obscurus'; % ADW
metaData.links.id_Taxo = '41982'; % Taxonomicon
metaData.links.id_WoRMS = '105796'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-obscurus'; % fisbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_obscurus}}';
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
bibkey = 'ThorSimp2009'; type = 'Article'; bib = [ ... 
'author = {James T. Thorson and Colin A. Simpfendorfer}, ' ... 
'year = {2009}, ' ...
'title = {Gear selectivity and sample size effects on growth curve selection in shark age and growth studies}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {98}, ' ...
'pages = {75-84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-obscurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

