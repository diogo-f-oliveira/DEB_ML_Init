function [data, auxData, metaData, txtData, weights] = mydata_Pylodictis_olivaris
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Pylodictis_olivaris'; 
metaData.species_en = 'Flathead catfish'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 08 02]; 

%% set data
% zero-variate data;

data.ab = 7.5;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'ADW';
  temp.ab = C2K(27.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 25*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishbase';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 46;  units.Lp  = 'cm';	label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'cabi';
data.Li  = 155;   units.Li  = 'cm';	label.Li  = 'ultimate standard length';    bibkey.Li  = 'fishbase'; 
  comment.Li = 'based on TL 155 cm';  

data.Wwb = 1.41e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'cabi'; 
  comment.Wwb = 'based on egg diameter of 3.0 mm: pi/6*0.3^3';
data.Wwi  = 55.8e3;   units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';

data.Ri  = 1e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.969	16.499
0.969	17.756
0.970	19.013
0.972	21.777
0.986	14.990
1.012	24.538
1.041	12.220
1.042	13.728
1.968	22.186
1.977	35.758
2.003	19.418
2.007	24.193
2.016	38.268
2.027	26.956
2.036	40.025
2.038	42.539
2.047	28.714
2.048	29.970
2.049	31.981
2.051	33.740
3.019	22.087
3.023	27.616
3.024	29.627
3.025	31.135
3.027	32.894
3.027	34.151
3.028	34.905
3.029	36.162
3.030	38.423
3.032	40.434
3.032	41.691
3.033	42.947
3.038	49.733
3.039	50.990
3.072	44.955
3.073	46.714
3.075	48.473
3.997	51.151
4.017	53.160
4.018	55.673
4.021	31.544
4.027	39.838
4.030	44.864
4.032	48.383
4.033	49.640
4.059	60.194
4.076	57.679
4.077	58.684
4.938	82.732
4.977	56.588
5.022	67.392
5.024	70.911
5.036	61.358
5.057	64.624
5.990	82.633
5.994	60.765
6.015	64.031
6.030	58.751
6.060	76.091
7.020	79.268
7.023	83.541
7.025	85.803
7.980	82.194
8.026	67.109
9.032	83.351
9.052	85.109
10.039	72.449
11.008	60.795
13.024	99.061
15.051	125.010];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GrabIsel2004';

% length - weight
data.LWw = [ ... % wet weight (g), fork length (cm), 
31.017	15.850
31.017	15.057
31.017	12.680
62.035	20.605
62.035	19.284
62.035	17.964
93.052	22.455
124.069	27.210
155.087	26.154
186.104	29.853
217.122	24.306
279.156	28.798
310.174	30.648
341.191	34.875
341.191	30.120
372.208	33.027
434.243	32.236
465.261	34.878
496.278	36.727
496.278	35.407
589.330	37.786
620.347	39.372
713.400	40.958
775.434	41.488
806.452	44.923
868.486	43.339
930.521	44.133
992.556	45.983
1116.625	46.778
1147.643	49.685
1147.643	45.458
1240.695	46.517
1271.712	49.159
1333.747	51.802
1457.816	50.484
1457.816	48.106
1519.851	52.862
1643.921	54.714
1674.938	51.545
1830.025	51.548
1985.112	56.042
2047.146	57.364
2078.164	54.723
2171.216	56.838
2233.251	55.255
2295.285	61.067
2326.303	59.747
2512.407	59.487
2512.407	57.374
2574.442	61.602
2760.546	59.492
2977.667	67.421
2977.667	60.289
3318.859	70.863
3473.945	68.224
3535.980	63.999
3535.980	65.848
3753.102	68.759
4001.241	64.009
4001.241	70.877
4528.536	68.247
4590.571	74.059
4745.658	76.176
4900.744	73.273
5055.831	74.862
5303.970	85.169
5303.970	75.659
5521.092	81.211
5552.109	83.061
5707.196	82.007
5738.213	84.914
6017.370	83.599
6079.404	82.015
6110.422	76.469
6203.474	79.376
6637.717	83.084
6730.769	84.406
6947.891	78.336
11011.166	94.270
11476.427	99.827
14081.886	102.788
21370.968	126.452];
data.LWw = data.LWw(:,[2 1]); % reverse order of cols
units.LWw   = {'cm', 'g'};  label.LWw = {'fork length','wet weight'};  
bibkey.LWw = 'GrabIsel2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00562*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4QPV3'; % Cat of Life
metaData.links.id_ITIS = '164029'; % ITIS
metaData.links.id_EoL = '221296'; % Ency of Life
metaData.links.id_Wiki = 'Pylodictis_olivaris'; % Wikipedia
metaData.links.id_ADW = 'Pylodictis_olivaris'; % ADW
metaData.links.id_Taxo = '185646'; % Taxonomicon
metaData.links.id_WoRMS = '594798'; % WoRMS
metaData.links.id_fishbase = 'Pylodictis-olivaris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pylodictis_olivaris}}';
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
bibkey = 'GrabIsel2004'; type = 'Article'; bib = [ ... 
'doi = {10.1080/02705060.2004.9664914}, ' ...
'author = {Timothy B. Grabowski and J. Jeffery Isely and Robert R. Weller},'...
'title = {Age and Growth of Flathead Catfish, \emph{Pylodictus olivaris} {R}afinesque, in the {A}ltamaha {R}iver {S}ystem, {G}eorgia},'...
'journal = {Journal of Freshwater Ecology},'...
'volume = {19(3)},'...
'year = {2004},'...
'pages = {411-418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pylodictis-olivaris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pylodictis_olivaris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'cabi'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.cabi.org/isc/datasheet/67542}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

