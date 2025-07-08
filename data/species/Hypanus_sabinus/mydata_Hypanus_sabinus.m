function [data, auxData, metaData, txtData, weights] = mydata_Hypanus_sabinus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Hypanus_sabinus'; 
metaData.species_en = 'Atlantic stingray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 04 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 04 11];

%% set data
% zero-variate data;
data.ab = 4*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'Schm1988';    
  temp.ab = C2K(25.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 29*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 13; units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'Schm1988';
data.Lp  = 22; units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 61;   units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase';

data.Wwi = 4.9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
 comment.Wwi = 'max published weight; WD 61 cm correstponds to TL 150 cm and 0.00646*Li^3.06, see F!, gives 29 kg';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-3 pups per litter, 1 litter per yr';
  
% uni-variate data at f
% time-length
data.tL_fm = [ ... % time since birth (d), disc width (cm)
  00.00	14.484 12.537
 264.86	19.863 16.590
 562.90	23.381 19.753
1008.02	26.534 22.111
1779.67	29.663 23.736
2970.80	31.611 24.619];
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'disc width'};  
temp.tL_fm = C2K(25.5); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Schm1988'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % disc width (cm), weight (g)
11.443	51.958
12.426	63.228
12.714	85.928
12.772	66.983
13.177	70.733
13.407	101.014
13.697	74.472
14.159	93.367
14.563	97.117
15.371	161.434
15.776	150.032
16.122	168.939
17.046	199.155
18.085	240.723
18.316	259.640
18.605	252.037
19.643	331.484
19.644	312.545
20.902	793.486
21.017	816.203
22.643	539.534
22.814	611.487
22.877	441.027
22.930	626.628
23.045	619.041
23.109	410.701
23.392	611.432
23.453	524.305
23.622	675.805
23.627	490.198
23.683	565.950
23.684	539.435
23.797	615.182
23.801	478.818
23.853	671.995
23.854	637.904
24.025	728.797
24.087	569.700
24.088	528.033
24.142	671.967
24.259	622.714
24.262	509.077
24.314	721.193
24.368	865.128
24.431	660.576
24.491	607.540
24.603	724.954
24.659	774.191
24.833	781.750
24.837	645.386
24.837	611.295
24.892	740.078
25.008	709.764
25.126	645.359
25.182	675.657
25.298	694.585
25.411	762.756
25.415	641.544
25.529	686.987
25.531	599.866
25.586	717.285
25.815	789.233
25.874	747.561
26.104	781.630
26.680	872.485
26.734	1005.055
27.369	1035.298
27.372	929.237
27.487	944.378
27.657	1061.786
27.772	1088.290
28.004	1042.814
28.347	1182.933
28.868	1141.217
29.384	1285.107
29.502	1235.854
29.610	1466.904
30.078	1277.466
30.366	1341.833
30.766	1474.370
30.769	1372.097
30.881	1497.087
30.999	1413.742
31.231	1379.629
31.515	1557.633
31.748	1493.217
31.753	1345.489
33.073	1663.546];
units.LW = {'cm', 'g'};  label.LW = {'disc width', 'weight'};  
bibkey.LW = 'Schm1988';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Wwi is ignored due to inconsistency with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight Ww in g = 0.00646*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'aplacental vivipary'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3NMJH'; % Cat of Life
metaData.links.id_ITIS = '160953'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Hypanus_sabinus'; % Wikipedia
metaData.links.id_ADW = 'Dasyatis_sabina'; % ADW
metaData.links.id_Taxo = '5439859'; % Taxonomicon
metaData.links.id_WoRMS = '1042864'; % WoRMS
metaData.links.id_fishbase = 'Hypanus-sabinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hypanus_sabinus}}'; 
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
bibkey = 'SchwDahl1978'; type = 'Article'; bib = [ ... 
'author = {Frank J. Schwartz and Michael D. Dahlberg}, ' ...
'year = {1978}, ' ...
'title = {BIOLOGY AND ECOLOGY OF THE {A}TLANTIC STINGRAY, \emph{Dayatis sabina} ({P}ISCES: {D}ASYATIDAE), IN {N}ORTH {C}AROLINA AND {G}EORGIA}, ' ...
'journal = {Northeast Gulf Science}, ' ...
'volume = {2(1)}, ' ...
'pages = {1-23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schm1988'; type = 'PhDthesis'; bib = [ ... 
'author = {Thomas Henry Schmid}, ' ...
'year = {1988}, ' ...
'title = {Age, growth, and movement patterns of the {A}tlantic stingray, \emph{{D}asyatis sabina}, in a {F}lorida coastal lagoon system}, ' ...
'school = {University of Central Florida}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Hypanus-sabinus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  