function [data, auxData, metaData, txtData, weights] = mydata_Magellania_fragilis

%% set metaData
metaData.phylum     = 'Brachiopoda'; 
metaData.class      = 'Rhynchonellata'; 
metaData.order      = 'Terebratulida'; 
metaData.family     = 'Terebratellidae';
metaData.species    = 'Magellania_fragilis'; 
metaData.species_en = 'Brachiopod'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'L-Wd'; 't-L'}; 

metaData.COMPLETE = 1.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 07 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 11]; 


%% set data
% zero-variate data

data.ab = 30;    units.ab = 'd';         label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 18*365;   units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'read from tL-data for L_p = 2 cm';
data.am = 125*365;  units.am = 'd';      label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.05; units.Lb  = 'cm';       label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 2;    units.Lp  = 'cm';       label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 5.95; units.Li  = 'cm';       label.Li  = 'ultimate total length';   bibkey.Li  = 'BreyPeck1995';

data.Ri  = 1.7e4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% L-Wd data
data.LW = [ ... shell length (cm), ash-free dry body mass (mg)
0.277	1.575
0.343	1.578
0.441	1.581
0.490	2.152
0.523	1.442
0.629	2.157
0.727	2.303
0.931	3.022
0.972	3.450
1.102	3.881
1.250	4.171
1.265	6.021
1.322	6.592
1.641	7.173
1.664	9.023
1.728	13.436
2.183	20.139
2.377	24.841
2.336	25.551
2.335	27.970
2.557	24.705
2.563	28.689
2.620	29.403
2.644	31.111
2.626	33.814
2.739	36.948
2.722	38.512
2.919	38.519
2.736	44.061
3.053	48.483
3.149	52.470
3.017	56.023
3.073	59.155
3.162	60.865
3.384	58.027
3.464	62.156];
units.LW   = {'cm', 'mg'};  label.LW = {'shell length', 'asfree dry weight'};  
bibkey.LW = 'BreyPeck1995';
% 
% t-L data 69*57'S, 11*49'E, 210-220 m, 1991/03/08
data.tL = [ ... % number of rings (yr), length (cm)
1   	0.278
1    	0.359
2    	0.481
4   	0.431
4    	0.872
5   	0.929
5   	0.838
6   	0.805
7       0.837
7       0.886
7    	0.960
9    	1.016
9   	1.179
10   	1.162
11   	1.113
12   	1.178
7   	1.197
8   	1.262
8   	1.523
10  	1.661
10  	1.758
11  	1.586
11  	1.399
12  	1.308
13  	1.471
16  	1.413
17  	1.453
11  	1.782
12  	1.766
13  	1.765
13  	1.839
12  	1.970
12  	2.100
14  	2.156
17  	1.755
18  	2.146
17  	2.277
18  	2.326
17  	2.367
20  	2.309
21  	1.900
22  	1.720
22  	2.030
22  	2.128
22      2.455
21  	2.626
24  	2.658
24  	2.894
25  	2.878
26  	2.991
28  	2.836
28  	3.105
27  	2.313
27  	2.126
29  	2.500
30  	2.622
30  	2.818
33  	3.127
35  	2.742
36  	2.660
34  	2.294
31  	2.181
40  	2.625
38  	3.035
36  	3.125
37  	3.182
37  	3.272
37  	3.279
41  	3.458
42  	3.318
43  	3.497
44  	3.709
49   	3.756
48  	3.568
48  	3.479
48  	3.438];
data.tL(:,1) = data.tL(:,1) + 1;   % put settlement at zero (back-extrapolation to L=0)
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell length'};  
temp.tL    = C2K(4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BreyPeck1995';
comment.tL = '69.57 S, 11.49 E, 210-220 m deep, 1991/03/08';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Since larvae do not feed (see fact 2), no acceleration is assumed';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Adults of most species are of one sex throughout their lives';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'The larvae of articulate species live only on yolk, and remain among the plankton for only a few days';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3XGMY'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46556167'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '152512'; % Taxonomicon
metaData.links.id_WoRMS = '235668'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brachiopoda}}';
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
bibkey = 'BreyPeck1995'; type = 'Article'; bib = [ ... 
'author = {Brey, T. and Peck, L. S. and Gutt, J. and Hain, S. and Arnitz, W. E.}, ' ... 
'year = {1995}, ' ...
'title = {Population dynamics of \emph{Magellania fragilis}, a brachiopod dominating a mixed-botto, macrobentic assemblage on the {A}ntarctic shelf}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {75}, ' ...
'pages = {857--869}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

