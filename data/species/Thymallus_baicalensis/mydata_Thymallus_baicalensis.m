function [data, auxData, metaData, txtData, weights] = mydata_Thymallus_baicalensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Thymallus_baicalensis'; 
metaData.species_en = 'Baikal black grayling'; 

metaData.ecoCode.climate = {'BW'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2024 12 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 26]; 

%% set data
% zero-variate data

data.ab = 15;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';   
  temp.ab = C2K(9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;     units.am = 'd';    label.am = 'life span'; bibkey.am = 'TsogMend2017';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 16;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 38.2;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 4.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.1 mm (1.9 to 2.4 mm) for Prosopium cylindraceum: pi/6*0.21^3';
data.Wwp  = 28.6; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'fishbase','guess'}; 
  comment.Wwp = 'based on 0.00501*Lp^3.12, see F1';
data.Wwi  = 432.43; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00501*Li^3.12, see F1; max published weight 1.2 kg';

data.Ri  = 6000/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(21.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Thymallus_tugarinae';
  
% uni-variate data
% time-length
data.tL_f = [... %  time since birth (yr), total length (cm)
1.034	18.998
1.067	13.510
2.004	25.434
2.004	24.639
2.004	14.937
2.037	28.058
2.069	23.366
3.006	24.474
3.006	23.758
3.039	26.780
3.039	21.929
3.103	25.348
3.976	27.968
4.009	21.288
4.009	25.821
5.011	32.257
5.011	22.635
5.043	30.030
10.959	38.110];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TsogMend2017';
%
data.tL_m = [... %  time since birth (yr), total length (cm)
1.099	14.942
2.037	16.607
2.069	22.173
2.069	24.161
2.069	20.423
2.909	25.190
2.942	29.882
3.006	28.609
3.006	27.337
3.103	31.154
4.009	21.845
4.041	27.332
4.041	29.161
5.043	27.406
6.013	33.603];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TsogMend2017';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
11.715	14.356
12.481	17.987
12.558	24.361
13.015	10.693
13.170	24.352
13.552	17.060
13.859	21.609
14.165	20.694
14.166	27.069
14.624	18.865
14.778	27.971
15.085	32.520
15.545	39.799
15.696	25.224
15.774	32.509
16.158	46.165
16.233	34.324
16.308	23.394
16.460	19.748
16.923	43.421
16.999	39.777
17.150	21.559
17.765	44.319
17.996	50.690
18.532	54.325
18.993	62.515
19.374	57.045
19.529	65.239
19.833	50.663
20.141	68.873
20.219	73.425
20.602	75.241
20.832	82.523
20.907	68.861
21.291	78.873
21.292	87.981
22.208	73.395
22.212	98.896
22.286	80.680
22.287	84.323
22.594	93.426
23.132	104.346
23.362	110.718
23.513	97.965
24.127	109.796
24.129	121.636
24.436	128.006
24.514	137.112
24.588	118.896
24.893	110.695
24.897	139.839
24.899	150.768
25.123	114.334
25.432	131.634
25.507	125.258
25.588	156.222
25.893	146.199
26.045	138.911
26.354	156.210
26.509	168.958
26.663	175.331
26.886	136.166
26.889	152.559
27.196	160.751
27.350	168.035
27.581	176.228
27.730	147.993
27.812	185.332
28.043	194.436
28.116	166.202
28.197	201.719
28.658	213.552
28.806	178.942
29.113	185.312
29.347	213.542
29.421	197.147
30.341	203.508
30.813	290.022
31.890	329.168
38.171	360.949];
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'TsogMend2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwi = 0 * weights.Wwi;

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
D2 = 'Data Wwi is ignorned due to incinsistency with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00501*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '56Q7Y'; % Cat of Life
metaData.links.id_ITIS = '162017'; % ITIS
metaData.links.id_EoL = '1230791'; % Ency of Life
metaData.links.id_Wiki = 'Thymallus_baicalensis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3421123'; % Taxonomicon
metaData.links.id_WoRMS = '1421968'; % WoRMS
metaData.links.id_fishbase = 'Thymallus-baicalensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thymallus_baicalensis}}';
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
bibkey = 'TsogMend2017'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.13247?msockid=0c7692ac275d65161cc287ef2626644e}, ' ...
'author = {Tsogtsaikhan, P. and B. Mendsaikhan and G. Jargalmaa and B. Ganzorig and B.C. Weidel and C.M. Filosa and C.M. Free and T. Young and O.P. Jensen}, ' ... 
'year = {2017}, ' ...
'title = {Age and growth comparisons of {H}ovsgol grayling (\emph{Thymallus nigrescens} {D}orogostaisky, 1923), {B}aikal grayling (\emph{T. baicalensis} {D}ybowski, 1874), and lenok (\emph{Brachymystax lenok} {P}allas, 1773) in lentic and lotic habitats of {N}orthern {M}ongolia}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {33}, ' ...
'pages = {108-115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Thymallus-baicalensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

