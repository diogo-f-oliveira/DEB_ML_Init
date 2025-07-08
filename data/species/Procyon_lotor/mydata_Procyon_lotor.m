function [data, auxData, metaData, txtData, weights] = mydata_Procyon_lotor

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Procyonidae';
metaData.species    = 'Procyon_lotor'; 
metaData.species_en = 'Raccoon'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 28]; 

%% set data
% zero-variate data

data.tg = 63;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 91;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 21*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 65;   units.Li  = 'cm';  label.Li  = 'ultimate head-body length';   bibkey.Li  = 'OkuyShim2013';

data.Wwb = 80;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 1175;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 6000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: one clutch per yr in spring';
  
% uni-variate data
% t-L data
data.tL = [ ... % time since april 1 (d), head body length (cm), 
88.770	32.755
91.102	34.796
100.222	35.616
105.857	33.849
110.576	39.838
113.940	38.206
115.047	37.118
119.668	39.705
123.149	42.155
126.243	31.000
129.999	43.110
142.507	43.115
157.300	43.528
157.328	44.481
169.967	49.111
193.792	47.216
193.846	49.120
203.070	53.614
209.773	49.398
209.939	55.249
212.248	56.474
230.360	53.624
239.696	62.063
244.125	57.847
245.049	50.364
250.886	55.672
277.916	46.567
307.798	57.734
317.973	55.697
330.280	48.627
337.168	50.942
344.041	52.714
344.211	58.700
347.596	57.749
351.088	60.607
358.773	50.950
358.831	52.991
373.814	60.072
377.156	57.624
377.175	58.304
380.478	54.496
380.606	58.986
382.787	55.721
384.907	50.280
385.216	61.164
389.548	53.547
392.851	49.739
403.177	53.008
403.270	56.273
404.361	54.641
405.482	54.097
415.921	61.312
421.464	56.280
421.483	56.960
421.494	57.368
421.506	57.777
422.825	64.172
423.691	54.648
423.707	55.192
423.830	59.546
424.797	53.560
426.004	56.010
426.031	56.962
426.058	57.914
427.118	55.194
428.240	54.650
428.271	55.738
428.456	62.269
429.477	58.188
429.500	59.004
430.591	57.372
430.653	59.549
435.031	53.564
436.099	51.115
439.641	55.743
439.665	56.559
439.726	58.736
443.285	63.907
444.344	61.186
445.354	56.697
445.439	59.690
446.526	57.922
447.593	55.473
447.787	62.276
448.692	54.113
452.095	53.842
453.387	59.285
454.466	57.245
457.951	59.831
457.966	60.375
458.078	64.321
462.449	58.064
462.615	63.914
465.895	59.290
505.778	62.298
507.851	55.224
517.017	57.676
549.061	64.899
603.633	64.647
715.980	56.798
745.633	59.938
758.118	59.127
785.392	58.592
789.960	59.274
789.971	59.683
793.216	53.834
795.514	54.651
802.468	59.279
808.219	61.594
808.289	64.043
812.686	58.739
812.748	60.916
813.804	58.059
820.750	62.415
824.045	58.335
831.142	67.997
855.984	61.884
864.980	58.350
875.113	54.816
902.535	59.452
920.829	62.997
922.012	64.630
1050.487	64.133
1084.437	58.432];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'head-body length'};  
temp.tL    = C2K(38);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OkuyShim2013';

% time-weight
data.tWw = [ ... % time since birth (d), weight (pounds)
0.001	0.112
7.011	0.376
14.228	0.539
21.206	0.702
27.478	0.899
35.433	1.128
42.172	1.291
48.855	2.048
55.885	1.600
63.476	2.203
70.538	2.637
77.329	2.969
84.828	4.047
91.915	4.565
99.086	5.355
106.163	5.840
113.630	6.036];
data.tWw(:,2) = data.tWw(:,2) * 453.59237; % convert pound to g
units.tWw   = {'d', 'cm'};  label.tWw = {'time since birth', 'head-body length'};  
temp.tWw    = C2K(38);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Mont1969';


%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4MPXY'; % Cat of Life
metaData.links.id_ITIS = '180575'; % ITIS
metaData.links.id_EoL = '328598'; % Ency of Life
metaData.links.id_Wiki = 'Procyon_lotor'; % Wikipedia
metaData.links.id_ADW = 'Procyon_lotor'; % ADW
metaData.links.id_Taxo = '66610'; % Taxonomicon
metaData.links.id_WoRMS = '1451680'; % WoRMS
metaData.links.id_MSW3 = '14001664'; % MSW3
metaData.links.id_AnAge = 'Procyon_lotor'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Procyon_lotor}}';
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
bibkey = 'OkuyShim2013'; type = 'Article'; bib = [ ... 
'author = {Okuyama, M. W. and Shimozuru, M. and Abe, G. and Nakai, M. and Sashika, M. and Shimada, K.-I.- and Takahashi, N. and Fukui, D. and Nakamura, R. and Tsubota, T.}, ' ... 
'year = {2013}, ' ...
'title = {Timing of puberty and its relationship with body growth and season in male raccoons (\emph{Procyon lotor}) in {H}okkaido}, ' ...
'journal = {J. Reprod. Dev.}, ' ...
'volume = {59}, ' ...
'pages = {361--367}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mont1969'; type = 'Article'; bib = [ ... 
'author = {G. G. Montgomery}, ' ... 
'year = {1969}, ' ...
'title = {Weaning of Captive Raccoons}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {33(1)}, ' ...
'pages = {154-159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Procyon_lotor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

