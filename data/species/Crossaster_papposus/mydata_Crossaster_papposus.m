function [data, auxData, metaData, txtData, weights] = mydata_Crossaster_papposus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Valvatida'; 
metaData.family     = 'Solasteridae';
metaData.species    = 'Crossaster_papposus'; 
metaData.species_en = 'Common sunstar'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN', 'MAN'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjCie', 'bjO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 25]; 


%% set data
% zero-variate data

data.tj = 2*30.5;   units.tj = 'd';      label.tj = 'time since birth at metam'; bibkey.tj = 'DupoLund2010';   
  temp.tj = C2K(14);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'all temps guessed';
data.tp = 4*365;  units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'marlin';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';      label.am = 'life span';                 bibkey.am = 'marlin';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.1;   units.Lj  = 'cm';  label.Lj  = 'diameter at metam';        bibkey.Lj  = 'DupoLund2010';
data.Li  = 34;    units.Li  = 'cm';  label.Li  = 'ultimate diameter';    bibkey.Li  = 'CarlPfis1999';

data.Wwb  = 2.68e-4; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';    bibkey.Wwb  = 'DupoLund2010';
  comment.Wwb = 'based on egg diameter 0f 0.8 mm: pi/6*0.08^3';
data.Wwi  = 2.6e3; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'CarlPfis1999';
  comment.Wwi = 'based on 0.03972 * Li^3.144, see F2';

data.Ri  = 6e3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'DupoLund2010';   
  temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data

% growth in length
data.LdL = [... % diameter (cm), growth in diameter (cm/yr) 
1.502	1.650
3.063	0.417
3.172	1.580
4.121	1.579
4.297	2.696
4.484	1.440
4.491	1.068
4.534	0.533
4.580	1.544
4.719	1.114
4.904	1.719
5.038	1.579
5.042	1.358
5.069	1.637
5.142	1.219
5.195	1.928
5.229	1.835
5.250	0.730
5.334	1.463
5.336	1.381
5.338	1.265
5.375	1.009
5.452	2.149
5.506	2.788
5.556	1.870
5.564	1.439
5.574	0.916
5.622	1.823
5.675	2.509
5.702	1.021
5.721	1.788
5.747	2.148
5.808	2.393
5.818	1.823
5.888	1.579
5.890	1.486
5.948	1.869
5.950	1.765
5.952	1.672
6.043	2.044
6.044	1.986
6.074	2.125
6.088	1.381
6.104	2.276
6.147	-0.003
6.281	1.602
6.305	2.044
6.340	1.904
6.408	0.032
6.414	1.474
6.422	1.020
6.584	1.148
6.717	2.788
6.728	2.171
6.747	1.160
6.765	1.950
6.824	2.311
6.852	2.555
6.877	1.206
6.877	1.194
6.890	0.532
6.909	1.253
6.931	1.834
6.992	2.032
7.006	1.311
7.253	2.125
7.268	1.276
7.334	4.787
7.407	0.880
7.492	1.566
7.498	1.229
7.561	1.369
7.686	1.717
7.749	1.822
7.776	2.113
7.801	0.787
7.858	1.252
7.877	0.206
8.037	2.182
8.044	1.810
8.118	1.357
8.122	1.113
8.130	0.682
8.180	1.496
8.217	1.310
8.309	1.624
8.323	0.857
8.410	1.484
8.474	1.531
8.480	1.252
8.516	1.031
8.797	1.775
8.803	1.449
8.902	1.414
8.975	1.031
8.978	0.833
9.035	1.310
9.089	1.926
9.106	1.019
9.107	0.973
9.120	0.275
9.210	0.693
9.248	0.403
9.319	1.856
9.332	1.158
9.371	0.833
9.379	0.391
9.532	0.949
9.547	1.926
9.616	1.740
9.620	1.530
9.645	0.182
9.665	0.879
9.795	0.926
9.837	0.391
9.892	0.972
10.035	2.042
10.045	1.530
10.280	1.205
10.354	0.739
10.376	1.344
10.434	-0.016
10.544	1.076
10.649	0.739
10.866	1.379
10.877	0.797
10.924	1.751
11.065	1.251
11.065	1.216
11.067	1.111
11.193	1.367
11.210	0.460
11.464	0.878
11.489	1.297
11.502	0.599
11.646	1.681
11.692	0.925
11.717	1.343
11.732	0.588
11.856	0.925
11.926	0.692
12.118	0.925
12.135	-0.006
12.319	0.692
12.323	0.459
12.371	1.390
12.380	0.924
12.429	0.041
12.485	0.529
12.490	2.017
12.703	1.110
12.747	0.506
12.845	0.529
12.900	1.087
12.939	0.738
12.985	0.040
13.060	1.296
13.106	0.587
13.221	1.424
13.266	0.796
13.354	1.331
13.439	0.250
13.624	0.901
13.729	0.494
13.927	0.447
13.951	0.866
14.020	0.714
14.073	1.354
14.279	0.865
14.382	2.331
14.450	0.470
14.469	1.168
14.472	1.017
14.507	0.923
14.615	0.365
14.876	0.400
14.999	0.830
15.011	0.226
15.076	0.202
15.130	0.819
15.205	0.319
15.261	0.818
15.279	-0.135
15.396	0.586
15.932	-0.054
15.955	0.481
15.991	0.295
16.055	-1.391
16.115	0.667
16.173	1.051
16.261	-0.147
16.284	0.388
16.306	0.923
16.378	0.609
17.095	0.736
17.370	0.062
17.525	0.480
17.628	0.224
17.730	0.050
17.896	-0.066
18.256	-0.113
19.334	-0.009
19.468	-0.160
20.083	0.177
20.215	0.130
21.952	-0.010
22.999	-0.022];
data.LdL(:,2) = data.LdL(:,2)/ 365; % convert yr to d
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'diameter', 'change in diameter'};  
temp.LdL   = C2K(14);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'CarlPfis1999';
comment.LdL = 'mark-recapture method';  

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'dioecious, which means that each individual is either male or female';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'weight-length: weight (g): 0.03972 * (diameter in cm)^3.144';
metaData.bibkey.F2 = 'sealifebase'; 
metaData.facts = struct('F1',F1,'F2',F2);  

%% Links
metaData.links.id_CoL = 'ZLN7'; % Cat of Life
metaData.links.id_ITIS = '157066'; % ITIS
metaData.links.id_EoL = '45328742'; % Ency of Life
metaData.links.id_Wiki = 'Crossaster_papposus'; % Wikipedia
metaData.links.id_ADW = 'Crossaster_papposus'; % ADW
metaData.links.id_Taxo = '40903'; % Taxonomicon
metaData.links.id_WoRMS = '124154'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crossaster_papposus}}';
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
bibkey = 'DupoLund2010'; type = 'Article'; bib = [ ... 
'author = {S. Dupont and B. Lundve and M. Thorndyke}, ' ... 
'year = {2010}, ' ...
'title = {Near Future Ocean Acidification Increases Growth Rate of the Lecithotrophic Larvae and Juveniles of the Sea Star \emph{Crossaster papposus}}, ' ...
'journal = {J. Exp. Zool. (Mol. Dev. Evol.)}, ' ...
'volume = {314B}, ' ...
'pages = {1--8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CarlPfis1999'; type = 'Article'; bib = [ ... 
'author = {H. R. Carlson and C. A. Pfister}, ' ... 
'year = {1999}, ' ...
'title = {A seventeen-year study of the rose star \emph{Crossaster papposus} population in a coastal bay in southeast {A}laska}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {133}, ' ...
'pages = {223--230}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6192}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.org/summary/Crossaster-papposus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];