function [data, auxData, metaData, txtData, weights] = mydata_Hippoglossus_stenolepis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Hippoglossus_stenolepis'; 
metaData.species_en = 'Pacific halibut'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2017 03 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 06]; 

%% set data
% zero-variate data

data.ab = 15;        units.ab = 'd'; label.ab = 'time since hatch at birth'; bibkey.ab = 'Wiki';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 6*30.5;    units.tj = 'd';  label.tj = 'time since hatch at metam';bibkey.tj = 'Wiki';
  temp.tj = C2K(5);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 12*365;    units.tp = 'd';  label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '12 yr for females; 7.5 yr for males';
data.am = 55*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 267;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'McFaJens1991';
  comment.Wwb = 'based on egg diameter 3.4 mm: 4/3*pi*0.17^3';
data.Wwi = 363e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

data.Ri  = 2e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '0.5e6 till 4e6 eggs';
  
% uni-variate data

% time-length
data.tL = [... % time since birth (yr), fork length (cm)
0.523	16.609
1.592	23.529
2.639	29.758
2.639	32.180
2.639	34.256
3.685	38.754
3.731	41.522
3.731	41.869
4.732	49.135
4.732	50.173
4.732	50.865
5.801	58.131
5.801	62.284
6.825	69.204
6.825	70.242
7.917	78.893
7.917	78.893
8.827	86.159
8.827	88.235
9.964	98.270
9.987	104.152
10.010	92.042
11.011	100.692
11.034	105.190
11.034	108.997
12.057	115.225
13.104	128.028
13.149	125.606
14.196	134.256
14.196	135.640
15.197	144.291
15.242	142.215
16.289	155.709
18.382	163.322
19.383	167.474
20.452	176.125
22.568	185.813];
data.tL(:,1) = 365 * data.tL(:,1); 
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OrloKutn2011';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
1.591	176.056
2.614	176.056
2.614	880.282
3.614	704.225
4.727	1408.451
5.773	2816.901
5.773	2992.958
6.795	3521.127
6.795	4401.408
7.795	5985.915
7.795	6690.141
8.932	8802.817
8.955	8450.704
9.909	10211.268
9.909	11795.775
9.909	15316.901
10.909	16021.127
10.955	16549.296
11.000	13732.394
12.000	17605.634
12.000	20950.704
13.091	28697.183
14.091	33802.817
14.136	31690.141
15.114	37323.944
15.159	50704.225
16.182	50880.282
18.318	58802.817
19.341	73767.606
20.364	72535.211
22.523	87500.000];
data.tW(:,1) = 365 * data.tW(:,1); 
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(5); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'OrloKutn2011';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 5 * weights.psd.kap;
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assume not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Preferred temperature 3 to 8 C, depth 183 to 457 m';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Females and males have the same size';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3M268'; % Cat of Life
metaData.links.id_ITIS = '172932'; % ITIS
metaData.links.id_EoL = '46570101'; % Ency of Life
metaData.links.id_Wiki = 'Hippoglossus_stenolepis'; % Wikipedia
metaData.links.id_ADW = 'Hippoglossus_stenolepis'; % ADW
metaData.links.id_Taxo = '46948'; % Taxonomicon
metaData.links.id_WoRMS = '274290'; % WoRMS
metaData.links.id_fishbase = 'Hippoglossus-stenolepis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippoglossus_stenolepis}}';
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
bibkey = 'OrloKutn2011'; type = 'Article'; bib = [ ... 
'author = {A. M. Orlov and E. N. Kuznetsova and I. N. Mukhametov}, ' ... 
'year = {2011}, ' ...
'title = {Age and Growth of the {P}acific Halibut \emph{Hippoglossus stenolepis} and the Size-Age Composition of Its Catches in the North-Western Part of the {P}acific {O}cean}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {51}, ' ...
'pages = {306-323}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McFaJens1991'; type = 'Techreport'; bib = [ ... 
'author = {G. A. McFarlane and J. O. T. Jensen and W. T. Andrews and E. P. Groot}, ' ... 
'year = {1991}, ' ...
'title = {Egg and Yolk Sac Larval Development of {P}acific Halibut (\emph{Hippoglossus stenolepis})}, ' ...
'institution = {International Pacific Halibut Commission  P.O. Box 95009 Seattle, Washington 98145-2009, U.S.A.}, ' ...
'number = {24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/514}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

