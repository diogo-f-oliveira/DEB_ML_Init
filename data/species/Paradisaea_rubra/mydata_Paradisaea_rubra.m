function [data, auxData, metaData, txtData, weights] = mydata_Paradisaea_rubra
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Paradisaeidae';
metaData.species    = 'Paradisaea_rubra'; 
metaData.species_en = 'Red bird-of-paradise';

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 07];

%% set data
% zero-variate data

data.ab = 16.6;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'WrotHutc1991';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 17;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'arkive';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '15 till 20 d';
data.tp = 51;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '15 till 20 d';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'WrotHutc1991';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'WrotHutc1991';
data.Wwi = 165; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';   bibkey.Wwi = 'arkive';
  comment.Wwi = '115 till 208 g';
data.Wwim = 185; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'arkive';
  comment.Wwi = '158 till 224 g';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'WrotHutc1991';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW1 = [ ... % scaled time since birth (d), scaled wet weight (g)
0.893	9.029
2.017	7.950
2.993	9.787
4.004	12.076
4.940	15.936
5.912	19.572
6.883	24.782
8.009	22.354
9.009	32.736
10.010	41.544
10.911	44.728
12.019	54.889
13.023	62.124
13.959	65.983
14.923	75.464
15.896	79.100
16.833	82.510
17.970	72.889
18.976	78.100
19.913	81.959
20.919	87.171
21.926	92.607
23.000	101.418
23.969	107.302
24.869	111.385
25.949	115.700
26.921	120.011
28.033	127.249];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'WrotHutc1991';
comment.tW1 = 'data for chick 1';
%
data.tW2 = [ ... % scaled time since birth (d), scaled wet weight (g)
0.967	7.908
1.980	8.398
2.994	8.888
3.969	10.726
5.015	13.915
5.951	18.000
6.960	21.637
8.007	24.152
8.971	33.858
9.979	37.721
10.988	41.358
12.000	42.748
13.081	47.288
13.978	53.169
14.982	59.729
15.919	63.364
16.932	64.304
17.951	60.748
18.882	68.429
19.960	74.093
20.951	65.589
21.922	70.125
23.002	74.664
24.043	81.451
24.983	82.613
25.920	86.023
26.997	92.361
27.932	97.344];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(41.6);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'WrotHutc1991';
comment.tW2 = 'data for chick 2';
%
data.tW3 = [ ... % scaled time since birth (d), scaled wet weight (g)
1.039	8.135
2.018	7.500
2.993	9.563
4.005	10.952
5.015	13.691
6.025	16.879
6.890	20.061
8.188	23.935
8.971	33.634
9.906	38.167
10.880	41.129
12.002	41.849
13.011	45.262
14.087	52.949
14.983	59.280
15.094	57.710
15.925	59.093
15.957	62.016
16.827	61.827
16.968	64.305
17.843	60.069
17.979	66.819
18.933	58.314
19.073	61.467
19.864	65.321
19.973	65.325
20.951	65.589
22.000	66.531
23.042	72.418
23.905	76.274
24.915	79.238];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3    = C2K(41.6);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3  = 'WrotHutc1991';
comment.tW3 = 'data for chick 3';
%
data.tW4 = [ ... % scaled time since birth (d), scaled wet weight (g)
0.966	8.582
2.017	8.399
2.995	8.439
3.861	10.497
4.981	12.790
6.024	17.328
6.854	19.610
7.972	22.802
9.053	27.342
10.063	30.080
11.063	39.788
11.993	47.694
13.081	47.288
13.941	53.168
15.093	58.385
15.956	62.466
16.822	65.199
17.987	60.974
18.891	62.134
19.973	65.550
21.023	65.367
22.000	66.531
22.970	71.516
23.906	76.050
24.916	78.788
25.922	84.449
26.971	85.390
27.978	90.152];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight'};  
temp.tW4    = C2K(41.6);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4  = 'WrotHutc1991';
comment.tW4 = 'data for chick 4';
%
data.tW5 = [ ... % scaled time since birth (d), scaled wet weight (g)
1.004	7.459
1.983	6.824
3.030	8.665
4.005	10.727
4.943	13.912
6.025	16.654
6.889	20.735
8.043	24.379
9.084	30.940
10.053	36.600
10.991	39.560
12.073	42.751
13.079	48.412
14.082	56.096
14.948	58.604
15.955	63.365
16.967	64.755
18.059	60.977
18.927	61.911
19.972	66.000
21.058	66.718
21.935	61.132
23.054	63.875
24.059	69.986
24.958	74.743
25.963	81.303
27.023	74.376
28.064	81.163];
units.tW5   = {'d', 'g'};  label.tW5 = {'time since birth', 'wet weight'};  
temp.tW5    = C2K(41.6);  units.temp.tW5 = 'K'; label.temp.tW5 = 'temperature';
bibkey.tW5  = 'WrotHutc1991';
comment.tW5 = 'data for chick 5';

%% set weights for all real data
weights = setweights(data, []);
weights.tW5 = weights.tW5 * 2;
weights.tW4 = weights.tW4 * 2;
weights.tW3 = weights.tW3 * 2;
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3','tW4','tW5'}; subtitle1 = {'Data for several individuals'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced';
D4 = 'mod_1: food availability taken variable in tW data';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'Females take care of all breeding and feeding';
metaData.bibkey.F1 = 'WrotHutc1991'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CTLH'; % Cat of Life
metaData.links.id_ITIS = '561812'; % ITIS
metaData.links.id_EoL = '45516974'; % Ency of Life
metaData.links.id_Wiki = 'Paradisaea_rubra'; % Wikipedia
metaData.links.id_ADW = 'Paradisaea_rubra'; % ADW
metaData.links.id_Taxo = '59419'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '2215C01D11B737E6'; % avibase
metaData.links.id_birdlife = 'red-bird-of-paradise-paradisaea-rubra'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paradisaea_rubra}}';
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
bibkey = 'WrotHutc1991'; type = 'Article'; bib = [ ... 
'author = {W. Worth and M. Hutchins and C. Sheppard and D. Bruning and J. Gonzalez and T. McNamara}, ' ... 
'year = {1991}, ' ...
'title = {Hand-rearing, growth, and development of the red bird of paradise (\emph{Paradidaea rubra}) at {New York Zoological Park}}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {10}, ' ...
'pages = {17--33}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.arkive.org/red-bird-of-paradise/paradisaea-rubra/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

