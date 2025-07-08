  function [data, auxData, metaData, txtData, weights] = mydata_Chanos_chanos

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gonorynchiformes'; 
metaData.family     = 'Chanidae';
metaData.species    = 'Chanos_chanos'; 
metaData.species_en = 'Milkfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW', 'TPi'};
metaData.ecoCode.habitat = {'0iMm', '0iFm', '0iFe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjCi', 'bjPz', 'jiB'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'; 'Ww-N'}; % tags for different types of uni-variate data

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 05 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data
data.ah = 35.5/24;      units.ah = 'd';  label.ah = 'age at hatch';       bibkey.ah = 'FAO'; 
  temp.ah = C2K(29);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'all temps guessed from distribution, larger than 20 C ADW; ADW: ah = 20 till 35 h at 26 to 32 C';
data.ab = data.ah+5;    units.ab = 'd';  label.ab = 'age at birth';       bibkey.ab = 'ADW'; 
  temp.ab = C2K(29); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = data.ab+14;   units.aj = 'd';  label.aj = 'age at metam';       bibkey.aj = 'ADW';
  temp.aj = C2K(29); units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = 'ADW: 14 - 30 d';
data.ap = 3*365;        units.ap = 'd';  label.ap = 'age at puberty';     bibkey.ap = 'Baga1991';
  temp.ap = C2K(29); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'ADW: 3 - 10 yr (male and female)';
data.am = 15*365;       units.am = 'd';  label.am = 'life span';          bibkey.am = 'ADW';   
  temp.am = C2K(29); units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0 = 0.12;  units.L0 = 'cm';   label.L0 = 'egg diameter';           bibkey.L0 = 'ADW';
data.Lh = 0.35;   units.Lh = 'cm';   label.Lh = 'total length at hatch';  bibkey.Lh = 'ADW'; 
data.Lb = 0.5;    units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'Baga1991';
data.Lp = 65;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 170;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';
  comment.Li = 'ADW,FAO: SL = 180 cm'; 

data.Wwp = 4500;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Baga1991';
data.Wwi = 14000;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'FAO';
  
data.Ri = 3.5e6/365;units.Ri = '#/d';label.Ri = 'maximum reprod rate';    bibkey.Ri = {'Wiki'}; 
  temp.Ri = C2K(29); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'for Ww = 6000 g';
  
% uni-variate data

% t-L data 
data.tL = [ ... % time since hatch (d), standard length (mm)
0.143	3.596
0.378	4.183
0.817	4.800
1.000	4.070
1.241	4.800
1.420	5.072
2.017	5.072
3.024	5.214
3.961	5.214
5.050	5.072
6.100	5.286
7.076	5.433
8.098	5.662
8.900	6.409
9.651	6.235
11.045	6.865
11.816	7.254
12.986	7.987
14.273	7.878
15.269	8.098
16.116	10.663
17.009	10.232
17.953	11.581
18.948	12.236
19.731	13.108
21.108	14.041
21.981	14.041
33.851	27.557
33.851	32.505
48.078	44.607
46.797	56.363
62.129	61.214
61.296	77.347
75.048	78.419
74.042	97.733
102.359	112.150
103.750	141.708
130.501	147.680
132.274	181.537
159.779	184.052
159.779	226.246
187.865	226.246
187.865	266.867
359.043	437.960
359.043	495.700
734.090	576.708
714.543	635.022
1085.680	680.251
1402.975	738.798
1402.975	780.603
1788.701	836.201
2190.000	883.517
2190.000	959.559];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};
  temp.tL = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'Baga1991'};
%
% L-N data from Baga1991
data.LN = [ ... % standard length (cm), number of eggs in 10^6
66.703	0.517
67.688	0.517
67.694	0.871
69.871	1.565
69.859	0.844
70.052	0.599
70.936	0.463
71.820	0.327
72.905	0.463
72.908	0.626
74.191	0.830
72.814	0.925
73.891	0.531
74.876	0.612
84.037	0.898
85.323	1.238
86.798	1.156
86.899	1.320
89.453	0.952
94.284	1.347
92.809	1.456
92.814	1.782
94.880	1.714
97.836	1.810
91.933	2.068
89.382	2.639
93.918	3.075
94.316	3.306
104.244	2.327
108.966	2.122
103.962	3.170
103.476	3.537
100.330	3.850
104.963	4.163
109.674	3.265
113.616	3.537
111.963	4.748
112.077	5.741
120.998	3.401
124.961	4.925];
units.LN = {'cm', '#'};  label.LN = {'standard length', 'number of eggs in 10^6'};
  temp.LN = C2K(29); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'Baga1991'};
%
% W-N data  from Baga1991
data.WN = [ ... % wet weight (g), number of eggs in 10^6
2568.679	0.498
2766.367	0.567
2903.685	0.292
3200.014	0.333
3437.330	0.444
2983.485	0.540
3062.877	0.664
3182.034	0.870
3460.926	1.614
3339.369	0.678
3457.756	0.650
3576.686	0.788
3972.062	0.926
3852.498	0.596
4484.557	0.651
4821.058	0.899
5256.651	1.257
5671.049	1.175
5770.731	1.464
6026.934	1.313
6303.154	1.245
5475.626	1.794
5496.368	2.097
5909.996	1.781
6206.053	1.740
7092.005	0.943
6327.519	2.648
8140.002	1.384
9268.750	2.362
8205.219	3.201
8481.937	3.284
10654.108	3.313
11624.524	4.181
11985.254	5.792
13265.314	4.747
12512.106	3.879
12510.838	3.494
12886.106	3.522];
units.WN = {'g', '#'};  label.WN = {'wet weight', 'number of eggs in 10^6'};
  temp.WN = C2K(29); units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = {'Baga1991'};

% t-W data from SumaBorl1995
data.tW = [ ... % time (d), wet weight (g)
0.238	33.062
14.721	49.864
27.574	65.873
42.070	95.578
60.463	150.246
76.387	181.550
86.995	194.355];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};
  temp.tW = C2K(29); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'SumaBorl1995'};
 
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
                                 
%% Links
metaData.links.id_CoL = 'TM62'; % Cat of Life
metaData.links.id_ITIS = '162838'; % ITIS
metaData.links.id_EoL = '46582157'; % Ency of Life
metaData.links.id_Wiki = 'Chanos_chanos'; % Wikipedia
metaData.links.id_ADW = 'Chanos_chanos'; % ADW
metaData.links.id_Taxo = '43032'; % Taxonomicon
metaData.links.id_WoRMS = '217625'; % WoRMS
metaData.links.id_fishbase = 'Chanos-chanos'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Chanidae}}';  
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
bibkey = 'Baga1991'; type = 'Article'; bib = [ ...  
'author = {Bagarinao, T. U.}, ' ...
'year = {1991}, ' ...
'title = {Biology of milkfish (\emph{Chanos chanos} {F}orssk\r{a}l).}, ' ... 
'publisher = {SEAFDEC Aquaculture Department}, ' ...
'address = {Tigbauan, Iloilo, Philippines.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SumaBorl1995'; type = 'Article'; bib = [ ...    
'author = {Sumagaysay, N. S. and Borlongan, I. G.}, ' ...
'year  = {1995}, ' ...
'title = {Growth and production of milkfish (\emph{Chanos chanos}) in brackishwater ponds: effects of dietary protein and feeding levels.}, ' ...  
'journal = {Aquaculture}, ' ...
'volume = {132}, ' ...
'pages = {273--283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.sinica.edu.tw/Summary/SpeciesSummary.php?id=80}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Chanos_chanos/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FAO'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/fishery/culturedspecies/Chanos_chanos/en}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Smithsonian'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sms.si.edu/irlspec/Albula_vulpes.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  