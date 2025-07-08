function [data, auxData, metaData, txtData, weights] = mydata_Myripristis_amaena

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Holocentriformes'; 
metaData.family     = 'Holocentridae';
metaData.species    = 'Myripristis_amaena'; 
metaData.species_en = 'Brick soldierfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'rB'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 02];

%% set data
% zero-variate data

data.ab = 3.6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(26.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5500;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'DeeRadt1989';   
  temp.am = C2K(26.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 26.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 88;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02089*Lp^3.08, see F1';
data.Wwi = 505;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^3.08, see F1';

data.Ri  = 6e5/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate at 225 g';  bibkey.Ri  = 'DeeParr1994';   
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birht (d), std length (cm)
171.258	4.337
235.155	4.819
289.114	5.663
569.410	7.229
608.685	7.711
662.867	7.651
839.665	9.578
1631.712	12.651
1729.892	13.886
1774.107	14.307
1818.640	13.434
2025.280	14.157
3034.134	16.657
4107.308	17.922
5042.714	18.735];
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(26.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DeeRadt1989';

% length-weight
data.LW = [ ... % std length (cm), weight (g)
4.392	3.125
4.801	5.340
4.972	4.867
5.569	7.059
5.995	8.366
6.438	10.124
6.660	11.003
6.813	11.891
7.086	11.858
7.239	15.009
7.324	17.717
7.445	12.720
7.529	14.974
7.581	14.515
7.631	17.227
7.700	14.048
7.768	17.210
7.836	17.202
7.921	18.097
8.075	19.438
8.262	22.132
8.466	25.278
8.636	27.522
8.960	27.936
9.250	30.165
9.387	29.696
9.573	37.373
9.710	34.186
9.897	36.428
10.101	39.120
10.237	45.445
10.340	41.809
10.390	43.614
10.714	46.746
10.867	51.256
10.986	53.053
11.139	56.658
11.530	62.951
11.853	67.441
12.006	71.499
12.025	63.345
12.159	72.839
12.500	76.874
12.670	79.118
12.992	88.137
13.468	96.685
13.469	92.608
13.505	84.452
13.639	98.929
13.860	102.978
13.961	105.683
14.045	112.919
14.303	106.095
14.401	127.822
14.439	105.172
14.485	130.529
14.777	122.342
15.286	135.867
15.403	148.987
15.438	144.907
15.473	140.374
15.640	157.564
15.861	160.254
16.285	176.508
16.418	192.796
16.491	166.972
16.541	176.024
16.559	171.040
17.918	202.578
18.630	223.779
18.922	215.591
18.988	227.359];
units.LW = {'cm', 'g'};     label.LW = {'total length', 'weight'};  
bibkey.LW = 'DeeRadt1989';

    
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.02089*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6S3FK'; % Cat of Life
metaData.links.id_ITIS = '166234'; % ITIS
metaData.links.id_EoL = '46567220'; % Ency of Life
metaData.links.id_Wiki = 'Myripristis_amaena'; % Wikipedia
metaData.links.id_ADW = 'Myripristis_amaena'; % ADW
metaData.links.id_Taxo = '94385'; % Taxonomicon
metaData.links.id_WoRMS = '276190'; % WoRMS
metaData.links.id_fishbase = 'Myripristis-amaena'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myripristis_amaena}}';
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
bibkey = 'DeeRadt1989'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00301806}, ' ...
'author = {Dee, A. J. and Radtke, R. L.}, ' ... 
'year = {1989}, ' ...
'title = {Age and growth of the brick soldierfish, \emph{Myripristis amaena}}, ' ...
'journal = {Coral Reefs}, ' ...
'volume = {8(2)}, ' ...
'pages = {79–85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeeParr1994'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00301806}, ' ...
'author = {Anderson J. Dee and James D. Parrish}, ' ... 
'year = {1994}, ' ...
'title = {Reproductive and trophic ecology of the soldierfish \emph{Myripristis amaena} in tropical fisheries}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {92(3)}, ' ...
'pages = {516-530}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Myripristis-amaena.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

