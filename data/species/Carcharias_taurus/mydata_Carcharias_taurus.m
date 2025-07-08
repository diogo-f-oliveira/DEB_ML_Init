function [data, auxData, metaData, txtData, weights] = mydata_Carcharias_taurus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Odontaspididae';
metaData.species    = 'Carcharias_taurus'; 
metaData.species_en = 'Sand tiger shark'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Le'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm     = [2017 08 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data

data.ab = 50;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'GilmDod1993';   
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 6 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'ADW';
  temp.tp = C2K(26); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4.5 * 365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(26); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 10;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'GilmDod1993';  
  comment.Lb = 'At 10 cm feeding on other eggs/offring starts; at 100 cm it leaves the mother';
data.Lp  = 220;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Lpm  = 195;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'ADW'; 
data.Li  = 330;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'computed as 0.0106 * Lb^2.940, see F3';
data.Wwp = 8.166e+04;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'computed as 0.0106 * Lp^2.940, see F3';
data.Wwpm = 5.728e+04;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = 'fishbase';
  comment.Wwi = 'computed as 0.0106 * Lpm^2.940, see F3';
data.Wwi = 2.690e+05;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'computed as 0.0106 * Li^2.940, see F3';

data.Ri  = 2000/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate at 269 cm';      bibkey.Ri  = 'GilmDod1993';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2000 hatched embryos in a 269 cm female; only 1 pup of 100 cm each 2 yr actually leaves the female';

% uni-variate data
% time-length data pre birth
data.tL_e = [ ... % age (d), embryo length (cm)
4.363	3.363
4.803	4.057
4.815	5.100
8.677	3.008
27.274	5.409
28.534	2.453
28.544	3.321
28.986	4.190
36.002	13.214
38.054	4.174  % outlier
38.449	1.045  % outlier
47.978	3.462  % outlier
47.988	4.331  % outlier
48.052	9.718  
48.078	11.977 % feeding starts here (see comment)
56.942	31.251
58.618	26.903
58.994	22.211 
65.256	3.954  % outlier
65.676	2.910  % outlier
66.018	31.930
66.030	32.973
66.083	0.824  % outlier
66.098	2.041  % outlier
95.821	32.574
96.318	1.467  % outlier
156.229	65.314
160.760	83.379
161.255	88.765
176.727	82.483
178.176	95.513
178.190	96.730
195.933	100.001
212.798	102.058
213.244	103.273
235.662	100.107
259.910	105.800
281.902	103.155
281.927	105.241
294.285	91.318];
units.tL_e   = {'d', 'cm'};  label.tL_e = {'age', 'total length'};  
temp.tL_e    = C2K(26);  units.temp.tL_e = 'K'; label.temp.tL_e = 'temperature';
bibkey.tL_e  = 'GilmDod1993';
comment.tL_e = ['Initially, embryos 13-18.5 mm TL obtain nutrition from internal coelomic yolk supplies during a period of early tissue differentiation. ' ...
'In embryos between 18.5 and 51 mm TL, consumption of encapsulated yolk supplies occurs until hatching, between 49 and 63 mm TL. ' ...
'After hatching, the embryo absorbs yolk-sac nutritive supplies and may also consume uterine fluid. ' ...
'At about 100 mm TL, the embryo begins to hunt and consume other intrauterine embryos. ' ...
'Seven to nine months into gestation, ova are no longer fertilized. ' ...
'In each uterus, the single remaining embryo, 334-1,060 mm TL, consumes enlarged yolk capsules containing 7-23 unfertilized ova. ' ...
'Just prior to parturition the maternal ovary is greatly reduced in size. ' ...
'Few egg capsules are found within the uteri, and in each uterus the remaining embryo exhibits reduced yolk consumption and an enlarged liver. ' ...
'Parturition observed in captivity typically takes place from December through March, after 9-12 months of gestation. Newborn juveniles are about 100 cm long'];
% 
data.tL_f = [ ... % time since birth (yr), total length (cm)
 0   100
 0.6 117
 1.1 127
 1.3 135.5
 1.6 140
 2.9 160
 5.1 180
 6.2 198
 6.8 207
 7.3 236
10.3 244.4];
data.tL_f(:,1) = 250 + data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(26);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'CoveKist1991';
comment.tL_f = 'Data for female Bess; 250 d added to age to account for time since start feeding';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
 0    95
 0.5 120
 2   156.6
 3   178
 4.1 199.5
 5.1 204
 6   212
 6.2 218.5
 7   222.1
 7.3 222.8
 7.8 223.2
 8.3 224.8
 8.4 228.3
 8.5 230
 8.7 230
 9.1 240
10.9 240
13.5 240
16.6 248.4];
data.tL_m(:,1) = 250 + data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'CoveKist1991';
comment.tL_m = 'Data for male Jabula; 250 d added to age to account for time since start feeding';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_e([10 11 12 13 19 20 23 24 26]) = 0; % cick out outliers
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D2 = 'Although the reproduction rate is high, due to sibling cannibalism, only 1 pup of 1 m is produced each 2 yr';
D3 = 'Life span of 12 yr seems too short, compared to other sharks';
D4 = 'The fit ignors embryo data that show a low length at high age';
D5 = 'Early juvenile data are underestimated, probably by ignoring gut contents';
D6 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);

%% Facts
F1 = 'Preferred temp 26 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Depth: 0 - 60 m';
metaData.bibkey.F2 = 'ADW';
F3 = 'Weight (g) - length (cm): Ww = 0.0106 * L^2.940';
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '5WZK9'; % Cat of Life
metaData.links.id_ITIS = '159879'; % ITIS
metaData.links.id_EoL = '46559764'; % Ency of Life
metaData.links.id_Wiki = 'Carcharias_taurus'; % Wikipedia
metaData.links.id_ADW = 'Carcharias_taurus'; % ADW
metaData.links.id_Taxo = '108247'; % Taxonomicon
metaData.links.id_WoRMS = '105843'; % WoRMS
metaData.links.id_fishbase = 'Carcharias-taurus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharias_taurus}}';
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
bibkey = 'CoveKist1991'; type = 'Article'; bib = [ ... 
'author = {A. Govender and N. Kistnasamy and R. P. Van Der Elst}, ' ... 
'year = {1991}, ' ...
'title = {Growth of spotted ragged-tooth sharks \emph{Carcharias taurus} ({R}afinesque) in captivity}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'doi = {10.2989/025776191784287718}, ' ...
'volume = {11}, ' ...
'number = {1}, '...
'pages = {15--19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GilmDod1993'; type = 'Article'; bib = [ ... 
'author = {Gilmore, R. G. and Dodrill, J. W. and P. A. Linley}, ' ... 
'year = {1993}, ' ...
'title = {Reproduction and embryonic development of the sand tiger shark, \emph{Odontaspis taurus} ({R}afinesque)}, ' ...
'journal = {Fishery Bull Wash}, ' ...
'volume = {81}, ' ...
'number = {2}, '...
'pages = {201--225}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharias-taurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Carcharias_taurus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Carcharias_taurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

