  function [data, auxData, metaData, txtData, weights] = mydata_Horabagrus_brachysoma
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Horabagridae';
metaData.species    = 'Horabagrus_brachysoma'; 
metaData.species_en = 'Guenther''s catfish'; 

metaData.ecoCode.climate = {'Aw','Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 24];

%% set data
% zero-variate data
data.ab = 6.5; units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';   bibkey.Lp = 'BindPadm2012';
data.Lpm = 17.5;     units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';   bibkey.Lpm = 'BindPadm2012';
data.Li = 45;     units.Li = 'cm';   label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 2.1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BindPadm2012';
  comment.Wwb = 'based on egg diameter of 1.6 mm: pi/6*0.16^3';
data.Wwp = 43;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = {'fishbase','BindPadm2012'};
  comment.Wwi = 'based on 0.00479*Lp^3.12, see F1';
data.Wwi = 689;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','BindPadm2012'};
  comment.Wwi = 'based on 0.00479*Li^3.12, see F1';

% uni-variate data
% time-length
data.tL_f = [ ... % time since 1 Jan (d), length (cm)
365+102.982	15.443
365+223.562	17.308
365+256.152	20.878
365+287.438	23.176
365+317.420	22.765
365+346.750	23.473
730+13.688	24.971
730+41.714	25.524
730+73.000	27.184
730+102.982	26.932
730+133.616	27.796
1095+132.964	33.383];
data.tL_f(:,1) = data.tL_f(:,1) - 160; % set origin to birth
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth','total length','females'};  
temp.tL_f = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PrasAli2012';
%
data.tL_m = [ ... % time since 1 Jan (d), length (cm)
365+44.198	12.624
365+74.159	13.141
365+226.613	17.405
365+319.139	20.872
365+348.565	21.389
730+14.580	22.864
730+46.158	22.786
730+74.484	24.974
730+103.396	24.295
730+133.886	25.172];
data.tL_m(:,1) = data.tL_m(:,1) - 160; % set origin to birth
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth','total length','males'};  
temp.tL_m = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PrasAli2012';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (1e4 * #)
17.901	1.843
17.936	1.448
18.042	0.203
18.298	0.202
18.701	0.658
18.810	0.354
18.921	0.900
18.961	1.933
19.101	-0.011
19.251	1.204
19.726	1.051
19.875	2.175
19.950	2.540
20.054	0.838
20.163	0.565
20.417	0.078
20.422	1.689
20.497	2.174
20.638	0.534
20.714	1.476
20.749	0.868
20.822	1.050
20.842	7.460
21.039	0.381
21.187	0.746
21.306	3.753
21.406	0.806
21.516	0.897
21.519	1.961
21.558	2.538
21.559	3.024
21.588	0.320
21.770	0.229
21.845	0.867
21.885	1.991
21.993	1.413
22.065	1.140
22.138	0.957
22.245	0.076
22.366	3.873
22.406	5.058
22.429	0.471
22.501	0.197
22.541	1.504
22.650	1.078
22.766	3.144
22.939	0.166
22.940	0.470
22.952	4.328
22.978	0.987
22.980	1.473
22.983	2.415
23.086	0.379
23.240	2.900
23.453	0.834
23.456	1.806
23.524	0.257
23.604	2.414
23.819	1.016
23.891	0.621
23.930	1.472
24.000	0.256
24.079	2.201
24.296	1.684
24.302	3.689
24.329	0.560
24.446	2.777
24.477	1.106
24.511	0.134
24.521	3.476
24.557	3.294
24.590	1.987
24.880	1.470
24.914	0.437
24.919	2.078
24.925	4.083
25.082	7.759
25.170	0.528
25.352	0.315
25.432	2.533
25.434	3.050
25.502	1.530
25.506	2.746
25.585	4.902
25.990	5.601
26.160	1.469
26.450	0.891
26.494	3.079
26.644	4.567
26.711	2.592
26.816	1.073
26.888	0.678
27.510	0.708
27.526	5.994
27.591	3.533
27.879	1.922
27.914	1.436
27.960	4.657
27.985	0.889
28.022	0.798
28.524	9.669
28.535	1.466
28.994	8.027
29.521	1.070
29.628	0.189
29.931	3.500
30.296	3.499
30.336	4.532
30.615	0.127
32.009	1.978];
data.LN(:,2) = data.LN(:,2)*1e4;
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BindPadm2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 10;
weights.tL_m = weights.tL_m * 10;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;
weights.Wwi = weights.Wwi * 3;
weights.Li = weights.Li * 3;
weights.Lp = weights.Lp * 3;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00479*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KDCM'; % Cat of Life
metaData.links.id_ITIS = '681828'; % ITIS
metaData.links.id_EoL = '681977'; % Ency of Life
metaData.links.id_Wiki = 'Bagarius_yarrelli'; % Wikipedia
metaData.links.id_ADW = 'Bagarius_yarrelli'; % ADW
metaData.links.id_Taxo = '162800'; % Taxonomicon
metaData.links.id_WoRMS = '1018581'; % WoRMS
metaData.links.id_fishbase = 'Bagarius-yarrelli'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Bagarius_yarrelli}}';  
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
bibkey = 'PrasAli2012'; type = 'Article'; bib = [ ...
'author = {Prasad, G. and A. Ali and M. Harikrishnan and R. Raghavan}, ' ...
'year = {2012}, ' ...
'title = {Population dynamics of an endemic and threatened Yellow Catfish \emph{Horabagrus brachysoma} ({G}\"{u}nther) from {P}eriyar {R}iver, southern {W}estern {G}hats, {I}ndia}, ' ... 
'journal = {J. Threat. Taxa}, ' ...
'volume = {4(2)}, '...
'pages = {2333-2342}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BindPadm2012'; type = 'Article'; bib = [ ...
'author = {Bindu, L. and Padmakumar, K. G., and Sreerekha, P. S. and Joseph, N.}, ' ...
'doi = {10.1111/j.1439-0426.2012.02026.x}, ' ...
'year = {2012}, ' ...
'title = {Reproductive biology of the golden catfish, \emph{Horabagrus brachysoma} ({G}\"{u}nther, 1864), an endemic species of the {W}estern {G}hats, {I}ndia}, ' ... 
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {28(5)}, '...
'pages = {772–777}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bagarius-yarrelli.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

