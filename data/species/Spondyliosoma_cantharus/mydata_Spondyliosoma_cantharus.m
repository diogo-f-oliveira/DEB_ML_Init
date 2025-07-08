function [data, auxData, metaData, txtData, weights] = mydata_Spondyliosoma_cantharus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Spondyliosoma_cantharus'; 
metaData.species_en = 'Black seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 21];

%% set data
% zero-variate data

data.am = 8*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'Daba2022';   
  temp.am = C2K(10.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19.7;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*.08^3';
data.Wwp = 102.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^3.03, see F1';
data.Wwi = 3e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.03, see F1';

data.Ri  = 554070/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(10.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.007	13.474
1.007	14.435
2.014	20.480
2.041	19.082
2.041	16.984
3.008	23.552
3.021	22.591
3.034	22.154
3.034	21.630
3.034	21.106
3.061	20.581
3.988	22.867
4.002	22.342
4.015	21.906
4.041	23.392
4.041	23.916
4.041	24.965
4.995	27.513
5.009	25.852
5.022	26.027
5.022	23.580
5.035	26.727
5.035	24.804
5.035	24.542
5.035	24.279
5.048	25.241
5.976	26.652
5.989	28.575
5.989	27.002
6.016	29.450
6.029	25.954
6.029	25.254
6.029	24.730
7.023	26.929
7.036	28.415
7.036	30.338
7.049	25.356
7.049	29.201
7.049	31.212
7.076	27.629
8.017	32.012
8.030	30.176
8.043	28.865]; 
data.tL_f(:,1) = (0.9 + data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(10.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Daba2022';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.018	11.140
0.970	11.894
0.982	17.339
0.982	16.501
0.983	13.318
0.996	14.994
0.997	12.648
1.010	12.313
1.022	15.999
1.023	13.653
1.063	14.240
1.955	21.192
1.983	19.349
1.996	20.019
1.996	19.936
1.996	18.930
1.997	18.260
2.008	22.030
2.024	17.925
2.024	17.171
2.026	12.648
2.038	14.910
2.076	21.024
2.985	19.265
2.997	21.695
3.011	20.187
3.011	19.936
3.023	23.202
3.024	22.197
3.024	20.689
3.025	18.930
3.051	20.941
3.064	21.443
3.065	20.438
4.012	24.710
4.012	22.951
4.025	23.537
4.026	21.108
4.053	21.695
4.066	22.448
4.105	25.631
5.026	26.469
5.027	23.537
5.028	22.365
5.028	21.862
5.040	26.720
5.041	23.035
5.052	27.726
5.054	24.124
5.080	26.050
5.080	25.631
5.080	24.961
5.974	29.233
5.988	28.144
6.014	28.647
6.015	26.050
6.015	25.380
6.028	26.385
6.041	27.390
6.042	26.888
6.069	25.045
6.989	30.992
7.002	30.155
7.030	28.144
7.044	27.223
7.057	27.642
7.057	26.720
7.070	28.982]; 
data.tL_m(:,1) = (0.9 + data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(10.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Daba2022';

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
F2 = 'protogynous sequential hermaphrodite. Sex change occurs at 25.0 cm TL and 3.75 years of age';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '79PJZ'; % Cat of Life
metaData.links.id_ITIS = '182942'; % ITIS
metaData.links.id_EoL = '46579976'; % Ency of Life
metaData.links.id_Wiki = 'Spondyliosoma_cantharus'; % Wikipedia
metaData.links.id_ADW = 'Spondyliosoma_cantharus'; % ADW
metaData.links.id_Taxo = '186591'; % Taxonomicon
metaData.links.id_WoRMS = '127064'; % WoRMS
metaData.links.id_fishbase = 'Spondyliosoma-cantharus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spondyliosoma_cantharus}}';
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
bibkey = 'Daba2022'; type = 'article'; bib = [ ... 
'doi = {10.4194/TRJFAS21016}, ' ...
'author = {Ismail Burak Daban}, ' ...
'year = {2022}, ' ...
'title  = {Age, Growth, Mortality and Reproduction Biology of the Black Seabream, \emph{Spondyliosoma cantharus} in {N}orth {A}egean {S}ea, {T}urkey, {M}editerranean {B}asin}, ' ...
'journal = {Turk. J. Fish.& Aquat. Sci.}, ' ...
'volume = {22(8)}, ' ...
'pages = {TRJFAS21016}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Spondyliosoma-cantharus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

