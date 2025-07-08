function [data, auxData, metaData, txtData, weights] = mydata_Argentina_silus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Argentiniformes'; 
metaData.family     = 'Argentinidae';
metaData.species    = 'Argentina_silus'; 
metaData.species_en = 'Greater argentine'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mpm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % in K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 19]; 

%% set data
% zero-variate data
data.am = 35*365;   units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 1.7;    units.Lb = 'cm';   label.Lb = 'total length at birth';         bibkey.Lb = 'MunkNiel2005';
  comment.Lb = 'pre-flexion stage';
data.Lp = 26;     units.Lp = 'cm';   label.Lp = 'total length at puberty';       bibkey.Lp = 'fishbase';
data.Li = 70;     units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 0.019; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'MunkNiel2005';
  comment.Wwb = 'based on egg diameter of 3.3 mm: 4/3*pi*0.06^3';
data.Wwp = 133;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.0039 * Lp^3.203, see F4';
data.Wwi = 3170;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.0039 * Li^3.203, see F4';

data.Ri = 11550/365; units.Ri = '#/d';  label.Ri = 'reprod rate at 45 cm';       bibkey.Ri = 'ICES';
  temp.Ri = C2K(7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data
data.tL = [ ... % age (years) ~ Length (cm) 
4.010	26.887
4.011	27.682
4.011	29.272
4.012	30.464
4.058	28.477
4.989	32.185
5.034	27.947
5.035	29.272
5.966	31.391
5.967	35.232
5.967	35.894
5.968	36.954
5.968	38.675
5.969	39.735
5.989	32.848
5.990	33.775
6.943	33.510
6.944	34.834
6.944	35.364
6.968	36.424
6.991	37.483
7.967	33.775
7.967	34.967
7.967	35.762
7.968	36.556
7.969	39.868
7.969	40.662
7.994	43.311
8.015	38.543
8.991	35.762
8.991	36.424
8.991	36.954
8.991	37.748
8.992	38.543
8.992	39.338
8.993	41.457
8.993	42.781
9.016	40.530
9.036	33.245
9.037	34.172
9.967	34.702
9.967	35.629
9.968	36.159
9.968	36.821
9.968	37.748
9.968	38.543
9.969	39.073
9.969	39.338
9.969	40.662
9.970	41.325
9.970	41.987
9.970	42.649
9.970	43.709
9.972	47.550
10.013	32.715
10.946	40.000
10.992	38.543
10.993	41.192
10.993	42.119
10.994	44.106
11.014	34.967
11.014	36.821
11.972	47.285
11.972	47.947
11.972	48.874
11.990	33.642
11.994	45.430
12.014	36.424
12.016	40.927
12.016	41.987
12.017	43.709
12.038	38.278
12.039	39.735
12.948	45.033
12.948	47.020
12.949	48.477
12.991	35.894
12.991	38.013
12.992	39.868
12.993	41.325
12.993	42.252
12.994	43.709
13.018	46.093
13.949	48.212
13.993	42.517
13.994	43.311
13.994	44.503
13.994	45.430
13.995	46.358
14.015	38.013
14.015	39.073
14.039	41.457
14.991	38.013
14.992	39.205
14.993	40.662
14.993	42.384
14.994	43.841
16.018	47.152
16.019	48.079
16.019	49.536
16.971	46.225
16.972	47.947
17.015	38.808
17.973	49.934
17.994	43.311
18.040	44.371
18.995	47.815
19.038	39.073
20.019	47.947];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Magn2007';

data.LW = [ ... % total length (cm), wet weight (g)
40  670
43  830
43  858
43  920
44  970
44  965
46 1010
47 1180
48 1250
49 1260];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'ICES';
comment.LW = 'spent females';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 7 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'bathydemersal;';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.0039 * (L in cm)^3.203';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = 'GGGP'; % Cat of Life
metaData.links.id_ITIS = '162064'; % ITIS
metaData.links.id_EoL = '46562886'; % Ency of Life
metaData.links.id_Wiki = 'Argentina_silus'; % Wikipedia
metaData.links.id_ADW = 'Argentina_silus'; % ADW
metaData.links.id_Taxo = '161604'; % Taxonomicon
metaData.links.id_WoRMS = '126715'; % WoRMS
metaData.links.id_fishbase = 'Argentina-silus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argentina_silus}}';
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
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ...  
'author = {Munk, P. and Nielsen, J. G.}, ' ...
'year = {2005}, ' ...
'title  = {Eggs and larvae of {N}orth {S}ea fishes}, ' ...
'publisher = {biofolia}, ' ...
'address = {Frederiksberg, DK}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Magn2007'; type = 'article'; bib = [ ...
'author = {E. Magnussen}, ' ... 
'year   = {2007}, ' ...
'title  = {Interpopulation comparison of growth patterns of 14 fish species on {F}aroe {B}ank: are all fishes on the bank fast-growing?}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {453-475}, ' ...
'volume = {71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/2700}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ICES'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ices.dk/sites/pub/CM~Doccuments/1991/H/1991_H57.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
