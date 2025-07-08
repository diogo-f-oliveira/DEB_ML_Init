function [data, auxData, metaData, txtData, weights] = mydata_Lepisosteus_oculatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lepisosteiformes'; 
metaData.family     = 'Lepisosteidae';
metaData.species    = 'Lepisosteus_oculatus'; 
metaData.species_en = 'Spotted gar'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFe', '0iFm', '0iMm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L','L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 06 28];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 12; units.ab = 'd';      label.ab = 'age at birth';   bibkey.ab = 'Wiki';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '10 to 14 d';
data.tp = 3.5*365;  units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2.5*365;  units.tpm = 'd'; label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Wiki';
  temp.tpm = C2K(20); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 18*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'Wiki';   
  temp.am = C2K(20);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 2.2;      units.Lb  = 'cm';  label.Lb  = 'standard length at birth'; bibkey.Lb  = 'ADW';
  comment.Lb = 'based on TL 2.5 cm: SL = 0.89 * TL, see F1';
data.Li  = 133;       units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';
  comment.Li = 'based on TL 150 cm: SL = 0.89 * TL, see F1';

data.Wwb  = 8.2e-3;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';

data.Ri  = 2e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.971	28.858
1.997	35.868
3.009	38.930
3.972	41.664
4.984	44.616
5.980	47.020
6.959	50.412
7.955	52.158
8.982	57.742
9.978	60.805];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'standard length', 'female'};  bibkey.tL_f = 'Love2004';
temp.tL_f = C2K(20.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0.955	27.542
2.014	33.674
2.977	37.944
4.021	41.554
4.968	44.397
5.980	46.033
6.977	47.121
7.990	48.867];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'standard length', 'male'};  bibkey.tL_m = 'Love2004';
temp.tL_m = C2K(20.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Data for males';

% length - weight
data.LWw_f = [ ... % std length (cm), wet weight (g)
39.182	49.272
39.520	45.241
40.361	44.859
41.092	36.798
41.250	73.974
41.423	59.434
41.870	63.082
42.157	40.867
42.772	45.328
43.105	58.267
43.273	61.100
43.276	48.170
43.722	58.283
44.114	59.102
44.450	62.747
44.677	50.228
44.954	62.761
45.007	76.096
45.127	48.220
45.232	71.253
45.627	63.587
45.850	66.826
46.006	112.890
46.187	66.431
46.244	61.584
46.804	65.639
46.971	69.280
46.973	61.603
47.082	72.515
47.249	77.772
47.308	66.865
47.424	53.939
47.645	64.854
47.702	61.219
47.870	63.648
47.980	70.115
48.201	82.242
48.367	89.924
48.482	80.634
48.654	66.093
48.761	85.894
48.877	73.372
49.268	77.019
49.383	67.325
49.490	85.105
49.659	81.070
49.718	70.566
50.049	89.969
50.051	84.312
50.220	81.085
50.666	90.794
51.117	83.937
51.338	95.256
51.620	90.011
51.784	104.561
52.120	105.782
52.402	100.941
52.462	85.589
52.688	80.343
52.967	85.603
53.077	93.283
53.243	99.752
53.298	105.006
53.358	90.462
53.688	114.309
53.694	92.087
53.968	115.529
54.196	100.990
54.307	105.033
55.033	115.962
55.048	63.437
57.163	119.655
57.437	141.885
57.997	143.920
59.067	127.788
60.014	150.843
60.623	176.314];
units.LWw_f = {'cm', 'g'};     label.LWw_f = {'standard length', 'wet weight', 'female'};  bibkey.LWw_f = 'Love2004';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % std length (cm), wet weight (g)
28.539	12.218
30.501	12.675
31.677	17.151
35.150	32.598
35.934	33.427
36.048	28.986
36.329	25.357
37.446	43.165
37.726	43.172
37.896	38.732
37.897	34.288
38.234	30.661
38.455	41.980
38.794	34.716
39.013	51.692
39.743	50.095
40.586	42.037
40.751	52.951
40.807	53.356
41.371	44.887
41.762	50.150
41.815	60.656
42.097	52.987
42.099	46.926
42.100	42.886
42.431	61.885
42.826	53.411
43.275	51.807
44.172	54.255
44.619	60.328
44.785	66.797
45.403	60.753
45.794	68.036
45.852	61.573
46.296	78.151
46.354	71.688
46.411	68.053
47.473	81.011
48.764	76.197
48.927	95.191
49.271	66.110
49.602	84.300
50.106	87.950
50.777	94.433
51.846	83.553
55.878	103.055
56.766	135.806];
units.LWw_m = {'cm', 'g'};     label.LWw_m = {'standard length', 'wet weight', 'male'};  bibkey.LWw_m = 'Love2004';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

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
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males ase assumed to differ froam females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'From photo: SL = 0.89 * TL';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6PCRM'; % Cat of Life
metaData.links.id_ITIS = '161095'; % ITIS
metaData.links.id_EoL = '46582205'; % Ency of Life
metaData.links.id_Wiki = 'Lepisosteus_oculatus'; % Wikipedia
metaData.links.id_ADW = 'Lepisosteus_oculatus'; % ADW
metaData.links.id_Taxo = '178459'; % Taxonomicon
metaData.links.id_WoRMS = '275402'; % WoRMS
metaData.links.id_fishbase = 'Lepisosteus-oculatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepisosteus_oculatus}}';  
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
bibkey = 'Love2004'; type = 'Article'; bib = [ ...  
'author = {Joseph W. Love}, ' ...
'year = {2004}, ' ...
'title  = {AGE, GROWTH, AND REPRODUCTION OF SPOTTED GAR, \emph{Lepisosteus oculatus} ({L}EPISOSTEIDAE), FROM THE {L}AKE {P}ONTCHARTRAIN {E}STUARY, {L}OUISIANA}, ' ...
'journal = {The Southwestern Naturalist}, ' ...
'volume = {49}, ' ...
'pages = {18-23}, ' ...
'doi = {10.1894/0038-4909(2004)049<0018:AGAROS>2.0.CO;2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seriouslyfish'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.seriouslyfish.com/species/search/Lepisosteus_oculatus}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepisosteus-oculatus.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lepisosteus_oculatus/}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

