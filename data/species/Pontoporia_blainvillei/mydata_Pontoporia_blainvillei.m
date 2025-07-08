function [data, auxData, metaData, txtData, weights] = mydata_Pontoporia_blainvillei

%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Pontoporiidae';
metaData.species    = 'Pontoporia_blainvillei'; 
metaData.species_en = 'La Plata dolphin'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.2); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2017 01 09];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data
data.tg = 319;       units.tg = 'd';  label.tg = 'gestation time';         bibkey.tg = 'AnAge';    
  temp.tg = C2K(37.2); units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from bottlenose dolphin';
data.tx =  8.5*30.5;  units.tx = 'd';  label.tx = 'time since birth at weaning';  bibkey.tx = 'ADW';    
  temp.tx = C2K(37.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp =  3.5*365; units.tp = 'd'; label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(37.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'ADW: 2-5 yr';
data.tpm = 2.75*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.2);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'ADW: 2-3.5 yr';
data.am =   21 * 365;  units.am = 'd';  label.am = 'life span';            bibkey.am = 'ADW';   
  temp.am = C2K(37.2);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 70;  units.Lb = 'cm'; label.Lb = 'length at birth';              bibkey.Lb = 'Wiki';
data.Lx = 105;  units.Lx = 'cm'; label.Lx = 'length at weaning';           bibkey.Lx = 'ADW';
data.Lp = 134;  units.Lp = 'cm'; label.Lp = 'total length at puberty for female'; bibkey.Lp = 'ADW';
  comment.Lp = 'ADW: 130-138 cm';
data.Lpm = 120;  units.Lpm = 'cm'; label.Lpm = 'length at puberty for male'; bibkey.Lpm = 'ADW';
  comment.Lpm = 'ADW: 115-128 cm';
data.Li = 125;  units.Li = 'cm'; label.Li = 'ultimate length for female';  bibkey.Li = 'ADW';
  comment.Li = 'ADW: 80-171 cm';
data.Lim = 115; units.Lim = 'cm'; label.Lim = 'ultimate length for male';  bibkey.Lim = 'ADW';
  comment.Lim = 'ADW: 76-147 cm';

data.Wwp = 32000;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty for female'; bibkey.Wwp = 'Wiki';
data.Wwpm = 26000; units.Wwpm = 'g'; label.Wwpm = 'wet weight at puberty for male';  bibkey.Wwpm = 'Wiki';
data.Wwi = 32000;  units.Wwi  = 'g'; label.Wwi  = 'ultimate wet weight for female';  bibkey.Wwi  = 'Wiki';
data.Wwim = 26000; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'Wiki';

data.Ri = 0.5/365;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.001	73.409
0.030	74.826
0.032	83.325
0.033	85.308
0.033	87.008
0.051	89.839
0.035	91.824
1.059	92.977
0.035	93.807
0.020	100.321
0.976	100.341
0.976	101.758
0.009	103.154
0.010	104.854
0.010	106.837
1.035	106.858
0.011	108.254
0.017	109.953
1.036	110.257
2.003	111.127
0.040	111.370
0.979	111.956
0.040	112.220
1.008	113.090
2.090	113.678
0.041	114.203
1.009	115.639
0.013	116.752
1.009	117.622
0.014	118.169
2.062	118.493
1.010	119.322
0.014	120.152
1.010	121.588
0.043	121.852
2.007	122.175
0.043	122.985
1.011	123.005
2.007	123.308
3.003	124.178
0.044	124.402
1.012	125.554
1.012	127.537
1.012	128.387
0.045	128.934
1.013	130.087
2.009	130.957
3.033	130.978
2.009	131.524
3.034	132.111
1.014	132.353
2.009	132.373
3.006	133.527
2.010	134.640
3.006	135.793
1.015	136.319
2.011	136.339
1.015	136.886
0.019	137.716
4.031	138.080
1.015	138.302
1.016	139.435
2.979	139.758
5.028	140.083
4.032	140.630
5.967	140.669
3.008	141.459
5.967	141.802
1.016	141.985
6.992	142.106
3.008	142.309
2.012	142.855
2.013	143.705
2.013	145.121
5.058	145.183
7.021	145.223
4.034	145.729
4.034	146.862
4.034	147.145
5.969	147.751
5.030	149.148
2.071	149.372
8.018	149.492
2.015	150.787
7.023	151.172
4.035	151.395
5.970	151.717
4.036	152.811
11.064	154.370
6.000	156.250
11.065	157.486
6.996	157.970
3.013	158.456
4.037	158.477
5.005	158.780
11.066	160.319
3.013	160.439
5.063	162.747
10.043	164.264
5.037	170.962];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(37.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BottSecc2010';
comment.tL_f = 'Data for females, South Africa';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.030	75.949
0.030	76.799
0.031	80.198
0.031	81.331
0.004	85.014
0.004	85.864
0.005	86.997
0.034	92.096
0.982	92.380
0.980	97.762
0.037	99.462
0.979	102.011
0.979	102.578
0.038	103.994
0.978	103.994
1.006	105.977
1.006	106.827
2.022	107.394
0.011	108.810
0.977	108.810
1.993	108.810
0.039	109.660
0.977	109.660
1.993	110.227
0.976	110.793
0.976	111.926
0.097	112.776
0.976	113.343
0.976	113.909
0.975	115.326
2.951	115.609
0.041	115.892
1.003	116.742
3.967	116.742
0.042	117.592
2.950	117.592
1.990	118.159
0.974	118.442
1.990	119.008
0.042	119.292
2.978	119.292
0.974	120.142
1.990	120.142
0.071	120.708
0.974	120.991
1.990	120.991
0.973	122.125
0.043	122.408
0.973	122.974
4.953	122.974
2.977	123.258
1.989	124.108
2.977	124.108
0.044	124.391
0.972	124.674
2.976	124.958
1.988	125.524
3.964	125.524
0.972	126.657
1.988	126.657
2.948	126.657
3.964	126.657
7.972	126.657
6.927	127.224
1.959	128.074
0.971	128.357
5.008	128.357
3.963	128.640
0.971	128.924
1.959	128.924
7.971	129.207
2.947	129.773
5.007	130.057
5.939	130.057
1.987	130.340
2.947	130.907
1.987	131.190
4.979	131.473
2.946	131.756
2.946	132.323
1.986	132.606
5.938	132.890
11.978	133.456
2.946	134.023
3.962	134.306
7.970	134.873
0.913	135.156
2.945	135.722
5.965	135.722
1.985	136.006
2.945	136.856
3.961	136.856
4.977	137.705
5.965	137.705
7.969	137.989
2.944	138.272
3.960	138.839
6.952	138.839
12.964	140.822
0.939	141.955
3.959	143.088
5.935	143.088
2.971	143.654
5.935	144.504
2.971	145.354
6.950	147.054];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(37.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BottSecc2010';
comment.tL_m = 'Data for males';

% length-weight
data.LW = [ ... % length (cm), weight (kg)
78.851	8.467
81.473	10.035
87.466	10.244
93.958	12.857
98.327	13.275
103.321	14.111
93.208	14.321
110.562	15.366
110.562	15.679
103.446	16.098
113.308	16.934
112.060	17.456
100.200	17.770
109.064	17.875
114.182	18.293
120.674	18.293
111.061	19.233
122.297	19.443
112.060	19.756
102.072	19.861
112.934	20.383
104.569	20.697
129.039	20.906
112.559	21.115
110.811	21.115
119.800	21.115
129.039	21.533
129.039	21.951
115.056	22.056
120.674	22.160
104.320	22.683
119.051	22.787
123.046	22.892
135.406	22.997
108.564	23.101
119.051	23.101
116.055	23.206
116.804	23.206
119.925	24.251
118.552	24.564
129.788	24.669
132.160	24.983
132.160	26.028
142.022	26.864
135.281	26.969
144.145	27.073
132.035	27.178
132.784	29.059
127.041	29.164
122.672	30.314
137.278	31.463
147.141	32.091
141.773	35.122
150.137	36.585
160.624	38.049
140.774	42.334
158.876	49.965
149.139	52.056];
units.LW  = {'cm', 'kg'};  label.LW = {'length', 'weight'};  
bibkey.LW = 'NegrPane2016';

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6W7TD'; % Cat of Life
metaData.links.id_ITIS = '180411'; % ITIS
metaData.links.id_EoL = '46559412'; % Ency of Life
metaData.links.id_Wiki = 'Pontoporia_blainvillei'; % Wikipedia
metaData.links.id_ADW = 'Pontoporia_blainvillei'; % ADW
metaData.links.id_Taxo = '68677'; % Taxonomicon
metaData.links.id_WoRMS = '254964'; % WoRMS
metaData.links.id_MSW3 = '14300145'; % MSW3
metaData.links.id_AnAge = 'Pontoporia_blainvillei'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pontoporia_blainvillei}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'URL = {../../../bib/Kooy2010.html}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BottSecc2010'; type = 'Article'; bib = [ ... 
'author = {S. Botta and E. R. Secchi and M. M. C. Muelbert and D. Danilewicz and M. F. Negri and H. L. Cappozzo and A. A. Hohn}, ' ... 
'year = {2010}, ' ...
'title = {Age and growth of Franciscana dolphins, \emph{Pontoporia blainvillei} ({C}etacea: {P}ontoporiidae) incidentally caught off southern {B}razil and northern {A}rgentina}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'doi = {10.1017/S0025315410001141}, ' ...
'pages = {1--8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NegrPane2016'; type = 'Article'; bib = [ ... 
'author = {M. F. Negri and M. V. Panebianco and P. Denuncio and M. N. P. Viola and D. Rodriguez and H. L. Cappozzo}, ' ... 
'year = {2016}, ' ...
'volume = {96}, ' ...
'pages = {821--829}, ' ...
'title = {Age and growth of Franciscana dolphins, \emph{Pontoporia blainvillei} ({C}etacea: {P}ontoporiidae) incidentally caught off southern {B}razil and northern {A}rgentina}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'doi = {10.1017/S0025315410001141}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pseudorca_crassidens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Pontoporia_blainvillei/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

