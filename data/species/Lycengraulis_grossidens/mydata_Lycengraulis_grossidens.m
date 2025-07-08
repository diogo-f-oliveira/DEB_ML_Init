  function [data, auxData, metaData, txtData, weights] = mydata_Lycengraulis_grossidens

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Lycengraulis_grossidens'; 
metaData.species_en = 'Atlantic sabretooth anchovy'; 

metaData.ecoCode.climate = {'MB';'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 10];

%% set data
% zero-variate data
data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(26.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(26.2); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on  Engraulis encrasicolus';

data.Lp = 11.2;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'fishbase';
data.Li = 23.5;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 4.2e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'MaiViei2007';
  comment.Wwb = 'based on egg length of 1-1.2 mm and width 0.756-0.945 mm: pi/6*0.11*0.085^2';
data.Wwp = 11.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00562*Lp^3.16, see F1';
data.Wwi = 120.9; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00562*Li^3.16, see F1';
  
data.Ri = 6847/365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(26.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 14.58 13.28
    2 19.00 17.66
    3 21.72 20.54 ];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.3) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'}; 
treat.tL_fm = {1, {'females','males'}};
temp.tL_fm = C2K(26.2); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'GoulAsch2007';
comment.tL_fm = 'Data for females, males';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
11.975	12.312
12.613	13.616
12.887	12.726
12.908	17.137
13.183	14.923
13.341	18.448
13.457	11.827
13.569	18.441
13.659	21.527
13.661	14.909
13.750	21.965
13.933	21.077
14.094	17.543
14.502	23.708
14.618	17.969
14.798	25.905
14.820	28.110
14.981	23.253
15.050	21.486
15.070	30.750
15.254	24.568
15.572	28.529
15.938	24.107
15.939	20.136
16.051	27.192
16.212	24.981
16.504	38.208
16.528	32.913
16.641	35.998
16.691	24.085
16.939	30.695
17.005	38.634
17.255	41.274
17.462	37.297
18.007	42.134
18.009	37.722
18.302	46.978
18.304	39.478
18.576	45.206
18.577	42.559
18.893	53.579
18.965	42.547
18.987	44.311
19.054	46.956
19.303	52.684
19.351	45.624
19.510	47.825
19.534	44.295
20.352	53.977
20.414	74.269
20.483	72.502
20.828	60.581
21.190	71.599
21.212	73.805
21.234	75.569
21.370	79.535
21.483	80.855
21.692	70.702
22.482	94.061
22.489	71.561
23.163	104.630
23.302	97.125
23.488	86.532
23.640	111.233
23.961	104.606
25.301	121.331];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight','females'}; 
bibkey.LW_f = 'GoulAsch2007';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
11.739	16.194
12.016	18.817
12.039	20.571
12.453	19.682
12.498	15.294
12.890	20.546
13.051	17.033
13.351	22.726
13.419	20.531
13.465	18.775
13.466	27.108
13.719	27.539
13.742	22.714
13.810	20.080
13.880	25.780
14.019	27.969
14.087	25.336
14.225	24.454
14.272	28.839
14.317	23.574
14.364	28.398
14.409	24.888
14.432	25.764
14.593	22.689
14.616	21.811
14.823	23.560
14.825	33.209
15.053	24.869
15.101	36.271
15.261	25.301
15.400	36.262
15.538	31.434
15.538	32.311
15.539	38.890
15.768	32.304
15.768	35.374
15.792	41.952
15.815	38.882
15.882	25.283
15.930	37.124
15.975	34.929
16.113	30.539
16.506	42.370
16.552	45.000
16.827	39.729
16.897	44.990
17.012	41.917
17.012	44.548
17.059	48.494
17.288	46.295
17.449	45.851
18.003	56.800
18.003	58.993
18.024	43.641
18.048	47.150
18.071	51.973
18.325	55.475
18.349	61.176
18.370	50.210
18.693	56.780
18.901	61.160
18.902	67.300
18.970	58.088
18.992	53.701
19.315	57.639
19.339	68.164
19.499	56.756
19.544	55.439
20.351	67.696
20.470	87.868
20.836	76.454
20.998	82.151
21.229	89.162
21.299	94.862
21.438	99.682
21.530	100.995
21.689	89.148
22.540	90.439
22.545	117.632
23.304	121.119
24.065	130.746];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','weight','males'}; 
bibkey.LW_m = 'GoulAsch2007';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'total length- standard length: SL = 0.86 * TL, based on photo';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3WJHF'; % Cat of Life
metaData.links.id_ITIS = '161865'; % ITIS
metaData.links.id_EoL = '46562690'; % Ency of Life
metaData.links.id_Wiki = 'Lycengraulis_grossidens'; % Wikipedia
metaData.links.id_ADW = 'Lycengraulis_grossidens'; % ADW
metaData.links.id_Taxo = '179312'; % Taxonomicon
metaData.links.id_WoRMS = '281446'; % WoRMS
metaData.links.id_fishbase = 'Lycengraulis-grossidens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lycengraulis_grossidens}}';  
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
bibkey = 'GoulAsch2007'; type = 'Article'; bib = [ ...  
'author = {Goulart, M.G. and A.C. Aschenbrenner and T. Bortoluzzi and C.R. Silveira and E.D. Lepkoski and J.A. Martins and E.S. Brandilli and D.C. Roos and E. Querol and M.V. Querol}, ' ...
'year = {2007}, ' ...
'title = {An\''{a}lise do crescimento de escamas de \emph{Lycengraulis grossidens} ({A}gassiz, 1829), em popula\c{c}\~{o}es da bacia rio Uruguai m\''{e}dio, {R}io {G}rande do {S}ul}, ' ... 
'journal = {Biodiversidadae Pampeana. Pucrs, Uruguaiana}, ' ...
'volume = {5(1)}, '...
'pages = {3-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaiViei2007'; type = 'Article'; bib = [ ...  
'author = {Ana Cecilia Giacometti Mai and Jo\~{a}o Paes Vieira}, ' ...
'year = {2007}, ' ...
'title = {Review and consideration on habitat use, distribution and life history of \emph{Lycengraulis grossidens} ({A}gassiz, 1829) ({A}ctinopterygii, {C}lupeiformes, {E}ngraulididae)}, ' ... 
'journal = {Biota Neotrop.}, ' ...
'volume = {13(3)}, '...
'pages = {195-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lycengraulis-grossidens.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
