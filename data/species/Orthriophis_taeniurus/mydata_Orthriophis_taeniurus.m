function [data, auxData, metaData, txtData, weights] = mydata_Orthriophis_taeniurus

global tX2 tX4

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Orthriophis_taeniurus'; 
metaData.species_en = 'Beauty rat snake'; 

metaData.ecoCode.climate = {'Am', 'Cwa', 'Cfa', 'Dwa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iThh', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f';'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 13];

%% set data
% zero-variate data

data.ab = 70;     units.ab = 'd';      label.ab = 'age at birth';            bibkey.ab = 'EoL';
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 18*30.5;     units.tp = 'd';      label.tp = 'time since birth at puberty';     bibkey.tp = 'EoL';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;    units.am = 'd';      label.am = 'life span';            bibkey.am = 'EoL';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 40.2;   units.Lb  = 'cm';  label.Lb  = 'SVL at hatching for females';      bibkey.Lb  = 'Naka1992';
data.Lbm  = 39.3;   units.Lbm  = 'cm';  label.Lbm  = 'SVL at hatching for males';      bibkey.Lbm  = 'Naka1992';
data.Li  = 144;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'EoL';
   comment.Li = 'based on TL = 180 cm and SVL = 0.8*TL; one snake has TL of 280 cm';
data.Lim  = 130;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'guess';

data.Wwb = 16.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';    bibkey.Wwb = 'Naka1992';
data.Wwbm = 14.6;   units.Wwbm = 'g';   label.Wwbm = 'wet weight at birth for male';   bibkey.Wwbm = 'Naka1992';
data.Wwi = 800;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'EoL';
data.Wwim = 589;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight';       bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Wwi * (Lim/Li)^3';
  
data.Ri  = 12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL2 = [ ... % time since birth (d), SVL (cm), hatch at time 0
0.235	39.278
30.445	48.499
58.214	58.524
88.397	66.149
119.181	72.974
150.591	80.595
181.984	87.153
210.915	93.185
241.669	98.149
271.813	103.380
302.566	108.344
334.521	111.708];
units.tL2  = {'d', 'cm'};  label.tL2 = {'time since birth', 'SVL', 'fed each 2 d'};  
temp.tL2   = C2K(24);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Naka1992';
comment.tL2 = 'feeding regime 2, 22.5-26.0C';
%
tX2 = [ ... % time since birth (d), cumulative food eaten (g)
1.332	0.000
31.083	41.510
63.054	121.631
86.144	204.031
116.782	269.314
148.753	370.666
180.280	446.549
212.695	547.895
242.445	606.823
273.528	731.546
303.723	837.177
335.249	953.399];
%
data.tL4 = [ ... % time since birth (d), SVL (cm), hatch at time 0
0.235	39.278
29.679	39.192
60.972	39.633
91.077	42.471
121.874	50.094
156.969	57.970
188.976	64.526
218.589	74.812
249.404	83.499
279.622	93.251
311.624	99.541
341.803	106.900];
units.tL4  = {'d', 'cm'};  label.tL4 = {'time since birth', 'SVL', 'fed each 4 d'};  
temp.tL4   = C2K(24);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'Naka1992';
comment.tL4 = 'feeding regime 4, 22.5-26.0C';
%
tX4 = [ ...
0.888	0.000
31.083	0.000
63.498	0.000
91.916	19.217
124.331	50.498
154.082	107.304
190.049	174.617
220.687	275.993
252.214	383.723
283.741	527.547
313.936	665.024
345.906	851.303];

% time-weight
data.tW2 = [ ... % time since birth (d), weight (g), hatch at time 0
1.377	13.982
29.049	37.145
55.769	67.198
87.647	101.882
117.198	125.057
148.111	173.527
179.510	212.805
209.035	249.773
239.552	259.161
270.450	315.677
301.375	357.251
330.913	387.322];
units.tW2  = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'fed each 2 d'};  
temp.tW2   = C2K(24);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Naka1992';
comment.tW2 = 'feeding regime 2, 22.5-26.0C';
%
data.tW4 = [ ... % time since birth (d), weight (g), hatch at time 0
1.847	13.985
30.508	10.717
59.634	9.752
91.552	23.746
121.590	37.728
156.295	67.832
185.842	93.305
217.233	137.181
247.195	191.393
278.567	245.613
309.919	310.178
339.373	385.077];
units.tW4  = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight', 'fed each 4 d'};  
temp.tW4   = C2K(24);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'Naka1992';
comment.tW4 = 'feeding regime 4, 22.5-26.0C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL2 = 3 * weights.tL2;
weights.tL4 = 3 * weights.tL4;
weights.tW2 = 3 * weights.tW2;
weights.tW4 = 3 * weights.tW4;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL2','tL4'}; subtitle1 = {'Data for being fed every 2, 4 d'};
set2 = {'tW2','tW4'}; subtitle2 = {'Data for being fed every 2, 4 d'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Incubation time is ignorned; part of embryo development might occur while still inside the mother';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-length: SVL = 0.805 * TL - 1.03 cm for females, SVL = 0.768 TL - 3.99 cm for males; SVL and weight were the same for males and females';
metaData.bibkey.F1 = 'Mori1987'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '886JM'; % Cat of Life
metaData.links.id_ITIS = '1081838'; % ITIS
metaData.links.id_EoL = '794893'; % Ency of Life
metaData.links.id_Wiki = 'Orthriophis_taeniurus'; % Wikipedia
metaData.links.id_ADW = 'Orthriophis_taeniurus'; % ADW
metaData.links.id_Taxo = '3815763'; % Taxonomicon
metaData.links.id_ReptileDB = 'genus=Orthriophis&species=taeniurus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orthriophis_taeniurus}}';
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
bibkey = 'Naka1992'; type = 'Article'; bib = [ ... 
'title = {Effects of Food Deprivation on the Subsequent Growth of the Hatchling \emph{Elaphe taeniura friesel} in captivity}, ' ...
'journal = {Japanese Journal of Herpetology}, ' ...
'year = {1992}, ' ...
'author = {Akira Nakachi}, ' ....
'volume = {14(3)}, ' ...
'pages = {124-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/794893}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

