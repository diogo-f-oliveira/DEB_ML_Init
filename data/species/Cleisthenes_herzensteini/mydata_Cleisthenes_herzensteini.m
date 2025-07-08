function [data, auxData, metaData, txtData, weights] = mydata_Cleisthenes_herzensteini
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Cleisthenes_herzensteini'; 
metaData.species_en = 'Sohachi'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.2); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 16];

%% set data
% zero-variate data
data.ab = 7.7;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(17.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;     units.am = 'd';    label.am = 'life span';                  bibkey.am = 'fishbase';  
  temp.am = C2K(17.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15.5;  units.Lp = 'cm';   label.Lp = 'total length at puberty';         bibkey.Lp = 'DagaChan1992';
data.Li = 47;    units.Li = 'cm';   label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 33.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00741*Lp^3.07, see F4';
data.Wwi = 1e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00741*Li^3.07, see F4; max published weight 1.2 kg';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm) 
 1	 9.171  9.171
 2	12.952 15.448
 3	19.301 18.472
 4	20.747 20.668
 5	23.274 22.611
 6	25.213 24.299];
data.tL_fm(:,1) = 365 * (0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'DagaChan1992'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % age (years) ~ weight (g0
 1	 14.987  NaN
 2	 34.061  27.460
 3	 63.892  58.936
 4	 96.215  89.603
 5	154.970 151.670
 6	199.672 192.250
];
data.tW_fm(:,1) = 365 * (0+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(17.2);  units.temp.tW_fm = 'K'; label.temp.tL = 'temperature';
bibkey.tW_fm = 'DagaChan1992'; treat.tW_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
15.543	87480.164
16.377	124895.022
16.961	158071.482
17.046	104690.721
17.254	121236.170
17.336	191140.782
17.506	104926.776
17.672	137888.778
18.175	72393.965
18.339	166998.792
18.466	113639.352
18.752	315155.919
18.796	249425.050
19.009	134465.980
19.047	233115.794
19.174	187975.499
19.254	290756.275
19.342	151075.670
19.761	114304.598
19.840	262290.187
19.927	159595.110
19.967	196602.237
20.135	188469.068
20.219	163854.830
20.258	233738.121
20.471	122888.555
20.547	328407.189
20.925	275176.644
20.930	139562.623
21.010	242343.399
21.012	197138.725
21.343	275391.240
21.383	328836.380
21.421	435705.200
21.512	226162.901
21.513	189177.233
21.636	259103.443
21.969	292151.146
22.179	251163.274
22.309	119723.134
22.335	588229.483
22.349	169058.908
22.389	230723.055
22.469	329394.328
22.471	271861.144
22.472	259532.634
23.178	358525.801
23.181	284554.467
23.219	399642.431
23.258	461306.578
23.349	264092.788
23.388	338085.445
23.511	395683.007
24.096	400093.082
24.269	239907.741
24.344	482412.042
24.350	293374.340
24.391	334490.970
24.471	433162.244
24.473	371519.557
24.889	416938.827
24.933	367646.109
24.966	597800.441
25.012	486864.899
25.763	507798.824
25.802	590010.625
25.810	363987.256
25.850	400994.383
25.891	433891.869
26.433	471156.510
26.554	594506.401
26.564	302730.703
26.681	532927.954
26.716	734315.694
27.225	516768.916
27.265	578433.062
27.303	677082.945
27.805	644464.295
27.932	595214.566
28.110	303524.706
28.170	965199.652
28.229	463860.265
28.349	624195.684
28.428	755743.122
28.431	681771.856
29.128	1039664.556
29.187	558872.685
29.269	616448.788
30.099	756601.504
30.104	629206.558
30.142	711418.289
30.177	908696.526
30.265	806001.519];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(17.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DagaChan1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00741*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YWZR'; % Cat of Life
metaData.links.id_ITIS = '616039'; % ITIS
metaData.links.id_EoL = '46570141'; % Ency of Life
metaData.links.id_Wiki = 'Cleisthenes_herzensteini'; % Wikipedia
metaData.links.id_ADW = 'Cleisthenes_herzensteini'; % ADW
metaData.links.id_Taxo = '171432'; % Taxonomicon
metaData.links.id_WoRMS = '280211'; % WoRMS
metaData.links.id_fishbase = 'Cleisthenes-herzensteini'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cleisthenes_herzensteini}}';
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
bibkey = 'DagaChan1992'; type = 'article'; bib = [ ...
'author = {Chen Dagang and Liu Changan and Dou Shuozeng}, ' ...
'year   = {1992}, ' ...
'title  = {THE BIOLOGY OF FLATFISH ({P}LEURONECTINAE) IN THE COASTAL WATERS OF {C}HINA}, ' ... 
'journal = {Netherlands Journal of Sea Research}, ' ...
'page = {215-221}, ' ...
'volume = {29(1-3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cleisthenes-pinetorum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
