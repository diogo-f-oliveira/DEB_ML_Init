function [data, auxData, metaData, txtData, weights] = mydata_Tursiops_truncatus

%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Tursiops_truncatus'; 
metaData.species_en = 'Common bottlenose dolphin'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.3); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 't-Ww'}; 

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
data.tg = 365;       units.tg = 'd';  label.tg = 'gestation time';         bibkey.tg = 'AnAge';    
  temp.tg = C2K(37.2); units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from HampWhit1971';
data.tx =  548;  units.tx = 'd';  label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';    
  temp.tx = C2K(37.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp =  2831; units.tp = 'd'; label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3689;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.2);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am =   51.6 * 365;  units.am = 'd';  label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(37.2);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 110;  units.Lb = 'cm'; label.Lb = 'total length at birth';       bibkey.Lb = 'McFeAdam2012';
data.Li = 250;  units.Li = 'cm'; label.Li = 'ultimate total length for female'; bibkey.Li = 'Wiki';
data.Lim = 350; units.Lim = 'cm'; label.Lim = 'ultimate total length for male'; bibkey.Lim = 'Wiki';
  comment.Lim = '2.5 till 3.5 m';
  
data.Wwb = 19350;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 300e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'ADW';
data.Wwim = 500e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'ADW';

data.Ri = 0.5/365;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
4.949	184.305
4.697	186.996
5.455	194.170
4.949	196.861
5.505	198.655
3.434	199.103
4.495	199.552
3.434	204.036
5.960	204.933
2.424	206.278
3.737	206.726
2.525	209.417
3.434	209.417
3.939	210.314
5.960	211.211
4.495	212.108
12.525	212.108
3.939	213.004
5.455	213.901
5.960	214.798
7.475	218.386
3.485	219.283
4.545	221.525
5.455	221.973
8.081	229.148
8.737	229.148
4.495	229.596
7.020	229.596
5.455	232.735
8.990	234.529
7.879	239.910
10.051	240.807
8.990	241.704
8.535	245.291
13.030	245.291
7.929	247.085
9.495	248.879
9.899	248.879
23.081	249.776
19.091	252.915
33.232	253.363
25.202	255.157
10.909	255.605
16.061	256.054
17.020	256.054
29.141	257.848
23.081	260.090
20.152	260.538
20.152	263.229
22.071	264.574
25.051	265.022
11.061	265.919
26.162	269.507
16.061	270.404
21.162	281.614];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(37.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'McFeAdam2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
3.510	181.884
3.510	185.870
6.017	191.667
4.864	193.478
4.864	195.652
4.513	196.014
6.067	197.101
7.321	197.464
4.513	198.913
5.415	200.000
4.964	203.623
6.017	208.333
7.521	209.420
7.923	210.145
9.928	211.232
11.984	212.681
4.964	213.406
6.920	214.855
12.937	215.580
9.026	216.304
6.017	217.391
6.519	219.203
8.073	219.565
9.026	220.652
13.037	220.652
5.466	221.739
11.934	221.739
7.722	222.101
9.928	222.101
6.920	222.464
10.530	225.362
10.079	225.725
10.380	225.725
6.920	227.174
8.023	227.899
9.979	227.899
12.937	228.261
14.943	228.623
10.931	230.435
6.519	230.797
9.928	231.522
10.530	232.246
12.937	232.246
13.990	232.971
24.069	232.971
7.923	234.420
11.984	234.783
12.536	234.783
14.943	234.783
9.828	235.145
10.931	235.507
13.940	235.870
8.976	236.232
15.946	236.594
15.946	238.043
14.943	238.406
10.931	238.768
24.069	239.130
16.948	239.493
18.954	240.217
10.530	240.942
16.948	243.841
14.943	244.203
18.954	244.203
21.010	244.928
13.940	245.290
14.943	245.290
17.951	245.290
15.946	246.377
13.037	246.739
24.069	246.739
11.884	247.464
10.480	248.188
10.380	250.725
23.016	251.087
14.993	253.623
10.931	253.986
16.948	253.986
15.946	254.710
23.016	254.710
27.980	255.072
21.963	255.797
17.951	256.522
18.954	256.884
26.024	257.609
15.946	260.507
18.954	262.681
15.946	263.406
14.943	263.768
13.940	264.493
27.980	267.029
14.943	267.391
17.951	268.116
27.980	268.841
21.060	271.014
23.066	272.101
27.077	272.464
16.999	273.188
16.999	282.971];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(37.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'McFeAdam2012';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), weight (kg)
4.914	63.253
4.655	72.537
5.964	74.690
3.939	81.817
2.435	82.519
4.398	84.321
5.445	85.758
5.904	89.690
3.420	91.456
3.879	94.674
5.449	95.043
4.402	95.392
3.423	101.813
5.975	103.976
12.320	105.098
3.490	105.742
5.911	106.833
4.407	108.964
5.912	109.333
5.520	111.472
6.960	113.627
4.409	115.035
7.942	117.920
8.990	120.428
8.402	122.567
6.963	123.270
9.907	124.007
13.047	125.818
7.946	127.206
7.490	132.559
8.080	137.921
8.081	139.707
8.670	139.712
5.466	143.258
22.996	144.468
9.457	145.789
19.988	146.944
18.942	149.793
9.916	150.079
11.030	155.802
21.953	156.246
16.983	157.278
24.963	158.412
16.003	159.770
16.004	162.627
32.944	162.761
16.004	163.698
10.968	165.801
28.956	167.016
24.967	169.841
20.062	170.874
10.973	179.730
20.922	197.666];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f  = C2K(37.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'McFeAdam2012';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), length (cm)
3.457	68.174
3.522	75.346
4.565	106.436
4.630	104.046
4.891	104.050
4.957	113.613
5.348	118.996
5.478	135.133
5.543	107.047
5.609	110.633
5.804	113.026
5.870	82.549
5.870	118.406
6.391	125.584
6.391	133.353
6.522	149.490
6.913	105.272
6.913	114.236
6.978	133.360
7.043	151.887
7.174	110.056
7.435	84.363
7.500	114.244
7.826	112.455
7.957	116.043
7.957	101.700
7.957	130.385
7.957	127.995
8.087	154.292
8.935	111.275
9.000	127.411
9.000	131.594
9.000	138.168
9.913	150.730
9.978	137.584
10.043	109.497
10.043	123.242
10.304	134.002
10.435	126.833
10.435	169.263
10.500	175.838
10.500	180.618
10.565	131.615
10.826	143.571
10.826	146.559
10.891	157.914
10.891	181.221
11.348	200.351
11.870	114.900
11.935	167.490
11.935	175.857
11.935	216.494
11.935	143.586
12.000	151.953
12.000	119.682
12.065	124.464
12.391	130.444
12.913	128.658
12.913	137.025
12.913	160.332
12.978	120.890
13.826	195.603
13.957	153.174
13.957	213.533
14.804	159.162
14.804	166.333
14.804	168.723
14.804	186.054
14.804	191.433
14.870	141.832
14.935	178.287
14.935	221.315
14.935	231.474
15.913	103.001
15.913	157.384
15.913	160.372
15.978	169.337
16.043	180.692
16.891	159.787
16.891	186.679
16.891	251.221
16.957	199.230
17.870	208.206
17.935	196.255
17.935	221.355
18.848	154.434
18.913	187.901
18.913	192.085
18.913	196.268
18.913	208.818
18.913	229.734
21.000	220.200
21.848	168.219
22.891	190.345
22.957	210.664
23.870	180.796
23.935	166.454
24.913	217.264
25.891	209.508
27.848	269.295
27.913	207.144
27.913	233.439];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m  = C2K(37.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'McFeAdam2012';
comment.tW_m = 'Data for males';

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tL_f','tL_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1, set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '59R5F'; % Cat of Life
metaData.links.id_ITIS = '180426'; % ITIS
metaData.links.id_EoL = '46559295'; % Ency of Life
metaData.links.id_Wiki = 'Tursiops_truncatus'; % Wikipedia
metaData.links.id_ADW = 'Tursiops_truncatus'; % ADW
metaData.links.id_Taxo = '68750'; % Taxonomicon
metaData.links.id_WoRMS = '137111'; % WoRMS
metaData.links.id_MSW3 = '14300099'; % MSW3
metaData.links.id_AnAge = 'Tursiops_truncatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tursiops_truncatus}}'; 
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
bibkey = 'McFeAdam2012'; type = 'Article'; bib = [ ... 
'author = {W. E. McFee and J. D. Adams and P. A. Fair and G. D. Bossart}, ' ... 
'year = {2012}, ' ...
'title = {Age Distribution and Growth of Two Bottlenose Dolphin (\emph{Tursiops truncatus}) Populations from Capture-Release Studies in the {S}outheastern {U}nited {S}tates}, ' ...
'journal = {Aquatic Mammals}, ' ...
'volume = {38}, ' ...
'pages = {17-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HampWhit1971'; type = 'Article'; bib = [ ... 
'author = {Hampton, I. F. G. and Whittow, G. C. and Szekerczes, J. and Rutherford, S.}, ' ... 
'year = {1971}, ' ...
'title = {Heat transfer and body temperature in the altlantic bottlenose dolphin, \emph{Tursiops truncatus}}, ' ...
'journal = {Int. J. Biometeor.}, ' ...
'volume = {5}, ' ...
'pages = {247-253}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tursiops_truncatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Tursiops_truncatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

