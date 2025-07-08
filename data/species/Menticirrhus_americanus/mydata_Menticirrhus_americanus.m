function [data, auxData, metaData, txtData, weights] = mydata_Menticirrhus_americanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Menticirrhus_americanus'; 
metaData.species_en = 'Southern kingcroaker'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.2); % K, body temp
metaData.data_0     = {'ab';  'am'; 'Lp'; 'Li';  'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 15];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(24.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24.2);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17.7;   units.Lp   = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;  units.Li   = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 0.37e-3; units.Wwb = 'g';label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on  Argyrosomus_regius';
data.Wwp = 55.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00794*Lp^3.08, see F1';
data.Wwi = 1357; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.08, see F1; max publish weight 1.1 kg';
 
data.Ri = 900*509.5/365; units.Ri = '#/d';    label.Ri = 'max reprod rate';        bibkey.Ri = 'ClarBrow2014';   
  temp.Ri = C2K(23.8);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on bacth fecundity of 509.5 eggs/g, assuming 1 batch per season';

% uni-variate data
% time-length
data.tL_f =	[ ... % year class (yr), total length (cm)
0.318	16.746
0.614	17.905
0.647	19.962
0.669	14.961
0.678	24.960
0.962	19.355
0.966	15.237
0.981	18.178
0.994	23.471
0.995	21.706
0.996	20.824
1.325	24.040
1.327	22.569
1.328	20.510
1.347	19.333
1.644	19.021
1.652	30.785
1.658	23.726
1.660	21.373
1.661	19.902
1.664	16.667
1.692	24.312
1.933	28.710
1.937	24.004
1.987	27.530
1.994	19.589
2.002	30.471
2.023	25.469
2.045	21.056
2.320	26.628
2.336	28.392
2.375	23.096
2.630	31.610
2.643	17.198
2.650	28.668
2.652	26.315
2.666	30.431
2.681	33.372
2.706	25.135
2.707	23.076
2.985	25.119
2.996	33.353
3.002	26.294
3.015	30.705
3.018	27.764
3.311	32.746
3.313	30.688
3.331	29.510
3.663	30.373
3.665	28.020
3.991	34.177
4.008	35.352
4.327	30.628]; 
data.tL_f(:,1) = (0.8 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(24.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ClarBrow2014';
%
data.tL_m =	[ ... % year class (yr), total length (cm)
0.982	16.413
1.349	17.274
2.308	20.453
2.324	21.922
2.969	23.943
3.023	21.881
3.319	23.922
3.335	25.098
3.669	23.314
3.981	26.236
3.983	23.589
4.351	22.979
4.679	27.078]; 
data.tL_m(:,1) = (0.8 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(24.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ClarBrow2014';

% length-weight
data.LW_f =	[ ... % total length (cm), weight (g)
14.650	31.498
15.350	31.387
15.787	31.317
15.958	43.210
16.655	51.047
17.176	62.884
17.964	58.786
18.308	78.599
18.920	78.501
19.095	78.474
19.618	82.364
19.709	70.429
20.657	117.960
20.751	94.104
21.011	102.010
21.271	109.916
21.448	101.941
21.882	113.792
22.312	137.565
22.665	125.588
23.187	133.452
23.536	137.370
23.969	149.222
24.487	172.981
25.093	192.752
25.187	168.896
25.190	160.949
25.435	220.512
25.876	204.548
26.046	220.415
26.305	232.294
26.317	192.557
26.488	204.451
26.926	200.408
27.005	232.183
27.443	228.140
27.612	247.981
27.969	224.083
28.040	279.701
28.385	295.540
28.570	259.749
29.344	303.335
29.683	339.042
29.781	303.265
29.934	378.738
30.299	327.024
30.376	362.773
30.458	378.654
30.478	311.101
30.812	366.678
31.069	382.531
31.177	310.990
31.678	394.354
32.543	426.005
32.973	449.778
33.159	410.013
33.917	509.230
34.610	528.988]; 
units.LW_f   = {'cm','g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'ClarBrow2014';
%
data.LW_m =	[ ... % total length (cm), weight (g)
17.174	50.844
17.440	67.950
17.898	64.459
17.992	57.589
18.442	71.241
19.079	74.582
19.878	122.473
19.896	84.756
20.262	81.277
20.530	94.955
21.071	108.595
21.618	108.520
22.333	142.708
22.523	125.539
22.975	135.762
23.791	145.936
24.238	166.446
24.339	145.861
25.508	183.415
26.050	193.626
26.681	210.683]; 
units.LW_m   = {'cm','g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'ClarBrow2014';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72ZJ2'; % Cat of Life
metaData.links.id_ITIS = '169274'; % ITIS
metaData.links.id_EoL = '46579048'; % Ency of Life
metaData.links.id_Wiki = 'Menticirrhus_americanus'; % Wikipedia
metaData.links.id_ADW = 'Menticirrhus_americanus'; % ADW
metaData.links.id_Taxo = '179848'; % Taxonomicon
metaData.links.id_WoRMS = '159326'; % WoRMS
metaData.links.id_fishbase = 'Menticirrhus-americanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Menticirrhus_americanus}}';
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
bibkey = 'ClarBrow2014'; type = 'article'; bib = [ ... 
'doi = {10.7755/FB.112.2-3.6}, ' ... 
'author = {Samuel D. Clardy and Nancy J. Brown-Peterson and Mark S. Peterson and Robert T. Leaf}, ' ... 
'year = {2014}, ' ...
'title = {Age, growth, and reproduction of Southern Kingfish (\emph{Menticirrhus americanus}): a multivariate comparison with life history patterns in other sciaenids} , ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {112)}, ' ...
'pages = {178–197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Menticirrhus-americanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

