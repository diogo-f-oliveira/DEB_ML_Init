function [data, auxData, metaData, txtData, weights] = mydata_Uranoscopus_scaber

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Uranoscopidae';
metaData.species    = 'Uranoscopus_scaber'; 
metaData.species_en = 'Atlantic stargazer'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 09]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 09]; 

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'redorbi','CokeAkyo2008'};
  comment.Wwb = 'based egg diameter of 2 mm: 4/3*pi*0.1^3'; 
data.Wwp = 45.8; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.0167*Lp^3, see F1';
data.Wwi = 1069; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0167*Li^3, see F1';

% uni-variate data
% t-L data
data.tL= [  ... % time since birth (yr), total length (cm)
1  7.03
2 12.45
3 16.71
4 19.37
5 21.20];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DemiCan2007';

% t-W data 
data.tW = [ ... % time since birth (yr), wet weight (g)
1   6.12
2  31.99
3  81.81
4 125.80
5 166.50];
data.tW(:,1) = 365 * (0.5 + data.tW(:,1)); % convert yr to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(18);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DemiCan2007';

% length-fecundity data
data.LN = [ ... % total length (cm), fecundity (#)
16.972	2291.673
17.194	871.136
17.778	9192.862
18.986	5987.699
19.194	136.957
19.194	1909.108
19.583	6866.211
19.972	304.329
20.000	5266.003
20.778	15534.636
20.778	26876.408
21.375	2590.368
21.389	13754.746
21.472	5956.229
21.583	7549.756
22.069	2227.150
22.069	6480.314
22.069	7543.603
22.417	6475.918
22.458	13563.995
22.667	8776.549
22.875	2216.953
23.083	22948.490
23.083	4163.684
23.181	7883.965
23.472	5399.260
23.694	1497.718
23.958	4329.818
24.083	5745.959
24.472	12475.213
24.583	19030.766
24.583	25410.515
24.653	47561.533
24.778	952.360
24.875	11406.826
24.972	8038.503
25.056	15657.700
25.181	15478.904
25.472	32665.085
25.472	9272.680
26.069	16708.159
26.083	19188.996
26.167	15289.204
26.361	9261.428
26.361	7843.704
26.486	19892.755
26.486	6956.050
26.569	752.463
26.569	13334.745
26.972	12797.994
26.972	58165.083
27.097	12087.558
27.181	2871.313
27.569	36182.843
29.069	10999.296];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CokeAkyo2008';
% weight-fecundity data
data.WN = [ ... % wet weight (g), fecundity (#)
74.703	8810.067
79.667	800.918
92.184	1601.836
95.423	5766.591
116.495	1762.016
120.097	7048.058
121.134	202.301
124.381	5766.591
131.145	160.188
150.131	7688.788
154.162	26910.753
155.176	15537.756
162.618	2562.934
184.088	6407.321
188.358	2562.934
189.844	13455.379
192.656	4004.574
194.461	7368.419
195.167	5766.591
198.390	6727.689
199.441	2562.934
209.835	7688.788
216.989	8489.706
219.460	2242.566
233.060	5125.861
233.815	12974.829
239.866	7688.788
242.391	12173.911
243.877	23066.363
251.276	1762.016
251.703	15537.756
257.084	19061.789
260.244	7848.968
263.481	11533.182
267.026	5766.591
272.803	16819.223
275.243	4485.124
287.044	5125.861
288.493	8970.255
288.884	15537.756
292.427	9290.616
293.098	640.737
298.588	25629.290
301.063	20183.068
315.001	19221.969
326.346	640.737
329.982	12494.280
332.080	3203.664
332.305	47414.186
333.886	6887.870
346.075	13455.379
348.574	12814.649
353.553	7688.788
355.826	32677.344
400.054	12494.280
408.152	58146.452
426.523	15217.395
428.289	10892.452
449.510	36041.189];
units.WN   = {'g', '#'};  label.WN = {'wet weight', 'fecundity'};  
temp.WN   = C2K(18);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'CokeAkyo2008';

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
F1 = 'weight-length relationship: W = 0.0167 * SL^3';
metaData.bibkey.F1 = 'DemiCan2007'; 
F2 = 'demersal; depth range 15 - 400 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7DPGB'; % Cat of Life
metaData.links.id_ITIS = '171078'; % ITIS
metaData.links.id_EoL = '46573190'; % Ency of Life
metaData.links.id_Wiki = 'Uranoscopus_scaber'; % Wikipedia
metaData.links.id_ADW = 'Uranoscopus_scaber'; % ADW
metaData.links.id_Taxo = '46399'; % Taxonomicon
metaData.links.id_WoRMS = '127093'; % WoRMS
metaData.links.id_fishbase = 'Uranoscopus-scaber'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Uranoscopus_scaber}}';
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
bibkey = 'DemiCan2007'; type = 'Article'; bib = [ ... 
'author = {S. A. Demirhan and M. F. Can and K. Seyhan}, ' ... 
'year = {2007}, ' ...
'title = {Age and growth of stargazer (\emph{Uranoscopus scaber} {L}., 1758) in the southeastern {B}lack {S}ea}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {23}, ' ...
'pages = {4692--694}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CokeAkyo2008'; type = 'Article'; bib = [ ... 
'author = {T. \c{C}oker and O. Akyol and O. \"{O}zayd{\i}n and S. Leblebici and Z. Tosuno\v{g}lu}, ' ... 
'year = {2008}, ' ...
'title = {Determination of batch fecundity in \emph{Uranoscopus scaber} {L}innaeus, 1758 from the {A}egean {S}ea, {T}urkey}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {24}, ' ...
'pages = {85--87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1779}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'redorbi'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.redorbit.com/reference/atlantic-stargazer-uranoscopus-scaber/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

