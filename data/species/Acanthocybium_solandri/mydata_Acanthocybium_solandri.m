function [data, auxData, metaData, txtData, weights] = mydata_Acanthocybium_solandri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Acanthocybium_solandri'; 
metaData.species_en = 'Wahoo'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.7); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 04];

%% set data
% zero-variate data

data.ab = 3.5;        units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(24.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'ZiscGrif2013';   
  temp.am = C2K(24.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 99.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 250;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.05 mm: pi/6*0.105^3';
data.Wwp = 6e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00282*Lp^3.17, see F1';
data.Wwi = 112.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00282*Li^3.17, see F1, gives 83 kg';

data.Ri  = 6e6/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 69 kg'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(24.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.347	79.247
0.375	91.462
0.454	95.436
0.463	99.129
0.571	107.079
0.573	97.988
0.584	90.033
0.623	94.577
0.641	109.917
0.652	102.246
0.718	123.834
0.779	116.445
0.827	127.807
0.957	124.393
0.964	143.426
0.970	104.506
0.973	151.949
0.980	107.914
0.981	106.494
0.982	102.233
0.983	162.460
0.984	154.789
0.994	146.550
1.003	150.243
1.957	165.545
1.968	154.465
1.975	112.704
1.977	162.703
1.992	125.487
1.993	122.362
1.994	115.544
1.996	168.669
2.039	147.644
2.964	152.152
2.972	169.765
2.975	150.163
2.982	167.492
2.984	157.549
2.985	147.890
2.993	164.083
3.007	136.241
3.970	154.100
3.977	173.702
3.980	152.111
3.989	162.054
3.998	164.610
3.999	155.803
4.972	178.207
4.974	163.434
5.035	155.761
5.978	177.030];
data.tL_f(:,1) = (data.tL_f(:,1)+0.5)*365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(24.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ZiscGrif2013';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.434	90.891
0.435	85.777
0.454	96.572
0.698	126.392
0.955	136.324
0.966	130.642
0.967	127.233
0.969	114.733
0.979	110.471
0.984	148.255
0.985	138.596
0.991	101.096
0.999	113.311
1.005	140.868
1.008	120.697
1.009	117.856
1.025	134.049
1.932	134.580
1.957	98.216
1.969	152.192
1.971	139.976
1.978	160.147
2.000	144.237
2.001	136.850
2.953	160.675
2.964	154.141
2.965	143.629
2.966	142.493
2.967	140.220
2.968	137.947
2.969	130.845
2.977	134.538
3.005	146.184
3.951	145.010
3.952	142.169
3.961	148.134
3.984	129.099
3.992	140.178
4.000	150.974
4.004	126.258
4.975	154.911
4.987	145.252
4.999	131.331
5.016	152.353
6.978	149.716];
data.tL_m(:,1) = (data.tL_m(:,1)+0.5)*365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(24.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ZiscGrif2013';
comment.tL_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.00282*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8VM2'; % Cat of Life
metaData.links.id_ITIS = '172451'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Acanthocybium_solandri'; % Wikipedia
metaData.links.id_ADW = 'Acanthocybium_solandri'; % ADW
metaData.links.id_Taxo = '46673'; % Taxonomicon
metaData.links.id_WoRMS = '127014'; % WoRMS
metaData.links.id_fishbase = 'Acanthocybium-solandri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...187059
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthocybium_solandri}}';
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
bibkey = 'ZiscGrif2013'; type = 'Article'; bib = [ ... 
'doi = {10.1093/icesjms/fst039}, ' ...
'author = {Mitchell T. Zischke and Shane P. Griffiths and Ian R. Tibbetts}, ' ... 
'year = {2013}, ' ...
'title = {Rapid growth of wahoo (\emph{Acanthocybium solandri}) in the {C}oral {S}ea, based on length-at-age estimates using annual and daily increments on sagittal otoliths}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {70(6)}, ' ...
'pages = {1128–1139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Acanthocybium-solandri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
