function [data, auxData, metaData, txtData, weights] = mydata_Paracentrotus_lividus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Parechinidae';
metaData.species    = 'Paracentrotus_lividus'; 
metaData.species_en = 'Purple sea urchin'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.5); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'GSI'; 'JX_W'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 

%% set data
% zero-variate data

data.tj = 18;     units.tj = 'd';    label.tj = 'time since birth at settlement'; bibkey.tj = 'CellFena1990';   
  temp.tj = C2K(19.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 9*365;  units.am = 'd';    label.am = 'life span';                      bibkey.am = 'ecol_mar';   
  temp.am = C2K(19.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj = 0.048;  units.Lj  = 'cm';  label.Lj  = 'test diameter at settlement';   bibkey.Lj  = 'CellFena1990';
data.Lp  = 2.25;  units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty';      bibkey.Lp  = 'Gros2001';
data.Li  = 6.5;   units.Li  = 'cm';  label.Li  = 'ultimate test diameter';        bibkey.Li  = 'Gros2001';

data.GSI  = 0.16; units.GSI  = '-'; label.GSI  = 'gonado somatic index';          bibkey.GSI  = 'CellFena1990';   
  temp.GSI = C2K(14.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'max value of female of tL4 at  172 d; Gros2001: 0.17 max';

data.JX0 = 0.082; units.JX0  = 'g/d'; label.JX0  = 'feeding rate for Ww = 0.006 g '; bibkey.JX0  = 'CellFena1990';   
  temp.JX0 = C2K(19.5);  units.temp.JX0 = 'K'; label.temp.JX0 = 'temperature';
data.JX1 = 0.288; units.JX1  = 'g/d'; label.JX1  = 'feeding rate for Ww = 4.45 g ';  bibkey.JX1  = 'CellFena1990';   
  temp.JX1 = C2K(19.5);  units.temp.JX1 = 'K'; label.temp.JX1 = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since settlement (d), test diameter (cm)
217.791	0.358
315.951	0.770
373.211	0.949
459.100	1.558
544.990	1.952
643.149	2.167
733.129	2.454
823.108	2.955
913.088	3.367
1007.157	3.743
1097.137	4.030
1191.207	4.442
1285.276	4.746
1379.346	4.943
1469.325	5.033
1559.305	5.158
1645.194	5.248
1825.153	5.355
2009.202	5.463
2189.162	5.534
2373.211	5.660
2549.080	5.642];
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'test diameter'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gros2001';
comment.tL = 'temp is 18 C';
%
data.tL1 = [ ... % time since settlement (d), test diameter (cm); natural light, 1 ind/10 ml
2.618	0.048
18.994	0.065
45.434	0.089
76.960	0.136
106.168	0.261
149.090	0.344
170.641	0.421
193.298	0.438
222.251	0.462
244.862	0.461
290.101	0.466];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since settlement', 'test diameter', '14.5 C in Feb till 26.5 C in Aug'};  
temp.tL1    = C2K(18);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Gros2001';
comment.tL1 = 'temp is 14.5 C in Feb till 26.5 C in Aug';
%
data.tL2 = [ ... % time since settlement (d), test diameter (cm); continuous light, 1 ind/10 ml
2.588	0.036
27.772	0.059
56.710	0.076
76.914	0.118
119.881	0.219
142.809	0.344
197.397	0.570
433.910	0.702
462.953	0.761
489.409	0.791];
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since settlement', 'test diameter', 'continuous light, 1 ind/ 10 ml'};  
temp.tL2    = C2K(18);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Gros2001';
comment.tL2 = 'continuous light, 1 ind/ 10 ml';
%
data.tL3 = [ ... % time since settlement (d), test diameter (cm); natural light, 1 ind/10 ml
196.960	0.956
231.009	1.242
321.367	1.418
348.513	1.522
547.375	2.008
599.332	2.111
694.064	2.105
748.230	2.146
813.698	2.218];
units.tL3   = {'d', 'cm'};  label.tL3 = {'time since settlement', 'test diameter', 'natural light, 1 ind/200 ml'};  
temp.tL3    = C2K(18);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'Gros2001';
comment.tL3 = 'natural light, 1 ind/200 ml';
%
data.tL4 = [ ... % continuous light, 1 ind/ 500 ml
33.901	0.088
81.404	0.267
137.940	0.460
368.448	1.036
411.451	1.230
472.362	1.241
547.022	1.539];
units.tL4   = {'d', 'cm'};  label.tL4 = {'time since settlement', 'test diameter', 'continuous light, 1 ind/ 500 ml'};  
temp.tL4    = C2K(18);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'Gros2001';
comment.tL4 = 'continuous light, 1 ind/ 500 ml';

% length-weight
data.LW = [ ... % test diameter (cm), wet weight (g)
0.807	0.294
0.853	0.441
0.912	0.500
0.942	0.618
0.950	0.471
0.967	0.412
0.988	0.588
0.997	0.735
1.009	0.500
1.022	0.412
1.034	0.824
1.047	0.618
1.073	0.471
1.081	0.824
1.089	1.029
1.102	1.176
1.111	0.588
1.115	0.824
1.115	0.824
1.140	0.647
1.144	1.000
1.169	1.176
1.170	0.794
1.195	0.971
1.220	1.176
1.229	0.794
1.254	1.029
1.266	1.324
1.300	1.441
1.301	1.000
1.351	1.588
1.389	1.324
1.405	1.941
1.427	1.500
1.541	1.735
1.658	3.353
1.684	2.441
1.684	2.441
1.794	2.618
1.911	3.824
1.923	3.941
1.932	3.206
1.953	3.676
1.961	4.206
1.970	3.941
1.986	4.471
1.991	4.235
2.033	4.529
2.058	4.324
2.088	4.206
2.088	3.676
2.096	4.588
2.125	5.029
2.142	4.794
2.142	4.794
2.167	5.294
2.167	5.294
2.167	5.294
2.181	4.441
2.193	4.971
2.197	5.353
2.227	5.000
2.290	5.618
2.293	6.029
2.349	5.529
2.379	5.353
2.400	5.529
2.605	7.676];
units.LW  = {'cm', 'g'};  label.LW = {'test diameter', 'wet weight'};  
bibkey.LW = 'CellFena1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL'}; subtitle1 = {'Gros2001 data at 18 C'};
set2 = {'tL1','tL2','tL3','tL4'}; subtitle2 = {'CellFena1990 data various conditions'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'morphological metamorphosis 18 d after birth at 19.5 C (= settlement)';
metaData.bibkey.F1 = 'CellFena1990'; 
F2 = 'sigmoidal growth after settlement probably results from intra-specific competition';
metaData.bibkey.F2 = 'Gros2001'; 
F3 = 'anus and mouth open 7 d after settlement';
metaData.bibkey.F3 = 'Gros2001'; 
F4 = 'P. lividus are either male or female although hermaphroditism has been observed';
metaData.bibkey.F4 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '4CP35'; % Cat of Life
metaData.links.id_ITIS = '157942'; % ITIS
metaData.links.id_EoL = '599658'; % Ency of Life
metaData.links.id_Wiki = 'Paracentrotus_lividus'; % Wikipedia
metaData.links.id_ADW = 'Paracentrotus_lividus'; % ADW
metaData.links.id_Taxo = '41136'; % Taxonomicon
metaData.links.id_WoRMS = '124316'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paracentrotus_lividus}}';
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
bibkey = 'Gros2001'; type = 'Phdthesis'; bib = [ ... 
'author = {Grosjean, P.}, ' ... 
'year = {2001}, ' ...
'title = {Growth model of the reared sea urchin \emph{Paracentrotus lividus} ({L}amarck, 1816)}, ' ...
'school = {Univ. Libre de Bruxelles}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CellFena1990'; type = 'Article'; bib = [ ... 
'author = {Cellario, C. and Fenaux, L.}, ' ... 
'year = {1990}, ' ...
'title = {\emph{Paracentrotus lividus} ({L}amarck) in culture (larval and benthic phases): parameters of growth observe during two years following metamorphosis.}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {84}, ' ...
'pages = {173--188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ecol_mar'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ecologiamarina.it/Portals/0/book_of_abstracts.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

