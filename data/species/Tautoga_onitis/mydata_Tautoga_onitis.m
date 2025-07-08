function [data, auxData, metaData, txtData, weights] = mydata_Tautoga_onitis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Tautoga_onitis'; 
metaData.species_en = 'Tautog'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 07];

%% set data
% zero-variate data

data.am = 43*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(10.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 91;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm of Labrus merula: pi/6*0.09^3';
data.Wwp = 187;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^3.05, see F1';
data.Wwi = 11.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.05, see F1';

data.Ri  = 10510000/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 62 cm';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(10.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm) 
    1 22.4 24.6
    2 26.8 27.6
    3 28.6 29.2
    4 33.4 32.9
    5 35.0 35.7
    6 37.8 37.5
    7 40.1 41.4
    8 42.5 44.3
    9 45.3 48.1
   10 51.9 50.1
   11 52.9 53.3
   12 54.5 56.4
   13 52.5 54.5
   14 55.1 57.4
   15 51.8 59.5
   16 48.5 58.6
   17 57.5 58.7
   18 62.8 65.5
   19 NaN  61.4
   20 55.7 55.0
   21 66.0 61.3
   22 NaN  65.5
   25 NaN  67.2];
data.tL_fm(:,1) = 365 * (.5 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(10.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'HostMunr1993'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (cm) 
    1  256  306
    2  444  491
    3  526  542
    4  822  740
    5  910  982
    6 1205 1145
    7 1395 1577
    8 1551 1795
    9 1960 2397
   10 3114 2693
   11 3033 2911
   12 3660 3663
   13 3227 3410
   14 3677 3861
   15 2715 4340
   16 2530 4202
   17 4220 4860
   18 4961 5549
   19 NaN  4452
   20 3385 3090
   21 5100 4750
   22 NaN  4995
   25 NaN  6568];
data.tW_fm(:,1) = 365 * (.5 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm    = C2K(10.9);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'HostMunr1993'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwi = 3 * weights.Wwi;

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
D1 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length weight: Ww in g = 0.01230*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YFCT'; % Cat of Life
metaData.links.id_ITIS = '170676'; % ITIS
metaData.links.id_EoL = '46571633'; % Ency of Life
metaData.links.id_Wiki = 'Tautoga_onitis'; % Wikipedia
metaData.links.id_ADW = 'Tautoga_onitis'; % ADW
metaData.links.id_Taxo = '46338'; % Taxonomicon
metaData.links.id_WoRMS = '126963'; % WoRMS
metaData.links.id_fishbase = 'Tautoga-onitis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tautoga_onitis}}';
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
bibkey = 'HostMunr1993'; type = 'article'; bib = [ ... 
'author = {E. Brian Hostetter and Thomas A. Munroe}, ' ... 
'year = {1993}, ' ...
'title = {Age, Growth, And Reproduction Of Tautog \emph{Tautoga onitis} ({L}abridae, {P}erciformes) From Coastal Waters Of {V}irginia}, ' ...
'journal = {Fishery Bulletin. U.S.}, ' ...
'volume = {91}, ' ...
'pages = {45-64}, ' ...
'howpublished = {\url{https://scholarworks.wm.edu/vimsarticles/600}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Tautoga-onitis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

