function [data, auxData, metaData, txtData, weights] = mydata_Simalia_amethistina
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Pythonidae';
metaData.species    = 'Simalia_amethistina'; 
metaData.species_en = 'Amethystine python'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww','t-JX'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 12 26];

%% set data
% zero-variate data

data.ab = 63;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 730;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';
  temp.tp = C2K(30); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13.8*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 72;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching for females';      bibkey.Lb  = 'Barn1993';
  comment.Lb = 'SVL 48 cm';
data.Li  = 600;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';

data.Ww0 = 100.38;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight'; bibkey.Ww0 = 'Barn1993';
data.Wwb = 48.7;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Barn1993';
data.Wwi = 30e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'Wiki';
  
data.Ri  = 30/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(30);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10-50 eggs per clutch, 1 clutch per yr assumed';

% univariate data
% time-length
data.tL = [ ... % time since birth (mnth), total length (mm) for ind 1:5
  0  715  719  718  727  729
  2  946  894  833  791 1007
  4 1116 1069  992  906 1188
  6 1326 1206 1150 1128 1315
  8 1552 1402 1274 1336 1423
 10 1909 1712 1492 1616 1660
 12 2104 1946 1653 1944 1884
 16 2808 2473 2178 2568 2519
 20 3210 2680 2575 2895 2935
 24 3667 3095 3027 3352 3343
 27 3883 3388 3415 3630 3653];
data.tL(:,1) = data.tL(:,1) * 30.5; % convert mnth to d
data.tL(:,2:6) = data.tL(:,2:6)/ 10; % convert mm to cm
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(30);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Barn1993'; treat.tL = {1, {'ind 1','ind 2','ind 3','ind 4','ind 5'}};

% time-weight
data.tW = [ ... % time since birth (mnth), weight (g) for ind 1:5
    0    49.5    50.4    48.2    48.4    49.2
    2   107.2    78.7    61.9    49.0   120.3
    4   180.6   126.2   112.3    83.2   185.8
    6   307.3   204.9   190.1   160.6   245.2
    8   455.6   289.9   231.1   304.8   311.2
   10   841.1   535.8   333.0   452.1   432.4
   12  1121.5   755.0   452.9   720.0   685.2
   16  3561.5  1991.1  1283.7  2370.0  2241.2
   20  5586.0  2587.0  2558.0  3901.0  4077.0
   24  8896.0  4456.0  4106.0  5801.0  6419.0
   27 10733.0  5760.0  6326.0  7557.0  8335.0];
data.tW(:,1) = data.tW(:,1) * 30.5; % convert mnth to d
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(30);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Barn1993'; treat.tW = {1, {'ind 1','ind 2','ind 3','ind 4','ind 5'}};

% time-cum food
data.tX = [ ... % time since birth (mnth), culumated amount of food eaten (g) for ind 1:5
    0     0.0     0.0     0.0     0.0     0.0
    2   137.29   78.79   37.9    13.0   171.4
    4   358.98  227.14  188.38  130.36  346.20
    6   653.49  449.69  377.89  441.85  542.88
    8  1072.60  677.52  534.86  788.89  711.12
   10  2062.71 1190.34  815.60 1226.51 1017.28
   12  2823.59 1771.73 1100.37 1880.12 1679.30
   16  9227.5  4874.2  3145.5  5892.6  5967.3
   20 14829.0  6425.3  6345.0  9773.3 10401.4
   24 23801.4 11710.5 11234.1 16085.2 17585.5
   27 28820.3 15328.0 16798.5 20303.0 22785.0];
data.tX(:,1) = data.tX(:,1) * 30.5; % convert mnth to d
units.tX  = {'d', 'g'};  label.tX = {'time since birth', 'cumulated food consumption'};  
temp.tX   = C2K(30);  units.temp.tX = 'K'; label.temp.tX = 'temperature';
bibkey.tX = 'Barn1993'; treat.tX = {1, {'ind 1','ind 2','ind 3','ind 4','ind 5'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tW = 5 * weights.tW;
weights.Wwb = 5 * weights.Wwb;
weights.Ww0 = 0 * weights.Ww0;
weights.ab = 5 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = '';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YPQ7'; % Cat of Life
metaData.links.id_ITIS = '1094043'; % ITIS
metaData.links.id_EoL = '47364855'; % Ency of Life
metaData.links.id_Wiki = 'Simalia_amethistina'; % Wikipedia
metaData.links.id_ADW = 'Morelia_amethistina'; % ADW
metaData.links.id_Taxo = '4684555'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Simalia&species=amethistina'; % ReptileDB
metaData.links.id_AnAge = 'Morelia_amethistina'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Simalia_amethistina}}';
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
bibkey = 'Barn1993'; type = 'Article'; bib = [ ... 
'howpublished = {\url{http://www.smuggled.com/BriBar16.htm}}, ' ...
'author = {Barnett, B.}, ' ... 
'year = {1993}, ' ...
'title = {The Amethystine Python (\emph{Morelia amethystina}): Captive keeping, reproduction and growth}, ' ...
'journal = {Bulletin of the Victorian Herpetological Society}, ' ...
'volume = {4(3)}, ' ...
'pages = {77-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Morelia_amethistina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
