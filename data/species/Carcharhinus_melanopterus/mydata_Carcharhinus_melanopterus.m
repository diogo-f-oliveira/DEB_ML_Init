function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_melanopterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_melanopterus'; 
metaData.species_en = 'Blacktip reef shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPE'};
metaData.ecoCode.habitat = {'0iMr','0iMm'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 23];


%% set data
% zero-variate data

data.ab = 9*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'fishbase';   
  temp.ab = C2K(27.4); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 16*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'ChinSimp2013';   
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on the assumption that max back-calculated age is close to life span';

data.Lb  = 49;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '48-50 cm';
data.Lp  = 91;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 200;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 46.6e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.05, see F1';

data.Ri  = 3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 pups per litter, 1 litter each yr';

% uni-variate data
 
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
0.000	61.304
0.000	60.652
0.000	59.783
0.000	62.174
0.000	56.522
0.000	54.783
0.000	51.957
0.023	63.696
0.047	73.043
0.047	68.478
0.047	67.826
0.047	66.304
0.047	65.000
0.047	64.348
0.930	66.522
0.977	64.783
0.977	67.826
1.000	63.261
1.000	77.391
1.000	83.261
1.023	70.000
1.023	72.826
2.000	73.043
2.000	75.435
2.000	77.609
2.000	78.913
2.000	80.435
2.000	88.696
2.000	90.000
2.023	83.696
2.977	82.609
3.163	93.043
3.953	108.261
4.930	104.130
5.000	121.304
5.698	115.217
6.163	119.130
6.860	121.087
7.000	131.739
7.326	126.957
7.442	128.478
7.581	128.478
7.977	135.217
7.977	128.261
8.000	122.826
8.023	124.783
8.674	128.043
9.023	145.217
9.395	130.870
9.419	138.043
9.977	139.348
10.000	142.391
10.070	131.957
10.233	141.739
10.419	142.174
10.814	144.565
11.000	143.043
11.000	150.652
11.721	144.348
12.186	148.043
12.977	143.043
13.140	150.217
13.651	148.696
14.674	152.609
15.116	152.391];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'ChinSimp2013';
comment.tL = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00447 * (TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'R3PH'; % Cat of Life
metaData.links.id_ITIS = '160365'; % ITIS
metaData.links.id_EoL = '46559786'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_melanopterus'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_melanopterus'; % ADW
metaData.links.id_Taxo = '41980'; % Taxonomicon
metaData.links.id_WoRMS = '105795'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-melanopterus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_melanopterus}}';
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
bibkey = 'ChinSimp2013'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF13017}, ' ...
'author = {Andrew Chin and Colin Simpfendorfer and Andrew Tobin and Michelle Heupel}, ' ... 
'year = {2013}, ' ...
'title = {Validated age, growth and reproductive biology of \emph{Carcharhinus melanopterus}, a widely distributed and exploited reef shark}, ' ...
'journal = {Marine and Freshwater Research}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-melanopterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

