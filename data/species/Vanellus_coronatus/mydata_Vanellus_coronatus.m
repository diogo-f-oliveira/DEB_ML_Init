function [data, auxData, metaData, txtData, weights] = mydata_Vanellus_coronatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Charadriidae';
metaData.species    = 'Vanellus_coronatus'; 
metaData.species_en = 'Crowned lapwing'; 

metaData.ecoCode.climate = {'Aw', 'BWh', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', '0iTa'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 29;     units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temp is guessed, ab based on V. armatur at AnAge';
data.tx = 35;     units.tx = 'd';   label.tx = 'time since birth at fledging'; bibkey.tx = 'TjorUnde2008';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '16-20 d';
data.tp = 105;     units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '16-20 d';
data.tR = 730;    units.tR = 'd';   label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on Vanellus vanellus at AnAge';
data.am = 20*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on V. armatus';

data.Wwb = 12.4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'TjorUnde2008';
% data.Wwx = 119;   units.Wwx = 'g';  label.Wwx = 'wet weight at fledging';  bibkey.Wwx = 'TjorUnde2008';
data.Wwi = 167;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'TjorUnde2008';
  
data.Ri  = 2.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'TjorUnde2008';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight 
data.tW = [ ... % time since birth (d), wet weight (g)
0.007	15.033
0.060	12.216
0.060	10.963
0.977	14.425
1.012	10.667
1.109	12.861
1.929	13.502
1.930	11.310
1.961	15.695
2.939	28.867
2.944	18.531
2.977	16.340
2.978	14.460
2.979	12.268
3.997	11.033
4.026	17.924
4.944	19.194
4.945	16.688
4.946	14.809
4.974	26.085
4.974	24.832
4.975	22.326
5.991	26.103
5.992	22.971
5.993	20.152
5.996	14.828
6.943	24.241
6.944	21.109
6.978	19.230
8.910	25.842
8.912	21.144
8.913	18.638
8.935	43.695
8.947	16.446
9.005	34.300
9.006	30.228
9.984	44.340
9.985	41.208
10.023	30.247
10.025	26.488
10.026	24.922
10.027	22.103
10.028	19.911
10.961	59.704
10.973	33.709
11.988	38.425
11.988	37.172
11.990	33.414
11.991	31.221
12.974	32.492
12.978	24.035
12.999	49.092
13.033	47.526
13.034	45.021
13.035	42.515
13.038	36.564
13.947	57.565
13.961	26.559
13.985	45.664
13.986	43.785
13.987	41.279
13.988	39.713
13.991	33.763
13.992	31.257
14.008	67.275
14.891	71.676
14.902	48.813
14.903	46.307
15.957	38.496
15.961	30.040
15.981	56.349
15.986	45.387
16.967	52.295
16.977	30.997
16.980	24.733
17.915	60.142
17.916	57.949
17.940	76.115
18.044	65.155
18.955	80.518
18.962	64.545
18.963	62.040
18.964	60.160
19.951	54.227
19.955	46.084
19.956	43.265
19.958	39.507
20.011	67.383
20.013	62.372
20.924	78.987
20.931	62.701
20.960	72.098
20.961	69.279
20.965	59.883
20.970	49.548
21.904	86.522
21.956	45.494
21.974	76.814
21.975	75.248
21.976	73.995
21.985	53.951
22.924	79.963
22.952	90.612
22.956	82.156
23.002	53.969
23.005	46.452
23.945	71.525
23.946	68.393
23.950	61.502
24.934	60.894
24.962	71.230
25.008	112.886
25.900	99.748
25.903	92.231
26.950	98.827
27.013	105.092
27.966	100.411
28.937	128.616
28.980	107.320
30.919	99.211
30.944	114.558
31.929	114.263
31.931	108.312
31.937	96.724
32.876	122.736
33.927	120.249
34.906	129.663];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'TjorUnde2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7FFJ7'; % Cat of Life
metaData.links.id_ITIS = '176486'; % ITIS
metaData.links.id_EoL = '1049064'; % Ency of Life
metaData.links.id_Wiki = 'Vanellus_coronatus'; % Wikipedia
metaData.links.id_ADW = 'Vanellus_coronatus'; % ADW
metaData.links.id_Taxo = '70269'; % Taxonomicon
metaData.links.id_WoRMS = '366837'; % WoRMS
metaData.links.id_avibase = 'D0FA8EBE3808F1D8'; % avibase
metaData.links.id_birdlife = 'crowned-lapwing-vanellus-coronatus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vanellus_coronatus}}';
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
bibkey = 'TjorUnde2008'; type = 'Article'; bib = [ ...  
'title = {The energetic implications of precocial development for three shorebird species breeding in a warm environment}, ' ...
'journal = {Ibis}, ' ...
'year = {2008}, ' ...
'author = {K. M. C. Tj{\o}rve and L. G. Underhill and G. H. Visser}, ' ...
'volume = {150}, ' ...
'pages = {125-138}'];
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

