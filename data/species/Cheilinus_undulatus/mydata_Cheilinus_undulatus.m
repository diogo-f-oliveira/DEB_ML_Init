function [data, auxData, metaData, txtData, weights] = mydata_Cheilinus_undulatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Cheilinus_undulatus'; 
metaData.species_en = 'Humphead wrasse'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 01];

%% set data
% zero-variate data

data.ab = 3;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 32*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 52;    units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Lim  = 229;  units.Lim  = 'cm';  label.Lim  = 'ultimate standard length for males'; bibkey.Lim  = 'fishbase';

data.Wwp = 1847;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01479*Lp^2.97, see F1';
data.Wwim = 151e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.01479*Li^2.97, see F1; max published weight 191 kg';

data.GSI = 0.03; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.161	6.009
0.321	9.173
0.960	24.357
2.962	35.442
2.964	38.604
2.966	42.715
3.080	56.312
3.959	36.399
4.013	37.665
4.015	41.459
4.018	46.202
4.781	89.846
4.911	47.475
5.012	41.152
5.019	52.219
5.119	44.315
5.801	43.689
5.917	61.397
5.966	56.022
6.061	40.213
6.701	56.029
6.856	53.184
7.009	46.229
7.013	51.605
7.059	41.803
7.063	48.127
7.169	50.025
7.743	44.655
7.956	49.716
8.010	52.562
8.015	59.203
8.017	62.049
8.954	51.939
8.964	65.852
9.008	53.836
9.058	49.410
9.108	46.564
9.901	55.109
9.902	57.323
9.957	59.853
10.057	52.897
10.065	65.862
10.947	50.376
11.002	53.222
11.015	72.827
11.904	69.357
12.000	55.444
12.893	57.350
13.946	62.735
14.046	54.514
14.109	70.958
14.159	66.215
15.044	56.104
15.050	65.591
15.996	66.864
17.045	66.557
17.940	71.308
18.991	73.215
19.000	86.496
21.943	93.479
22.041	83.677
23.026	65.030
28.030	94.482
28.070	74.562
29.975	98.927];
data.tL_f(:,1) = (0.3+data.tL_f(:,1)) * 365;
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(27.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ChoaDavi2006'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.806	42.406
3.965	45.886
5.063	39.571
5.066	44.315
5.912	53.492
5.963	50.647
6.012	45.588
7.125	62.989
8.064	54.776
9.222	59.530
11.856	76.313
11.906	72.202
11.912	80.740
13.918	99.730
15.122	95.631
16.169	91.213
17.026	117.782
17.108	83.000
17.924	127.277
18.064	99.768
18.070	109.254
18.073	113.365
19.976	135.833
21.083	143.115
21.901	109.605
23.127	138.707
25.114	128.923];
data.tL_m(:,1) = (0.3+data.tL_m(:,1)) * 365;
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(27.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ChoaDavi2006'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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

%% Facts
F1 = 'length-weight: Ww in g  = 0.01479*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'TRTD'; % Cat of Life
metaData.links.id_ITIS = '170619'; % ITIS
metaData.links.id_EoL = '46571891'; % Ency of Life
metaData.links.id_Wiki = 'Cheilinus_undulatus'; % Wikipedia
metaData.links.id_ADW = 'Cheilinus_undulatus'; % ADW
metaData.links.id_Taxo = '46334'; % Taxonomicon
metaData.links.id_WoRMS = '218945'; % WoRMS
metaData.links.id_fishbase = 'Cheilinus-undulatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cheilinus_undulatus}}';
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
bibkey = 'ChoaDavi2006'; type = 'Article'; bib = [ ... 
'author = {J. H. Choat and C. R. Davies and J. L. Ackerman and B. D. Mapstone}, ' ... 
'year = {2006}, ' ...
'title = {Age structure and growth in a large teleost, \emph{Cheilinus undulatus}, with a review of size distribution in labrid fishes}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {318}, ' ...
'pages = {237–246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cheilinus-undulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

