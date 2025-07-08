  function [data, auxData, metaData, txtData, weights] = mydata_Sperata_aor
  
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Bagridae';
metaData.species    = 'Sperata_aor'; 
metaData.species_en = 'Long-whiskered catfish '; 

metaData.ecoCode.climate = {'Aw','Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biC'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 25];

%% set data
% zero-variate data
data.ab = 16; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'NaziKhan2020';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 46.8;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'JabeHoss2020';
data.Li = 180;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 567;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'JabeHoss2020','fishbase'};
  comment.Wwp = 'based on 0.00575*Lp^2.99, see F1';
data.Wwi = 32e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^2.99, see F1';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.979	20.904
0.979	20.374
0.979	17.456
0.979	14.008
1.005	21.964
1.005	18.250
1.005	15.598
1.058	24.614
1.905	28.017
1.905	27.487
1.931	29.342
1.931	28.811
1.958	35.972
1.958	34.911
1.984	38.358
1.984	37.297
1.984	32.257
2.037	39.416
2.063	25.887
2.090	33.312
2.910	40.165
2.910	39.370
2.937	42.286
2.937	41.225
2.937	40.960
2.989	37.774
2.989	30.877
3.016	45.199
3.016	44.404
3.042	31.935
3.942	61.596
3.968	48.597
3.995	47.800
3.995	47.270
3.995	46.209
4.048	52.041
4.048	50.185
4.974	52.523
4.974	49.605
5.000	70.824
5.000	69.497
5.026	58.090
5.026	55.968
5.026	54.642
5.026	54.377
5.026	53.846
5.979	66.262
5.979	62.284
6.005	61.487
6.005	60.160
6.058	64.136
6.984	71.514
6.984	70.188
6.984	69.923
6.984	69.127
7.011	66.208
7.011	65.412
7.037	73.103
7.037	67.267
8.016	70.664
8.016	76.234
8.042	74.111
8.069	75.966
8.069	77.823
8.968	89.181
9.021	82.812
9.048	82.015
9.048	85.728
9.048	87.320
9.048	88.381
9.048	91.033
9.048	94.747
9.074	84.401];
data.tL_f(:,1) = 365 * (0.3 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'females'};  
  temp.tL_f = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'NaziKhan2020'; 
comment.tL_f = 'Data from Narora–Kanpur';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.899	29.548
0.926	31.146
0.926	20.746
0.926	14.080
0.952	24.745
0.952	22.078
0.952	16.478
0.952	15.145
1.905	33.494
1.905	30.294
1.905	28.161
1.905	27.094
1.905	26.028
1.931	44.426
1.931	42.293
1.931	40.426
1.931	39.359
1.931	31.893
1.931	31.626
1.931	31.359
1.958	38.291
1.958	36.958
1.958	35.891
2.857	41.710
2.857	30.777
2.884	38.775
2.910	42.774
2.910	32.107
2.937	44.906
2.937	43.839
2.963	49.704
2.963	49.171
2.963	39.838
2.989	38.236
3.942	51.786
3.968	50.451
3.968	48.051
3.968	46.451
3.968	46.184
3.995	59.516
3.995	48.849
4.921	57.333
4.921	48.800
4.947	65.599
4.947	54.932
4.947	52.799
4.947	49.332
4.974	56.264
4.974	53.597
5.899	66.348
5.899	61.814
5.952	74.878
6.005	64.209
6.005	60.475
6.931	80.426
6.931	68.159
6.931	66.826
6.958	73.758
6.958	66.291
6.984	70.823
6.984	69.757
7.937	71.306
7.963	76.638
7.963	75.571
7.963	75.038
7.963	74.238
7.989	93.703
7.989	88.903
8.016	91.302
8.016	79.035
8.942	84.052
8.942	83.252
8.968	96.584
8.995	93.383
8.995	90.983
8.995	87.249
9.021	89.648];
data.tL_m(:,1) = 365 * (0.3 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'males'};  
  temp.tL_m = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'NaziKhan2020'; 
comment.tL_m = 'Data from Narora–Kanpur';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
713.437	34194.483
757.111	34431.988
768.011	34848.491
772.800	34648.077
778.937	34754.812
780.980	34858.416
782.340	34961.498
865.058	59208.474
888.239	59736.418
897.810	59437.622
908.726	59548.017
910.748	60059.768
926.457	59867.708
935.158	63241.715
946.058	63658.220
961.758	63670.234
970.641	63472.951
978.139	63682.771
996.563	63798.912
1004.561	67580.542
1007.963	67787.227
1012.752	67586.810
1017.529	67590.467
1022.297	67798.197
1044.139	67814.913
1059.828	68031.000
1062.412	70890.120
1074.026	70694.927
1080.153	71005.739
1086.307	70806.367
1091.064	71218.170
1094.492	70914.672];
units.WN = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
  temp.WN = C2K(22);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'JabeHoss2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 10;
weights.tL_m = weights.tL_m * 10;
weights.ab = weights.ab * 0;
weights.WN = weights.WN * 5;
weights.Wwb = weights.Wwb * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Z8V7'; % Cat of Life
metaData.links.id_ITIS = '681124'; % ITIS
metaData.links.id_EoL = '216875'; % Ency of Life
metaData.links.id_Wiki = 'Sperata_aor'; % Wikipedia
metaData.links.id_ADW = 'Sperata_aor'; % ADW
metaData.links.id_Taxo = '187900'; % Taxonomicon
metaData.links.id_WoRMS = '1022803'; % WoRMS
metaData.links.id_fishbase = 'Sperata-aor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Sperata_aor}}';  
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
bibkey = 'NaziKhan2020'; type = 'Article'; bib = [ ...
'doi = {10.1071/MF19315}, ' ...
'author = {Aafaq Nazir and M. Afzal Khan}, ' ...
'year = {2020}, ' ...
'title = {Stock-specific assessment of precise age and growth in the long-whiskered catfish \emph{Sperata aor} from the {G}anges {R}iver}, ' ... 
'journal = {Marine and Freshwater Research}, ' ...
'volume = {71(12)}, '...
'pages = {52-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JabeHoss2020'; type = 'Article'; bib = [ ...
'doi = {10.4194/2618-6381-v21_2_01}, ' ...
'author = {Md. Naimuddin Jabed and Mohammad Amzad Hossain and Sohel Mian and Muhammad Anamul Kabir and Sabuj Kanti Mazumder and Mohammed Mahbub Iqbal}, ' ...
'year = {2020}, ' ...
'title = {Some Aspects of Reproduction in Long Whiskered Catfish, \emph{Sperata aor} ({H}amilton 1822), from {N}orth-{E}ast {B}angladesh}, ' ... 
'journal = {Aquaculture Studies}, ' ...
'volume = {21}, '...
'pages = {52-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sperata-aor.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

