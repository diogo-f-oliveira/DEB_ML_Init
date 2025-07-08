function [data, auxData, metaData, txtData, weights] = mydata_Taeniopygia_guttata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Estrildidae';
metaData.species    = 'Taeniopygia_guttata'; 
metaData.species_en = 'Zebra finch'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi', 'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTs', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tnsf', 'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'; 't-JOe'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1 = {'Bas Kooijman'};    
metaData.date_mod_1   = [2022 11 16];              
metaData.email_mod_1  = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1= {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3 = {'Bas Kooijman'};    
metaData.date_mod_3   = [2024 02 21];              
metaData.email_mod_3  = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3= {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 21];

%% set data
% zero-variate data

data.ab = 15;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 17.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 300;    units.tR = 'd';    label.tR = 'time since birth at first brood'; bibkey.tR = 'voliere';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.8;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wiki';
data.Wwi = 11.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 eggs per clutch; 1 clutches per yr';

% uni-variate data

% time-weight
data.tW = [ % time since birth (d), wet weight  (g)
0.002	0.769
1.011	1.137
2.021	1.538
2.999	2.007
3.977	2.442
4.988	3.347
6.062	4.386
7.009	5.157
8.020	6.431
9.032	7.671
10.043	8.811
11.053	9.582
12.064	10.453
13.011	10.989
13.988	11.189
15.029	11.590
16.070	11.790
17.047	11.856
17.992	11.720
19.001	11.786
20.010	11.952
21.019	12.320
22.028	12.385];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KillTie2014';

% time-weight for embryo
data.tWe = [ ... % time (d), embryo weight (g)
4.622	0.016
5.599	0.053
5.637	0.027
6.539	0.014
6.576	0.079
7.516	0.123
7.591	0.086
8.493	0.125
8.530	0.099
8.718	0.131
9.545	0.172
10.221	0.448
10.597	0.271
11.311	0.463
11.461	0.317
11.499	0.487
12.401	0.602
12.551	0.431
13.415	0.587
13.641	0.541
14.017	0.535
14.092	0.582];
units.tWe   = {'d', 'g'};  label.tWe = {'age', 'weight'};  
temp.tWe    = C2K(37.5);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'VeckHoyt1979';
  
% time-respiration for embryo
data.tJOe= [ ... % time (d), rrespiration (cm^3 O2/ h)
1.870	0.023
2.065	0.018
2.978	0.053
3.978	0.028
4.848	0.055
5.000	0.039
5.022	0.093
5.891	0.144
6.326	0.152
6.522	0.122
6.543	0.133
7.391	0.195
7.435	0.240
7.457	0.133
7.565	0.162
7.565	0.178
8.348	0.259
8.413	0.318
8.435	0.232
8.457	0.289
8.457	0.256
8.457	0.211
8.543	0.194
9.326	0.305
9.391	0.324
9.391	0.372
9.413	0.251
9.478	0.270
9.500	0.364
10.239	0.458
10.326	0.477
10.348	0.423
10.348	0.332
10.370	0.372
10.391	0.504
10.435	0.458
10.522	0.345
10.565	0.453
10.652	0.496
10.652	0.447
11.239	0.552
11.304	0.604
11.326	0.442
11.348	0.579
11.348	0.485
11.370	0.547
11.500	0.593
11.522	0.458
11.587	0.525
12.261	0.630
12.283	0.849
12.283	0.808
12.283	0.614
12.348	0.576
12.370	0.671
12.391	0.727
12.435	0.797
12.435	0.765
12.500	0.660
12.543	0.827
12.565	0.927
12.674	0.781
13.196	0.760
13.217	0.867
13.261	0.838
13.283	0.884
13.283	0.730
13.283	0.695
13.326	0.975
13.326	0.811
13.348	0.832
13.413	0.916
13.435	1.013
13.457	0.862
13.522	1.137
13.522	0.875
13.522	0.848
13.565	0.932
13.587	0.962
13.630	0.808
13.696	1.002
14.109	1.102
14.174	1.228
14.196	1.021
14.261	1.239
14.261	1.164
14.304	0.975
14.370	1.123
14.413	1.215
14.457	1.042];
data.tJOe(:,2) = data.tJOe(:,2) * 24; % convert h to d
units.tJOe   = {'d', 'ml O_2/d'};  label.tJOe = {'age', 'O_2 consumption'};  
temp.tJOe    = C2K(37.5);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe = 'VeckHoyt1979';
    
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

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'mod_1: v reduced';
D3 = 'mod_2: Puberty data added';
D4 = 'mod_3: Embryo data added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '54HRJ'; % Cat of Life
metaData.links.id_ITIS = '563276'; % ITIS
metaData.links.id_EoL = '45511027'; % Ency of Life
metaData.links.id_Wiki = 'Taeniopygia_guttata'; % Wikipedia
metaData.links.id_ADW = 'Taeniopygia_guttata'; % ADW
metaData.links.id_Taxo = '58868'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'CF7D71B0FC773B09'; % avibase
metaData.links.id_birdlife = 'timor-zebra-finch-taeniopygia-guttata'; % birdlife
metaData.links.id_AnAge = 'Taeniopygia_guttata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Taeniopygia_guttata}}';
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
bibkey = 'KillTie2014'; type = 'Article'; bib = [ ... 
'author = {T. L. Killpack and D. N. Tie and W. H. Karasov}, ' ... 
'doi = {10.1642/AUK-14-1.1}, ' ...
'year = {2014}, ' ...
'title = {Compensatory growth in nestling Zebra Finches impacts body composition but not adaptive immune function}, ' ...
'journal = {The Journal of Experimental Biology}, ' ...
'volume = {131}, ' ...
'pages = {396--406}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Taeniopygia_guttata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'voliere'; type = 'Misc'; bib = ...
'howpublished = {\url{https://voliere-info.nl/zebravink/}}';
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
%
bibkey = 'VlecHoyt1979'; type = 'Article'; bib = [...
'author = {Vleck, C. M. and Hoyt, D. F. and Vleck, D.}, '...
'year = {1979},'...
'title = {Metabolism of avian embryos: patterns in artricial and precocial birds}, '...
'journal = {Physiol. Zool. }, ' ...
'volume = {52}, ' ...
'pages = {363-377}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

