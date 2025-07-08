function [data, auxData, metaData, txtData, weights] = mydata_Hemiramphus_brasiliensisHemiramphus_balao
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae';
metaData.species    = 'Hemiramphus_balao'; 
metaData.species_en = 'Balao halfbeak'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 17];

%% set data
% zero-variate data

data.ab = 7;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(27.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'BerkHoud1978';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'BerkHoud1978'; 
data.Li  = 27;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'BerkHoud1978';

data.Wwb = 8e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'BerkHoud1978';
  comment.Wwb = 'based on egg diameter of 2.48 mm: pi/6*0.248^3';
data.Wwp = 43;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'BerkHoud1978';
  comment.Wwp = 'based on 0.00380*Lp^3.08, see F1';
data.Wwi = 190;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BerkHoud1978';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), fork length (cm)
190	15.90
440	20.90];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BerkHoud1978';

% length-weight
data.LW = [ ... ^fork length (cm), weight (10g)
12.710	1.529
14.015	1.969
15.219	3.058
15.269	2.810
15.721	3.246
15.771	3.122
15.821	3.184
16.122	3.464
16.122	3.310
16.424	3.435
16.775	3.777
16.925	3.964
16.926	3.561
17.025	4.212
17.227	3.717
17.276	4.337
17.328	3.563
17.376	4.430
17.426	4.647
17.477	4.276
17.776	5.113
17.779	4.153
17.877	4.835
17.928	4.587
18.128	5.239
18.330	4.713
18.379	5.209
18.479	5.581
18.480	5.054
18.630	5.489
18.729	5.799
18.781	5.180
19.031	5.552
19.082	5.212
19.132	5.553
19.231	6.080
19.232	5.770
19.332	5.863
19.332	5.801
19.431	6.328
19.433	5.585
19.632	6.422
19.633	6.143
19.682	6.732
19.684	5.834
19.732	6.639
19.883	6.485
20.131	7.972
20.183	7.075
20.184	6.858
20.185	6.363
20.285	6.456
20.333	7.478
20.435	6.766
20.535	6.922
20.634	7.789
20.685	7.325
20.735	7.604
20.935	8.069
20.938	6.676
20.939	6.428
20.986	7.790
20.986	7.481
21.087	7.358
21.186	8.132
21.187	7.420
21.235	8.442
21.338	7.575
21.387	8.133
21.436	8.628
21.437	8.288
21.536	8.815
21.588	8.165
21.738	8.196
21.788	8.537
21.837	9.033
21.887	9.157
21.986	9.653
21.988	8.724
22.185	10.490
22.234	10.768
22.238	9.437
22.238	9.251
22.337	9.809
22.439	9.221
22.488	9.686
22.588	10.182
22.839	10.059
23.038	10.803
23.039	10.648
23.040	10.060
23.239	11.021
23.292	9.814
23.338	11.331
23.394	9.164
23.438	11.548
23.491	10.681
23.643	10.001
23.692	10.528
23.790	11.673
23.790	11.519
24.044	10.622
24.141	12.109
24.240	12.450
24.438	13.534
24.641	13.102
24.641	12.761
24.889	14.093
24.993	12.886
25.040	14.032
25.044	12.360
25.891	15.429
26.045	14.254
26.492	16.051
26.593	16.176
27.440	19.090];
data.LW(:,2) = 10 * data.LW(:,2); % convert 10 g to g
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'BerkHoud1978';

% weight-fecundity
data.WN = [ % weight (g), fecundity
42.656	1473.685
52.451	1917.296
84.132	5340.400
86.168	5155.975
93.013	2798.706
93.728	1669.234
96.407	2480.089
103.827	3107.945
127.412	5902.836
144.306	6451.368
145.999	6401.670
149.347	7432.102
154.013	9491.897
161.927	5550.029
165.306	5636.128
175.326	9418.811
190.719	4384.764];
units.WN   = {'g', '#'};  label.WN = {'weight','fecundity'};  
temp.WN    = C2K(27.3);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'BerkHoud1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Grouped plots
% set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00339*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6LQPQ'; % Cat of Life
metaData.links.id_ITIS = '165460'; % ITIS
metaData.links.id_EoL = '46566989'; % Ency of Life
metaData.links.id_Wiki = 'Hemiramphus_brasiliensis'; % Wikipedia
metaData.links.id_ADW = 'Hemiramphus_brasiliensis'; % ADW
metaData.links.id_Taxo = '176443'; % Taxonomicon
metaData.links.id_WoRMS = '159279'; % WoRMS
metaData.links.id_fishbase = 'Hemiramphus-brasiliensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemiramphus_brasiliensis}}'];
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
bibkey = 'BerkHoud1978'; type = 'Article'; bib = [ ... 
'author = {Steven A. Berkeley and Edward D. Houde}, ' ... 
'year = {1987}, ' ...
'title = {Biology of two speices of halfbeaks, \emph{Hemiramphus brasiliensis} and \emph{H. balao} from southeast {F}lorida}, ' ...
'journal = {Bull. Mar. Sci.}, '...
'volume = {28(4)}, ' ...
'pages = {624-644}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hemiramphus-brasiliensis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

