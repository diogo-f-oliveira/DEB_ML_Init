function [data, auxData, metaData, txtData, weights] = mydata_Allocyttus_verrucosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Zeiformes'; 
metaData.family     = 'Oreosomatidae';
metaData.species    = 'Allocyttus_verrucosus'; 
metaData.species_en = 'Warty oreo'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bpPz', 'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.9); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 10];

%% set data
% zero-variate data

data.ab = 50.5;        units.ab = 'd';    label.ab = 'age at hatch';              bibkey.ab = 'guess';   
  temp.ab = C2K(4.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 140*365;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(4.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 42;       units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1/350;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on 350 eggs/g of Allocyttus niger';
data.Wwi = 1.23e3;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^3.05, see F1';

data.Ri  = 3e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Allocyttus niger at 1.23 kg';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
9.727	16.081
10.224	14.707
15.847	20.175
16.464	22.344
16.899	19.143
18.767	26.108
19.074	19.136
19.691	29.305
23.380	25.865
23.955	26.777
24.440	25.061
26.968	27.453
27.333	30.194
27.477	26.423
28.191	23.449
29.080	25.617
29.406	27.216
31.573	26.981
32.424	28.006
34.058	28.115
34.711	31.313
35.006	31.998
37.367	29.476
39.285	29.927
42.632	32.430
43.956	31.397
44.143	28.882
44.298	25.453
49.626	30.236
51.715	27.715
54.076	33.193
54.864	32.390
56.712	30.784
57.295	31.925
59.461	31.690
59.675	29.975
64.296	29.960
64.373	32.245
68.575	35.888
70.396	33.482
89.703	33.648
89.811	36.848
94.417	36.375
109.087	36.099
127.357	37.754
129.512	37.175];
data.tL_f(:,1) = (0+ data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(4.9); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StewFent1995';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
14.257	19.682
17.679	24.406
19.034	24.270
19.515	22.426
19.930	26.635
19.948	27.161
20.032	21.634
20.076	22.950
21.334	27.945
22.652	26.756
23.428	25.569
23.900	23.462
24.207	24.513
24.297	27.144
24.604	28.196
24.888	20.563
25.072	25.957
25.553	24.113
25.865	25.296
26.003	21.349
27.322	28.186
27.518	25.948
27.540	26.606
27.745	24.632
28.378	27.261
28.989	29.232
29.679	25.545
29.773	28.308
29.978	26.334
32.233	28.694
34.304	25.659
35.205	28.156
35.276	30.261
43.751	23.650
43.983	30.492
44.464	28.648
44.959	27.198
45.084	30.882
46.117	29.299
46.264	25.615
47.182	28.637
48.559	29.159
49.909	28.890
50.395	27.178
55.025	27.424
55.667	30.316
58.099	29.912
59.004	32.540
62.154	29.239
64.953	31.597
65.090	27.649
65.193	30.675
69.154	27.239
69.266	30.528
69.502	29.475
80.165	31.277
82.277	29.426
87.949	28.353
89.242	34.400
89.737	32.951
93.974	29.646
94.576	31.354
95.382	31.088
100.025	31.728
109.445	28.930
114.890	29.172
117.256	34.821
119.582	31.260];
data.tL_m(:,1) = (0+ data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(4.9); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StewFent1995';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi; 
weights.Wwb = 3 * weights.Wwb; 
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.01380*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BW29'; % Cat of Life
metaData.links.id_ITIS = '166306'; % ITIS
metaData.links.id_EoL = ''; % Ency of LifeAllocyttus_niger
metaData.links.id_Wiki = 'Allocyttus_verrucosus'; % Wikipedia
metaData.links.id_ADW = 'Allocyttus_verrucosus'; % ADW
metaData.links.id_Taxo = '160424'; % Taxonomicon
metaData.links.id_WoRMS = '127422'; % WoRMS
metaData.links.id_fishbase = 'Allocyttus-verrucosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Allocyttus_verrucosus}}';
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
bibkey = 'StewFent1995'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00288330.2018.1481436}, ' ...
'author = {B. D. Stewart and G. E. Fenton and D. C. Smith and S. A. Short}, ' ... 
'year = {1995}, ' ...
'title = {Validation of otolith-increment age estimates for a deepwater fish species,  the warty oreo \emph{Allocyftus verrucosus}, by radiometric analysis}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {123}, ' ...
'pages = {29-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Allocyttus-verrucosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

