function [data, auxData, metaData, txtData, weights] = mydata_Zeus_faber

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Zeiformes'; 
metaData.family     = 'Zeidae';
metaData.species    = 'Zeus_faber'; 
metaData.species_en = 'John Dory'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bpPz', 'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ah'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.ah = 13;        units.ah = 'd';    label.ah = 'age at hatch';              bibkey.ah = 'nz_fish';   
  temp.ah = C2K(18); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ap = 4.5*365;   units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'IsmeArsl2013';
  temp.ap = C2K(18); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 18*365;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'IsmeArsl2013';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.43;     units.Lh  = 'cm';  label.Lh  = 'total length at hatch';    bibkey.Lh  = 'fishwisepro';  
  comment.Lh = 'www.fishwisepro.com: H.-W Halbeisen larvae';
data.Lp  = 25.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'IsmeArsl2013'; 
data.Li  = 90;       units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwi = 8000;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: TL = 65 cm; Wi = 8 kg';

data.GSI  = 0.0348;  units.GSI  = '-';  label.GSI  = 'gonado somatic index';    bibkey.GSI  = 'IsmeArsl2013';   
temp.GSI = C2K(18);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'M_ER/(M_V + M_E)'; 

% uni-variate data

% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g) for females
13.665	56.843
17.997	68.498
18.773	112.117
19.774	101.428
22.327	156.239
23.103	199.857
24.546	232.727
24.989	254.547
25.765	287.296
26.764	320.086
28.434	255.171
28.988	287.880
28.542	320.408
28.874	353.077
29.763	353.238
29.760	418.455
30.870	429.525
31.206	375.238
31.647	462.275
32.314	451.526
32.311	516.743
31.642	560.100
33.091	473.406
33.866	517.025
33.531	571.312
35.085	593.332
34.529	604.101
34.859	680.248
35.638	658.650
36.304	669.640
36.413	724.008
35.968	734.797
36.519	843.592
36.754	550.156
37.306	626.343
38.308	583.047
38.524	713.521
37.745	745.988
37.076	800.215
38.519	843.954
39.742	822.437
40.410	789.949
40.747	713.923
40.183	898.604
40.290	974.710
39.733	1018.087
41.626	920.604
42.067	1007.641
41.731	1061.928
43.735	964.465
43.396	1105.708
43.169	1214.362
43.722	1257.941
42.613	1214.261
42.832	1290.388
44.612	1236.363
45.499	1280.002
45.727	1160.478
46.729	1106.311
48.060	1160.900
45.828	1388.757
44.494	1399.385
43.600	1518.788
45.035	1725.570
47.251	1856.406
47.375	1573.820
48.373	1628.348
48.929	1606.710
52.795	2129.149];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'IsmeArsl2013';
comment.LW_f = 'Data for females';
% males
data.LW_m = [ ... % total length (cm), wet weight (g) for males
12.314	30.568
12.498	36.681
13.049	42.795
14.058	61.135
15.253	61.135
16.081	61.135
16.632	61.135
17.551	61.135
17.916	97.817
21.222	146.725
23.426	177.293
25.170	207.860
25.352	232.314
25.442	268.996
27.736	330.131
28.103	342.358
28.468	372.926
28.289	299.563
29.023	324.017
29.573	342.358
29.204	366.812
30.213	397.380
30.668	458.515
31.680	452.402
31.409	379.039
31.686	354.585
32.050	415.721
32.694	397.380
34.062	562.445
34.430	556.332
34.892	531.878
35.442	544.105
34.795	605.240
35.071	605.240
35.714	605.240
35.712	641.921
35.066	672.489
36.532	751.965
36.899	751.965
37.641	648.035
38.188	721.397
38.649	690.830
38.274	813.100
39.380	770.306
36.978	947.598
39.094	923.144
39.272	1014.847
41.105	1082.096
40.918	1143.231
42.480	1137.118
42.468	1326.638
41.662	1002.620
42.859	972.052];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m = 'IsmeArsl2013';
comment.LW_m = 'Data for males';

% time-length
data.tL_f = [ ... % time since hatch (yr), total length (cm)
18.002	53.140
13.994	49.160
12.014	45.426
10.962	43.792
10.988	45.652
9.985	43.320
9.986	44.134
9.986	44.948
9.008	41.919
9.057	38.896
9.054	33.431
7.977	31.214
8.005	37.726
7.805	38.655
6.999	28.999
7.027	35.278
7.028	37.371
7.029	38.185
5.999	30.853
5.999	32.248
6.050	33.876
6.051	34.807
6.026	35.853
4.996	29.218
4.973	31.311
4.973	32.241
5.023	33.056
3.968	24.677
3.040	22.578
2.062	17.920];
data.tL_f = flip(data.tL_f); data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since hatch', 'total length', 'female'};  
temp.tL_f = C2K(18); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'IsmeArsl2013';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ... % time since hatch (yr), total length (cm)
0.957	12.099
0.958	12.681
1.008	13.495
2.034	12.455
2.035	13.502
2.035	14.199
2.035	14.781
2.036	15.478
2.011	16.292
2.011	16.873
2.037	17.804
2.988	18.159
2.990	21.415
4.969	23.637
4.946	27.474
4.971	27.939
5.995	23.411
6.023	29.109
6.023	29.923
6.024	31.202
6.976	32.138
8.004	34.935
9.055	35.291
10.007	35.413
11.007	34.373
11.008	35.653
11.009	38.443
15.016	39.864
14.992	41.608
14.991	39.515
17.019	41.273];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since hatch', 'total length', 'male'};  
temp.tL_m = C2K(18); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'IsmeArsl2013';
comment.tL_m = 'Data for males';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Birth is assumed to coincide with hatch, due to lack of data';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5D45H'; % Cat of Life
metaData.links.id_ITIS = '166287'; % ITIS
metaData.links.id_EoL = '46571219'; % Ency of Life
metaData.links.id_Wiki = 'Zeus_faber'; % Wikipedia
metaData.links.id_ADW = 'Zeus_faber'; % ADW
metaData.links.id_Taxo = '44763'; % Taxonomicon
metaData.links.id_WoRMS = '127427'; % WoRMS
metaData.links.id_fishbase = 'Zeus-faber'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zeus_faber}}';
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
bibkey = 'IsmeArsl2013'; type = 'Article'; bib = [ ... 
'author = {A. Ismen and M. Arslan and C. C. Yigin and N. A. Bozbay}, ' ... 
'year = {2013}, ' ...
'title = {Age, growth, reproduction and feeding of John Dory, \emph{Zeus faber} ({P}isces: {Z}eidae), in the {S}aros {B}ay ({N}orth {A}egean {S}ea)}, ' ...
'journal = {J. Appl. Ichthyol}, ' ...
'volume = {29}, ' ...
'pages = {125--131}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Akyo2001'; type = 'Article'; bib = [ ... 
'author = {O. Akyol}, ' ... 
'year = {2001}, ' ...
'title = {Some Biological Properties and Stock Estimates of \emph{Zeus faber} {L}., 1758 ({P}isces, {Z}eidae) in the {A}egean Coasts of {T}urkey}, ' ...
'journal = {E.U. Journal of Fisheries & Aquatic Sciences}, ' ...
'volume = {18}, ' ...
'pages = {39--46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nz_fish'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fs.fish.govt.nz/Doc/5475/JDO_06.pdf.ashx}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/zeus-faber.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishwisepro'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishwisepro.com}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
