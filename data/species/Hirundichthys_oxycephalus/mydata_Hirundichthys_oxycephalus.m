function [data, auxData, metaData, txtData, weights] = mydata_Hirundichthys_oxycephalus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Exocoetidae';
metaData.species    = 'Hirundichthys_oxycephalus'; 
metaData.species_en = 'Bony flyingfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MIN'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 07 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 07 14]; 

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 141;     units.tp = 'd';    label.tp = 'timce since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(28.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Read from tL-curve, given Lp';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12.54;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on same relative length compared to Hirundichthys_affinis: 18*20.9/30';
data.Li  = 18.0;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki_t';
  comment.Wwb = 'based on egg diameter of 0.5-0.8 mm for tobiko: pi/6*0.07^3';

data.Ri = 8.9; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(28.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected value for Hirundichthys_affinis: (18/30)^3*1.5e4/365';
 
% uni-variate data
% t-L data
data.tL = [... % time since birth (d), fork length (cm)
0.079	3.665
0.088	3.394
0.093	3.848
0.105	5.118
0.105	4.302
0.107	5.662
0.107	4.393
0.109	4.756
0.244	14.198
0.263	14.925
0.270	13.475
0.274	15.017
0.288	15.562
0.288	14.746
0.293	15.835
0.295	14.838
0.302	15.292
0.319	14.930
0.319	14.477
0.326	16.110
0.330	15.838
0.335	16.383
0.340	16.836
0.342	14.932
0.349	15.568
0.349	16.747
0.351	15.205
0.358	15.750
0.358	16.385
0.365	15.660
0.365	15.207
0.372	17.021
0.377	15.752
0.377	15.117
0.377	16.296
0.393	17.113
0.393	16.751
0.400	15.482
0.407	17.205
0.416	15.846
0.419	19.110
0.421	18.204
0.423	18.023
0.433	18.840
0.435	19.112
0.435	18.477
0.442	19.566
0.447	18.025
0.447	17.844
0.463	18.570
0.463	19.114
0.463	19.658
0.465	18.208
0.467	18.299
0.470	19.931
0.479	18.663
0.507	19.209
0.512	20.026
0.514	19.663
0.521	20.026
0.521	19.392
0.537	20.028
0.540	18.759
0.547	19.847
0.570	21.391
0.572	20.756
0.591	20.214
0.595	20.849
0.595	20.668
0.619	20.398
0.628	21.759
0.667	20.674
0.677	21.219
0.693	23.125
0.695	20.768];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChanYuan2022';

% length - weight
data.LWw_f = [ ... % fork length (cm), wet weight (g)
0.459	0.374
0.786	0.374
0.918	0.374
1.180	-0.374
1.508	0.374
1.770	-0.374
2.032	0.374
2.098	0.000
2.557	0.000
3.082	-0.374
3.410	-0.374
3.606	0.374
4.000	-0.374
4.196	1.121
4.458	1.121
4.720	1.121
11.532	15.327
12.383	18.692
12.644	20.561
12.840	22.430
13.228	32.150
13.491	30.280
13.621	33.645
13.624	28.037
13.816	35.514
14.144	35.514
14.404	41.121
15.253	46.355
16.238	43.364
16.617	71.402
16.957	48.224
17.214	57.196
17.343	61.308
17.671	62.430
18.058	73.645
18.130	62.430
18.312	88.224
18.391	63.551
18.392	62.430
18.579	79.252
18.644	81.495
18.646	77.383
18.714	73.271
18.905	83.364
18.914	66.168
19.170	78.505
19.173	72.150
19.234	82.243
19.295	90.467
19.298	84.486
19.622	90.841
19.624	87.850
19.628	79.626
19.634	69.533
19.684	97.570
19.690	87.103
19.761	77.383
19.811	105.047
19.882	95.701
19.883	93.458
20.021	81.869
20.073	106.168
20.085	84.860
20.208	99.439
20.411	87.850
20.540	92.336
20.541	89.720
20.667	99.439
20.671	90.841
20.727	109.533
20.796	102.430
21.189	103.925
21.244	122.991
21.318	106.916
21.329	87.103
21.391	93.832
21.444	117.757
21.451	103.551
21.510	117.009
21.837	118.505
21.971	113.271
22.359	122.991];
units.LWw_f = {'cm', 'g'};     label.LWw_f = {'fork length','wet weight','females'};  
bibkey.LWw_f = 'ChanYuan2022';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % fork length (cm), wet weight (g)
10.747	13.084
11.008	14.579
11.271	14.579
11.271	14.579
11.532	16.822
13.102	22.056
13.104	19.065
13.300	20.187
14.016	30.280
14.017	28.785
14.408	32.150
14.415	20.935
14.470	40.374
14.604	33.645
14.605	32.897
14.669	35.514
14.864	37.757
14.928	41.495
14.997	35.514
15.065	30.280
15.191	39.252
15.194	35.140
15.196	31.402
15.260	34.019
15.387	41.495
15.451	44.486
15.652	37.009
15.711	48.224
15.845	43.738
15.846	41.495
15.908	48.224
15.912	40.000
15.977	42.617
16.169	50.467
16.237	45.981
16.311	30.280
16.493	57.196
16.494	55.701
16.506	34.019
16.628	50.467
16.692	53.458
16.693	51.963
16.763	43.738
16.953	55.701
17.081	60.561
17.145	64.299
17.280	56.822
17.282	54.206
17.339	69.907
17.398	80.748
17.466	76.636
17.480	50.467
17.537	66.542
17.607	58.692
17.612	48.972
17.674	55.701
17.735	63.925
17.806	54.953
17.925	77.009
17.930	68.037
17.993	72.523
18.062	65.421
18.064	62.430
18.120	80.374
18.247	86.729
18.250	82.991
18.252	79.252
18.323	68.411
18.330	56.075
18.450	75.888
18.453	71.402
18.458	62.056
18.644	81.869
18.714	73.645
18.968	88.598
19.042	72.523
19.104	79.626
19.105	77.757
19.172	74.393
19.175	69.159
19.356	97.944
19.361	88.972
19.421	99.439
19.432	79.626
19.558	87.850
19.682	101.308
19.751	95.327
19.752	92.710
19.762	75.140
19.825	80.374
19.885	89.346
19.948	94.579
20.020	83.738
20.137	108.037
20.531	108.037
20.662	108.785
20.868	90.841
20.871	86.355
21.183	114.019
21.191	99.439
21.192	97.944
21.253	107.290
21.324	96.822
21.381	111.776
21.457	93.458
21.516	105.421
21.842	108.785
21.901	120.748
22.029	126.729
22.100	117.383
22.161	124.112
22.490	123.738];
units.LWw_m = {'cm', 'g'};     label.LWw_m = {'fork length','wet weight','males'};  
bibkey.LWw_m = 'ChanYuan2022';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lp = 3 * weights.Lp;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouped plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Fecundity is assumed to equal that of Cheilopogon melanurus';
D2 = 'shape coefficient for fork length is assumed 0.95 * that for standard length';
D3 = 'Li is given more weight to assure a proper max length';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Preferred temp: 24.7 - 29.3 C';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3M4QP'; % Cat of Life
metaData.links.id_ITIS = '645258'; % ITIS
metaData.links.id_EoL = '46566955'; % Ency of Life
metaData.links.id_Wiki = 'Hirundichthys'; % Wikipedia
metaData.links.id_ADW = 'Hirundichthys_oxycephalus'; % ADW
metaData.links.id_Taxo = '176747'; % Taxonomicon
metaData.links.id_WoRMS = '159265'; % WoRMS
metaData.links.id_fishbase = 'Hirundichthys-oxycephalus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hirundichthys}}'];
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
bibkey = 'ChanYuan2022'; type = 'Article'; bib = [ ... 
'doi = {10.3389/fmars.2021.747382}, ' ...
'author = {Shui-Kai Chang and Tzu-Lun Yuan and Simon D. Hoyle and Jessica H. Farley and Jen-Chieh Shiao}, ' ... 
'year = {2022}, ' ...
'title = {Growth Parameters and Spawning Season Estimation of Four Important Flyingfishes in the {K}uroshio Current Off {T}aiwan and Implications From Comparisons With Global Studies}, ' ...
'journal = {Front. Mar. Sci.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hirundichthys-oxycephalus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_t'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tobiko}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

