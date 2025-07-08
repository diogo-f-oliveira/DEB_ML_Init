function [data, auxData, metaData, txtData, weights] = mydata_Sousa_chinensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Sousa_chinensis'; 
metaData.species_en = 'Indo-Pacific humpbacked dolphin'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW', 'MI'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 18]; 

%% set data
% zero-variate data

data.tg = 11*30.5;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'JeffHung2012';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'little support from data';
data.tx = 150;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 14*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'JeffHung2012';   
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 38*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'JeffHung2012';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 101; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'JeffHung2012';
data.Li = 249; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'JeffHung2012';

data.Ri  = 1/(62.6*30.5);   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'JeffHung2012';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'mean interval between calving: 62.6 mnth';
  
% uni-variate data
% time-length data
data.tL_f = [ % time since birth (yr), length (cm)
0.127	100.281
0.127	102.531
0.127	108.436
0.255	106.186
0.318	104.218
0.318	110.404
0.318	114.903
0.318	117.996
0.318	132.337
0.382	112.935
0.509	141.898
3.055	166.924
7.127	225.975
7.127	233.286
8.018	227.381
9.036	233.568
10.055	234.411
18.073	234.411
20.045	235.817
20.045	257.469
21.000	232.162
21.000	260.281
21.064	246.503
21.127	240.316
22.018	238.067
22.973	249.033
22.973	253.814
23.991	251.845
25.073	268.155
26.282	221.757
26.855	246.503
27.045	243.972
28.000	249.033
29.273	260.562
31.182	252.408
32.136	237.786
34.045	258.032
38.245	257.188]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JeffHung2012';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.064	104.780
0.127	99.719
0.318	109.561
0.318	143.866
0.509	138.805
3.373	195.888
3.882	182.953
4.964	205.448
5.091	208.541
5.791	205.167
5.791	227.663
7.064	233.849
7.191	205.448
8.145	221.195
8.973	224.007
9.036	229.631
9.227	207.417
13.045	213.322
13.045	251.845
13.109	248.190
14.064	231.318
14.191	235.536
15.082	249.596
15.082	252.970
17.055	247.065
19.982	237.223
20.173	244.815
20.936	244.534
20.936	246.784
20.936	250.439
22.018	248.752
26.027	245.659
27.045	253.814
29.909	243.128
33.155	264.780]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JeffHung2012';
comment.tL_m = 'Data for males';

% length-weight
data.LW = [ ...  % length (cm), weight (kg)
46.110	2.224
84.650	5.783
86.845	5.783
90.747	5.783
96.850	11.121
100.263	9.786
103.678	9.342
105.384	8.452
106.603	8.007
109.042	8.007
109.045	10.676
110.021	11.121
110.998	12.900
111.490	17.349
112.219	14.680
112.222	16.904
113.929	16.904
132.239	34.253
132.722	29.804
141.018	33.363
177.883	69.840
183.993	82.295
189.849	84.964
193.027	92.527
207.931	118.772
215.239	109.875
215.986	125.000
216.463	114.769
218.188	132.117
221.103	120.107
225.790	174.822
227.454	130.338
229.905	141.904
230.619	124.555
232.346	144.573
233.351	174.822
236.996	160.587
237.063	229.537
240.391	140.125
240.439	189.947
242.354	152.580
242.606	161.032
244.300	147.687
244.600	204.626
249.162	130.338
249.234	205.071
250.214	209.520
250.224	219.306
251.173	192.171
258.048	239.324];
units.LW  = {'cm', 'kg'};  label.LW = {'length', 'weight'};  
bibkey.LW = 'JeffHung2012';
comment.LW = 'Sexes combined, no difference found';

%% set weights for all real data
weights = setweights(data, []);
weights.tg = 0 * weights.tg;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;
weights.psd.p_M = 2 * weights.psd.p_M;

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
D1 = 'Males are assumed not to differ from femals';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4YDGF'; % Cat of Life
metaData.links.id_ITIS = '180419'; % ITIS
metaData.links.id_EoL = '46559303'; % Ency of Life
metaData.links.id_Wiki = 'Sousa_chinensis'; % Wikipedia
metaData.links.id_ADW = 'Sousa_chinensis'; % ADW
metaData.links.id_Taxo = '68698'; % Taxonomicon
metaData.links.id_WoRMS = '220226'; % WoRMS
metaData.links.id_MSW3 = '14300082'; % MSW3
metaData.links.id_AnAge = 'Sousa_chinensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sousa_chinensis}}';
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
bibkey = 'JeffHung2012'; type = 'article'; bib = [ ... 
'author = {T. A. Jefferson and S. K. Hung and K. M. Robertson and F. I. Archer}, ' ... 
'year = {2012}, ' ...
'title = {Life history of the {I}ndo-{P}acific humpback dolphin in the {P}earl {R}iver {E}stuary, southern {C}hina}, ' ...
'journal = {Mar. Mamm. Sci.}, ' ...
'volume = {28}, ' ...
'pages = {84--104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sousa_chinensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

