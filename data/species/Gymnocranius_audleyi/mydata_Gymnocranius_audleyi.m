function [data, auxData, metaData, txtData, weights] = mydata_Gymnocranius_audleyi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Gymnocranius_audleyi'; 
metaData.species_en = 'Collared large-eye bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 09];

%% set data
% zero-variate data

data.am = 13*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'LaurRuss1999';   
  temp.am = C2K(26.1);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 18; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'CarpAlle1989';
data.Wwi = 1225; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.02138*Li^2.97, see F1';

data.Ri  = 77e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'CarpAlle1989';   
  temp.Ri = C2K(26.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Lethrinus lentjan';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.948	19.457
0.956	15.784
0.960	17.572
0.961	18.297
0.973	16.751
0.986	24.242
0.991	18.781
1.002	16.316
1.003	17.379
1.017	25.112
1.019	18.008
1.970	22.119
1.981	20.379
1.994	27.628
1.995	19.026
2.002	24.004
2.004	24.922
2.005	25.212
2.006	25.840
2.010	19.654
2.013	21.684
2.018	24.439
2.019	24.729
2.036	18.108
2.941	21.253
2.966	27.535
2.973	22.606
2.974	23.331
2.986	21.929
2.988	22.751
2.992	25.361
2.994	26.617
2.995	27.052
3.006	24.684
3.011	28.019
3.022	25.747
3.034	23.863
3.038	26.134
4.010	26.138
4.024	25.703
4.030	29.134
5.000	27.639
5.013	26.335
5.019	29.911
5.995	31.606
6.051	29.963
6.060	26.822
6.998	32.335
8.079	26.733
11.001	28.483
13.018	27.524];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(26.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LaurRuss1999';

% length-weight
data.LW = [ ... % fork length (cm), wet weight (g)
14.572	76.138
14.905	82.272
15.104	71.613
15.138	82.294
15.504	91.481
15.604	77.762
15.837	99.140
16.069	71.705
16.137	109.847
16.303	102.235
16.536	114.461
16.802	108.385
16.836	120.591
17.235	113.002
17.601	109.986
17.901	145.100
18.400	149.724
18.666	143.647
19.199	145.223
20.398	200.253
20.598	212.475
20.963	194.205
20.996	177.429
21.530	226.293
21.731	267.499
22.064	266.005
22.497	282.826
22.663	266.062
22.930	288.969
23.029	269.148
23.061	234.066
23.263	319.509
23.296	299.682
23.397	328.674
23.529	295.128
23.529	313.433
23.862	313.465
23.962	327.203
24.162	331.798
24.196	360.785
24.226	273.838
24.362	336.394
24.460	304.369
24.628	356.250
24.961	345.603
25.029	380.694
25.228	380.713
25.494	382.264
25.626	356.345
25.826	344.160
25.894	400.607
26.160	388.429
26.194	406.738
26.359	389.974
26.494	435.749
26.592	394.572
26.927	435.791
26.927	457.147
27.194	480.053
27.460	464.825
27.591	422.125
28.092	466.410
28.595	586.967
29.659	568.763
31.429	758.084
31.926	698.640];
units.LW   = {'cm', 'g'};  label.LW = {'total length','wet weight'};  
bibkey.LW = 'LaurRuss1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length=weight: Ww in  g = 0.02138*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3HR9Q'; % Cat of Life
metaData.links.id_ITIS = '550893'; % ITIS
metaData.links.id_EoL = '46580970'; % Ency of Life
metaData.links.id_Wiki = 'Gymnocranius_audleyi'; % Wikipedia
metaData.links.id_ADW = 'Gymnocranius_audleyi'; % ADW
metaData.links.id_Taxo = '175550'; % Taxonomicon
metaData.links.id_WoRMS = '278869'; % WoRMS
metaData.links.id_fishbase = 'Gymnocranius-audleyi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnocranius_audleyi}}';
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
bibkey = 'LaurRuss1999'; type = 'Article'; bib = [ ... 
'author = {Laursen, T. and G.R. Russ and S.J. Newman and J.B. Higgs}, ' ... 
'year = {1999}, ' ...
'title = {Age, growth and mortality of \emph{Gymnocranius audleyi} ({P}isces: {L}ethrinidae)}, ' ...
'journal = {Asian Fisheries Society}, ' ...
'volume = {12}, ' ...
'pages = {187-200}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CarpAlle1989'; type = 'techreport'; bib = [ ... 
'author = {Kent E Carpenter and Gerald R. Allen }, ' ... 
'year = {1989}, ' ...
'title = {Emperor fishes and large-eye breams of the world (Family Lethrinidae)}, ' ...
'institution = {FAO}, ' ...
'volume = {FIR/S125-9}, ' ...
'series = {Fao Species Catalog}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Gymnocranius-audleyi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
