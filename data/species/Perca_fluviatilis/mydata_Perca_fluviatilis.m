function [data, auxData, metaData, txtData, weights] = mydata_Perca_fluviatilis 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Perca_fluviatilis'; 
metaData.species_en = 'European perch'; 

metaData.ecoCode.climate = {'Cfa', 'Dfc', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2013 12 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 10];

%% set data
% zero-variate data

data.ab = 8;       units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'fishbase';   
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 4 * 365; units.ap = 'd';   label.ap = 'age at puberty';           bibkey.ap = 'fishbase';
  temp.ap = C2K(13); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'males 2-3 yr';
data.am = 22 * 365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.225; units.L0  = 'cm';  label.L0  = 'egg diameter';            bibkey.L0  = 'fishbase'; 
%  comment.L0 = '2-2.5 mm'; 
data.Lb  = 0.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'fishbase';  
data.Lp  = 13;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
  comment.Lp = '11-23.4 cm';
data.Li  = 60;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwi = 4800; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
 
% uni-variate data
% t-L data from PersRoos2004
% temp not specified, here analysed using mean 13 C
data.tL = [ ... % time since hatch (d), length (cm)
0       0.5
352	    6
735	    9
1086	12
1452	13
1837	20
2204	24
2571	27
2938	30
3305	33
3670	34];
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
temp.tL    = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PersRoos2004';
comment.tL = 'temp not specified, here analysed using mean 13 C';
  
% L-N data from Jell1980
% temp: 6.7 - 24.2 C at surface of Lake Pounui. 
data.LN = [ ... % length (cm), number of egg (1e3 eggs) per spawn
14.256	3.103
14.256	3.103
14.512	2.467
14.512	2.467
14.512	5.978
14.854	5.661
15.280	5.239
15.793	3.115
15.793	5.881
15.878	4.605
15.878	4.605
15.878	5.243
15.878	5.243
16.049	5.670
16.305	7.800
16.561	5.461
16.646	4.824
16.646	7.164
16.732	6.207
16.817	4.293
17.073	8.231
17.159	4.615
17.159	6.530
17.244	7.488
17.415	8.340
17.671	6.533
17.841	8.556
17.927	4.621
18.098	9.303
18.268	8.666
18.268	9.729
18.439	5.263
18.524	9.093
18.610	6.009
18.866	9.628
19.037	10.586
19.122	6.544
19.720	8.783
19.805	12.720
20.061	12.403
20.232	6.872
20.488	14.640
20.829	11.238
21.171	21.986
21.341	8.795
21.598	7.734
21.683	11.138
22.280	10.930
22.707	16.359
23.220	21.363
23.561	9.876
23.988	11.794
24.244	19.562
24.329	13.499
24.329	15.839
24.671	15.416
25.183	26.059
25.524	12.763
25.524	14.891
25.524	15.529
26.207	12.981
26.549	16.707
27.402	16.820
29.195	15.557
30.476	29.609
30.902	30.357
31.585	24.831
32.268	33.240
34.232	60.915
38.329	63.924
42.085	40.549];
units.LN = {'cm', '#'};     label.LN = {'total length', '1e3 eggs'};  
temp.LN    = C2K(12);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Jell1980';
comment.LN = '1 spawn per yr';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M  = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6V3PB'; % Cat of Life
metaData.links.id_ITIS = '168470'; % ITIS
metaData.links.id_EoL = '46580126'; % Ency of Life
metaData.links.id_Wiki = 'Perca_fluviatilis'; % Wikipedia
metaData.links.id_ADW = 'Perca_fluviatilis'; % ADW
metaData.links.id_Taxo = '45191'; % Taxonomicon
metaData.links.id_WoRMS = '151353'; % WoRMS
metaData.links.id_fishbase = 'Perca-fluviatilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Perca_fluviatilis}}';
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
bibkey = 'PersRoos2004'; type = 'Article'; bib = [ ... 
'author = {Persson, L. and Claessen, D. and Roos, A. M. de and Bystr\"{o}m, P. and Sj\"{o}gren, S. and Svanb\"{a}ck, R. and Wahlstrm, E. and Westman, E.}, ' ... 
'year = {2004}, ' ...
'title = {Cannibalism in a size-structured population: energy extraction and control}, ' ...
'journal = {Ecological monographs}, ' ...
'volume = {74}, ' ...
'pages = {135-157}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jell1980'; type = 'Article'; bib = [ ... 
'author = {D. J. Jellyman}, ' ... 
'year = {1980}, ' ...
'title = {Age, growth, and reproduction of perch, \emph{Perca fluviatilis} {L}., in {L}ake {P}ounui}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {14}, ' ...
'number = {4}, '...
'pages = {391--400}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Perca-fluviatilis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

