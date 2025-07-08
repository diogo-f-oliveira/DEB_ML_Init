function [data, auxData, metaData, txtData, weights] = mydata_Vanellus_armatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Charadriidae';
metaData.species    = 'Vanellus_armatus'; 
metaData.species_en = 'Blacksmith lapwing'; 

metaData.ecoCode.climate = {'Aw', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', '0iTa'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
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

data.ab = 29;        units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temp is guessed';
data.tx = 40;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'TjorUnde2008';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '16-20 d';
data.tp = 120;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '16-20 d';
data.tR = 370;       units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on Vanellus vanellus at AnAge';
data.am = 18.6*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 11.1;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'TjorUnde2008';
% data.Wwx = 105.5;    units.Wwx = 'g';   label.Wwx = 'wet weight at fledging';   bibkey.Wwx = 'TjorUnde2008';
data.Wwi = 158;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'TjorUnde2008';
  
data.Ri  = 3.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'TjorUnde2008';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.034	12.500
0.035	10.312
0.035	9.062
0.899	9.993
0.936	12.180
1.987	13.734
1.987	12.172
2.963	15.914
3.039	12.789
3.039	11.539
3.939	16.219
3.941	10.907
4.990	17.461
4.991	15.274
5.891	20.891
5.892	18.704
6.868	19.009
6.868	17.134
7.919	22.438
7.953	32.750
7.957	20.250
7.957	18.375
7.958	16.188
7.996	14.000
7.996	12.438
9.947	20.235
9.984	24.297
11.973	28.969
11.974	27.719
12.913	26.774
12.914	22.087
12.948	33.961
12.950	29.899
13.963	32.078
14.901	36.446
14.902	33.946
14.902	32.071
14.941	26.446
14.943	20.508
15.955	28.938
16.926	46.430
17.003	39.867
17.004	37.992
17.004	35.180
17.905	39.548
17.979	41.422
18.012	61.109
18.018	38.609
18.018	35.797
18.022	23.922
18.960	25.477
18.992	44.852
19.972	33.906
20.903	63.274
20.903	62.024
20.904	60.149
20.907	49.524
20.907	48.274
20.940	65.461
20.984	42.649
21.953	68.578
21.955	63.891
21.960	44.203
21.963	32.641
22.969	63.883
22.971	55.133
24.960	60.430
25.892	86.360
25.932	76.360
25.935	66.360
25.980	38.547
26.911	68.227
26.912	66.040
27.962	71.344
27.992	98.219
27.993	96.344
29.988	78.203
31.973	101.000
32.053	83.500
32.915	90.055
33.964	99.735
33.966	92.547
33.966	90.360
34.935	120.040
35.990	106.281
36.931	99.086
37.905	107.516
38.919	110.633
38.922	96.258
38.993	114.383];
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
metaData.links.id_CoL = '7FFGJ'; % Cat of Life
metaData.links.id_ITIS = '176483'; % ITIS
metaData.links.id_EoL = '1049061'; % Ency of Life
metaData.links.id_Wiki = 'Vanellus_armatus'; % Wikipedia
metaData.links.id_ADW = 'Vanellus_armatus'; % ADW
metaData.links.id_Taxo = '70262'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '2F23EDC6558D31B3'; % avibase
metaData.links.id_birdlife = 'blacksmith-lapwing-vanellus-armatus'; % birdlife
metaData.links.id_AnAge = 'Vanellus_armatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vanellus_armatus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Vanellus_armatus}}';
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

