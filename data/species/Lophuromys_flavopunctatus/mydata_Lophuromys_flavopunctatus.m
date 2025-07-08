function [data, auxData, metaData, txtData, weights] = mydata_Lophuromys_flavopunctatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Lophuromys_flavopunctatus'; 
metaData.species_en = 'Yellow-spotted brush-furred rat'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 16];              

%% set data
% zero-variate data

data.tg = 30.5;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Dela2009';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 38;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Dela2009';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 6.0;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Dela2009';
data.Wwi = 259;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Dela2009';

data.Ri  = 2.5*2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Dela2009';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-3 pups per litter; 2 litters per yr assumed';
  
% univariate data
data.tWw2 = [ ... % time since birth (d), weight (g)
0.000	6.350
0.000	5.564
0.000	7.269
0.388	6.286
0.778	6.550
0.975	10.682
1.069	8.584
1.304	7.273
1.737	10.160
2.106	9.177
2.168	12.915
2.651	11.080
2.658	11.474
2.674	12.458
3.067	12.918
3.086	14.098
3.965	12.855
3.981	13.839
3.990	14.363
4.671	16.726
4.821	18.038
5.347	18.761
5.690	16.205
5.698	16.664
5.704	17.057
5.722	18.107
5.788	14.369
6.762	18.897
6.909	20.012
7.383	17.587
7.682	20.145
7.695	20.932
7.854	22.769
8.611	21.919
8.619	22.443
8.843	20.411
8.910	24.477
9.691	25.135
9.840	18.578
10.033	22.513
10.043	23.103
11.495	25.469
11.817	29.404
11.910	27.240
11.953	29.864
12.065	21.076
13.016	32.031
13.079	28.031
13.155	24.883
13.364	29.737
13.647	31.312
13.730	28.557
13.923	32.493
14.521	29.806
14.946	24.429
15.118	34.857
15.804	29.678
16.081	30.925
16.737	39.518
17.356	30.339
18.506	37.753
18.655	38.999
19.898	44.249
20.606	32.709
22.597	36.584
22.969	43.537
23.061	33.569
24.702	39.607
25.824	45.316
25.848	46.759
29.698	54.312
29.952	46.377
32.639	45.730
33.670	45.929
37.625	52.106
39.759	49.095
40.066	52.113
44.400	57.831
45.782	55.999
52.304	54.247
53.402	58.513
58.528	57.741
67.133	57.701
82.028	57.352];
units.tWw2  = {'d', 'g'};  label.tWw2 = {'time since birth', 'wet weight', '2 pups'};  
temp.tWw2    = C2K(36);  units.temp.tWw2 = 'K'; label.temp.tWw2 = 'temperature'; 
bibkey.tWw2 = 'Dela2009';
comment.tWw2 = 'Data for litter size 2';
%
data.tWw3 = [ ... % time since birth (d), weight (g)
2.696	6.031
2.817	5.572
3.092	6.688
5.701	9.056
5.826	8.860
6.076	8.467
8.797	9.853
8.809	10.574
8.816	11.033
11.665	12.419
11.889	10.452
11.911	11.764
14.586	18.198
14.819	16.756
14.922	15.183
17.360	22.797
17.436	19.649
17.778	17.027
20.573	22.938
21.141	26.218
23.758	29.112
23.861	27.538
26.495	31.481
26.860	30.236
29.834	39.229
29.992	33.262
30.001	33.786
32.397	38.843
32.884	37.205
35.744	39.312
35.756	40.033
37.939	39.974
38.730	41.223
38.842	40.239
41.683	41.100
41.838	42.740
44.776	41.765
44.971	45.766
45.192	43.602
47.744	42.561
48.053	45.709
52.241	42.640
54.637	47.696
54.803	42.188
58.964	45.283
61.758	43.323
61.867	49.947
69.478	44.133
75.962	47.825
76.134	42.710
83.114	53.092
83.250	45.813
90.046	45.046
90.155	51.670
97.335	50.839
104.530	50.926
110.950	50.814
118.200	54.245
118.328	46.441
125.663	47.250
125.742	52.038];
units.tWw3  = {'d', 'g'};  label.tWw3 = {'time since birth', 'wet weight', '3 pups'};  
temp.tWw3    = C2K(36);  units.temp.tWw3 = 'K'; label.temp.tWw3 = 'temperature'; 
bibkey.tWw3 = 'Dela2009';
comment.tWw3 = 'Data for litter size 3';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw2 = 3 * weights.tWw2;
weights.tWw3 = 3 * weights.tWw3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw2','tWw3'}; subtitle1 = {'Data for litter size 2,3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '7VQQP'; % Cat of Life
metaData.links.id_ITIS = '585293'; % ITIS
metaData.links.id_EoL = '1179141'; % Ency of Life
metaData.links.id_Wiki = 'Lophuromys_flavopunctatus'; % Wikipedia
metaData.links.id_ADW = 'Lophuromys_flavopunctatus'; % ADW
metaData.links.id_Taxo = '63013'; % Taxonomicon
metaData.links.id_MSW3 = '13001034'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lophuromys_flavopunctatus}}';
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
bibkey = 'Dela2009'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1971.tb02177.x}, ' ...
'author = {Delany, M. J.}, ' ... 
'year = {2009}, ' ...
'title = {The biology of small rodents in {M}ayanja {F}orest, {U}ganda}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {165(1)}, ' ...
'pages = {85–1297}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

