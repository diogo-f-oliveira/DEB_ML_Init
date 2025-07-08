function [data, auxData, metaData, txtData, weights] = mydata_Diplodus_sargus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Diplodus_sargus'; 
metaData.species_en = 'White sea bream'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 19]; 



%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 10*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 45;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm: pi/6*0.085^3';
data.Wwi = 1900;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri  = 536e3/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), total length (cm)
0.088	1.057
0.149	2.417
0.258	3.776
0.335	5.891
0.428	7.704
0.582	10.272
0.597	13.746
0.597	12.538
0.598	11.329
0.645	9.819
0.659	12.840
0.660	11.934
0.661	7.100
0.892	13.897
1.576	16.163
1.622	19.184
1.636	21.299
1.637	20.846
1.637	19.789
1.667	21.601
1.715	18.882
1.715	18.127
1.715	17.372
1.716	16.465
1.823	20.544
1.886	19.335
1.886	18.580
1.886	18.278
1.886	17.674
1.916	22.961
1.978	22.810
1.978	22.054
2.056	23.716
2.553	23.414
2.569	22.205
2.570	21.148
2.630	26.435
2.630	25.378
2.646	24.622
2.817	27.190
2.817	26.435
2.818	23.112
2.818	22.205
2.819	19.940
2.833	25.831
2.833	24.773
2.864	23.565
2.881	21.148
2.896	22.205
2.973	24.169
2.973	22.659
2.988	27.190
2.988	26.133
3.064	30.211
3.065	29.305
3.065	27.190
3.066	25.529
3.066	24.169
3.563	27.039
3.580	24.018
3.639	32.175
3.639	31.571
3.640	29.456
3.640	28.852
3.641	27.946
3.797	25.680
3.810	32.779
3.811	30.514
3.811	29.909
3.811	29.456
3.811	28.852
3.812	28.248
3.998	28.550
3.999	27.190
4.044	29.456
4.045	27.492
4.060	30.967
4.060	28.097
4.076	29.607
4.090	31.571
4.091	28.852
4.372	26.284
4.682	30.967
4.696	34.592
4.791	27.795
4.821	33.686
4.821	31.873
4.992	32.326
5.054	32.477
5.069	35.801
5.085	34.743
5.085	34.139
5.085	33.384
5.101	32.024
5.397	30.211
5.429	28.097
5.816	33.082
6.065	34.894
6.095	36.103
6.392	33.535
6.407	35.196
6.407	34.290
6.422	36.103
7.059	37.311
7.417	37.462
7.417	36.405
7.418	34.894
8.381	38.218
8.381	37.160
9.407	40.181];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GordMoli1997';
  
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

%% Links
metaData.links.id_CoL = '36LF7'; % Cat of Life
metaData.links.id_ITIS = '169194'; % ITIS
metaData.links.id_EoL = '205145'; % Ency of Life
metaData.links.id_Wiki = 'Diplodus_sargus'; % Wikipedia
metaData.links.id_ADW = 'Diplodus_sargus'; % ADW
metaData.links.id_Taxo = '192585'; % Taxonomicon
metaData.links.id_WoRMS = '127053'; % WoRMS
metaData.links.id_fishbase = 'Diplodus-sargus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplodus_sargus}}';
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
bibkey = 'GordMoli1997'; type = 'Article'; bib = [ ... 
'author = {Ana Gordoa and Balbina Mol\''{i}}, ' ... 
'year = {1997}, ' ...
'title = {Age and growth of the sparids \emph{Diplodus vulgaris}, \emph{D. sargus} and \emph{D. annularis} in adult populations and the differences in their juvenile growth patterns in the north-western {M}editerranean {S}ea}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {33}, ' ...
'pages = {123-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
