  function [data, auxData, metaData, txtData, weights] = mydata_Huso_dauricus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Huso_dauricus'; 
metaData.species_en = 'Kalugo'; 

metaData.ecoCode.climate = {'Dwc', 'Dwd', 'MC'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iMcd', '0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am';'Lp'; 'Li'; 'Wwb'; 'Ri'};
metaData.data_1     = {'t-L'; 'L-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU Universisty Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 27]; 

%% set data
% zero-variate data
data.am = 80*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 180;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
  comment.Lp = '170 to 190 cm';
data.Li = 560;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.41e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at hatch';    bibkey.Wwb = 'BirsWald2002';
  comment.Wwb = 'based on egg diameter 0f 3 mm: pi/6*0.3^3';
  
data.Ri = 4.1e6/365/1.5; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fecundity 4.1e6 to 4.8e6, but does not spawn every year';  
  
% uni-variate data
% time-length
data.tL = [... % time since birth (d), total length (cm)
1.075	34.224
1.882	44.195
2.957	52.310
3.871	64.151
4.946	79.104
5.914	86.594
6.989	90.358
7.957	95.983
8.925	104.095
9.839	111.583
10.753	112.855
11.774	127.185
12.903	137.788
13.065	130.333
13.978	139.687
13.978	134.092
14.839	134.119
15.108	140.344
16.022	144.102
16.022	146.589
16.989	150.970
16.989	153.457
18.065	154.112
18.172	156.602
18.925	163.464
18.925	160.356
19.946	166.604
19.946	164.739
20.860	167.254
20.968	171.609
22.043	173.508
22.151	171.024
23.065	174.783
23.065	180.378
23.925	184.135
23.978	181.650
24.892	186.651
24.892	190.381
25.968	187.306
25.968	191.036
26.828	192.928
26.828	197.280
27.796	203.527
27.796	201.662
28.710	197.338
28.925	211.022
30.000	213.542
30.054	202.975
30.968	206.112
30.968	216.680
31.935	208.007
31.989	215.469
33.118	216.125
33.118	219.234
33.925	214.286
33.925	220.502
34.731	214.932
34.731	221.771
35.699	214.341
35.753	231.127
36.989	235.518
37.043	231.168
37.903	234.924
37.903	239.276
38.925	225.631
38.978	241.796
40.108	238.101
40.968	256.156
41.075	230.671
41.989	251.215
42.043	268.001
42.796	248.753
43.925	257.492
43.978	288.577];
data.tL(:,1) = 365*data.tL(:,1); % conver yr to d;
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'KoshMikh2014'};
 
% length-weight
data.LW = [... %  total length (cm), wet weight (g)
30.277	1058.202
35.092	352.727
38.535	1410.930
40.942	705.475
45.414	705.475
49.544	1410.930
52.640	1410.930
59.177	1410.930
64.338	2116.405
68.122	1410.930
73.973	2821.859
79.135	3527.334
83.953	4585.536
88.425	4585.536
93.246	7054.668
99.095	7054.668
104.259	9171.073
108.043	8818.345
114.927	10934.750
120.435	12698.407
126.283	12345.680
131.449	15520.286
136.611	16578.489
136.614	17989.418
141.430	17989.418
147.289	23985.884
151.421	26102.289
156.236	25396.834
163.467	28571.421
163.471	31393.300
166.574	35273.361
166.576	36331.564
172.770	36684.311
177.593	40917.100
181.725	43033.505
181.730	45502.636
186.550	47619.041
186.554	50088.183
191.376	53262.780
191.381	56437.387
195.508	55026.447
196.213	64902.995
200.680	61728.388
201.037	69488.531
206.549	73721.340
206.551	74779.542
210.692	82539.675
211.027	77248.674
215.506	80776.008
216.551	88183.424
220.360	102645.498
221.723	94885.355
225.862	100881.831
226.212	104409.165
230.687	105820.105
231.387	112874.783
235.862	114285.713
235.867	117107.582
241.010	106878.307
241.056	134038.798
241.056	134038.798
246.542	123104.058
246.558	132627.869
251.368	128395.059
256.551	141446.209
256.555	143915.341
261.774	178130.510
267.275	176014.111
272.069	162610.229
272.771	171075.837
277.258	179188.712];
units.LW = {'cm', 'g'};     label.LW = {'total length'; 'wet weight'};  
bibkey.LW = {'KoshMikh2014'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 5 * weights.psd.kap;
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

                                 
%% Links
metaData.links.id_CoL = '3MV26'; % Cat of Life
metaData.links.id_ITIS = '550557'; % ITIS
metaData.links.id_EoL = '46561185'; % Ency of Life
metaData.links.id_Wiki = 'Huso_dauricus'; % Wikipedia
metaData.links.id_ADW = 'Huso_dauricus'; % ADW
metaData.links.id_Taxo = '42448'; % Taxonomicon
metaData.links.id_WoRMS = '271700'; % WoRMS
metaData.links.id_fishbase = 'Huso-dauricus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://en.wikipedia.org/wiki/Huso_dauricus}}';  
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
bibkey = 'KoshMikh2014'; type = 'Article'; bib = [ ...    
'author = {V. N. Koshelev and P. B. Mikheev and A. P. Shmigirilov}, ' ...
'year  = {2014}, ' ...
'title = {Age and Growth of Kaluga \emph{Acipenser dauricus} from the Estuary of the {A}mur and Its Lagoon}, ' ...  
'journal = {Journal of Ichthyology}, ' ...
'volume = {54}, ' ...
'pages = {165-176}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BirsWald2002'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Vadim J. Birstein and John R. Waldman and William E. Bemis}, ' ...
'year = {2002}, ' ...
'title  = {Sturgeon biodiversity and conservation}, ' ...
'publisher = {Kluwer, Dordrecht}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Huso-dauricus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

