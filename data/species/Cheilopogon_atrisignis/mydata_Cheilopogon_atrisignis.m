function [data, auxData, metaData, txtData, weights] = mydata_Cheilopogon_atrisignis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Exocoetidae';
metaData.species    = 'Cheilopogon_atrisignis'; 
metaData.species_en = 'Glider flyingfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
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
data.tp = 194;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(28.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Read from tL-curve, given Lp';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on same relative length compared to Hirundichthys_affinis: 33*20.9/30';
data.Li  = 33.0;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki_t';
  comment.Wwb = 'based on egg diameter of 0.5-0.8 mm for tobiko: pi/6*0.07^3';

data.Ri = 55; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(28.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected value for Hirundichthys_affinis: (33/30)^3*1.5e4/365';
 
% uni-variate data
% t-L data
data.tL = [... % time since birth (d), fork length (cm)
0.054	1.373
0.061	2.201
0.061	1.741
0.068	2.569
0.080	2.844
0.089	3.764
0.098	3.948
0.098	3.764
0.103	4.776
0.133	9.747
0.492	26.662
0.504	26.200
0.511	26.476
0.529	26.658
0.532	28.684
0.543	29.696
0.548	25.827
0.555	26.564
0.557	28.129
0.562	26.931
0.567	25.457
0.576	25.733
0.593	27.942
0.597	26.928
0.609	27.940
0.614	26.558
0.618	28.768
0.623	27.202
0.625	29.505
0.630	25.451
0.632	30.149
0.658	27.659
0.670	27.658
0.700	27.379
0.717	29.496
0.728	28.298
0.745	28.849
0.745	28.112
0.745	27.651
0.745	29.494
0.763	28.939
0.775	29.030
0.785	30.411
0.803	29.949
0.822	28.289
0.831	31.051
0.845	29.300];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChanYuan2022';

% length - weight
data.LWw_f = [ ... % fork length (cm), wet weight (g)
1.720	2.036
2.163	1.977
2.518	1.929
2.961	2.989
3.404	2.929
3.936	1.739
4.468	2.787
4.734	2.751
4.823	3.858
4.911	2.727
5.177	3.811
5.709	3.739
7.571	10.206
9.521	6.585
25.035	221.666
25.390	242.887
25.833	203.648
25.922	251.770
26.011	193.550
26.188	217.033
26.454	192.371
26.543	243.851
26.809	252.771
27.074	211.317
27.163	231.454
27.163	267.275
27.163	277.350
27.163	257.201
27.163	243.768
27.340	211.281
27.340	290.759
27.518	304.168
27.518	272.825
27.606	251.544
27.695	232.502
27.695	285.114
27.784	308.610
27.784	281.744
27.872	299.643
28.050	239.171
28.050	315.291
28.050	254.843
28.138	289.532
28.227	227.953
28.227	296.237
28.227	327.580
28.493	251.425
28.670	284.983
28.670	296.177
28.670	263.715
28.848	278.243
28.936	236.813
28.936	244.649
28.936	289.425
28.936	315.171
29.025	303.966
29.025	346.503
29.291	327.437
29.379	279.291
29.468	294.951
29.557	339.715
29.645	301.643
29.645	337.464
29.734	308.348
29.734	332.975
29.734	277.005
29.911	369.891
30.000	322.864
30.000	309.432
30.355	334.011
30.355	342.966
30.355	360.876
30.355	346.324
30.709	327.247
30.709	333.963
30.975	375.345
31.064	375.333
31.152	348.456
31.152	357.411];
units.LWw_f = {'cm', 'g'};     label.LWw_f = {'fork length','wet weight','females'};  
bibkey.LWw_f = 'ChanYuan2022';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % fork length (cm), wet weight (g)
24.326	174.746
24.415	203.838
24.592	192.621
24.681	206.042
24.770	223.940
25.124	201.504
25.301	210.436
25.301	235.063
25.745	248.436
25.833	224.917
25.833	205.887
25.833	189.096
26.011	237.206
26.011	219.296
26.011	246.161
26.099	232.717
26.454	241.624
26.631	263.989
26.631	249.436
26.631	229.287
26.631	213.615
26.631	210.257
26.631	238.242
26.720	260.618
26.809	206.875
26.809	255.010
26.897	224.774
27.074	263.929
27.163	272.872
27.163	240.410
27.163	220.260
27.163	257.201
27.252	250.472
27.340	232.550
27.340	250.460
27.429	273.956
27.606	225.798
27.695	241.458
27.784	260.476
27.872	248.150
27.872	247.031
28.138	292.891
28.138	283.935
28.227	257.058
28.227	263.774
28.316	269.359
28.670	283.864
28.670	239.088
28.670	262.595
28.670	264.834
29.113	306.192];
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
F1 = 'preferred temp: 23.4 - 29.2 C';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Y3JK'; % Cat of Life
metaData.links.id_ITIS = '616689'; % ITIS
metaData.links.id_EoL = '46566922'; % Ency of Life
metaData.links.id_Wiki = 'Cheilopogon'; % Wikipedia
metaData.links.id_ADW = 'Cheilopogon_atrisignis'; % ADW
metaData.links.id_Taxo = '170680'; % Taxonomicon
metaData.links.id_WoRMS = '217863'; % WoRMS
metaData.links.id_fishbase = 'Cheilopogon-atrisignis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cheilopogon}}'];
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
'howpublished = {\url{http://www.fishbase.org/summary/Cheilopogon-atrisignis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_t'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tobiko}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

